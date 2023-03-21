DROP PROCEDURE IF EXISTS update_session;

CREATE PROCEDURE update_session(
    IN p_refreshToken VARCHAR(50) 
)
COMMENT "(p_refreshToken VARCHAR(50)) - обновляет access_token по refresh_token"
SQL SECURITY DEFINER
BEGIN
  DECLARE v_login VARCHAR(30);
  DECLARE v_createdAt TIMESTAMP;
  DECLARE v_token VARCHAR(50);

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

  START TRANSACTION;

  -- Находит сессию 
  SELECT login, createdAt INTO v_login, v_createdAt FROM Tokens WHERE refreshToken = p_refreshToken;

  -- Ошибка, если пользователь не найден или refresh_token устарел
  IF v_login IS NULL OR v_createdAt + INTERVAL 30 DAY <= NOW() THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка авторизации';
  END IF;

  -- Генерирует новый access_token
  SET v_token = SHA2(UUID_SHORT(), 256);

  -- Обновление таблицы с токенами
  UPDATE Tokens SET token = v_token, createdAt = NOW()
  WHERE refreshToken = p_refreshToken;

  COMMIT;

  -- Возвращает access_token
  SELECT v_token AS token;
END;
