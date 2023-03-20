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
     DELETE FROM Moves WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE Moves.roomCode = Rooms.roomCode);
     DELETE FROM HintCards WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE HintCards.roomCode = Rooms.roomCode);
     DELETE FROM Masters WHERE  NOT EXISTS (SELECT * FROM Players WHERE Masters.playerId = Players.playerId);
     DELETE FROM TableCards WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE TableCards.roomCode = Rooms.roomCode);
     DELETE FROM SelectedCards WHERE NOT EXISTS (SELECT * FROM TableCards WHERE TableCards.tableCardId = SelectedCards.tableCardId);
     DELETE FROM Votes WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.playerId = Votes.playerId);
    COMMIT;
END;
