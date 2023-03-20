DROP PROCEDURE IF EXISTS join_game;
CREATE PROCEDURE join_game(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "(p_token, p_roomCode)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = p_roomCode);
    DECLARE v_remaining_time TINYINT UNSIGNED;
    DECLARE v_isGameOver TINYINT UNSIGNED DEFAULT (is_game_over(p_roomCode));
    CALL update_game_phase(p_roomCode); 
    
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Неправильный код комнаты';
    END IF;

    IF v_playerId = v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вы не можете подсоединиться к игре';
    END IF;

    IF (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Игра не найдена';
    END IF;

    SET v_remaining_time = (SELECT TIMESTAMPDIFF(SECOND, NOW(), DATE_ADD((Moves.createdAt), INTERVAL Rooms.moveTime SECOND)) FROM Moves LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode);


        IF v_isGameOver = 1 THEN
        SET v_remaining_time = 0;
        END IF;

   SELECT Moves.roundNumber, RoundRules.cardsToRemoveCount, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules ON Moves.roundNumber = RoundRules.roundNumber LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode;
    SELECT tableCardId, Cards.cardName, imageUrl, description FROM TableCards LEFT JOIN Cards ON TableCards.cardName = Cards.cardName WHERE TableCards.roomCode = p_roomCode;
END;
