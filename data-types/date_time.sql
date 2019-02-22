CREATE TABLE people
    (
        name VARCHAR(100),
        birthdate DATE,
        birthtime TIME,
        birthdt DATETIME
    );
    
INSERT INTO people 
    (name, birthdate, birthtime, birthdt)
        VALUES ('Sara', '1983-11-11', '10:07:37', '1991-11-11 10:07:37');
                ('Max', '1991-04-30', '04:15:25', '1991-04-30 04:15:25');

INSERT INTO people 
    (name, birthdate, birthtime, birthdt)
        VALUES ('Oscar', CURDATE(), CURTIME(), NOW())

SELECT 
    name, MONTHNAME(birthdate) 
FROM people;

SELECT name, 
    DAYOFWEEK(birthdate) 
FROM people;

SELECT 
    DATE_FORMAT(birthdt, 'Was born on a %W') 
FROM people;

SELECT 
    DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%m') 
FROM people;

SELECT 
    DATEDIFF(NOW(), birthdate) 
FROM people;

SELECT 
    birthdt + INTERVAL 1 MONTH 
FROM people;
