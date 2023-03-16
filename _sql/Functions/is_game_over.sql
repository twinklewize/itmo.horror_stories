DROP FUNCTION IF EXISTS is_game_over;
CREATE FUNCTION is_game_over(
    p_roomCode INT UNSIGNED
)
RETURNS TINYINT(1)
COMMENT "Check if game is over"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    DECLARE v_selectedCardId INT DEFAULT (SELECT tableCardId FROM SelectedCards WHERE roomCode = p_roomCode);
    
    DECLARE v_isGameOver TINYINT(1) DEFAULT 0;

IF NOT EXISTS (SELECT * FROM Rooms WHERE roomCode = p_roomCode AND status IN ('IN_PROGRESS','WAITING')) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is not found or has not been started';
END IF;

    -- Check if there is no master
    IF ((SELECT COUNT(*) FROM Masters WHERE roomCode = p_roomCode) = 0 OR (SELECT masterId FROM Masters WHERE roomCode = v_masterId) IS NULL) THEN
        SET v_isGameOver = 1;
    -- Check if there are no players left in the game except the current master
    ELSEIF ((SELECT COUNT(*) FROM Players WHERE roomCode = p_roomCode AND playerId <> v_masterId) = 0) THEN
        SET v_isGameOver = 1;
    -- Check if the main card is out of play
    ELSEIF ((SELECT isOnTable FROM TableCards WHERE tableCardId = v_selectedCardId) = 0) THEN
        SET v_isGameOver = 1;
    -- Check if only the main card remains on the table
    ELSEIF ((SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1) = v_selectedCardId) THEN
        SET v_isGameOver = 1;
    END IF;

    RETURN v_isGameOver;
END;

