DROP TABLE IF EXISTS TableCards;

CREATE TABLE IF NOT EXISTS TableCards (
  tableCardId INT PRIMARY KEY AUTO_INCREMENT,
  roomCode INT UNSIGNED NOT NULL,
  cardName VARCHAR(25) NOT NULL,
  isOnTable TINYINT NOT NULL DEFAULT '1',
  UNIQUE (roomCode, cardName),
  FOREIGN KEY (roomCode) REFERENCES Rooms(roomCode) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (cardName) REFERENCES Cards(cardName) ON UPDATE CASCADE
);
