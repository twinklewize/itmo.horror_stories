DROP TABLE IF EXISTS SelectedCards;
CREATE TABLE IF NOT EXISTS SelectedCards (
tableCardId INT PRIMARY KEY REFERENCES TableCards(tableCardId) ON UPDATE CASCADE ON DELETE CASCADE
)