DROP PROCEDURE IF EXISTS update_room;
CREATE PROCEDURE update_room( 
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "(p_token, p_roomCode)"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login VARCHAR(30) DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE out_masterId INT DEFAULT (SELECT Players.playerId FROM Masters LEFT JOIN Players ON Players.playerId = Masters.playerId WHERE roomCode = p_roomCode);
    DECLARE out_isGameStarted INT DEFAULT (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode);
    
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Вас нет в этой комнате';
    END IF;

    -- Return otherPlayers
    SELECT playerId, Users.nickname FROM Players LEFT JOIN Users ON Players.login = Users.login WHERE Players.login <> v_login AND roomCode = p_roomCode;
    SELECT out_isGameStarted AS isGameStarted;
    SELECT out_masterId as masterId;
END;