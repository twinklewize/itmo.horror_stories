DROP PROCEDURE IF EXISTS restore_game;

CREATE PROCEDURE restore_game (
    IN p_token VARCHAR(50),
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - возвращает полное состояние игры для игрока или мастера"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode);
    DECLARE v_remaining_time TINYINT UNSIGNED;
    DECLARE v_isGameOver TINYINT UNSIGNED DEFAULT (is_game_over(p_roomCode));

    -- Обновляет фазу игры
    CALL update_game_phase(p_roomCode);

    -- Ошибка, если игрок не найден
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игрока нет в этой комнате';
    END IF;

    -- Возвращает закончилась ли игра
    SELECT v_isGameOver as isGameOver;
    -- Возвращает playerId пользователя
    SELECT v_playerId as playerId;
     -- Возвращает masterId
    SELECT v_masterId as masterId;

    -- Возвращает других игроков
    SELECT playerId, nickname FROM Players LEFT JOIN Users USING(login) WHERE Players.login <> v_login AND roomCode = p_roomCode;
     -- Возвращает карты на столе
    SELECT tableCardId, Cards.cardName, imageUrl, description, isOnTable FROM TableCards LEFT JOIN Cards USING(cardName) WHERE roomCode = p_roomCode;
    -- Возвращает голоса
    SELECT Votes.playerId, tableCardId FROM Votes LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode;

    -- Если remaining_time < 0 присвоить remaining_time = 0
    SET v_remaining_time = (SELECT TIMESTAMPDIFF(SECOND, NOW(), DATE_ADD((Moves.createdAt), INTERVAL Rooms.moveTime SECOND)) FROM Moves LEFT JOIN Rooms USING(roomCode) WHERE Moves.roomCode = p_roomCode);
            IF v_isGameOver = 1 THEN
        SET v_remaining_time = 0;
        END IF;


    IF v_playerId <> v_masterId THEN
        -- Возвращает подсказки, которые на столе для обычного игрока
        SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards USING(cardName) WHERE HintCards.roomCode = p_roomCode AND hintStatus <> 'hand';
         -- Возвращает информацию о ходе с cardsToRemoveCount
        SELECT Moves.roundNumber, RoundRules.cardsToRemoveCount, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules USING(roundNumber) LEFT JOIN Rooms USING(roomCode) WHERE Moves.roomCode = p_roomCode;
    ELSE 
         -- Возвращает все подсказки для мастера
        SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards USING(cardName) WHERE roomCode = p_roomCode;
        -- Возвращает информацию о ходе без cardsToRemoveCount
        SELECT Moves.roundNumber, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN Rooms USING(roomCode) WHERE Moves.roomCode = p_roomCode;
    END IF; 
    -- Возвращает selectedCardId если игра закончилась или это мастер
    IF v_playerId = v_masterId OR v_isGameOver = 1 THEN
        SELECT SelectedCards.tableCardId as selectedCardId FROM SelectedCards LEFT JOIN TableCards USING(tableCardId) WHERE roomCode = p_roomCode;
    END IF;
END;
