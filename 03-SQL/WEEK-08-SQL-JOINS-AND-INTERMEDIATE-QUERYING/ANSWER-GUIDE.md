# Week 8 Answer Guide

Attempt the exercises before using this guide. These are suggested solutions. Equivalent queries are acceptable if they use the correct relationships and return the intended result.

Start with:
```sql
USE retail_practice;
```

## Part A — INNER JOIN

```sql
-- 1. Orders and customer names
SELECT o.order_id, c.customer_name
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

-- 2. Orders and product names
SELECT o.order_id, p.product_name
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 3. Customer, product and quantity
SELECT c.customer_name, p.product_name, o.quantity
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 4. Order date, customer and payment method
SELECT o.order_date, c.customer_name, o.payment_method
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

-- 5. Product, category and quantity
SELECT p.product_name, p.category, o.quantity
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

## Part B — LEFT JOIN

```sql
-- 6. All customers and any matching orders
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

-- 7. Customers with no orders
SELECT c.customer_id, c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 8. All products and any matching orders
SELECT p.product_name, o.order_id
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id;

-- 9. Products never ordered
SELECT p.product_id, p.product_name
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL;
```

The supplied sample returns no rows for 7 and 9 because every customer and every product appears in at least one order. No rows does not automatically mean the query is wrong.

## Part C — Three-table joins and calculations

```sql
-- 10
SELECT o.order_id, c.customer_name, p.product_name,
       o.quantity, p.unit_price
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 11
SELECT o.order_id, c.customer_name, p.product_name,
       o.quantity, p.unit_price,
       o.quantity * p.unit_price AS order_line_value
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 12
SELECT c.customer_name, c.city, p.product_name, o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;

-- 13
SELECT p.product_name, p.category, o.quantity, o.payment_method
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

## Part D — Grouped analysis

```sql
-- 14
SELECT p.product_name, SUM(o.quantity) AS total_units
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units DESC;

-- 15
SELECT p.category,
       SUM(o.quantity * p.unit_price) AS total_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_order_value DESC;

-- 16
SELECT c.city, COUNT(o.order_id) AS order_count
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY order_count DESC;

-- 17
SELECT c.city,
       SUM(o.quantity * p.unit_price) AS total_order_value
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_order_value DESC;

-- 18
SELECT p.category,
       SUM(o.quantity * p.unit_price) AS total_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity * p.unit_price) > 10000;
```

## Challenge — customer summary including customers with no orders

```sql
SELECT
    c.customer_id,
    c.customer_name,
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
```

COUNT(o.order_id) counts matched order records. For a customer with no order, the LEFT JOIN still produces one output row, but o.order_id is NULL. COUNT(o.order_id) returns zero for that customer. COUNT(*) would count the preserved customer row and incorrectly show one.

COALESCE(expression, 0) returns zero when the expression is NULL. This makes missing totals easier to interpret.

## Expected sample-data checks

The Week 6 sample contains 15 order records and 25 total units. The order-line value across all order records is ₦76,000.

Grouped order-line value by category:
- Groceries: ₦60,100.
- Personal Care: ₦10,200.
- Household: ₦5,600.

Total units by product:
- Rice 5kg: 4.
- Cooking Oil 1L: 4.
- Laundry Detergent: 5.
- Bathing Soap Pack: 4.
- Tomato Paste Carton: 3.
- Toothpaste: 5.

These are sample-data checks to help you validate the calculations. Your query output should match them if you have not changed the Week 6 data.

## Validation reminder

A join can run successfully and still be wrong. Check the join keys, compare row counts, inspect sample IDs and verify aggregate totals before writing a recommendation.
