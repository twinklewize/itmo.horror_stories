DROP FUNCTION IF EXISTS is_game_over;
CREATE FUNCTION is_game_over(
    p_roomCode INT UNSIGNED
)
RETURNS TINYINT
COMMENT "(p_roomCode)"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = p_roomCode);
    DECLARE v_selectedCardId INT DEFAULT (SELECT SelectedCards.tableCardId FROM SelectedCards LEFT JOIN TableCards ON SelectedCards.tableCardId = TableCards.tableCardId WHERE roomCode = p_roomCode);
    
    DECLARE v_isGameOver TINYINT DEFAULT 0;

IF NOT EXISTS (SELECT * FROM Moves WHERE roomCode = p_roomCode) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра не найдена';
END IF;

    -- Check if there is no master
    IF NOT EXISTS (SELECT * FROM Masters LEFT JOIN Players ON Masters.playerId = Players.playerId WHERE roomCode = p_roomCode) THEN
        SET v_isGameOver = 1;
    -- Check if there are no players left in the game except the current master
    ELSEIF NOT EXISTS (SELECT * FROM Players WHERE roomCode = p_roomCode AND playerId <> v_masterId) THEN
        SET v_isGameOver = 1;
    -- Check if the main card is out of play
    ELSEIF ((SELECT isOnTable FROM TableCards WHERE tableCardId = v_selectedCardId) = 0) THEN
        SET v_isGameOver = 1;
    -- Check if only the main card remains on the table
    ELSEIF (SELECT COUNT(*) FROM TableCards WHERE roomCode = p_roomCode and isOnTable = 1) = 1 AND ((SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1) = v_selectedCardId) THEN
        SET v_isGameOver = 1;
    END IF;

    RETURN v_isGameOver;
END;

