DROP TABLE IF EXISTS HintCards;
CREATE TABLE IF NOT EXISTS HintCards (
roomCode INT UNSIGNED REFERENCES Rooms(roomCode) ON UPDATE CASCADE ON DELETE CASCADE, 
cardName VARCHAR(25) REFERENCES Cards(cardName) ON UPDATE CASCADE, 
hintStatus ENUM('connected', 'notConnected', 'hand') NOT NULL DEFAULT 'hand',
PRIMARY KEY (roomCode, cardName)
)