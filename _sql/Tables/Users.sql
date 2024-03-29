DROP TABLE IF EXISTS Users;

CREATE TABLE IF NOT EXISTS Users (
    login VARCHAR(30) PRIMARY KEY, 
    password VARCHAR(255) NOT NULL, 
    nickname VARCHAR (12) NOT NULL,
    lastActivity TIMESTAMP NOT NULL
);