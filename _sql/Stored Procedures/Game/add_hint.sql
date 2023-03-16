DROP PROCEDURE IF EXISTS add_hint;

CREATE PROCEDURE add_hint(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED, 
    p_cardName VARCHAR(25), 
    p_hintStatus ENUM('connected', 'notConnected')
)
COMMENT "Add hint on table"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    DECLARE v_isGameOver BOOLEAN DEFAULT (SELECT isGameOver FROM Rounds WHERE roundNumber = (SELECT roundNumber FROM Moves WHERE roomCode = p_roomCode));
    DECLARE v_roundNumber TINYINT DEFAULT 0;

    SELECT roundNumber INTO v_roundNumber FROM Moves WHERE roomCode = p_roomCode;

    CALL update_game_phase(p_roomCode);

    START TRANSACTION;
    
    IF v_playerId <> v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unauthorized Action: You are not the master of this room.';
    END IF;

    IF v_isGameOver = 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is over';
    END IF;

    IF (SELECT COUNT(*) FROM HintCards WHERE roomCode = p_roomCode AND cardName = p_cardName AND hintStatus = 'hand') = 0 THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Hint Card Selected.';
    END IF;

    IF (SELECT phase FROM Moves WHERE roomCode = p_roomCode) <> 'hints' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Is not hints phase';
    END IF;

    IF (SELECT COUNT(*) FROM HintCards WHERE hintStatus IN ('connected', 'notConnected') AND roomCode = p_roomCode) >= v_roundNumber THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your hint for this round is already over';
    END IF;
    
    UPDATE HintCards SET hintStatus = p_hintStatus WHERE roomCode = p_roomCode AND cardName = p_cardName; 

    IF (v_roundNumber <= 4) THEN
        INSERT INTO HintCards (roomCode, cardName)
            SELECT p_roomCode, cardName FROM Cards WHERE cardName NOT IN (
                SELECT cardName FROM HintCards WHERE roomCode = p_roomCode 
                UNION 
                SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
            ) ORDER BY RAND() LIMIT 1;

        SELECT cardName, imageUrl, description FROM Cards WHERE cardName NOT IN (
            SELECT cardName FROM HintCards WHERE roomCode = p_roomCode
        ) AND cardName NOT IN (
            SELECT cardName FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1
        ) LIMIT 1;
    END IF;

    UPDATE Moves SET phase = 'voting', startedAt = NOW() WHERE roomCode = p_roomCode;
    
    COMMIT;
END;
