DROP PROCEDURE IF EXISTS start_game;
CREATE PROCEDURE start_game(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Start game for master"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token)); 
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = p_roomCode);

DECLARE errorMessage VARCHAR(255);

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    RESIGNAL;
END;

    IF v_playerId <> v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unauthorized Action: You are not the master of this room.';
    END IF;

    IF EXISTS (SELECT * FROM TableCards WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is started';
    END IF;

    START TRANSACTION;

    -- Generate the first 12 cards from Cards with chosen roomCode
    INSERT INTO TableCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards ORDER BY RAND() LIMIT 12;

    -- Select one of the generated cards at random to be the selected card
    INSERT INTO SelectedCards (tableCardId)
    SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1;
    
    -- Generate the hint cards
    INSERT INTO HintCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards WHERE cardName NOT IN (
      SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
    ) ORDER BY RAND() LIMIT 5;

    INSERT INTO Moves (roundNumber, roomCode) VALUES (1, p_roomCode);

    -- Commit the transaction
    COMMIT;

    SELECT HintCards.cardName, description, imageUrl
    FROM HintCards 
    JOIN Cards ON HintCards.cardName = Cards.cardName
    WHERE roomCode = p_roomCode;

    SELECT tableCardId, imageUrl, TableCards.cardName, description
    FROM TableCards
    JOIN Cards ON TableCards.cardName = Cards.cardName
    WHERE roomCode = p_roomCode;

    -- Return data
    SELECT SelectedCards.tableCardId as selectedCardId FROM SelectedCards LEFT JOIN TableCards ON SelectedCards.tableCardId = TableCards.tableCardId WHERE roomCode = p_roomCode;
END;
