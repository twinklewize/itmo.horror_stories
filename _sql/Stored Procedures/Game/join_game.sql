DROP PROCEDURE IF EXISTS join_game;

CREATE PROCEDURE join_game(
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - возвращает начальное состояние игры (tableCards) для обычного игрока"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT;

    -- Обновляет фазу игры
    CALL update_game_phase(p_roomCode); 
    
    -- Если игрок не найден, генерируем ошибку
    IF v_login IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игрок не найден';
    END IF;
    
    -- Получаем playerId игрока в этой игре
    SELECT playerId INTO v_playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode;
    
    -- Если playerId не найден, генерируем ошибку
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игрок не найден';
    END IF;
    
    -- Если игрок мастер, генерируем ошибку
    IF EXISTS (SELECT * FROM Masters WHERE playerId = v_playerId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не можете подсоединиться к игре';
    END IF;
    
    -- Проверяем, что игра существует
    IF NOT EXISTS (SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра не найдена';
    END IF;

    -- Возвращаем таблицу карт на столе
    SELECT TableCards.tableCardId, TableCards.cardName, imageUrl, description 
    FROM TableCards
    JOIN Cards USING(cardName) 
    WHERE roomCode = p_roomCode;
END;
