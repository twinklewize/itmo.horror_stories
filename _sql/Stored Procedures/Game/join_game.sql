DROP PROCEDURE IF EXISTS join_game;
CREATE PROCEDURE join_game(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Get init game state for players"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE v_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    CALL update_game_phase(p_roomCode); 
    
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid room code';
    END IF;

    IF v_playerId = v_masterId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'To get initial game state master should use start_game procedure';
    END IF;

    IF (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No game found';
    END IF;

    SELECT roundNumber, phase, TIMESTAMPDIFF(SECOND, startedAt, NOW()) as remainingTime, cardsToRemoveCount FROM Moves WHERE roomCode = p_roomCode;

    SELECT tableCardId, Cards.cardName, imageUrl, desription FROM TableCards LEFT JOIN Cards ON TableCards.cardName = Cards.cardName WHERE roomCode = p_roomCode;
END;
