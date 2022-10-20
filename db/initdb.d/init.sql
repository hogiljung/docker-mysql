USE mysql;

CREATE USER 'django'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE board;
USE board;

CREATE TABLE users
(
    uuid    VARBINARY(16)   NOT NULL UNIQUE,
    id      VARCHAR(20)     NOT NULL UNIQUE,
    pw      VARCHAR(100)    NOT NULL,
    primary key(uuid)
);