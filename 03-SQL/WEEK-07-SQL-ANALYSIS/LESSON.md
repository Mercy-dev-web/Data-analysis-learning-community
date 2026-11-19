# Week 7 Lesson: SQL Analysis

## 1. From retrieving data to answering questions

Last week, you learnt how to create and inspect tables and retrieve records with SELECT. Analysts rarely stop at displaying every row. They ask questions such as:
- Which orders used Transfer as the payment method?
- Which products cost more than ₦3,000?
- How many orders were placed?
- What is the average quantity per order?
- How many orders were placed using each payment method?

SQL helps answer these questions directly from the database.

**Before you begin:** Select the practice database:

```sql
USE retail_practice;
```

The examples use the fictional Customers, Products and Orders tables created in Week 6.

## 2. The basic query structure

```sql
SELECT column_name
FROM table_name
WHERE condition
GROUP BY column_name
HAVING group_condition
ORDER BY column_name
LIMIT number;
```

This is a learning outline, not a requirement to include every clause in every query. The logical order in which MySQL processes a query is not exactly the order in which you type the clauses. For this week, learn the roles of each clause and follow the syntax order shown.

## 3. Filtering rows with WHERE

WHERE keeps only rows that satisfy a condition.

### Equality
```sql
SELECT *
FROM orders
WHERE payment_method = 'Transfer';
```
This returns only orders whose payment method is Transfer.

### Comparison operators

| Operator | Meaning | Example |
|---|---|---|
| = | Equal to | quantity = 2 |
| != or <> | Not equal to | city <> 'Lagos' |
| > | Greater than | unit_price > 3000 |
| < | Less than | quantity < 3 |
| >= | Greater than or equal to | unit_price >= 5000 |
| <= | Less than or equal to | quantity <= 2 |

Example:
```sql
SELECT product_name, unit_price
FROM products
WHERE unit_price > 3000;
```

Text values need quotation marks. Numeric values usually do not.

## 4. Combining conditions: AND, OR and NOT

### AND
Both conditions must be true.

```sql
SELECT *
FROM orders
WHERE payment_method = 'Transfer'
  AND quantity >= 2;
```

### OR
At least one condition must be true.

```sql
SELECT *
FROM customers
WHERE city = 'Ibadan'
   OR city = 'Lagos';
```

### NOT
Reverses a condition.

```sql
SELECT *
FROM products
WHERE NOT category = 'Groceries';
```

You can use parentheses to make combined conditions easier to understand:

```sql
SELECT *
FROM orders
WHERE (payment_method = 'Card' OR payment_method = 'Cash')
  AND quantity >= 2;
```

Without parentheses, AND is evaluated before OR. Use parentheses when the intended logic might otherwise be unclear.

## 5. Useful filtering operators

### IN
IN checks whether a value matches any value in a list.

```sql
SELECT *
FROM customers
WHERE city IN ('Ibadan', 'Lagos', 'Abuja');
```

This is shorter than writing several OR conditions.

### BETWEEN
BETWEEN checks an inclusive range: the start and end values are included.

```sql
SELECT *
FROM products
WHERE unit_price BETWEEN 2000 AND 9000;
```

For dates:
```sql
SELECT *
FROM orders
WHERE order_date BETWEEN '2026-11-05' AND '2026-11-12';
```

### LIKE
LIKE searches for a pattern in text. The percent sign (%) represents zero or more characters; underscore (_) represents exactly one character.

```sql
-- Names beginning with A
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

-- Product names containing the word Soap
SELECT *
FROM products
WHERE product_name LIKE '%Soap%';
```

### IS NULL
NULL means a value is missing or unknown. It is not the same as zero or an empty string. Do not use `= NULL`.

```sql
SELECT *
FROM customers
WHERE signup_date IS NULL;
```

To find records where a value exists:
```sql
SELECT *
FROM customers
WHERE signup_date IS NOT NULL;
```

## 6. Sorting results with ORDER BY

ORDER BY sorts the returned rows.

```sql
SELECT product_name, unit_price
FROM products
ORDER BY unit_price ASC;
```

- ASC means ascending (smallest to largest, A to Z, earliest to latest). It is the default.
- DESC means descending (largest to smallest, Z to A, latest to earliest).

Example:
```sql
SELECT *
FROM orders
ORDER BY order_date DESC;
```

You can sort by more than one column:
```sql
SELECT *
FROM orders
ORDER BY payment_method ASC, quantity DESC;
```
MySQL sorts by payment method first. Within each payment method, it sorts quantity from highest to lowest.

## 7. Limiting results with LIMIT

LIMIT controls how many rows are returned.

```sql
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;
```

This returns the five most recent orders in the sample data. When finding a top or bottom list, combine LIMIT with ORDER BY. LIMIT by itself does not guarantee which records are returned.

