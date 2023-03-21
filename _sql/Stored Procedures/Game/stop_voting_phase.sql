DROP PROCEDURE IF EXISTS stop_voting_phase;

CREATE PROCEDURE stop_voting_phase (
  IN p_roomCode INT UNSIGNED
)
 COMMENT "(p_roomCode INT UNSIGNED) - останавливает фазу голосования и выбирает какие карты убрать со стола"
 SQL SECURITY INVOKER
BEGIN
  DECLARE v_cardsToRemoveCount  TINYINT;
  DECLARE v_cardsWithVotesCount  TINYINT;
  DECLARE v_remainingCardsToRemoveCount TINYINT;

      -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

  -- Сколько карт должно быть удалено в раунде
  SELECT cardsToRemoveCount INTO v_cardsToRemoveCount FROM Moves 
    LEFT JOIN RoundRules USING(roundNumber)
    WHERE roomCode = p_roomCode;

  -- Сколько карт имеют голоса
  SELECT COUNT(*) INTO v_cardsWithVotesCount FROM TableCards 
    WHERE EXISTS (SELECT * FROM Votes WHERE Votes.tableCardId = TableCards.tableCardId) 
    AND roomCode = p_roomCode;

  START TRANSACTION;
  -- Если количество карт с голосами = количеству карт которое должно быть удалено, 
  -- удаляет все карты с голосами
  IF v_cardsWithVotesCount = v_cardsToRemoveCount THEN
    UPDATE TableCards 
    SET isOnTable = 0 
    WHERE TableCards.tableCardId IN (
      SELECT tableCardId 
      FROM (
        SELECT tableCardId FROM Votes  
        LEFT JOIN Players USING(playerId)
        WHERE Players.roomCode = p_roomCode
      ) AS tblToRemove
    );

  -- Если количество карт с голосами > количества карт которое должно быть удалено, 
  -- удаляет из них рандомно нужное количество
ELSEIF v_cardsWithVotesCount > v_cardsToRemoveCount THEN
UPDATE TableCards 
SET isOnTable = 0 
WHERE TableCards.tableCardId IN (
  SELECT tableCardId 
  FROM (
    SELECT Votes.tableCardId 
    FROM Votes LEFT JOIN Players USING(playerId)
    WHERE Players.roomCode = p_roomCode
    ORDER BY RAND() 
    LIMIT v_cardsToRemoveCount
  ) AS tblCardsToRemove
);
  -- Если количество карт с голосами < количества карт которое должно быть удалено, 
  -- удаляет все карты с голосами и из остальных карт на столе рандомно удаляет оставшееся количество
  ELSE
   UPDATE TableCards 
    SET isOnTable = 0 
    WHERE TableCards.tableCardId IN (
      SELECT tableCardId 
      FROM (
        SELECT tableCardId FROM Votes 
        LEFT JOIN Players USING(playerId)
        WHERE roomCode = p_roomCode
      ) AS tblToRemove
    );

    -- Сколько карт осталось удалить
    SET v_remainingCardsToRemoveCount = v_cardsToRemoveCount - v_cardsWithVotesCount;

    CREATE TEMPORARY TABLE TempTableCards 
    SELECT TableCards.tableCardId 
    FROM TableCards 
    WHERE roomCode = p_roomCode AND isOnTable = 1 
    ORDER BY RAND()
    LIMIT v_remainingCardsToRemoveCount;

    UPDATE TableCards t1
    INNER JOIN TempTableCards tmp_table USING(tableCardId)
    SET t1.isOnTable = 0;

    DROP TEMPORARY TABLE IF EXISTS TempTableCards;
  END IF;

  -- Если это не последний раунд начинает фазу подсказок
  IF (SELECT roundNumber FROM Moves WHERE roomCode = p_roomCode) < 5 THEN
    UPDATE Moves 
    SET createdAt = NOW(), phase = 'hints', roundNumber = Moves.roundNumber+1 
    WHERE roomCode = p_roomCode;
  END IF;

  -- Удаляет голоса 
  DELETE FROM Votes WHERE tableCardId IN (SELECT TableCards.tableCardId FROM TableCards WHERE roomCode = p_roomCode);
  COMMIT;
END;