DROP PROCEDURE IF EXISTS add_hint;

CREATE PROCEDURE add_hint(
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED, 
    IN p_cardName VARCHAR(25), 
    IN p_hintStatus ENUM('connected', 'notConnected')
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED, p_cardName VARCHAR(25), p_hintStatus ENUM('connected', 'notConnected')) - добавляет новую подсказку для игроков, если это не последний раунд возвращает новую подсказку мастеру"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_isMaster TINYINT UNSIGNED DEFAULT(SELECT COUNT(*) FROM Masters WHERE playerId = v_playerId);
    DECLARE v_roundNumber TINYINT DEFAULT 0;
    DECLARE v_newCardName VARCHAR(25);

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Обновляет фазу игры
    CALL update_game_phase(p_roomCode);
    
    START TRANSACTION;
    SELECT roundNumber INTO v_roundNumber FROM Moves WHERE roomCode = p_roomCode FOR UPDATE;

    -- Ошибка, если игрок не мастер
    IF v_isMaster = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не мастер';
    END IF;

    -- Ошибка, если игра закончилась
    IF is_game_over(p_roomCode) = 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра окончена';
    END IF;

    -- Ошибка, если этой карты нет в руке мастера
    IF NOT EXISTS (SELECT * FROM HintCards WHERE roomCode = p_roomCode AND cardName = p_cardName AND hintStatus = 'hand') THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Карта не может быть выбрана';
    END IF;

    -- Ошибка, если это не фаза подсказок
    IF (SELECT phase FROM Moves WHERE roomCode = p_roomCode) <> 'hints' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Это не фаза выбора подсказок';
    END IF;

    -- Ошибка, если количество подсказок на столе уже равно количеству раундов
    IF (SELECT COUNT(*) FROM HintCards WHERE hintStatus IN ('connected', 'notConnected') AND roomCode = p_roomCode) >= v_roundNumber THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы больше не можете добавлять подсказки';
    END IF;
    
    -- Добавляем подсказку на стол
    UPDATE HintCards SET hintStatus = p_hintStatus WHERE roomCode = p_roomCode AND cardName = p_cardName; 

    -- Если это не последний раунд добавляется еще подсказка в руку мастера
    IF (v_roundNumber < 5) THEN
        SELECT cardName INTO v_newCardName FROM Cards WHERE cardName NOT IN (
                SELECT cardName FROM HintCards WHERE roomCode = p_roomCode 
                UNION 
                SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
            ) ORDER BY RAND() LIMIT 1;

        INSERT INTO HintCards (roomCode, cardName)
            VALUES (p_roomCode, v_newCardName);
        -- Возвращает новую посказку
        SELECT cardName, imageUrl, description FROM Cards WHERE cardName = v_newCardName;
    END IF;
    -- Обновляет фазу хода
    UPDATE Moves SET phase = 'voting', createdAt = NOW() WHERE roomCode = p_roomCode;
    COMMIT;
END;
