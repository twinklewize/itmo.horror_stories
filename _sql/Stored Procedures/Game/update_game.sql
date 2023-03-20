    DROP PROCEDURE IF EXISTS update_game;

    CREATE PROCEDURE update_game(
        p_token VARCHAR(50),
        p_roomCode INT UNSIGNED
    )
    COMMENT "(p_token, p_roomCode)"
    BEGIN
        DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
        DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
        DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = p_roomCode);
        DECLARE v_isGameOver TINYINT DEFAULT (is_game_over(p_roomCode));
        DECLARE v_remaining_time TINYINT UNSIGNED;

        DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

        CALL update_game_phase(p_roomCode);

        START TRANSACTION;

        SELECT v_isGameOver as isGameOver;

        SELECT SelectedCards.tableCardId as selectedCardId FROM SelectedCards LEFT JOIN TableCards ON SelectedCards.tableCardId = TableCards.tableCardId WHERE roomCode = p_roomCode AND v_isGameOver = 1 AND v_playerId != v_masterId;

        SELECT tableCardId FROM TableCards WHERE roomCode = p_roomCode AND isOnTable = 1;
        SELECT playerId FROM Players WHERE roomCode = p_roomCode AND login <> v_login;

        SELECT Votes.playerId, tableCardId FROM Votes LEFT JOIN Players ON Votes.playerId = Players.playerId WHERE roomCode = p_roomCode AND Votes.playerId <> v_playerId;

SET v_remaining_time = (SELECT TIMESTAMPDIFF(SECOND, NOW(), DATE_ADD((Moves.createdAt), INTERVAL Rooms.moveTime SECOND)) FROM Moves LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode);


            IF v_isGameOver = 1 THEN
        SET v_remaining_time = 0;
        END IF;

        IF v_playerId <> v_masterId THEN
            SELECT Moves.roundNumber, RoundRules.cardsToRemoveCount, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules ON Moves.roundNumber = RoundRules.roundNumber LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode;
            SELECT HintCards.cardName, Cards.description, Cards.imageUrl, hintStatus FROM HintCards LEFT JOIN Cards ON HintCards.cardName = Cards.cardName WHERE HintCards.roomCode = p_roomCode AND hintStatus <> 'hand';
        ELSE
         SELECT Moves.roundNumber, Moves.phase, v_remaining_time as remainingTime FROM Moves LEFT JOIN RoundRules ON Moves.roundNumber = RoundRules.roundNumber LEFT JOIN Rooms ON Rooms.roomCode = Moves.roomCode WHERE Moves.roomCode = p_roomCode;
        END IF;
        COMMIT;
    END;

