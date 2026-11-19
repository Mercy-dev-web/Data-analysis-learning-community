-- Week 8 JOIN practice
-- Run the Week 6 retail_practice_database.sql script first.
USE retail_practice;

-- 1. INNER JOIN: orders with customer names
SELECT o.order_id, c.customer_name, o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

-- 2. INNER JOIN: orders with product names
SELECT o.order_id, p.product_name, o.quantity
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 3. Three-table JOIN: who bought what?
SELECT o.order_id, c.customer_name, p.product_name,
       o.quantity, o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 4. LEFT JOIN: keep every customer
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- 5. Find customers without an order
SELECT c.customer_id, c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 6. Calculate order-line value
SELECT o.order_id, p.product_name,
       o.quantity, p.unit_price,
       o.quantity * p.unit_price AS order_line_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 7. Total units by product
SELECT p.product_name, SUM(o.quantity) AS total_units
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units DESC;

-- 8. Total order-line value by category
SELECT p.category,
       SUM(o.quantity * p.unit_price) AS total_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_order_value DESC;

-- 9. Count orders by customer city
SELECT c.city, COUNT(o.order_id) AS order_count
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY order_count DESC;

-- 10. Customer summary: retain customers even if they have no orders
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.quantity), 0) AS total_units,
       COALESCE(SUM(o.quantity * p.unit_price), 0) AS total_order_value
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_value DESC;
