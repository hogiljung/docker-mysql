USE mysql;

CREATE USER 'django'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE board;
USE board;

CREATE TABLE account
(
    uuid        CHAR(36)        NOT NULL,
    id          VARCHAR(20)     NOT NULL UNIQUE,
    pw          VARCHAR(100)    NOT NULL,
    signup_date DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(uuid)
);

CREATE TABLE board
(
    id              INT            UNSIGNED NOT NULL AUTO_INCREMENT,
    title           VARCHAR(100)   NOT NULL,
    register_date   DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modify_date     DATETIME,       
    account_uuid    CHAR(36)       NOT NULL,
    INDEX account_idx(account_uuid),
    FOREIGN KEY(account_uuid) REFERENCES account(uuid),
    PRIMARY KEY(id)
);

CREATE TABLE board_content
(
    board_id        INT     UNSIGNED NOT NULL,
    content         TEXT,
    large_content   BLOB,
    FOREIGN KEY(board_id) REFERENCES board(id) ON DELETE CASCADE,
    PRIMARY KEY(board_id)
);