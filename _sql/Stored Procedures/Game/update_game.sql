DROP PROCEDURE IF EXISTS update_game;

CREATE PROCEDURE update_game(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Returns updated game state"
BEGIN
    DECLARE v_login INT DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    DECLARE v_isGameOver INT DEFAULT (isGameOver(p_roomCode));

    CALL update_game_phase(p_roomCode);

    START TRANSACTION;

    IF v_isGameOver = 1 AND v_playerId != v_masterId THEN 
        SELECT tableCardId as selectedCardId FROM SelectedCards WHERE roomCode = p_roomCode;
    END IF;

    SELECT roundNumber, phase, TIMESTAMPDIFF(SECOND, startedAt, NOW()) as remainingTime, cardsToRemoveCount FROM Moves WHERE roomCode = p_roomCode;
    SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1;
    SELECT playerId FROM Players WHERE roomCode = p_roomCode AND login <> v_login;

    IF (SELECT COUNT(*) FROM Votes WHERE roomCode = p_roomCode) > 0 THEN
        SELECT playerId, tableCardId FROM Votes WHERE roomCode = p_roomCode AND playerId <> v_playerId;
    END IF;

    IF v_playerId <> v_masterId THEN
        SELECT cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = Cards.cardName WHERE roomCode = p_roomCode AND hintStatus <> 'hand';
    END IF;
    COMMIT;
END;
