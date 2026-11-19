# Week 6 Answer Guide

Try the exercises and assignment before using this guide. These are suggested answers; equivalent correct explanations and SQL are acceptable.

## Part A — Database concepts

1. A database is an organised collection of data. A DBMS is software used to create, manage and interact with databases.
2. One row represents one customer record.
3. A row is one record; a column is one attribute shared by records.
4. Customer names are not guaranteed to be unique. CustomerID can uniquely identify each customer.
5. Orders.CustomerID points to the customer who placed the order.
6. One customer can be linked to many order records; each order in this simplified model belongs to one customer.
7. Repeated details can become inconsistent when a customer updates their information. Duplication also wastes storage and can create insertion or deletion problems.
8. Customer name: VARCHAR; order date: DATE; quantity: INT; unit price: DECIMAL(10,2).

## Part B — Set up and inspect

1. The list depends on what is already installed on your own MySQL server. It should include `retail_practice` after the script runs.
2. `USE retail_practice;`
3. `SHOW TABLES;` should show customers, orders and products.
4. `DESCRIBE customers;`
5. Products has four columns: product_id, product_name, category and unit_price.
6. order_id.
7. customer_id and product_id.

## Part C — Suggested SQL

```sql
-- 1
SELECT * FROM customers;

-- 2
SELECT product_name, unit_price
FROM products;

-- 3
SELECT order_id, order_date
FROM orders;

-- 4
SELECT customer_name AS customer, city AS customer_city
FROM customers;

-- 5
SELECT DISTINCT city
FROM customers;

-- 6
SELECT *
FROM orders
LIMIT 5;

-- 7
SELECT product_name, unit_price AS price_ngn
FROM products;

-- 8
SELECT customer_id
FROM customers;

-- 9
SELECT 'Week 6 SQL Practice' AS message;
```

## Part D — Explain your query

- `SELECT * FROM products;` returns every column and row from Products.
- `SELECT customer_name, city FROM customers;` returns only the customer name and city columns for all customer records.
- `SELECT DISTINCT city FROM customers;` returns each distinct city once.
- `SELECT * FROM orders LIMIT 3;` returns up to three rows from Orders.

## Assignment checks

- The script creates 8 customers, 6 products and 15 orders.
- Expected tables: customers, products and orders.
- Expected primary keys: customer_id, product_id and order_id.
- Expected foreign keys in Orders: customer_id and product_id.
- Query syntax should match the examples above.

A useful self-check is to run each query and compare the column headings and number of rows with what you expected. If a query returns no rows or an error, check that you selected the correct database and spelled each table and column name correctly.
