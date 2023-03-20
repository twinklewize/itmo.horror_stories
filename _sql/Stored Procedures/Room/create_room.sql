DROP PROCEDURE IF EXISTS create_room;
CREATE PROCEDURE create_room(
  p_token VARCHAR(50),
  p_roomCode INT UNSIGNED,
  p_moveTime TINYINT UNSIGNED,
  p_placesCount TINYINT UNSIGNED
)
COMMENT "(p_token, p_roomCode, p_moveTime, p_placesCount)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE out_playerId INT DEFAULT NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    RESIGNAL;
END;
  
    -- start transaction
    START TRANSACTION;

    -- Check if room already exists
    IF EXISTS(SELECT * FROM Rooms WHERE roomCode = p_roomCode) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Комната уже существует';
    END IF;

    -- Check if places_count is valid
    IF (p_moveTime < 30 OR p_moveTime > 120) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Границы времени хода: 30..120';
    END IF; 

    -- Check if places_count is valid
    IF (p_placesCount < 2 OR p_placesCount > 10) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Границы количества игроков: 2..10';
    END IF;

    -- Add room to Rooms table
    INSERT INTO Rooms(roomCode, moveTime, placesCount) 
        VALUES(p_roomCode, p_moveTime, p_placesCount);
      
    -- Add user to the Players Table and get the playerId
    INSERT INTO Players(login, roomCode) 
      VALUES(v_login, p_roomCode);

    -- RETURN: playerId
    SELECT LAST_INSERT_ID() as playerId;

    -- commit changes
    COMMIT;
END;