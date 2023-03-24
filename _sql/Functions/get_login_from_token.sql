DROP FUNCTION IF EXISTS get_login_from_token;

CREATE FUNCTION get_login_from_token(
    p_token VARCHAR(50)
)
RETURNS VARCHAR(30)
COMMENT "(p_token VARCHAR(50)) - возвращает login пользователя по access_token"
SQL SECURITY INVOKER
BEGIN
    -- Создаем переменные
    DECLARE v_login VARCHAR(30);

    -- Получаем логин и время создания токена из таблицы Tokens для данного токена
    SELECT login INTO v_login 
    FROM Tokens 
    WHERE token = p_token 
    AND createdAt + INTERVAL 3 HOUR >= NOW() FOR UPDATE;

    -- Если токен не найден или устарел, генерируем ошибку
    IF v_login IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'AUTHENTICATION_ERROR';
    END IF;

    -- Обновляем lastActivity для полученного login в таблице Users
    UPDATE Users 
    SET lastActivity = CURRENT_TIMESTAMP 
    WHERE login = v_login;

    RETURN v_login;
END;