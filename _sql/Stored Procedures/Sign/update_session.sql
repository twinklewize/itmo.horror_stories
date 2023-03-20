DROP PROCEDURE IF EXISTS update_session;

CREATE PROCEDURE update_session(
    IN p_refreshToken VARCHAR(50) 
)
COMMENT "(p_refreshToken)"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_createdAt TIMESTAMP DEFAULT NULL;
  DECLARE v_token VARCHAR(50);

  START TRANSACTION;

  -- Find user in Tokens table using refresh token and check expiry date
  SELECT login, createdAt INTO @login, v_createdAt FROM Tokens WHERE refreshToken = p_refreshToken;

  -- If no user found, signal error
  IF @login IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid refresh token';
  ELSEIF v_createdAt + INTERVAL 30 DAY <= NOW() THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Refresh token expired';
  END IF;

  -- Update last activity time for the user in Users table
  UPDATE Users SET lastActivity = CURRENT_TIMESTAMP WHERE login = @login;

  -- Generate new access_token
  SET v_token = SHA2(UUID_SHORT(), 256);

  -- Update Tokens table with new tokens
  UPDATE Tokens SET token = v_token, createdAt = NOW()
  WHERE refreshToken = p_refreshToken;

  -- Commit transaction 
  COMMIT;

  SELECT v_token AS token;
END;
