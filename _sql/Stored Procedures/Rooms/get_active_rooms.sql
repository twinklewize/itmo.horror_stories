DROP PROCEDURE IF EXISTS get_active_rooms;
CREATE PROCEDURE get_active_rooms(
    p_token VARCHAR(50)
)
COMMENT "(p_token)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));

        -- Select active rooms for the given user
        SELECT Rooms.roomCode, Rooms.moveTime, Rooms.placesCount, (SELECT COUNT(*) FROM Moves WHERE Moves.roomCode=Rooms.roomCode) as isGameStarted, COUNT(SELECT COUNT(*) FROM Players WHERE roomCode = Rooms.roomCode) as playersCount
        FROM Rooms WHERE login = v_login GROUP BY Rooms.roomCode;
END;
