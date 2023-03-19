DROP PROCEDURE IF EXISTS vote;
CREATE PROCEDURE vote(
    p_token VARCHAR(50),
    p_tableCardId INT UNSIGNED
)
COMMENT "Add a vote of current player to a card"
SQL SECURITY DEFINER
BEGIN
DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
DECLARE v_roomCode INT UNSIGNED DEFAULT (SELECT roomCode FROM TableCards WHERE tableCardId = p_tableCardId AND isOnTable = 1);
DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = v_roomCode);
DECLARE v_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = v_roomCode);
DECLARE v_maxVotesCount TINYINT DEFAULT (SELECT cardsToRemoveCount FROM RoundRules RIGHT JOIN Moves  ON RoundRules.roundNumber = Moves.roundNumber WHERE roomCode = v_roomCode);
DECLARE v_playerVotesCount TINYINT DEFAULT (SELECT COUNT(*) FROM Votes WHERE playerId = v_playerId);
DECLARE v_isGameOver TINYINT DEFAULT (is_game_over(v_roomCode));


IF v_roomCode IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid table card id';
END IF;

IF v_playerId IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is not in room';
END IF;

IF v_playerId = v_masterId THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Master can not vote';
END IF;

CALL update_game_phase(v_roomCode);

IF (SELECT phase FROM Moves WHERE roomCode = v_roomCode) <> 'voting' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Is not voting phase';
END IF;

IF v_isGameOver = 1 THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Game is over';
END IF;

IF v_maxVotesCount <= v_playerVotesCount THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your votes is over';
END IF;

IF EXISTS (SELECT * FROM Votes WHERE tableCardId = p_tableCardId AND playerId = v_playerId) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You have already voted for this card';
END IF;

IF (SELECT isOnTable FROM TableCards WHERE tableCardId = p_tableCardId) = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Card is not on table';
END IF;

START TRANSACTION;
INSERT INTO Votes (tableCardId, playerId) VALUES (p_tableCardId, v_playerId);
IF ((SELECT COUNT(*) FROM Votes LEFT JOIN TableCards ON Votes.tableCardId = TableCards.tableCardId WHERE TableCards.roomCode = v_roomCode) >= ((SELECT COUNT(*) FROM Players WHERE roomCode = v_roomCode) - 1) * v_maxVotesCount) THEN
    CALL stop_voting_phase(v_roomCode);
END IF;
COMMIT;
END;
