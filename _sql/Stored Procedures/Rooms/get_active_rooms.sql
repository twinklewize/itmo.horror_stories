DROP PROCEDURE IF EXISTS get_active_rooms;

CREATE PROCEDURE get_active_rooms( 
    IN p_token VARCHAR(50)
)
COMMENT "(p_token VARCHAR(50)) - получить по токену комнаты в которых находится игрок"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));

    -- Возвращает активные комнаты и количество игроков в них
    SELECT 
        Rooms.roomCode, 
        Rooms.moveTime, 
        Rooms.placesCount, 
        (SELECT COUNT(*) FROM Moves WHERE Moves.roomCode=Rooms.roomCode) as isGameStarted, 
        COUNT(Players.playerId) as playersCount
    FROM Rooms 
    LEFT JOIN Players USING(roomCode)
    WHERE login = v_login 
    GROUP BY Rooms.roomCode;
END;
