   DROP PROCEDURE IF EXISTS stop_voting_phase;

   CREATE PROCEDURE stop_voting_phase (
      p_roomCode INT UNSIGNED
   )
   COMMENT "Remove table cards after voting concludes"
   SQL SECURITY INVOKER
   BEGIN
      DECLARE v_cardsToRemoveCount TINYINT;
      DECLARE v_cardsWithVotesCount TINYINT UNSIGNED;
      DECLARE v_remainingCardsToRemoveCount TINYINT DEFAULT (v_cardsToRemoveCount - v_cardsWithVotesCount);

      -- find out how many cards are supposed to be removed
      SET v_cardsToRemoveCount = (
         SELECT cardsToRemoveCount FROM RoundRules 
            RIGHT JOIN Moves ON Moves.roundNumber = RoundRules.roundNumber 
         WHERE Moves.roomCode = p_roomCode
      );

      -- count how many cards actually have votes
      SET v_cardsWithVotesCount = (
         SELECT COUNT(*) FROM Votes 
            RIGHT JOIN TableCards ON Votes.tableCardId = TableCards.tableCardId
         WHERE roomCode = p_roomCode
      );

      START TRANSACTION;
      
      -- if there are exactly cardsToRemoveCount cards with votes, remove them
      IF v_cardsWithVotesCount = v_cardsToRemoveCount THEN
         UPDATE TableCards 
            SET isOnTable = 0 
            WHERE tableCardId IN (
               SELECT tableCardId FROM Votes 
                  RIGHT JOIN TableCards ON Votes.tableCardId = TableCards.tableCardId
               WHERE roomCode = p_roomCode
         );

      -- if there are more than cardsToRemoveCount cards with votes, remove some randomly until we get down to the right number
      ELSEIF v_cardsWithVotesCount > v_cardsToRemoveCount THEN
         UPDATE TableCards 
            SET isOnTable = 0 
            WHERE tableCardId IN (
               SELECT tableCardId FROM (
                  SELECT tableCardId FROM Votes 
                     RIGHT JOIN TableCards ON Votes.tableCardId = TableCards.tableCardId
                  WHERE roomCode = p_roomCode
                  ORDER BY RAND() 
                  LIMIT v_cardsToRemoveCount
               ) AS tblCardsToRemove
            );

      -- if there are fewer than cardsToRemoveCount cards with votes, remove all of them and randomly add more until we get up to the right number
      ELSE
         UPDATE TableCards 
            SET isOnTable = 0 
            WHERE tableCardId IN (
               SELECT tableCardId FROM Votes 
                  RIGHT JOIN TableCards ON Votes.tableCardId = TableCards.tableCardId 
               WHERE roomCode = p_roomCode
            );
         UPDATE TableCards
            JOIN (SELECT tableCardId
                  FROM TableCards
                  WHERE roomCode = p_roomCode AND isOnTable = 1
                  ORDER BY RAND()
                  LIMIT v_remainingCardsToRemoveCount) AS tblCardsToRemove
            ON TableCards.tableCardId = tblCardsToRemove.tableCardId
            SET isOnTable = 0;
      END IF;

      IF (SELECT roundNumber FROM Moves WHERE roomCode = p_roomCode) < 5 THEN
         INSERT INTO Moves (roomCode, startedAt) VALUES (p_roomCode, NOW());
      END IF;

      COMMIT;
   END;
