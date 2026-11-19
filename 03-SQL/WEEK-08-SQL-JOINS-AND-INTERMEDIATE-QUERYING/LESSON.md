# Week 8 Lesson: SQL Joins and Intermediate Querying

## 1. Why do we need JOINs?

In Weeks 6 and 7, you queried one table at a time. But business questions often need information stored in different tables.

For example:
- Which customers bought each product?
- What product category generated the orders?
- Which city are the customers who placed orders from?
- What quantity of each product was ordered, and by whom?

The Customers table stores customer details. The Products table stores product details. The Orders table connects customers and products through their IDs.

A JOIN lets SQL combine rows from two or more tables using a related column.

Before practising, select the database:

```sql
USE retail_practice;
```

## 2. Understand the relationships again

The Week 6 practice database contains:
- Customers: one row per customer; primary key is customer_id.
- Products: one row per product; primary key is product_id.
- Orders: one row per order record; order_id is the primary key, while customer_id and product_id are foreign keys.

The relationship looks like this:

```text
CUSTOMERS                  ORDERS                  PRODUCTS
customer_id (PK)  1 ----<  customer_id (FK)
customer_name              order_id (PK)
city                       product_id (FK)  >---- 1 product_id (PK)
                           quantity                  product_name
                           order_date                category
                                                     unit_price
```

The Orders table is the connecting table in this simplified example. The key columns are what make the relationships possible.

## 3. Table aliases and qualified column names

A table alias is a shorter temporary name used inside a query.

```sql
SELECT
    c.customer_name,
    c.city
FROM customers AS c;
```

Here, `c` is an alias for Customers. The alias exists only for this query; it does not rename the table.

When two tables have columns with the same name, qualify the column with its table or alias:

```sql
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

The expression `c.customer_id` means the customer_id column from the Customers table.

## 4. INNER JOIN

An INNER JOIN returns rows where the join condition matches in both tables.

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.quantity
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

How to read it:
1. Start with Customers, given alias c.
2. Join Orders, given alias o.
3. Match a customer's ID to the customer ID stored on each order.
4. Return the requested columns for matching rows.

A customer with no matching order would not appear in this INNER JOIN result. A customer with several orders appears several times — once for each matching order.

### Important: row multiplication is expected
If one customer has five orders, that customer will appear in five result rows. This is not necessarily duplicate data; it reflects the one-to-many relationship.

## 5. LEFT JOIN

A LEFT JOIN returns every row from the left table and matching rows from the right table. If there is no match, columns from the right table are returned as NULL.

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

This keeps all customers, including customers who have not placed an order.

### Find customers who have never ordered

```sql
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

The LEFT JOIN first preserves all customers. The WHERE condition then keeps only rows without a matching order.

The supplied sample has orders for all eight customers, so this query returns no rows. That is a valid result: it means no customer in this sample is unmatched. In a different dataset, it could return customers.

## 6. RIGHT JOIN

A RIGHT JOIN returns every row from the right table and matching rows from the left table. Missing matches from the left side appear as NULL.

```sql
SELECT
    c.customer_name,
    o.order_id
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

Because every order should reference an existing customer (the foreign key enforces this in our sample), this query returns the order records with their matching customer.

Many analysts prefer LEFT JOIN because it is often easier to read: start with the table whose records you want to preserve, then join the other table. A RIGHT JOIN can usually be rewritten as a LEFT JOIN by switching the table order.

## 7. Joining three tables

Now answer a more useful business question: which customer bought which product?

```sql
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    o.order_date
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

This query:
- Starts with Orders.
- Adds customer details by matching customer_id.
- Adds product details by matching product_id.
- Returns one result row per matching order record.

You can join more than two tables. Each JOIN needs a clear relationship condition.

## 8. Calculate order value after joining

The Orders table contains quantity. The Products table contains unit_price. To calculate the value of each order row, we need both.

```sql
SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    p.unit_price,
    o.quantity * p.unit_price AS order_line_value
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

This is a line value based on the listed unit price multiplied by quantity. It is not necessarily profit, and it does not account for discounts, taxes, delivery charges or returns.

## 9. Aggregate joined data

You can group a joined result to answer summary questions.

### Total units ordered by product

```sql
SELECT
    p.product_name,
    SUM(o.quantity) AS total_units
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units DESC;
```

### Total order-line value by product category

```sql
SELECT
    p.category,
    SUM(o.quantity * p.unit_price) AS total_order_value
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_order_value DESC;
```

### Number of orders by customer city

```sql
SELECT
    c.city,
    COUNT(o.order_id) AS number_of_orders
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY number_of_orders DESC;
```

Notice that we use COUNT(o.order_id) to count matched orders. If you use a LEFT JOIN and want to count matches, COUNT of a non-NULL column from the right-hand table is often more useful than COUNT(*), because COUNT(*) also counts the preserved unmatched left-side row.

## 10. WHERE versus ON in an outer join

This difference is important.

Suppose you want all customers, but only orders paid by Transfer when a matching order exists.

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.payment_method
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
   AND o.payment_method = 'Transfer';
```

The payment condition is part of the join match. All customers remain in the result, even if they have no Transfer order.

If you instead write:

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.payment_method
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.payment_method = 'Transfer';
```

The WHERE condition removes rows where payment_method is NULL. This can make the result behave like an INNER JOIN for this condition.

For now, remember: conditions in ON define how rows match; WHERE filters the result after the join.

## 11. Common JOIN mistakes

1. **Joining on the wrong columns.** Match primary keys to the corresponding foreign keys, not unrelated fields that happen to contain similar values.
2. **Forgetting the ON condition.** This can create a Cartesian product, where every row from one table is paired with every row from another.
3. **Ambiguous column names.** Use aliases such as c.customer_id and o.customer_id.
4. **Assuming repeated names mean duplicate records.** One customer can have multiple orders.
5. **Using COUNT(*) without understanding the join.** A one-to-many join can increase the number of rows being counted.
6. **Aggregating after an incorrect join.** A wrong join can multiply amounts and produce inflated totals.
7. **Filtering a LEFT JOIN in WHERE without considering NULLs.** This can remove rows you intended to preserve.

## 12. How to validate a JOIN

Before trusting a joined result:
- Check how many rows the base table contains.
- Check the expected relationship (one-to-one, one-to-many or many-to-many).
- Inspect a few rows and verify the IDs match.
- Compare row counts before and after the join.
- Check whether totals have unexpectedly increased.
- Confirm that the query answers the question you intended.

A JOIN is not correct simply because it runs without an error.

## 13. Week 8 self-check

You should be able to:
- Explain why JOINs are needed.
- Write an INNER JOIN and LEFT JOIN.
- Explain what RIGHT JOIN preserves.
- Use aliases and qualified column names.
- Join three tables through their keys.
- Identify unmatched records with IS NULL.
- Calculate order-line values from joined columns.
- Aggregate joined data and explain the risk of duplicated totals.

**Next:** You have completed the core SQL sequence. The next stage of the programme moves into Power BI and data transformation.
