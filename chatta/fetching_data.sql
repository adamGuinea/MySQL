who are the oldest users?

SELECT 
    *
FROM users 
ORDER BY created_at
LIMIT 5;

whats the best day of the week to advertise?

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users 
GROUP BY day 
ORDER BY total DESC
LIMIT 2;

who are the inactive users?

SELECT 
    username,
    image_url
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;
    
what's the most liked photo?

SELECT
    username,
    photos.id, 
    photos.image_url, 
    COUNT(*) AS total
FROM photos
JOIN likes
    ON likes.photo_id = photos.id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

how much does the average user post?

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'average post count';

what are the top 5 most popular hash tags?

SELECT 
    tags.tag_name,
    COUNT(*) AS total
FROM photo_tags
JOIN tags 
    ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

find users who have liked every single photo on our site

SELECT 
    username,
    COUNT(*) AS num_likes
FROM users
JOIN likes  
    ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);