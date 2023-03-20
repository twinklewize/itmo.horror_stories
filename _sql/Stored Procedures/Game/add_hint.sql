DROP PROCEDURE IF EXISTS add_hint;

CREATE PROCEDURE add_hint(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED, 
    p_cardName VARCHAR(25), 
    p_hintStatus ENUM('connected', 'notConnected')
)
COMMENT "(p_token, p_roomCode, p_cardName, p_hintStatus)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE Players.roomCode = p_roomCode);
    DECLARE v_isGameOver BOOLEAN DEFAULT (is_game_over(p_roomCode));
    DECLARE v_roundNumber TINYINT DEFAULT 0;
    DECLARE v_newCardName VARCHAR(25);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    RESIGNAL;
END;

    CALL update_game_phase(p_roomCode);

    START TRANSACTION;

    SELECT roundNumber INTO v_roundNumber FROM Moves WHERE roomCode = p_roomCode;

    
    IF v_playerId <> v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не мастер';
    END IF;

    IF v_isGameOver = 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра окончена';
    END IF;

    IF (SELECT COUNT(*) FROM HintCards WHERE roomCode = p_roomCode AND cardName = p_cardName AND hintStatus = 'hand') = 0 THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Карта не может быть выбрана';
    END IF;

    IF (SELECT phase FROM Moves WHERE roomCode = p_roomCode) <> 'hints' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Это не фаза выбора подсказок';
    END IF;

    IF (SELECT COUNT(*) FROM HintCards WHERE hintStatus IN ('connected', 'notConnected') AND roomCode = p_roomCode) >= v_roundNumber THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы больше не можете добавлять подсказки';
    END IF;
    
    UPDATE HintCards SET hintStatus = p_hintStatus WHERE roomCode = p_roomCode AND cardName = p_cardName; 

    IF (v_roundNumber <= 4) THEN
        SELECT cardName INTO v_newCardName FROM Cards WHERE cardName NOT IN (
                SELECT cardName FROM HintCards WHERE roomCode = p_roomCode 
                UNION 
                SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
            ) ORDER BY RAND() LIMIT 1;

        INSERT INTO HintCards (roomCode, cardName)
            VALUES (p_roomCode, v_newCardName);

        SELECT cardName, imageUrl, description FROM Cards WHERE cardName = v_newCardName;
    END IF;

    UPDATE Moves SET phase = 'voting', createdAt = NOW() WHERE roomCode = p_roomCode;
    
    COMMIT;
END;
