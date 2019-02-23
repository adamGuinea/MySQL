CREATE DATABASE chatta;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(40) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(username)
    VALUES 
        ('adamguinea'),
        ('stephaniecullen'),
        ('danielattard');

CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos(image_url, user_id)
    VALUES 
        ('https://source.unsplash.com/5Z398JOmCKw', 1),
        ('https://source.unsplash.com/DWnWF7PXf98', 2),
        ('https://source.unsplash.com/CHvNt7DOVLY', 3);

SELECT photos.image_url, users.username
FROM photos
JOIN users
    ON photos.user_id = users.id;

CREATE TABLE comments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);
           
INSERT INTO comments(comment_text, user_id, photo_id)
    VALUES 
        ('Where did you take this shot??', 1, 3),
        ('Masalaa', 2, 1),
        ('<3 this!', 3, 2);

CREATE TABLE likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id)
    VALUES 
        (1, 2),
        (2, 3),
        (3, 2);

INSERT INTO likes(user_id, photo_id)
    VALUES 
        (1, 2); Won't work because of duplicate entry

CREATE TABLE follows(
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id)
    VALUES 
        (1, 2),
        (1, 3),
        (3, 1),
        (2, 3);

CREATE TABLE tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO tags(tag_name) VALUES
    ('morningrun'),
    ('incatrail'),
    ('relationaldata');

INSERT INTO photo_tags(photo_id, tag_id)
    VALUES
        (1, 1),
        (1, 2),
        (2, 3),
        (3, 2);