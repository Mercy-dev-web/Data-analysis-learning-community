# Week 6 Exercises

**Instructions:** Complete these exercises in MySQL Workbench using the supplied `retail_practice_database.sql` script. Attempt each question before opening the answer guide.

## Part A — Database concepts

1. Explain the difference between a database and a DBMS.
2. In a Customers table, what does one row represent?
3. What is the difference between a row and a column?
4. Why is CustomerID a better primary key than CustomerName?
5. In the Orders table, why is CustomerID a foreign key?
6. Explain the one-to-many relationship between Customers and Orders.
7. Give one reason why storing every customer detail in every order row can cause problems.
8. Choose a suitable MySQL data type for each: customer name, order date, quantity, unit price.

## Part B — Set up and inspect the database

Run the supplied SQL script, then answer:

1. Which databases are listed by `SHOW DATABASES;`?
2. Select the `retail_practice` database.
3. List all tables in the database.
4. Use `DESCRIBE` to inspect the Customers table.
5. How many columns are in the Products table?
6. Which column is the primary key in Orders?
7. Which columns in Orders are foreign keys?

## Part C — Write basic SQL queries

Write a query for each task:

1. Display every column from the Customers table.
2. Display only ProductName and UnitPrice from Products.
3. Display OrderID and OrderDate from Orders.
4. Display CustomerName and City, but use the aliases `customer` and `customer_city`.
5. Display each city only once from Customers.
6. Display the first five rows from Orders.
7. Display ProductName, UnitPrice and a temporary column heading called `price_ngn` for UnitPrice.
8. Return only the CustomerID column from Customers.
9. Use `SELECT` without a table to display the text `Week 6 SQL Practice` with the heading `message`.

## Part D — Explain your query

For each query below, explain in plain English what it returns.

```sql
SELECT * FROM products;
```

```sql
SELECT customer_name, city
FROM customers;
```

```sql
SELECT DISTINCT city
FROM customers;
```

```sql
SELECT *
FROM orders
LIMIT 3;
```

## Challenge

A small pharmacy wants to store customers, products and sales. Suggest three tables it could use. For each table, list at least four columns, identify a primary key, and explain how the tables could be related. Do not write joins yet.

## Completion check

- [ ] I can explain database, DBMS, table, row and column.
- [ ] I can identify primary and foreign keys.
- [ ] I can explain a one-to-many relationship.
- [ ] I successfully ran the practice SQL script.
- [ ] I can inspect a table with DESCRIBE.
- [ ] I can write and explain basic SELECT queries.
