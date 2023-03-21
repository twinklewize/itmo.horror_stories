DROP PROCEDURE IF EXISTS join_game;

CREATE PROCEDURE join_game(
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - возвращает начальное состояние игры (tableCards) для обычного игрока"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_isMaster TINYINT UNSIGNED DEFAULT(SELECT COUNT(*) FROM Masters WHERE playerId = v_playerId);

    -- Обновляет фазу игры
    CALL update_game_phase(p_roomCode); 
    
    -- Ошибка, если игрок не найден
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игрок не найден';
    END IF;

    -- Ошибка, если игрок мастер
    IF v_isMaster = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не можете подсоединиться к игре';
    END IF;

    -- Ошибка, если игрок мастер
    IF (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра не найдена';
    END IF;

    -- Возвращает карты на столе
    SELECT tableCardId, Cards.cardName, imageUrl, description FROM TableCards LEFT JOIN Cards USING(cardName) WHERE TableCards.roomCode = p_roomCode;
END;
