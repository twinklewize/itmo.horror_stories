DROP FUNCTION IF EXISTS get_login_from_token;

CREATE FUNCTION get_login_from_token(
    p_token VARCHAR(50)
) 
RETURNS VARCHAR(30)
COMMENT "(p_token) - возвращает login пользователя по access_token"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT NULL;
    DECLARE v_createdAt TIMESTAMP DEFAULT NULL;
    SELECT login, createdAt INTO v_login, v_createdAt FROM Tokens WHERE token = p_token;

    -- Ошибка, если access_token больше 3 часов
    IF v_login IS NULL OR v_createdAt + INTERVAL 3 HOUR <= NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'AUTHENTICATION_ERROR';
    END IF;

    -- Обновляет lastActivity пользователя
    UPDATE Users 
    SET lastActivity = CURRENT_TIMESTAMP 
    WHERE login = v_login;

    RETURN v_login;
END;
