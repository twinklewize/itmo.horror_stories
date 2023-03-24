DROP PROCEDURE IF EXISTS sign_up;

-- Процедура регистрации нового пользователя
CREATE PROCEDURE sign_up (
  IN p_login VARCHAR(30), -- логин нового пользователя
  IN p_password VARCHAR(255), -- пароль нового пользователя
  IN p_nickname VARCHAR(12) -- никнейм нового пользователя
)
COMMENT "(p_login VARCHAR(30), p_password VARCHAR(255), p_nickname VARCHAR(12)) - регестрирует нового пользователя и возвращает access_token и refresh_token"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_salt VARCHAR(64); -- переменная для соли пароля
  DECLARE v_token VARCHAR(50); -- переменная для access_token
  DECLARE v_refreshToken VARCHAR(50); -- переменная для refresh_token
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

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


  START TRANSACTION;
  SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
  
  -- Создает нового пользователя (сохраняет зашифрованный пароль)
  INSERT INTO Users (login, password, nickname, lastActivity)
  VALUES (p_login, SHA2(p_password, 256), p_nickname, CURRENT_TIMESTAMP);

  -- Генерирует access_token и refresh_token
  SET v_token = SHA2(UUID_SHORT(), 256);
  SET v_refreshToken = SHA2(UUID_SHORT(), 256);

  -- Сохраняет access_token и refresh_token
  INSERT INTO Tokens (login, token, refreshToken)
  VALUES (p_login, v_token, v_refreshToken);
  
  COMMIT; -- завершаем транзакцию после успешной регистрации

  -- Возвращает access_token и refresh_token
  SELECT v_token AS token, v_refreshToken AS refreshToken;
END;
