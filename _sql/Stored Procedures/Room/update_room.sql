DROP PROCEDURE IF EXISTS update_room;
CREATE PROCEDURE update_room(
    p_token VARCHAR(50),
    p_roomCode INT UNSIGNED
)
COMMENT "Returns room state"
SQL SECURITY DEFINER
BEGIN
    DECLARE v_login INT DEFAULT (get_login_from_token(p_token));
    DECLARE v_playerId INT DEFAULT (SELECT playerId FROM Players WHERE login = v_login AND roomCode = p_roomCode);
    DECLARE out_masterId INT DEFAULT (SELECT masterId FROM Masters WHERE roomCode = p_roomCode);
    DECLARE out_isGameStarted INT DEFAULT (SELECT COUNT(*) FROM Moves WHERE roomCode = p_roomCode);
    
    IF v_playerId IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is not in room';
    END IF;

    IF out_isGameStarted THEN
        SELECT out_isGameStarted AS isGameStarted;
    END IF;

    IF out_masterId IS NOT NULL THEN
        SELECT out_masterId as masterId;
    END IF;

   -- Return otherPlayers
   SELECT playerId, nickname FROM Players WHERE login <> v_login AND roomCode = p_roomCode;
END;