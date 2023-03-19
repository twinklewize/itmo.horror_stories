DROP TABLE IF EXISTS Rooms;
CREATE TABLE IF NOT EXISTS Rooms (
roomCode INT UNSIGNED PRIMARY KEY, 
moveTime TINYINT UNSIGNED NOT NULL DEFAULT 120, 
placesCount TINYINT UNSIGNED NOT NULL DEFAULT 2
)