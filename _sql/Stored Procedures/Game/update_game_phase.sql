DROP PROCEDURE IF EXISTS update_game_phase;

CREATE PROCEDURE update_game_phase(p_roomCode INT UNSIGNED)
COMMENT "Check if round phase is over"
BEGIN
    DECLARE v_moveTime TINYINT DEFAULT (SELECT moveTime FROM Rooms WHERE roomCode = p_roomCode);
    DECLARE v_isGameOver INT DEFAULT (isGameOver(p_roomCode));
    
    START TRANSACTION;
    
    IF v_isGameOver = 0 AND NOW() >= DATE_ADD((SELECT startedAt FROM Moves WHERE roomCode = p_roomCode), INTERVAL v_moveTime SECOND) AND (SELECT phase FROM Moves WHERE roomCode = p_roomCode) = 'voting' THEN
            CALL stop_voting(p_roomCode);
        
        -- Start voting phase if we are not in voting phase and time is not up yet
    ELSEIF v_isGameOver = 0 AND NOW() < DATE_ADD((SELECT startedAt FROM Moves WHERE roomCode = p_roomCode), INTERVAL v_moveTime SECOND) AND (SELECT phase FROM Moves WHERE roomCode = p_roomCode) != 'voting' THEN
            UPDATE Moves SET phase = 'voting', startedAt = NOW() WHERE roomCode = p_roomCode;
    END IF;
    COMMIT;
END;
