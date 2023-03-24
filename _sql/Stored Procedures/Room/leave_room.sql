DROP PROCEDURE IF EXISTS leave_room;

CREATE PROCEDURE leave_room (
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - удаляет пользователя из комнаты, если в комнате не осталось игроков она удаляется"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30);
    DECLARE v_playerId INT;

    START TRANSACTION;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

    SELECT get_login_from_token(p_token) INTO v_login;
    SELECT playerId INTO v_playerId 
    FROM Players 
    WHERE login = v_login AND roomCode = p_roomCode 
    FOR UPDATE;

    -- Ошибка если игрока нет в этой комнате
    IF v_playerId IS NULL THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вас уже нет в этой комнате';
    END IF;


    -- Удаляет игрока (ON DELETE CASCADE не работает)
    DELETE FROM Players WHERE playerId = v_playerId;
    DELETE FROM Masters WHERE playerId = v_playerId;

    -- Удаляет комнату, если в комнате не осталось игроков  (ON DELETE CASCADE не работает)
   IF (SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode) = 0 THEN
        DELETE FROM Rooms WHERE roomCode = p_roomCode;
        DELETE FROM Moves WHERE roomCode = p_roomCode;
        DELETE FROM HintCards WHERE roomCode = p_roomCode;
        DELETE FROM TableCards WHERE roomCode = p_roomCode;
        DELETE FROM SelectedCards WHERE NOT EXISTS (SELECT * FROM TableCards WHERE TableCards.tableCardId = SelectedCards.tableCardId);
        DELETE FROM Votes WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.playerId = Votes.playerId);
    END IF;

    COMMIT;
END;