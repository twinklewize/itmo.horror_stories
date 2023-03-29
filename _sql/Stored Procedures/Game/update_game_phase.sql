DROP PROCEDURE IF EXISTS update_game_phase;

CREATE PROCEDURE update_game_phase(
    IN p_roomCode INT UNSIGNED
)
COMMENT "(p_room INT UNSIGNED) - проверяет закончилось ли время хода и обновляет раунд и фазу"
SQL SECURITY INVOKER
BEGIN
    DECLARE v_moveTime TINYINT UNSIGNED DEFAULT (SELECT moveTime FROM Rooms WHERE roomCode = p_roomCode);
    DECLARE v_createdAt TIMESTAMP DEFAULT (SELECT createdAt FROM Moves WHERE roomCode = p_roomCode);

    -- Остановить фазу голосования, если игра не закончилась, а время хода закончилось
    IF is_game_over(p_roomCode) = 0 AND NOW() >= DATE_ADD(v_createdAt, INTERVAL v_moveTime SECOND) THEN
        -- Если была фаза голосования остановить фазу голосования
        IF (SELECT phase FROM Moves WHERE roomCode = p_roomCode) = 'voting' THEN
            CALL stop_voting_phase(p_roomCode);
             -- Если была фаза подсказок начать фазу голосования
        ELSE
            UPDATE Moves SET phase = 'voting', createdAt = NOW()
            WHERE roomCode = p_roomCode;
        END IF;
    END IF;
END;
