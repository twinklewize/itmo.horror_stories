DROP PROCEDURE IF EXISTS update_game_phase;
CREATE PROCEDURE update_game_phase(p_roomCode INT UNSIGNED)
COMMENT "(p_room)"
BEGIN
    DECLARE v_moveTime TINYINT UNSIGNED DEFAULT (SELECT moveTime FROM Rooms WHERE roomCode = p_roomCode);
    DECLARE v_isGameOver INT UNSIGNED DEFAULT (is_game_over(p_roomCode));

    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    IF v_isGameOver = 0 AND NOW() >= DATE_ADD((SELECT createdAt FROM Moves WHERE roomCode = p_roomCode), INTERVAL v_moveTime SECOND) AND (SELECT phase FROM Moves WHERE roomCode = p_roomCode) = 'voting' THEN
        CALL stop_voting_phase(p_roomCode);
    ELSEIF v_isGameOver = 0 AND NOW() >= DATE_ADD((SELECT createdAt FROM Moves WHERE roomCode = p_roomCode), INTERVAL v_moveTime SECOND) AND (SELECT phase FROM Moves WHERE roomCode = p_roomCode) != 'voting' AND (SELECT roundNumber FROM Moves WHERE roomCode=p_roomCode)<5   THEN
        UPDATE Moves SET phase = 'voting', createdAt = NOW(), roundNumber = Moves.roundNumber+1 WHERE roomCode = p_roomCode;
    END IF;
    
END;
