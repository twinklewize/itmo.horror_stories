DROP PROCEDURE IF EXISTS join_room;

CREATE PROCEDURE join_room(
    IN p_token VARCHAR(50), 
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - добавляет пользователя в комнату, если его в ней нет, возвращает его playerId в этой комнате, а также playerId и nickname других игроков"
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_existingPlayersCount TINYINT UNSIGNED;
    DECLARE v_placesCount          TINYINT UNSIGNED;
    DECLARE v_remainingPlacesCount TINYINT UNSIGNED;
    DECLARE v_isUserInRoom TINYINT DEFAULT(SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode AND login = v_login);

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Ошибка, если игра уже началась
    IF EXISTS(SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра уже началась';
    END IF;

    -- Ошибка, если комнаты не существует
    IF NOT EXISTS (SELECT * FROM Rooms WHERE roomCode = p_roomCode) THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный код комнаты';
    END IF;

    START TRANSACTION;
    
    SELECT placesCount, COUNT(*) AS existingPlayersCount 
    INTO v_placesCount, v_existingPlayersCount 
    FROM Rooms
    LEFT JOIN Players USING(roomCode)
    WHERE Rooms.roomCode = Players.roomCode 
    GROUP BY Rooms.roomCode
    FOR UPDATE;
    
    -- сколько мест осталось в комнате
    SET v_remainingPlacesCount = v_placesCount - v_existingPlayersCount;
    
    -- Ошибка, если пользователь не в комнате и мест нет
    IF v_isUserInRoom = 0 AND v_remainingPlacesCount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'В комнате нет мест';
    -- Если пользователь не в комнате и места есть добавляет его в комнату
    ELSEIF v_isUserInRoom = 0 AND v_remainingPlacesCount > 0 THEN
        INSERT INTO Players(login, roomCode) VALUES(v_login, p_roomCode);
        -- Если мест не осталось, рандомно выбирается мастер
        IF v_remainingPlacesCount = 1 THEN 
            INSERT INTO Masters(playerId) VALUES (
                (SELECT playerId FROM Players WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1)
            );
        END IF;
    END IF;

    -- Возвращает playerId игрока
    SELECT playerId FROM Players WHERE roomCode = p_roomCode AND login = v_login;

    -- Возвращает других игроков
    SELECT playerId, Users.nickname 
    FROM Players 
    LEFT JOIN Users USING(login)
    WHERE roomCode = p_roomCode AND Players.login <> v_login;

    COMMIT;
END;