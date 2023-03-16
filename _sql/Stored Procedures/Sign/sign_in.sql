DROP PROCEDURE IF EXISTS sign_in;

CREATE PROCEDURE sign_in (
    p_login VARCHAR(30),
    p_password VARCHAR(255)
)
COMMENT "User sign in"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_encryptedPassword VARCHAR(255);
  DECLARE out_token VARCHAR(50);
  DECLARE out_refreshToken VARCHAR(50);
  DECLARE out_nickname VARCHAR(12);

  -- Use START TRANSACTION to begin the transaction
  START TRANSACTION;

  SELECT password INTO v_encryptedPassword FROM Users WHERE login = p_login FOR UPDATE;

  -- If no user found, signal error
  IF v_encryptedPassword IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found';
  ELSEIF NOT v_encryptedPassword = SHA2(p_password, 256) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid password';
  END IF;

  UPDATE Users SET lastActivity = CURRENT_TIMESTAMP WHERE login = p_login;

  SET out_token = UUID_SHORT();
  SET out_refreshToken = UUID_SHORT();

  -- Insert or update token and refreshToken for user
  INSERT INTO Tokens (login, token, refreshToken) 
  VALUES (p_login, out_token, out_refreshToken)
  ON DUPLICATE KEY UPDATE token=out_token, refreshToken=out_refreshToken;

  SELECT nickname INTO out_nickname FROM Users WHERE login = p_login;

  -- Use COMMIT to commit the changes made during the transaction
  COMMIT;

  SELECT out_token AS token, out_refreshToken AS refreshToken, out_nickname AS nickname;
END;
