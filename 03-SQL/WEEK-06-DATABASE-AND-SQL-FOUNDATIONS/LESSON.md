# Week 6 Lesson: Database and SQL Foundations

## 1. Why are we learning databases?

Imagine a supermarket in Ibadan with thousands of customers and sales every month. A single spreadsheet can become difficult to maintain. It may contain repeated customer details, inconsistent product names, and many rows that are hard to manage.

A database provides an organised way to store and manage information. Instead of forcing every detail into one giant table, a relational database can keep customers, products and orders in separate related tables.

A data analyst often uses SQL to retrieve information from these databases and prepare it for analysis.

## 2. Important terms

### Data
Raw facts or observations. Examples include a customer's name, a product price, an order date or the quantity sold.

### Database
An organised collection of data stored so it can be accessed and managed.

### DBMS
A Database Management System is software used to create, manage and interact with databases. MySQL is a DBMS. Other examples include PostgreSQL, Microsoft SQL Server, SQLite and Oracle Database.

### Relational database
A database that organises information into tables and connects related tables through keys.

### Table, row and column
- **Table:** a structured collection of related records, such as Customers.
- **Row/record:** one individual entry, such as one customer.
- **Column/field:** one attribute, such as CustomerName or Email.

Think of an Excel worksheet: the sheet resembles a table, a row resembles a record, and a column resembles a field. A relational database adds rules and relationships that help keep data organised and consistent.

## 3. A simple retail database

Suppose a small retailer records customers, products and orders.

**Customers**

| CustomerID | CustomerName | City |
|---:|---|---|
| 1 | Amina Yusuf | Ibadan |
| 2 | Tunde Bello | Lagos |
| 3 | Kemi Ade | Osogbo |

**Products**

| ProductID | ProductName | UnitPrice |
|---:|---|---:|
| 101 | Rice 5kg | 12500 |
| 102 | Cooking Oil 1L | 3200 |

**Orders**

| OrderID | CustomerID | ProductID | Quantity |
|---:|---:|---:|---:|
| 1001 | 1 | 101 | 2 |
| 1002 | 2 | 102 | 1 |
| 1003 | 1 | 102 | 3 |

Notice that Amina's name and city do not need to be repeated in every order. Her CustomerID identifies her in the Customers table. The Orders table stores that ID to show who placed each order.

## 4. Keys and relationships

### Primary key
A primary key uniquely identifies each row in a table. It must be unique and cannot be NULL.

Examples:
- Customers.CustomerID
- Products.ProductID
- Orders.OrderID

A customer name is usually a poor primary key because two customers can share the same name. A generated ID is safer.

### Foreign key
A foreign key is a column in one table that refers to a key in another table. It creates a link between related records and helps protect data consistency.

In our example:
- Orders.CustomerID refers to Customers.CustomerID.
- Orders.ProductID refers to Products.ProductID.

The referenced table is often called the parent table; the table containing the foreign key is the child table.

### One-to-many relationship
One customer can place many orders, but each order in this simple example belongs to one customer. This is a one-to-many relationship.

One product can also appear in many orders. In a more realistic sales system, an order may contain several products, so a separate OrderItems table would usually be introduced. We will build on relationships in Week 8.

### Relationship diagram

```text
CUSTOMERS                    ORDERS                    PRODUCTS
----------------             ----------------          ----------------
CustomerID (PK)  1 ------<   CustomerID (FK)            ProductID (PK)
CustomerName                 OrderID (PK)   >------ 1   ProductName
City                         ProductID (FK)             UnitPrice
                             Quantity
                             OrderDate
```

The crow's-foot side represents “many”. This diagram is a simplified learning model.

## 5. Why not store everything in one giant table?

If every order row repeats the customer's name, phone number, city and product details, several problems can occur:
- **Update problem:** a customer's phone number may be changed in one row but missed in another.
- **Insertion problem:** it may be difficult to add a product before anyone has ordered it.
- **Deletion problem:** deleting the only order for a product could accidentally remove the only copy of its details.

Separating related information into tables reduces unnecessary repetition and makes consistency easier to maintain. This is one reason relational database design matters.

### A gentle introduction to normalisation
Normalisation is the process of organising database tables to reduce unnecessary duplication and avoid data anomalies.

At this stage, remember these practical principles:
1. Give each table one clear subject (customers, products, orders).
2. Store each fact in the table where it belongs.
3. Use a primary key to identify each record.
4. Use foreign keys to connect related records.
5. Avoid storing lists of multiple values in one cell.

You do not need to memorise formal normal forms this week. We will use these principles as we work with tables.

## 6. Common data types

A data type tells the database what kind of value a column can store.

| MySQL data type | What it stores | Example |
|---|---|---|
| INT | Whole numbers | 25 |
| DECIMAL(10,2) | Exact decimal values, useful for money | 12500.50 |
| VARCHAR(100) | Text up to a chosen length | 'Ibadan' |
| DATE | Calendar date | '2026-11-19' |
| DATETIME | Date and time | '2026-11-19 14:30:00' |
| BOOLEAN | True/false style value (stored as 0/1 in MySQL) | 1 |

For money, prefer DECIMAL rather than FLOAT because DECIMAL stores exact decimal values suitable for financial amounts.

Choose data types thoughtfully. Do not store a date as random text if it needs to be treated as a date.

## 7. What is SQL?

SQL means Structured Query Language. It is used to communicate with relational databases.

