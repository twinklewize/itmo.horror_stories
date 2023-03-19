DROP PROCEDURE IF EXISTS sign_up;

CREATE PROCEDURE sign_up (
   IN p_login VARCHAR(30),
   IN p_password VARCHAR(255),
   IN p_nickname VARCHAR(12)
)
COMMENT "(p_login, p_password, p_nickname)"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_salt VARCHAR(64);
  DECLARE v_token VARCHAR(50);
  DECLARE v_refreshToken VARCHAR(50);

  -- start transaction
  START TRANSACTION;

  IF LENGTH(p_login) < 5 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Too short login';
  END IF;

  IF LENGTH(p_password) < 5 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Too short password';
  END IF;

  IF EXISTS(SELECT * FROM Users WHERE login = p_login) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User already exists';
  END IF;

  SET p_password = SHA2(p_password, 256);

  INSERT INTO Users (login, password, nickname, lastActivity)
  VALUES (p_login, p_password, p_nickname, CURRENT_TIMESTAMP);

  SET v_token = SHA2(UUID_SHORT(), 256);
  SET v_refreshToken = SHA2(UUID_SHORT(), 256);

  INSERT INTO Tokens (login, token, refreshToken)
  VALUES (p_login, v_token, v_refreshToken);

  -- commit changes
  COMMIT;
  SELECT v_token AS token, v_refreshToken AS refreshToken;

END;
