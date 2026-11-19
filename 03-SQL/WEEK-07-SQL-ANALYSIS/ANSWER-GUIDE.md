# Week 7 Answer Guide

Attempt the exercises first. These are suggested solutions. SQL keywords are case-insensitive in MySQL; formatting may differ while the logic remains correct.

Start with:
```sql
USE retail_practice;
```

## Part A — WHERE and comparison operators

```sql
-- 1
SELECT * FROM orders
WHERE payment_method = 'Transfer';

-- 2
SELECT * FROM products
WHERE unit_price > 3000;

-- 3
SELECT * FROM customers
WHERE city <> 'Lagos';

-- 4
SELECT * FROM orders
WHERE quantity >= 2;

-- 5
SELECT * FROM products
WHERE unit_price <= 3200;
```

## Part B — Conditions and patterns

```sql
-- 6
SELECT * FROM orders
WHERE payment_method = 'Transfer' AND quantity >= 2;

-- 7
SELECT * FROM customers
WHERE city = 'Ibadan' OR city = 'Lagos';

-- 8
SELECT * FROM products
WHERE NOT category = 'Groceries';

-- 9
SELECT * FROM products
WHERE product_name LIKE '%Soap%';

-- 10
SELECT * FROM customers
WHERE customer_name LIKE 'A%';

-- 11
SELECT * FROM products
WHERE unit_price BETWEEN 2000 AND 9000;

-- 12
SELECT * FROM customers
WHERE city IN ('Ibadan', 'Abuja', 'Ilorin');
```

## Part C — ORDER BY and LIMIT

```sql
-- 13
SELECT * FROM products
ORDER BY unit_price DESC;

-- 14
SELECT * FROM orders
ORDER BY order_date DESC;

-- 15
SELECT * FROM products
ORDER BY unit_price ASC
LIMIT 3;

-- 16
SELECT * FROM orders
ORDER BY payment_method ASC, quantity DESC;
```

## Part D — Aggregate functions

```sql
-- 17
SELECT COUNT(*) AS total_orders
FROM orders;

-- 18
SELECT SUM(quantity) AS total_units
FROM orders;

-- 19
SELECT AVG(quantity) AS average_quantity
FROM orders;

-- 20
SELECT MIN(unit_price) AS minimum_price,
       MAX(unit_price) AS maximum_price
FROM products;

-- 21
SELECT COUNT(signup_date) AS customers_with_signup_date
FROM customers;
```

Expected checks for this sample:
- Total orders: 15.
- Total units: 25.
- Average quantity: 25 / 15 = 1.6667 (approximately).
- Minimum product price: 1,500.
- Maximum product price: 12,500.
- Customers with signup dates: 8.

## Part E — GROUP BY and HAVING

```sql
-- 22
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method;

-- 23
SELECT payment_method, SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method;

-- 24
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 25
SELECT category, AVG(unit_price) AS average_price
FROM products
GROUP BY category;

-- 26
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method
HAVING COUNT(*) >= 4;

-- 27
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2;

-- 28
SELECT payment_method, SUM(quantity) AS total_units
FROM orders
WHERE order_date >= '2026-11-05'
GROUP BY payment_method;
```

Expected group summaries:
- Payment-method order counts: Transfer = 7, Card = 4, Cash = 4.
- Units by payment method: Transfer = 11, Card = 7, Cash = 7.
- Customers by city: Ibadan = 3, Lagos = 2, Osogbo = 1, Abuja = 1, Ilorin = 1.
- Average prices: Groceries = 8,033.33; Household = 2,800; Personal Care = 1,700.
- Cities with at least two customers: Ibadan and Lagos.

For the date range 5–12 November inclusive, use:
```sql
SELECT COUNT(*) AS order_count
FROM orders
WHERE order_date BETWEEN '2026-11-05' AND '2026-11-12';
```
Expected count: 8.

## Part F — Explanations

1. WHERE filters individual rows before grouping; HAVING filters grouped results after GROUP BY.
2. COUNT(*) counts rows. COUNT(column) counts only non-NULL values in that column.
3. ORDER BY sorts returned rows. GROUP BY creates groups for summary calculations.
4. COUNT(quantity) counts non-NULL quantity entries; SUM(quantity) adds the quantity values.
5. LIMIT 3 alone returns up to three rows without specifying which are highest. ORDER BY quantity DESC LIMIT 3 sorts first and then returns the three largest quantity values.

## Challenge — one possible answer

```sql
SELECT payment_method,
       SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method
ORDER BY total_units DESC;
```

This reports the total number of units ordered through each payment method, ranked from highest to lowest. In this sample, Transfer has the highest total (11 units). This is not the same as having the highest number of orders.