## 8. Aggregate functions

Aggregate functions calculate a summary from multiple rows.

| Function | What it does | Example |
|---|---|---|
| COUNT(*) | Counts rows | Number of orders |
| COUNT(column) | Counts non-NULL values in a column | Orders with a recorded payment method |
| SUM(column) | Adds numeric values | Total units ordered |
| AVG(column) | Calculates the average | Average order quantity |
| MIN(column) | Finds the smallest value | Lowest product price |
| MAX(column) | Finds the largest value | Highest product price |

Examples:

```sql
-- Count all orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total units ordered
SELECT SUM(quantity) AS total_units
FROM orders;

-- Average quantity per order row
SELECT AVG(quantity) AS average_quantity
FROM orders;

-- Lowest and highest product price
SELECT
    MIN(unit_price) AS lowest_price,
    MAX(unit_price) AS highest_price
FROM products;
```

### Important: COUNT(*) versus COUNT(column)
COUNT(*) counts every row. COUNT(column) counts only rows where that column is not NULL. This difference matters when a column contains missing values.

## 9. GROUP BY: summarising categories

GROUP BY puts rows with the same value into groups so you can calculate a summary for each group.

### Count orders by payment method
```sql
SELECT
    payment_method,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY payment_method;
```

Instead of one total for the whole table, you get one count for each payment method.

### Total quantity by payment method
```sql
SELECT
    payment_method,
    SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method;
```

### Average price by product category
```sql
SELECT
    category,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category;
```

When using GROUP BY, every selected column should normally either be included in the grouping or be calculated with an aggregate function. This avoids ambiguous results.

## 10. HAVING: filtering groups

WHERE filters individual rows before grouping. HAVING filters the groups after GROUP BY.

Example: show payment methods with at least four orders.

```sql
SELECT
    payment_method,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY payment_method
HAVING COUNT(*) >= 4;
```

Compare:
- WHERE payment_method = 'Transfer' filters order rows before grouping.
- HAVING COUNT(*) >= 4 filters grouped payment-method results based on their count.

You can use both:
```sql
SELECT
    payment_method,
    SUM(quantity) AS total_units
FROM orders
WHERE order_date >= '2026-11-05'
GROUP BY payment_method
HAVING SUM(quantity) >= 3;
```

## 11. Calculated columns and aliases

You can calculate a value in a query without changing the original table.

For a simple order-line value, multiply the product price by quantity. This requires data from both Products and Orders, so it will be demonstrated with JOINs in Week 8. For now, practise calculations using columns in the same table:

```sql
SELECT
    product_name,
    unit_price,
    unit_price * 1.075 AS price_with_7_5_percent_increase
FROM products;
```

The calculation creates a result column; it does not update the stored price.

Aliases make output easier to read:
```sql
SELECT
    payment_method AS payment_channel,
    COUNT(*) AS order_count
FROM orders
GROUP BY payment_method;
```

## 12. A complete business question

**Question:** How many units were ordered through each payment method, and which payment methods account for at least four order records?

```sql
SELECT
    payment_method,
    COUNT(*) AS number_of_orders,
    SUM(quantity) AS total_units
FROM orders
GROUP BY payment_method
HAVING COUNT(*) >= 4
ORDER BY total_units DESC;
```

How to read it:
1. FROM chooses the Orders table.
2. GROUP BY creates one group per payment method.
3. COUNT and SUM calculate measures for each group.
4. HAVING keeps only groups with at least four orders.
5. ORDER BY ranks the remaining groups by total units, highest first.

An analyst should then explain what the results mean and check whether the sample is large enough to support a business decision.

## 13. Common mistakes

- Writing `= NULL` instead of `IS NULL`.
- Forgetting quotation marks around text and date values.
- Using WHERE to filter an aggregate result instead of HAVING.
- Forgetting GROUP BY when selecting a category alongside an aggregate.
- Expecting LIMIT to return the highest or newest records without ORDER BY.
- Using AND when the question requires either condition (OR), or the reverse.
- Confusing the number of orders (COUNT) with the number of units (SUM(quantity)).
- Treating a sample dataset as if it represents every customer or every month.

## 14. Week 7 self-check

You should now be able to:
- Filter rows with WHERE and combine conditions with AND, OR and NOT.
- Use IN, BETWEEN, LIKE and IS NULL.
- Sort with ORDER BY and limit with LIMIT.
- Explain COUNT, SUM, AVG, MIN and MAX.
- Group records with GROUP BY and filter groups with HAVING.
- Explain the difference between WHERE and HAVING.
- Translate a simple business question into a query and describe the result.

**Next week:** SQL JOINs — combining Customers, Products and Orders to answer questions that require more than one table.
