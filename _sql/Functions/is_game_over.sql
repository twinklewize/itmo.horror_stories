DROP FUNCTION IF EXISTS is_game_over;

CREATE FUNCTION is_game_over(
    p_roomCode INT UNSIGNED
)
RETURNS TINYINT
COMMENT "(p_roomCode) - возвращает 1, если игра закончилась"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode);
    DECLARE v_selectedCardId INT DEFAULT (SELECT SelectedCards.tableCardId FROM SelectedCards LEFT JOIN TableCards USING(tableCardId) WHERE roomCode = p_roomCode);
    DECLARE v_isGameOver TINYINT DEFAULT 0;

    IF NOT EXISTS (SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра не найдена';
    END IF;

    -- Игра заканчивается:
    -- Если в комнате нет мастера
    IF NOT EXISTS (SELECT * FROM Masters LEFT JOIN Players USING(playerId) WHERE roomCode = p_roomCode) THEN
        SET v_isGameOver = 1;
    -- Если в комнате нет других игроков кроме мастера
    
    ELSEIF NOT EXISTS (SELECT * FROM Players WHERE roomCode = p_roomCode AND playerId <> v_masterId) THEN
        SET v_isGameOver = 1;
    -- Если selected_card не на столе
    ELSEIF ((SELECT isOnTable FROM TableCards WHERE tableCardId = v_selectedCardId) = 0) THEN
        SET v_isGameOver = 1;
    -- Если selected_card единственная карта на столе
    ELSEIF (SELECT COUNT(*) FROM TableCards WHERE roomCode = p_roomCode and isOnTable = 1) = 1 AND ((SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1) = v_selectedCardId) THEN
        SET v_isGameOver = 1;
    END IF;

    RETURN v_isGameOver;
END;

