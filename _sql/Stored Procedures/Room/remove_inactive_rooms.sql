DROP PROCEDURE IF EXISTS remove_inactive_rooms;
CREATE PROCEDURE remove_inactive_rooms()
COMMENT "Remove rooms where activity of all players was more than 3 hours ago"
SQL SECURITY INVOKER
BEGIN
    DECLARE exit handler for SQLEXCEPTION 
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;

    -- Remove all room/player combinations where the last activity was over 3 hours ago
    DELETE FROM Players 
    WHERE (SELECT TIMESTAMPDIFF(SECOND, lastActivity, NOW()) >= 10800);

    -- Remove any orphaned rooms (ones with no players left)
    DELETE FROM Rooms WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.roomCode = Rooms.roomCode);
    
    COMMIT;
END;
