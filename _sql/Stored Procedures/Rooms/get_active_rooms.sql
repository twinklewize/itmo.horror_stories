DROP PROCEDURE IF EXISTS get_active_rooms;
CREATE PROCEDURE get_active_rooms(
    p_token VARCHAR(50)
)
COMMENT "Returns rooms with free places"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));

        -- Select active rooms for the given user
        SELECT Rooms.roomCode, Rooms.moveTime, Rooms.placesCount, (SELECT COUNT(*) FROM Moves WHERE Moves.roomCode=Rooms.roomCode) as isGameStarted, COUNT(Players.playerId) as playersCount
        FROM Rooms 
        LEFT JOIN Players ON Rooms.roomCode = Players.roomCode 
        WHERE login = v_login
        GROUP BY Rooms.roomCode;
END;
