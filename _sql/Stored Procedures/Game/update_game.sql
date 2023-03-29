    DROP PROCEDURE IF EXISTS update_game;

    CREATE PROCEDURE update_game(
        IN p_token VARCHAR(50),
        IN p_roomCode INT UNSIGNED
    )
    COMMENT "(p_token VARCHAR(50), p_roomCode INT UNSIGNED) - возращает id активных игроков, id карт которые еще лежат на столе, раунд, фазу раунда, оставшееся время, голоса других игроков, подсказки для игроков, закончилась ли игра и selected_сard_id для игроков, если закончилась"
    BEGIN
        DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
        DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
        DECLARE v_isMaster TINYINT UNSIGNED DEFAULT(SELECT COUNT(*) FROM Masters WHERE playerId = v_playerId);
        DECLARE v_isGameOver TINYINT DEFAULT (is_game_over(p_roomCode));
        DECLARE v_remaining_time TINYINT UNSIGNED;

        -- Отмена транзакции на SQLEXCEPTION
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            RESIGNAL;
        END;

        -- Обновляет фазу игры
        CALL update_game_phase(p_roomCode);

        START TRANSACTION;
        SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
        -- Возвращает закончилась ли игра
        SELECT v_isGameOver as isGameOver;
        -- Возвращает selectedCardId, если игра закончилась и игрок не мастер
        SELECT SelectedCards.tableCardId as selectedCardId FROM SelectedCards LEFT JOIN TableCards USING(tableCardId) WHERE roomCode = p_roomCode AND v_isGameOver = 1 AND v_isMaster = 0;
        -- Возвращает id карт которые еще на столе
        SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1;
        -- Возвращает других id игроков которые еще в комнате
        SELECT playerId FROM Players WHERE roomCode = p_roomCode AND login <> v_login;
        -- Возвращает голоса других игроков
        SELECT Votes.playerId, tableCardId FROM Votes LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode AND Votes.playerId <> v_playerId;

        -- Оставшееся время хода
        SET v_remaining_time = (SELECT TIMESTAMPDIFF(SECOND, NOW(), DATE_ADD((Moves.createdAt), INTERVAL Rooms.moveTime SECOND)) FROM Moves LEFT JOIN Rooms USING(roomCode) WHERE Moves.roomCode = p_roomCode);
        IF v_isGameOver = 1 THEN
            SET v_remaining_time = 0;
        END IF;

        -- Если игрок не мастер вовзращает информацию о ходе с cardsToRemoveCount
        -- Также возвращает карты подсказок на столе
        IF v_isMaster = 0 THEN
            SELECT Moves.roundNumber, cardsToRemoveCount, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules USING(roundNumber) 
            LEFT JOIN Rooms USING(roomCode)
            WHERE Moves.roomCode = p_roomCode;

            SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards 
            LEFT JOIN Cards USING(cardName) WHERE roomCode = p_roomCode AND hintStatus <> 'hand';
        ELSE
          -- Если игрок мастер вовзращает информацию о ходе без cardsToRemoveCount
         SELECT Moves.roundNumber, Moves.phase, v_remaining_time as remainingTime 
         FROM Moves 
         LEFT JOIN RoundRules USING(roundNumber) 
         LEFT JOIN Rooms USING(roomCode)
         WHERE Moves.roomCode = p_roomCode;
        END IF;
        COMMIT;
    END;

