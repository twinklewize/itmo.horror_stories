DROP PROCEDURE IF EXISTS create_room;

CREATE PROCEDURE create_room(
  IN p_token VARCHAR(50),
  IN p_roomCode INT UNSIGNED,
  IN p_moveTime TINYINT UNSIGNED,
  IN p_placesCount TINYINT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode TINYINT UNSIGNED, p_moveTime TINYINT UNSIGNED, p_placesCount TINYINT UNSIGNED) - создает новую комнату и возвращает пользователю его playerId в этой комнате"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      ROLLBACK;
      RESIGNAL;
    END;
  
    START TRANSACTION;
     -- Ошибка, если  комната уже существует
    IF EXISTS(SELECT * FROM Rooms WHERE roomCode = p_roomCode) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Комната уже существует';
    END IF;

     -- Ошибка, если длина хода не в границах 30-120
    IF (p_moveTime < 30 OR p_moveTime > 120) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Границы времени хода: 30..120';
    END IF; 

    -- Ошибка, если количество мест не в границах 2-10
    IF (p_placesCount < 2 OR p_placesCount > 10) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Границы количества игроков: 2..10';
    END IF;

    -- Создает комнату
    INSERT INTO Rooms(roomCode, moveTime, placesCount) 
        VALUES(p_roomCode, p_moveTime, p_placesCount);
      
    -- Добаляет пользователя в комнату
    INSERT INTO Players(login, roomCode) 
      VALUES(v_login, p_roomCode);

    -- возвращает playerId игрока
    SELECT LAST_INSERT_ID() as playerId;
    COMMIT;
END;