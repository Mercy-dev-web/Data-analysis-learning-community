# Week 6 Assignment: Build and Explore a Small Retail Database

## Scenario

A fictional neighbourhood retailer wants to move away from keeping all its information in one spreadsheet. The owner wants a simple database to store customers, products and orders.

Your task is to create the database, inspect its structure and demonstrate that you can retrieve basic information.

## Files to use

- `practice-data/retail_practice_database.sql`
- `practice-data/customers.csv`
- `practice-data/products.csv`
- `practice-data/orders.csv`

The SQL script creates and populates the practice database for you. The CSV files are included so you can inspect the source data and understand the table contents.

## Tasks

### Task 1 — Explain the design
Write a short explanation (200–350 words) that covers:
- Why you have separate Customers, Products and Orders tables.
- The primary key in each table.
- The foreign keys in Orders.
- The relationship between Customers and Orders.
- One problem that could happen if customer and product details were duplicated in every order row.

### Task 2 — Run and inspect the database
1. Execute the supplied SQL script.
2. Select the `retail_practice` database.
3. Show the tables.
4. Use `DESCRIBE` on all three tables.
5. Confirm how many records are in each table by checking the result grid or using a simple row-count query if you already know how.

### Task 3 — Write eight retrieval queries
Save your SQL in a file named `week6_assignment.sql`. It must include:
1. All columns from Customers.
2. CustomerName and City only.
3. ProductName and UnitPrice only.
4. All columns from Products.
5. OrderID, OrderDate and Quantity from Orders.
6. A DISTINCT list of customer cities.
7. CustomerName with the alias `customer`.
8. The first five Orders records using LIMIT.

Add a SQL comment above each query explaining its purpose.

### Task 4 — Reflect
In 100–150 words, answer:
- What was the most confusing part of creating or exploring the database?
- What did you understand better after running the queries?
- What do you want to practise again?

## Submission checklist

Submit:
- [ ] Your database design explanation.
- [ ] Your `week6_assignment.sql` file.
- [ ] A screenshot showing the three tables in MySQL Workbench.
- [ ] A screenshot showing at least two successful SELECT query results.
- [ ] Your short reflection.

Do not include your database password or any private information in screenshots.

## Assessment rubric (100 marks)

| Area | Marks |
|---|---:|
| Database concepts and table design explanation | 20 |
| Correct inspection of database and table structure | 20 |
| Eight correct and readable SQL queries | 40 |
| Screenshots and evidence of execution | 10 |
| Reflection and clarity | 10 |
| **Total** | **100** |

**Pass target:** 70%. If you score below 70%, review the relevant lesson and correct your submission before moving on.

## Important
This is a foundations assignment. You are not expected to write JOIN, GROUP BY or complex WHERE queries yet. Those are covered in later weeks.
