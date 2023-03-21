DROP PROCEDURE IF EXISTS update_game_phase;

CREATE PROCEDURE update_game_phase(
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_room INT UNSIGNED) - проверяет закончилось ли время хода и обновляет раунд и фазу"
BEGIN
    DECLARE v_moveTime TINYINT UNSIGNED DEFAULT (SELECT moveTime FROM Rooms WHERE roomCode = p_roomCode);

    -- Остановить фазу голосования, если игра не закончилась, а время хода закончилось
    IF is_game_over(p_roomCode) = 0 AND NOW() >= DATE_ADD((SELECT createdAt FROM Moves WHERE roomCode = p_roomCode), INTERVAL v_moveTime SECOND) AND (SELECT phase FROM Moves WHERE roomCode = p_roomCode) THEN
        -- Если была фаза голосования остановить фазу голосования
        IF (SELECT phase FROM Moves WHERE roomCode = p_roomCode) = 'voting' THEN
            CALL stop_voting_phase(p_roomCode);
             -- Если была фаза подсказок начать фазу голосования
        ELSE
            UPDATE Moves SET phase = 'voting', createdAt = NOW(), roundNumber = Moves.roundNumber + 1 WHERE roomCode = p_roomCode;
        END IF;
    END IF;
END;
