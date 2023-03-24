DROP TABLE IF EXISTS HintCards;

CREATE TABLE IF NOT EXISTS HintCards (
    roomCode INT UNSIGNED NOT NULL,
    cardName VARCHAR(25) NOT NULL,
    hintStatus ENUM('connected', 'notConnected', 'hand') NOT NULL DEFAULT 'hand',
    PRIMARY KEY (roomCode, cardName),
    FOREIGN KEY (roomCode) REFERENCES Rooms(roomCode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cardName) REFERENCES Cards(cardName) ON UPDATE CASCADE ON DELETE CASCADE
);