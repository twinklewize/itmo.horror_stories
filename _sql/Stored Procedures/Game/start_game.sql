DROP PROCEDURE IF EXISTS start_game;
CREATE PROCEDURE start_game(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Start game for master"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login INT DEFAULT (get_login_from_token(p_token)); 
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred while processing the request';
    END;

    IF v_playerId <> v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unauthorized Action: You are not the master of this room.';
    END IF;

    START TRANSACTION;

    -- Generate the first 12 cards from Cards with chosen roomCode
    INSERT INTO TableCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards WHERE cardName NOT IN (
      SELECT cardName FROM HintCards WHERE roomCode = p_roomCode UNION 
      SELECT cardName FROM SelectedCards t1 INNER JOIN TableCards t2 ON t1.tableCardId = t2.tableCardId WHERE roomCode = p_roomCode
    ) ORDER BY RAND() LIMIT 12;

    -- Select one of the generated cards at random to be the selected card
    INSERT INTO SelectedCards (tableCardId)
    SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1;
    
    -- Generate the hint cards
    INSERT INTO HintCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards WHERE cardName NOT IN (
      SELECT cardName FROM HintCards WHERE roomCode = p_roomCode UNION 
      SELECT cardName FROM SelectedCards t1 INNER JOIN TableCards t2 ON t1.tableCardId = t2.tableCardId WHERE roomCode = p_roomCode UNION
      SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
    ) ORDER BY RAND() LIMIT 5;

    -- Commit the transaction
    COMMIT;

    -- Return data
    SELECT tableCardId as selectedCardId FROM SelectedCards WHERE roomCode = p_roomCode;

    SELECT tableCardId, imageUrl, cardName, description
    FROM TableCards
    JOIN Cards ON TableCards.cardName = Cards.cardName
    WHERE roomCode = p_roomCode;

    SELECT cardName, description, imageUrl
    FROM HintCards 
    JOIN Cards ON HintCards.cardName = Cards.cardName
    WHERE roomCode = p_roomCode;

    UPDATE Moves SET phase = 'hints', startedAt = NOW(), roundNumber = roundNumber + 1 WHERE roomCode = p_roomCode;
END;
