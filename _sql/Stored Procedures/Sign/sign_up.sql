DROP PROCEDURE IF EXISTS sign_up;

CREATE PROCEDURE sign_up (
    p_login VARCHAR(30),
    p_password VARCHAR(255),
    p_nickname VARCHAR(12)
)
COMMENT "User sign up"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_salt VARCHAR(64);
  DECLARE out_token VARCHAR(50);
  DECLARE out_refreshToken VARCHAR(50);

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

  SET out_token = UUID_SHORT();
  SET out_refreshToken = UUID_SHORT();

  INSERT INTO Tokens (login, token, refreshToken)
  VALUES (p_login, out_token, out_refreshToken);

  -- commit changes
  COMMIT;
  SELECT out_token AS token, out_refreshToken AS refreshToken;

END;
