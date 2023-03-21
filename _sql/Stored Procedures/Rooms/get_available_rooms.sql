DROP PROCEDURE IF EXISTS get_available_rooms;

CREATE PROCEDURE get_available_rooms(
    IN p_token VARCHAR(50)
)
COMMENT "(p_token VARCHAR(50)) - получить по токену комнаты ожидающие новых игроков"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    
    -- Возвращает доступные комнаты и количество игроков в них
    SELECT 
        Rooms.roomCode, 
        Rooms.moveTime, 
        Rooms.placesCount, 
        COUNT(Players.playerId) as playersCount
    FROM Rooms 
    LEFT JOIN Players USING(roomCode)
    WHERE NOT EXISTS (SELECT * FROM Moves WHERE Moves.roomCode=Rooms.roomCode)
    AND (SELECT COUNT(playerId) FROM Players WHERE roomCode = Rooms.roomCode) < Rooms.placesCount
    AND NOT EXISTS(SELECT playerId FROM Players WHERE login = v_login AND roomCode = Rooms.roomCode)
    GROUP BY Rooms.roomCode;
END;
