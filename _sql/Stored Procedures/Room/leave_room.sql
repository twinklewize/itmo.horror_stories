DROP PROCEDURE IF EXISTS leave_room;
CREATE PROCEDURE leave_room(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Leave room"
SQL SECURITY DEFINER
BEGIN  
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);

    -- Check if room exists, rollback if condition fails
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room is not exist or user is not in this room';
    END IF;

    -- Remove player from the Players table and get playerId        
    DELETE FROM Players WHERE playerId = v_playerId;

    -- ON DELETE CASCADE не работает
    DELETE FROM Masters WHERE playerId = v_playerId;

    -- If no players are left in room then delete the room
IF (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode) = 0 THEN
    DELETE FROM Masters 
    WHERE playerId IN (SELECT playerId FROM Players WHERE roomCode = p_roomCode);
END IF;


    -- If no players are left in room then delete the room
   IF (SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode) = 0 THEN
        DELETE FROM Rooms WHERE roomCode = p_roomCode;
         -- ON DELETE CASCADE не работает
        DELETE FROM Moves WHERE roomCode = p_roomCode;
        DELETE FROM HintCards WHERE roomCode = p_roomCode;
        DELETE FROM TableCards WHERE roomCode = p_roomCode;
        DELETE FROM SelectedCards WHERE NOT EXISTS (SELECT * FROM TableCards WHERE TableCards.tableCardId = SelectedCards.tableCardId);
    END IF;
END;