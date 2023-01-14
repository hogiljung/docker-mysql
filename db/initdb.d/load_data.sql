USE board;

INSERT INTO account(uuid, id, pw) VALUES ("3f06af63-a93c-11e4-9797-00505690773f", "hogil", "1234");

INSERT INTO board(title, account_uuid) VALUES("hi", "3f06af63-a93c-11e4-9797-00505690773f");

INSERT INTO board_content(board_id, content, large_content) VALUES(1, "hello", "");