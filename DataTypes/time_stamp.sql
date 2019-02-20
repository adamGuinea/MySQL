CREATE TABLE comments
    (
        content VARCHAR(100),
        created_at TIMESTAMP DEFAULT NOW()
    );

INSERT INTO comments
    (content)
        VALUES ('What a funny article');

CREATE TABLE more_comments
    (
        content VARCHAR(100),
        changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
    );
    
INSERT INTO more_comments
    (content)
        VALUES ('Here\'s a better one');

UPDATE 
    more_comments
SET content='I found another' WHERE content='Here\'s a better one';

SELECT
    *
FROM more_comments ORDER BY changed_at;

CREATE TABLE tweets
    (content VARCHAR(140), username VARCHAR(20), created_at TIMESTAMP DEFAULT NOW());

INSERT 
    INTO tweets (content, username)
        VALUES ('Leaving to Chiang Mai soon!', 'Stephanie');