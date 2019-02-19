INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES  ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
          
SELECT 
    DISTINCT released_year 
FROM books;

SELECT 
    DISTINCT author_fname, author_lname
FROM books;

SELECT
    author_lname
FROM books ORDER BY author_lname;

SELECT 
    released_year, pages
FROM books ORDER BY title DESC;

SELECT
    title, released_year, pages
FROM books ORDER BY 2;

SELECT 
    author_fname, author_lname
FROM books ORDER BY author_lname, author_fname;

SELECT
    title, released_year
FROM books ORDER BY released_year DESC LIMIT 2,3;

SELECT 
    title, author_fname
FROM books WHERE author_fname LIKE '%da%';

SELECT
    title 
FROM books WHERE title LIKE 'the%';

SELECT
    title, stock_quantity
FROM books WHERE stock_quantity LIKE '____';

SELECT
    title
FROM books WHERE title LIKE '%Stories%';

SELECT
    title, pages
FROM books ORDER BY pages DESC LIMIT 1;

SELECT
    CONCAT(title, ' - ', released_year) AS Summary
FROM books ORDER BY released_year DESC LIMIT 3;

SELECT
    title, author_lname
FROM books WHERE author_lname LIKE '% %';

SELECT 
    title, released_year, stock_quantity
FROM books ORDER BY stock_quantity LIMIT 3;

SELECT 
    title, author_lname
FROM books ORDER BY author_lname, title;

SELECT 
    UPPER(CONCAT('my favorite author is ', author_fname, ' ', author_lname,'!')) AS Yell
FROM books ORDER BY author_lname;
