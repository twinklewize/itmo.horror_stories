DROP PROCEDURE IF EXISTS vote;
CREATE PROCEDURE vote(
    IN p_token VARCHAR(50),
    IN p_tableCardId INT
)
COMMENT "(p_token VARCHAR(50), p_tableCardId INT UNSIGNED) - добавляет голос для tale_card"
SQL SECURITY DEFINER
BEGIN
DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
DECLARE v_roomCode INT UNSIGNED DEFAULT (SELECT roomCode FROM TableCards WHERE tableCardId = p_tableCardId AND isOnTable = 1);
DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = v_roomCode);
DECLARE v_maxVotesCount TINYINT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
       ROLLBACK;
       RESIGNAL;
    END;
    
-- Обновляет фазу игры
CALL update_game_phase(v_roomCode);

-- Ошибка если игра закончена
IF is_game_over(v_roomCode) = 1 THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра окончена';
END IF;

-- ошибка если игрок не найден
IF v_playerId IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игрока нет в этой игре';
END IF;

-- ошибка если игрок мастер
IF EXISTS (SELECT * FROM Masters WHERE playerId = v_playerId) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Мастер не может голосовать';
END IF;

START TRANSACTION;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT cardsToRemoveCount INTO v_maxVotesCount 
FROM RoundRules RIGHT JOIN Moves USING(roundNumber) 
WHERE roomCode = v_roomCode 
FOR UPDATE;

-- Ошибка, если не фаза голосования
IF (SELECT phase FROM Moves WHERE roomCode = v_roomCode) <> 'voting' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Это не фаза голосования';
END IF;

-- Ошибка если голоса игрока закончились
SELECT COUNT(*) INTO @votesCount FROM Votes WHERE playerId = v_playerId;
IF v_maxVotesCount <= @votesCount THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ваши голоса закончились';
END IF;

-- Ошибка если игрок уже голосовал за эту карту
IF EXISTS (SELECT * FROM Votes WHERE tableCardId = p_tableCardId AND playerId = v_playerId) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы уже голосовали за эту карту';
END IF;

-- Ошибка если карта не на столе
IF (SELECT isOnTable FROM TableCards WHERE tableCardId = p_tableCardId) = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Карта не на столе';
END IF;

-- Добавляет голос
INSERT INTO Votes (tableCardId, playerId) VALUES (p_tableCardId, v_playerId);

-- Если все проголосовали, то остановить фазу голосования
SELECT COUNT(*) INTO @totalVotesCount 
    FROM Votes 
    LEFT JOIN TableCards USING(tableCardId) 
    WHERE TableCards.roomCode = v_roomCode;
    
IF @totalVotesCount >= ((SELECT COUNT(*) FROM Players WHERE roomCode = v_roomCode) - 1) * v_maxVotesCount THEN
    CALL stop_voting_phase(v_roomCode);
END IF;

COMMIT;
END;
