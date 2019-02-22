-- IMPLICIT INNER JOIN

SELECT 
    * 
FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name = 'George'
    );

 
SELECT 
    first_name, last_name, order_date, amount
FROM customers, orders WHERE customers.id = customer_id

-- EXPLCIT INNER JOIN

SELECT  
    first_name, last_name, order_date, amount
FROM customers JOIN orders ON customers.id = orders.customer_id;

SELECT  
    first_name, last_name, order_date, amount
FROM customers JOIN orders ON customers.id = orders.customer_id
ORDER BY amount;

SELECT  
    first_name, last_name, SUM(amount) AS total_spent
FROM customers JOIN orders ON customers.id = orders.customer_id
GROUP BY orders.customer_id ORDER BY total_spent DESC;

-- LEFT JOIN

SELECT
    *
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT
    first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- RIGHT JOIN

SELECT
    IFNULL(first_name, 'MISSING') AS first, 
    IFNULL(last_name, 'USER') AS last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers 
RIGHT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;
