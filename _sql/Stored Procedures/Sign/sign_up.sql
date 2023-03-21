DROP PROCEDURE IF EXISTS sign_up;

CREATE PROCEDURE sign_up (
   IN p_login VARCHAR(30),
   IN p_password VARCHAR(255),
   IN p_nickname VARCHAR(12)
)
COMMENT "(p_login VARCHAR(30), p_password VARCHAR(255), p_nickname VARCHAR(12)) - регестрирует нового пользователя и возвращает access_token и refresh_token"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_salt VARCHAR(64);
  DECLARE v_token VARCHAR(50);
  DECLARE v_refreshToken VARCHAR(50);

      -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

  START TRANSACTION;

  -- Ошибка, если длина логина меньше 5 символов
  IF LENGTH(p_login) < 5 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Слишком короткий логин';
  END IF;

  -- Ошибка, если длина пароля меньше 5 символов
  IF LENGTH(p_password) < 5 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Слишком короткий пароль';
  END IF;

  -- Ошибка, если пользователь уже существует
  IF EXISTS(SELECT * FROM Users WHERE login = p_login) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Пользователь уже существует';
  END IF;

  -- Создает нового пользователя (сохраняет зашифрованный пароль)
  INSERT INTO Users (login, password, nickname, lastActivity)
  VALUES (p_login, SHA2(p_password, 256), p_nickname, CURRENT_TIMESTAMP);

  -- Генерирует access_token и refresh_token
  SET v_token = SHA2(UUID_SHORT(), 256);
  SET v_refreshToken = SHA2(UUID_SHORT(), 256);

  -- Сохраняет access_token и refresh_token
  INSERT INTO Tokens (login, token, refreshToken)
  VALUES (p_login, v_token, v_refreshToken);
  COMMIT;

  -- Возвращает access_token и refresh_token
  SELECT v_token AS token, v_refreshToken AS refreshToken;
END;
