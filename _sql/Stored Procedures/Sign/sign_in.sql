DROP PROCEDURE IF EXISTS sign_in;

CREATE PROCEDURE sign_in (
    IN p_login VARCHAR(30),
    IN p_password VARCHAR(255)
)
COMMENT "(p_login VARCHAR(30), p_password  VARCHAR(255)) - авторизует пользователя и возвращает access_token, refresh_token и nickname"
-- Процедура авторизации пользователя и возвращения access_token, refresh_token и nickname
SQL SECURITY DEFINER
BEGIN
    DECLARE v_encryptedPassword VARCHAR(255);
    DECLARE v_token VARCHAR(50);
    DECLARE v_refreshToken VARCHAR(50) DEFAULT(SELECT refreshToken FROM Tokens WHERE login = p_login);
    DECLARE v_nickname VARCHAR(12);
    DECLARE v_createdAt TIMESTAMP DEFAULT(SELECT createdAt FROM Tokens WHERE login = p_login);

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Начинает транзакцию с уровнем изоляции "read committed"
    START TRANSACTION;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Запрашивает захешированный пароль из таблицы Users для указанного логина и лочит строку для предотвращения конфликтов
    SELECT password INTO v_encryptedPassword 
    FROM Users 
    WHERE login = p_login FOR UPDATE;

    -- Проверяет, что пользователь найден и пароль верный. Если нет, генерирует ошибку.
    IF v_encryptedPassword IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Пользователь не найден';
    ELSEIF NOT v_encryptedPassword = SHA2(p_password, 256) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неверный пароль';
    END IF;

    -- Обновляет lastActivity для данного пользователя
    UPDATE Users SET lastActivity = CURRENT_TIMESTAMP 
    WHERE login = p_login;

    -- Генерирует новый access_token
    SET v_token = SHA2(UUID_SHORT(), 256);

    -- Генерирует новый refresh_token, если прошло более 30 дней с момента создания предыдущего
    IF v_createdAt + INTERVAL 30 DAY <= NOW() THEN
        SET v_refreshToken = SHA2(UUID_SHORT(), 256);
    END IF;

    -- Обновляет таблицу токенов для данного пользователя
    UPDATE Tokens
    SET token=v_token, refreshToken=v_refreshToken, createdAt=NOW()
    WHERE login = p_login;

    -- Получает никнейм пользователя
    SELECT nickname INTO v_nickname 
    FROM Users WHERE login = p_login;

    -- Завершение транзакции
    COMMIT;

    -- Возвращает access_token, refresh_token и nickname
    SELECT v_token AS token, v_refreshToken AS refreshToken, v_nickname AS nickname;
END;