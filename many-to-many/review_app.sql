SELECT 
    title, rating
FROM series
JOIN reviews 
    ON series.id = reviews.series_id;

SELECT 
    title, 
    AVG(rating) AS avg_rating
FROM series
JOIN reviews 
    ON series.id = reviews.series_id
GROUP BY series.id ORDER BY avg_rating;

SELECT 
    first_name, last_name, rating
FROM reviewers
JOIN reviews
ON reviewers.id = reviews.reviewer_id;

unreviewed series

SELECT
    title,
    rating
FROM series
LEFT JOIN reviews
ON series.id = reviews.series_id
WHERE reviews.id IS NULL;

SELECT 
    genre,
    ROUND(AVG(rating),1) AS avg_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre;

SELECT
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
    IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS critic
FROM reviewers
JOIN reviews
    ON reviewers.id = reviews.reviewer_id
JOIN series
    ON series.id = reviews.series_id
ORDER BY title;