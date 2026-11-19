-- Week 7 SQL analysis practice
-- Run the Week 6 retail_practice_database.sql script first.
USE retail_practice;

-- 1. Filter orders by payment method
SELECT *
FROM orders
WHERE payment_method = 'Transfer';

-- 2. Combine conditions
SELECT *
FROM orders
WHERE payment_method = 'Transfer'
  AND quantity >= 2;

-- 3. Match a list of cities
SELECT *
FROM customers
WHERE city IN ('Ibadan', 'Lagos', 'Abuja');

-- 4. Search for product names containing Soap
SELECT *
FROM products
WHERE product_name LIKE '%Soap%';

-- 5. Sort products from highest to lowest price
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC;

-- 6. Return the three cheapest products
SELECT product_name, unit_price
FROM products
ORDER BY unit_price ASC
LIMIT 3;

-- 7. Count all order records
SELECT COUNT(*) AS total_orders
FROM orders;

-- 8. Sum the quantities across all orders
SELECT SUM(quantity) AS total_units
FROM orders;

-- 9. Count order records per payment method
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method;

-- 10. Calculate total units per payment method
SELECT payment_method, SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method;

-- 11. Show only payment methods with at least four orders
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method
HAVING COUNT(*) >= 4;

-- 12. Sort grouped results by total units
SELECT payment_method, SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method
ORDER BY total_units DESC;
