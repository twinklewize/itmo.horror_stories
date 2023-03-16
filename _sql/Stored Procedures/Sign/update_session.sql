DROP PROCEDURE IF EXISTS update_session;

CREATE PROCEDURE update_session(
    IN p_refreshToken VARCHAR(50) 
)
COMMENT "Update user session by refresh token"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_createdAt TIMESTAMP DEFAULT NULL;
  DECLARE out_token VARCHAR(50);
  DECLARE out_newRefreshToken VARCHAR(50);

  -- Set autocommit off and start transaction
  SET autocommit = 0;
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

  -- Generate new tokens
  SET out_token = UUID_SHORT();
  SET out_newRefreshToken = UUID_SHORT();

  -- Update Tokens table with new tokens
  UPDATE Tokens SET token = out_token, refreshToken = out_newRefreshToken WHERE refreshToken = p_refreshToken;

  -- Commit transaction and set autocommit back on
  COMMIT;
  SET autocommit = 1;
  SELECT out_token AS token, out_newRefreshToken AS refreshToken;

END;
