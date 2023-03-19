DROP FUNCTION IF EXISTS get_login_from_token;
CREATE FUNCTION get_login_from_token(p_token VARCHAR(50))
RETURNS VARCHAR(30)
COMMENT "Check if token is valid, update user lastActivity and return user login"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT NULL;
    DECLARE v_createdAt TIMESTAMP DEFAULT NULL;
    
    SELECT login, createdAt INTO v_login, v_createdAt FROM Tokens WHERE token = p_token;

    IF v_login IS NULL OR v_createdAt + INTERVAL 3 HOUR <= NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'AUTHENTIFICATION_ERROR';
    END IF;

    -- Update last activity time for the user in Users table
    UPDATE Users SET lastActivity = CURRENT_TIMESTAMP WHERE login = v_login;
    
    RETURN v_login;
END;