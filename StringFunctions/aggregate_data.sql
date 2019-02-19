-- SELECT 
--     COUNT(*) 
-- FROM books WHERE title LIKE '%the%' 

-- SELECT 
--     author_fname, author_lname, COUNT(*)
-- FROM books GROUP BY author_lname, author_fname;
    
-- SELECT
--     CONCAT('In ',released_year, ' ', COUNT(*), ' book(s) were released') AS Year
-- FROM books GROUP BY released_year;

-- SELECT
--     title, pages
-- FROM books ORDER BY pages DESC LIMIT 1;

-- SELECT
--     author_fname, author_lname, MIN(released_year)
-- FROM books GROUP BY author_lname, author_fname;

-- SELECT
--     author_lname, author_fname, SUM(pages)
-- FROM books GROUP BY author_lname, author_fname;

-- SELECT
--     released_year, AVG(stock_quantity)
-- FROM books GROUP BY released_year;

-- SELECT
--     released_year, COUNT(*)
-- FROM books GROUP BY released_year;

-- SELECT
--     SUM(stock_quantity)
-- FROM books;

-- SELECT 
--     author_fname, author_lname, AVG(released_year)
-- FROM books GROUP BY author_fname, author_lname;

-- SELECT
--     CONCAT(author_fname, ' ', author_lname) AS Author
-- FROM books ORDER BY pages DESC LIMIT 1;

SELECT
    released_year AS Year, COUNT(*) AS '# Pages', AVG(pages) AS 'Average Pages'
FROM books GROUP BY released_year;