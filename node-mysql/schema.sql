CREATE TABLE users(
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

-- earliest date a user joined

SELECT 
    DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM users;

-- finding their email

SELECT 
    * 
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

-- how many users joined in each month

SELECT 
    MONTHNAME(created_at) AS month,
    COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- users with yahoo emails

SELECT 
    COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo.com';

-- total number of users with each email host

SELECT 
    CASE
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;