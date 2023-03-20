DROP PROCEDURE IF EXISTS restore_game;
CREATE PROCEDURE restore_game (
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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid room code';
    END IF;

    SELECT v_isGameOver as isGameOver;

    SELECT v_playerId as playerId;
    SELECT v_masterId as masterId;

    SELECT playerId, nickname FROM Players LEFT JOIN Users ON Players.login = Users.login WHERE Players.login <> v_login AND roomCode = p_roomCode;
    SELECT tableCardId, Cards.cardName, imageUrl, description, isOnTable FROM TableCards LEFT JOIN Cards ON TableCards.cardName = Cards.cardName WHERE roomCode = p_roomCode;

    SELECT Votes.playerId, tableCardId FROM Votes LEFT JOIN Players ON Players.playerId = Votes.playerId WHERE roomCode = p_roomCode;

    SET v_remaining_time = (SELECT TIMESTAMPDIFF(SECOND, NOW(), DATE_ADD((Moves.createdAt), INTERVAL Rooms.moveTime SECOND)) FROM Moves LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode);
            IF v_isGameOver = 1 THEN
        SET v_remaining_time = 0;
        END IF;

    IF v_playerId <> v_masterId THEN
        SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = Cards.cardName WHERE HintCards.roomCode = p_roomCode AND hintStatus <> 'hand';
        SELECT Moves.roundNumber, RoundRules.cardsToRemoveCount, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules ON Moves.roundNumber = RoundRules.roundNumber LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode;
    ELSE 
        SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = Cards.cardName WHERE roomCode = p_roomCode;
        SELECT Moves.roundNumber, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode;
    END IF; 
    IF v_playerId = v_masterId OR v_isGameOver = 1 THEN
    SELECT SelectedCards.tableCardId as selectedCardId FROM SelectedCards LEFT JOIN TableCards ON TableCards.tableCardId = SelectedCards.tableCardId WHERE roomCode = p_roomCode;
    END IF;
END;
