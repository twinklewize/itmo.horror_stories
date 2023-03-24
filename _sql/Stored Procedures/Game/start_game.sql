DROP PROCEDURE IF EXISTS start_game;

CREATE PROCEDURE start_game(
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - генерирует карты для игры и возвращает их (может использовать только мастер)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token)); 
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);

    -- Отмена транзакции на SQLEXCEPTION
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Ошибка, если игра уже началась 
    IF EXISTS (SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра уже началась';
    END IF;

    -- Ошибка, если игрок не мастер 
    IF NOT EXISTS (SELECT * FROM Masters WHERE playerId = v_playerId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не мастер';
    END IF;

    START TRANSACTION;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Генерирует 12 tableCards
    INSERT INTO TableCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards ORDER BY RAND() LIMIT 12;

    -- Выбирает из них 1 карту
    INSERT INTO SelectedCards (tableCardId)
    SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode ORDER BY RAND() LIMIT 1;
    
    -- Генерирует карты подсказок
    INSERT INTO HintCards (roomCode, cardName)
    SELECT p_roomCode, cardName FROM Cards WHERE cardName NOT IN (
      SELECT cardName FROM TableCards WHERE roomCode = p_roomCode
    ) ORDER BY RAND() LIMIT 5;

    -- Начинает раунд
    INSERT INTO Moves (roomCode) VALUES (p_roomCode);
    COMMIT;

    -- Возвращает карты подсказок
    SELECT HintCards.cardName, description, imageUrl
    FROM HintCards 
    JOIN Cards USING(cardName)
    WHERE roomCode = p_roomCode;

    -- Возвращает карты на столе
    SELECT tableCardId, imageUrl, TableCards.cardName, description
    FROM TableCards
    JOIN Cards USING(cardName)
    WHERE roomCode = p_roomCode;

    -- Возвращает SelectedCardId
    SELECT SelectedCards.tableCardId as selectedCardId 
    FROM SelectedCards LEFT JOIN TableCards USING(tableCardId)
    WHERE roomCode = p_roomCode;
END;
