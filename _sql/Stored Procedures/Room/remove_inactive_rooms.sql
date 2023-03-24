DROP PROCEDURE IF EXISTS remove_inactive_rooms;

CREATE PROCEDURE remove_inactive_rooms()
COMMENT "Удаляет в комнате в которых последняя активность всех игроков была более 3 часов назад"
SQL SECURITY INVOKER
BEGIN
     DELETE FROM Players WHERE (SELECT TIMESTAMPDIFF(SECOND, lastActivity, NOW()) > 10800);
     DELETE FROM Rooms WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.roomCode = Rooms.roomCode);
END;