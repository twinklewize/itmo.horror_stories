DROP PROCEDURE IF EXISTS join_room;

CREATE PROCEDURE join_room(
    p_token VARCHAR(50), 
    p_roomCode INT UNSIGNED
)
COMMENT "Join room"
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_existingPlayersCount TINYINT UNSIGNED;
    DECLARE v_placesCount          TINYINT UNSIGNED;
    DECLARE v_remainingPlacesCount TINYINT UNSIGNED;
    DECLARE v_isUserInRoom TINYINT DEFAULT(SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode AND login = v_login);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    RESIGNAL;
END;

    -- Check if the game has started or not
    IF EXISTS(SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game has already started';
    END IF;

    IF NOT EXISTS (SELECT * FROM Rooms WHERE roomCode = p_roomCode) THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Room Code';
    END IF;

    START TRANSACTION;
    
    -- Get the number of available spots in the room
    SELECT placesCount, COUNT(*) AS existingPlayersCount 
    INTO v_placesCount, v_existingPlayersCount 
    FROM Rooms r
    LEFT JOIN Players p ON r.roomCode = p.roomCode
    WHERE r.roomCode = p_roomCode 
    GROUP BY r.roomCode
    FOR UPDATE;
    
    -- Calculate how many remaining seats are there in the room
    SET v_remainingPlacesCount = v_placesCount - v_existingPlayersCount;
    
    -- If the room is full throw an error
    IF v_isUserInRoom = 0 AND v_remainingPlacesCount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is already full';
    -- If player is not in room and there are available seats
    ELSEIF v_isUserInRoom = 0 AND v_remainingPlacesCount > 0 THEN
        -- Add the user to the Players table
        INSERT INTO Players(login, roomCode) VALUES(v_login, p_roomCode);
        -- If this is the last spot, choose a master randomly from the new players
        IF v_remainingPlacesCount = 1 THEN 
            INSERT INTO Masters(playerId) VALUES (
                (SELECT playerId FROM Players WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1)
            );
        END IF;
    END IF;

    -- Return the playerId of the current user
    SELECT playerId FROM Players WHERE roomCode = p_roomCode AND login = v_login;

    -- Return the playerId and nickname of other players in the room
    SELECT playerId, Users.nickname 
    FROM Players 
    LEFT JOIN Users ON Players.login = Users.login 
    WHERE roomCode = p_roomCode AND Players.login <> v_login;

    COMMIT;
END;