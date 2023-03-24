DROP PROCEDURE IF EXISTS remove_inactive_rooms;

CREATE PROCEDURE remove_inactive_rooms()
COMMENT "Удаляет в комнате в которых последняя активность всех игроков была более 3 часов назад"
SQL SECURITY INVOKER
BEGIN
     -- Отмена транзакции на SQLEXCEPTION
     DECLARE exit handler for SQLEXCEPTION 
        BEGIN
            ROLLBACK;
        END;

     START TRANSACTION;
     SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
     -- Удаляет комнаты (ON DELETE CASCADE не работает)
     DELETE FROM Players WHERE (SELECT TIMESTAMPDIFF(SECOND, lastActivity, NOW()) > 10800);
     DELETE FROM Rooms WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.roomCode = Rooms.roomCode);
     DELETE FROM Moves WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE Moves.roomCode = Rooms.roomCode);
     DELETE FROM HintCards WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE HintCards.roomCode = Rooms.roomCode);
     DELETE FROM Masters WHERE  NOT EXISTS (SELECT * FROM Players WHERE Masters.playerId = Players.playerId);
     DELETE FROM TableCards WHERE  NOT EXISTS (SELECT * FROM Rooms WHERE TableCards.roomCode = Rooms.roomCode);
     DELETE FROM SelectedCards WHERE NOT EXISTS (SELECT * FROM TableCards WHERE TableCards.tableCardId = SelectedCards.tableCardId);
     DELETE FROM Votes WHERE NOT EXISTS (SELECT * FROM Players WHERE Players.playerId = Votes.playerId);
    COMMIT;
END;
