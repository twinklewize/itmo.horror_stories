DROP PROCEDURE IF EXISTS sign_in;

CREATE PROCEDURE sign_in (
    IN p_login VARCHAR(30),
    IN p_password VARCHAR(255)
)
COMMENT "(p_login, p_password)"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_encryptedPassword VARCHAR(255);
  DECLARE v_token VARCHAR(50);
  DECLARE v_refreshToken VARCHAR(50) DEFAULT(SELECT refreshToken FROM Tokens WHERE login = p_login);
  DECLARE v_nickname VARCHAR(12);
  DECLARE v_createdAt TIMESTAMP DEFAULT(SELECT createdAt FROM Tokens WHERE login = p_login);

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

  SET v_token = SHA2(UUID_SHORT(), 256);

    IF v_createdAt + INTERVAL 30 DAY > NOW() THEN
  SET v_refreshToken = SHA2(UUID_SHORT(), 256);
  END IF;

  -- Insert or update token and refreshToken for user
  INSERT INTO Tokens (login, token, refreshToken) 
  VALUES (p_login, v_token, v_refreshToken)
  ON DUPLICATE KEY UPDATE token=v_token, refreshToken=v_refreshToken, createdAt = NOW();

  SELECT nickname INTO v_nickname FROM Users WHERE login = p_login;

  -- Use COMMIT to commit the changes made during the transaction
  COMMIT;

  SELECT v_token AS token, v_refreshToken AS refreshToken, v_nickname AS nickname;
END;
