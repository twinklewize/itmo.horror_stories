DROP PROCEDURE IF EXISTS restore_game;
CREATE PROCEDURE restore_game (
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Get full game state"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    CALL update_game_phase(p_roomCode);

    IF (SELECT isGameOver FROM Rounds WHERE roundNumber = (SELECT roundNumber FROM Moves WHERE roomCode = p_roomCode)) = 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is over';
    END IF;

    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid room code';
    END IF;

    SELECT v_playerId as playerId;
    SELECT v_masterId as masterId;
    SELECT roundNumber, phase, TIMESTAMPDIFF(SECOND, startedAt, NOW()) as remainingTime, cardsToRemoveCount FROM Moves WHERE roomCode = p_roomCode;
    SELECT playerId, nickname FROM Players WHERE login <> v_login AND roomCode = p_roomCode;
    SELECT tableCardId, Cards.cardName, imageUrl, description FROM TableCards LEFT JOIN Cards ON TableCards.cardName = Cards.cardName WHERE roomCode = p_roomCode;

    IF (SELECT COUNT(*) FROM Votes WHERE roomCode = p_roomCode) > 0 THEN
        SELECT playerId, tableCardId FROM Votes WHERE roomCode = p_roomCode;
    END IF;

    IF v_playerId <> v_masterId THEN
        SELECT cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = Cards.cardName WHERE roomCode = p_roomCode AND hintStatus <> 'hand';
    ELSE 
        SELECT tableCardId as selectedCardId FROM SelectedCards WHERE roomCode = p_roomCode;
        SELECT cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = HintCards.cardName WHERE roomCode = p_roomCode;
    END IF; 
END;
