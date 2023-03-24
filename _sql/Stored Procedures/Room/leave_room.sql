DROP PROCEDURE IF EXISTS leave_room;

CREATE PROCEDURE leave_room (
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - удаляет пользователя из комнаты, если в комнате не осталось игроков она удаляется"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);

    -- Ошибка если игрока нет в этой комнате
    IF v_playerId IS NULL THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вас уже нет в этой комнате';
    END IF;

    DELETE FROM Players WHERE playerId = v_playerId;
    -- Удаляет комнату, если в комнате не осталось игроков
    DELETE FROM Rooms WHERE roomCode = p_roomCode AND (SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode) = 0;
END;