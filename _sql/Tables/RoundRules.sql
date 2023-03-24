DROP TABLE IF EXISTS RoundRules;

CREATE TABLE IF NOT EXISTS RoundRules(
    roundNumber TINYINT UNSIGNED PRIMARY KEY, 
    cardsToRemoveCount  TINYINT UNSIGNED NOT NULL
);

INSERT INTO RoundRules(roundNumber, cardsToRemoveCount) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1);