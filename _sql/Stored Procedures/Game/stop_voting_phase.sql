DROP PROCEDURE IF EXISTS stop_voting_phase;

CREATE PROCEDURE stop_voting_phase (
  p_roomCode INT UNSIGNED
)
 COMMENT "(p_roomCode)"
 SQL SECURITY INVOKER
BEGIN
  DECLARE v_cardsToRemoveCount  TINYINT;
  DECLARE v_cardsWithVotesCount  TINYINT;
  DECLARE v_remainingCardsToRemoveCount TINYINT;

      -- find out how many cards are supposed to be removed
  SELECT RoundRules.cardsToRemoveCount INTO v_cardsToRemoveCount FROM Moves 
    LEFT JOIN RoundRules ON Moves.roundNumber = RoundRules.roundNumber 
    WHERE Moves.roomCode = p_roomCode;

  -- count how many cards actually have votes
  SELECT COUNT(*) INTO v_cardsWithVotesCount FROM TableCards 
    WHERE EXISTS (SELECT * FROM Votes WHERE Votes.tableCardId = TableCards.tableCardId) 
    AND roomCode = p_roomCode;

  SET v_remainingCardsToRemoveCount = v_cardsToRemoveCount - v_cardsWithVotesCount;

  START TRANSACTION;
  -- if there are exactly cardsToRemoveCount cards with votes, remove them
  IF v_cardsWithVotesCount = v_cardsToRemoveCount THEN
    UPDATE TableCards 
    SET isOnTable = 0 
    WHERE TableCards.tableCardId IN (
      SELECT tableCardId 
      FROM (
        SELECT tableCardId FROM Votes  LEFT JOIN Players ON Votes.playerId = Votes.playerId
        WHERE Players.roomCode = p_roomCode
      ) AS tblToRemove
    );

  -- if there are more than cardsToRemoveCount cards with votes, remove some randomly until we get down to the right number
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
  -- if there are fewer than cardsToRemoveCount cards with votes, remove all of them and randomly add more until we get up to the right number
  ELSE
   UPDATE TableCards 
    SET isOnTable = 0 
    WHERE TableCards.tableCardId IN (
      SELECT tableCardId 
      FROM (
        SELECT tableCardId FROM Votes LEFT JOIN Players ON Players.playerId = Votes.playerId
        WHERE roomCode = p_roomCode
      ) AS tblToRemove
    );

    CREATE TEMPORARY TABLE TempTableCards 
    SELECT TableCards.tableCardId 
    FROM TableCards 
    WHERE roomCode = p_roomCode AND isOnTable = 1 
    ORDER BY RAND()
    LIMIT v_remainingCardsToRemoveCount;

    UPDATE TableCards t1
    INNER JOIN TempTableCards tmp_table ON t1.tableCardId = tmp_table.tableCardId
    SET t1.isOnTable = 0;

    DROP TEMPORARY TABLE IF EXISTS TempTableCards;
  END IF;

  IF (SELECT roundNumber FROM Moves WHERE roomCode = p_roomCode) < 5 THEN
    UPDATE Moves 
    SET createdAt = NOW(), phase = 'hints', roundNumber = Moves.roundNumber+1 
    WHERE roomCode = p_roomCode;
  END IF;

  DELETE FROM Votes WHERE tableCardId IN (SELECT TableCards.tableCardId FROM TableCards WHERE roomCode = p_roomCode);
  COMMIT;
END;