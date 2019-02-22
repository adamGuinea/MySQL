SELECT
    title, stock_quantity, author_lname, author_fname
FROM books WHERE stock_quantity < 200; 

SELECT
    title
FROM books WHERE title NOT LIKE 'W%';

SELECT 
    title, released_year
FROM books WHERE released_year > 1991;

SELECT 
    title, author_lname, released_year
FROM books WHERE released_year > 2010 && author_lname = 'Eggers';

SELECT          
    *
FROM products WHERE brand = 'lego' && instock = true;

SELECT
    *
FROM books WHERE author_lname = 'Eggers' && released_year || 2010 && title LIKE '%novel%';

SELECT
    title, released_year
FROM books BETWEEN 2004 AND 2015;

SELECT
    title, released_year
FROM books NOT BETWEEN 2004 AND 2015;

SELECT CAST('2019-02-22' AS DATETIME);

SELECT name, birthdt FROM people
WHERE birthdt BETWEEN CAST('1991-01-30' AS DATETIME) 
                      AND CAST('1993-02-18' AS DATETIME);
                      
SELECT 
    title, author_lname 
FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT 
    title, released_year
FROM books WHERE released_year IN (2017, 1995);

SELECT 
    title, released_year
FROM books WHERE released_year >= 2000
AND released_year % 2 != 0;

-- Conditionals

SELECT
    title, released_year,
        CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th century Lit'
    END AS GENRE
FROM books;

SELECT 
    title,
        CASE stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

SELECT  
    title, released_year
FROM books WHERE released_year < 1980;

SELECT 
    title, author_lname
FROM books WHERE author_lname IN ('Eggers', 'Chabon');

SELECT
    title, author_lname, released_year
FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;

SELECT
    title, pages
FROM books WHERE pages BETWEEN 100 AND 200;

SELECT
    title, author_lname
FROM books WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');

SELECT
    title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'The Namesake' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

SELECT
    author_lname, 
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books GROUP BY author_lname, author_fname
        
                 