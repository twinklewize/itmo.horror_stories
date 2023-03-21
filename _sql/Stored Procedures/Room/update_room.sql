DROP PROCEDURE IF EXISTS update_room;

CREATE PROCEDURE update_room( 
    IN p_token VARCHAR(50), 
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - возвращает playerId и nickname других игроков, masterId если он выбран и началась ли игра"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    
    -- Ошибка, если игрока нет в этой комнате
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вас нет в этой комнате';
    END IF;

    -- Возвращает других игроков
    SELECT playerId, Users.nickname FROM Players LEFT JOIN Users USING(login) WHERE Players.login <> v_login AND roomCode = p_roomCode;
    -- Возвращает началась ли игра
    SELECT COUNT(*) as isGameStarted FROM Moves WHERE roomCode = p_roomCode;
    -- Возвращает id мастера
    SELECT Players.playerId as masterId FROM Masters LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode;
END;
