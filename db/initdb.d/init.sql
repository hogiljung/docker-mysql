USE mysql;

CREATE USER 'django'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE board;
USE board;

CREATE TABLE user
(
    id              CHAR(36)        NOT NULL,
    username        VARCHAR(20)     NOT NULL UNIQUE,
    password        VARCHAR(100)    NOT NULL,
    created_date    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE post
(
    id                  INT            UNSIGNED NOT NULL AUTO_INCREMENT,
    title               VARCHAR(100)   NOT NULL,
    brief_description   VARCHAR(255),           
    created_date        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_date        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,       
    user_id             CHAR(36)       NOT NULL,
    INDEX idx_user_id(user_id),
    FOREIGN KEY(user_id) REFERENCES user(id),
    PRIMARY KEY(id)
);

CREATE TABLE post_content
(
    post_id         INT     UNSIGNED NOT NULL,
    content         TEXT,
    large_content   BLOB,
    FOREIGN KEY(post_id) REFERENCES post(id) ON DELETE CASCADE,
    PRIMARY KEY(post_id)
);