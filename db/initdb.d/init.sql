USE mysql;

CREATE USER 'django'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE board;
USE board;

CREATE TABLE users
(
    uuid    CHAR(36)        NOT NULL UNIQUE,
    id      VARCHAR(20)     NOT NULL UNIQUE,
    pw      VARCHAR(100)    NOT NULL,
    PRIMARY KEY(uuid)
); 

CREATE TABLE boards
(
    id          INT(11)        UNSIGNED NOT NULL AUTO_INCREMENT,
    title       VARCHAR(100)   NOT NULL,
    author      VARCHAR(20)    NOT NULL,
    reg_date    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    INDEX author_idx(author),
    FOREIGN KEY(author) REFERENCES users(id)
);

CREATE TABLE board_contents
(
    id       INT(11)    UNSIGNED NOT NULL,     
    content  TEXT,
    INDEX board_idx(id),
    FOREIGN KEY (id) REFERENCES boards(id)
);