SQL is used to:
- Create databases and tables.
- Insert and update records.
- Retrieve information.
- Filter and summarise data.
- Combine data from related tables.

You will meet different SQL command groups over the next weeks. For now, focus on:
- `CREATE DATABASE` — creates a database.
- `USE` — selects the database you want to work with.
- `CREATE TABLE` — creates a table.
- `INSERT INTO` — adds records.
- `SELECT` — retrieves records.
- `SHOW DATABASES`, `SHOW TABLES`, `DESCRIBE` — inspect what exists.

## 8. Set up MySQL

We use MySQL Community Server as the database engine and MySQL Workbench as the graphical application for connecting to it and writing queries.

### Windows setup
1. Visit the official [MySQL Community Downloads](https://dev.mysql.com/downloads/).
2. Download MySQL Installer for Windows where available.
3. Run the installer and choose a setup that includes MySQL Server and MySQL Workbench.
4. Follow the configuration prompts. Keep a note of the root password you create; do not share it with anyone.
5. Complete the installation and open MySQL Workbench.
6. Open the local MySQL connection. Enter the password you created if prompted.
7. A SQL editor should open. Type a query and click the lightning-bolt execute button.

Installer screens can differ by release. Follow the current official installation guide linked in the resources file if your screen looks different.

### If you already have MySQL Workbench
Workbench is a client application; it needs a running MySQL Server to connect to. If Workbench opens but cannot connect, check whether MySQL Server is installed and running. Workbench alone is not the database server.

### If installation fails
Do not spend the whole week stuck on installation. Use a reputable browser-based SQL practice environment that supports MySQL syntax, or ask for help during the live session. Do not enter real passwords, personal information or private business data into a public SQL playground.

## 9. Your first SQL commands

SQL keywords are commonly written in uppercase for readability, but MySQL generally accepts lowercase keywords too. SQL statements usually end with a semicolon.

### See the databases on your server
```sql
SHOW DATABASES;
```

### Create a database
```sql
CREATE DATABASE retail_learning;
```

If you are repeating the lesson, use:
```sql
CREATE DATABASE IF NOT EXISTS retail_learning;
```

### Select the database
```sql
USE retail_learning;
```

### Create a table
```sql
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    learner_name VARCHAR(100),
    city VARCHAR(50),
    age INT
);
```

This creates four columns. learner_id is the primary key.

### Insert records
```sql
INSERT INTO learners (learner_id, learner_name, city, age)
VALUES
(1, 'Ada Okafor', 'Ibadan', 22),
(2, 'Bola James', 'Lagos', 25),
(3, 'Chidi Musa', 'Abuja', 21);
```

Text and date values are written inside single quotation marks. Numeric values are usually not.

### Inspect the tables
```sql
SHOW TABLES;
DESCRIBE learners;
```

SHOW TABLES lists the tables in the selected database. DESCRIBE displays the columns and their definitions.

## 10. Retrieve data with SELECT

SELECT asks the database to return data.

### Return every column
```sql
SELECT * FROM learners;
```
The asterisk means all columns. It is useful while exploring a small practice table. In real analysis, select only the columns you need.

### Return selected columns
```sql
SELECT learner_name, city
FROM learners;
```

### Give a column a temporary display name (alias)
```sql
SELECT learner_name AS student_name, city AS location
FROM learners;
```
An alias changes the heading in the query result. It does not rename the original column in the table.

### Return unique values
```sql
SELECT DISTINCT city
FROM learners;
```
DISTINCT removes duplicate combinations from the selected result columns.

### Limit the number of returned rows
```sql
SELECT *
FROM learners
LIMIT 2;
```
LIMIT is useful when previewing a large table.

## 11. Use the supplied practice database

Open `practice-data/retail_practice_database.sql` in Workbench and execute the script. It creates a database called `retail_practice` with Customers, Products and Orders tables and sample records.

After running the script, try:
```sql
USE retail_practice;

SHOW TABLES;

DESCRIBE customers;

SELECT * FROM customers;

SELECT product_name, unit_price
FROM products;

SELECT DISTINCT city
FROM customers;

SELECT *
FROM orders
LIMIT 5;
```

The database uses fictional sample data. The accompanying CSV files show the same source tables in a format you can inspect outside MySQL.

## 12. Important habits and common mistakes

- Select the correct database with `USE database_name;` before creating or querying tables.
- Check spelling of table and column names.
- Put text values in quotation marks.
- Separate column definitions with commas, but do not leave an extra comma before the closing parenthesis.
- Give each table a sensible primary key.
- Insert parent records before child records when foreign keys are enforced.
- Do not assume two tables are related just because they contain similar-looking values; check the key and relationship.
- Avoid `SELECT *` in large production queries when you only need a few columns.
- A successful query does not automatically mean the data is correct. Check row counts and sample records.

## 13. Week 6 self-check

You are ready to move on when you can explain, without reading:
- The difference between a database and a DBMS.
- Why a relational database uses multiple tables.
- The difference between a primary key and a foreign key.
- What a one-to-many relationship means.
- Why data types matter.
- What `CREATE DATABASE`, `USE`, `CREATE TABLE`, `INSERT INTO` and `SELECT` do.

You should also be able to open the practice database, inspect its tables and run a basic SELECT query.

**Next week:** SQL analysis — filtering, sorting, counting and summarising data to answer questions.
