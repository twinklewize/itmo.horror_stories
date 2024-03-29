DROP PROCEDURE IF EXISTS get_active_rooms;

CREATE PROCEDURE get_active_rooms( 
    IN p_token VARCHAR(50)
)
COMMENT "(p_token VARCHAR(50)) - получить по токену комнаты в которых находится игрок"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));

    -- блокирует таблицы Rooms, Moves и Players до окончания выполнения запроса
    SELECT 
        Rooms.roomCode, 
        Rooms.moveTime, 
        Rooms.placesCount, 
        (SELECT COUNT(*) FROM Moves WHERE Moves.roomCode=Rooms.roomCode) as isGameStarted, 
        (SELECT COUNT(*) FROM Players WHERE Players.roomCode=Rooms.roomCode) as playersCount   
    FROM Rooms JOIN Players USING(roomCode)
    WHERE Players.login =v_login 
    GROUP BY Rooms.roomCode;
END;
