DROP PROCEDURE IF EXISTS join_room;
CREATE PROCEDURE join_room(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Join room"
BEGIN
    DECLARE v_login INT DEFAULT (get_login_from_token(p_token));
    
    DECLARE v_existingPlayersCount TINYINT UNSIGNED;
    DECLARE v_placesCount   TINYINT UNSIGNED;
    DECLARE v_remainingPlacesCount TINYINT UNSIGNED;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;

    START TRANSACTION;
    
    -- Check if the room exists and fetch the places count
    SELECT placesCount, (SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode) 
        INTO v_placesCount, v_existingPlayersCount FROM Rooms 
        WHERE roomCode = p_roomCode FOR UPDATE;

    -- If room does not exist throw an error
    IF v_placesCount IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Room Code';
    END IF;
    
    -- Calculate how many remaining seats are there in the room
    SET v_remainingPlacesCount = v_placesCount - v_existingPlayersCount;
    
    -- If the room is full throw an error
    IF (v_remainingPlacesCount <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is already full';
    END IF;

    -- If player already in room
    IF (SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode AND login = v_login > 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is already in room';
    END IF;

    IF (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode > 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is already start';
    END IF;

    -- Add the user to the Players table
    INSERT INTO Players(login, roomCode) VALUES(v_login, p_roomCode);

    -- Return the playerId of the newly created player
    SELECT LAST_INSERT_ID() as playerId;

    -- Return otherPlayers
    SELECT playerId, nickname FROM Players WHERE login <> v_login AND roomCode = p_roomCode;

    -- If the last seat has been taken then select a master for this room
    IF (v_remainingPlacesCount = 1) THEN
        INSERT INTO Masters(playerId) 
        SELECT playerId FROM Players WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1;
    END IF;
    
    COMMIT;
END;
