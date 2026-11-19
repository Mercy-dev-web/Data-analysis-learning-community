# Week 7 Exercises: SQL Analysis

Use the `retail_practice` database from Week 6. Run `USE retail_practice;` first. Write each query yourself and save it in `week7_exercises.sql`.

## Part A — WHERE and comparison operators

1. Display all orders paid for by Transfer.
2. Display products with a unit price greater than ₦3,000.
3. Display customers who are not from Lagos.
4. Display orders with a quantity greater than or equal to 2.
5. Display products with a unit price less than or equal to ₦3,200.

## Part B — AND, OR, NOT and pattern matching

6. Find orders paid by Transfer AND with a quantity of at least 2.
7. Find customers from Ibadan OR Lagos.
8. Find products that are NOT in the Groceries category.
9. Find products whose names contain the word `Soap`.
10. Find customer names that begin with the letter A.
11. Find products priced BETWEEN ₦2,000 and ₦9,000 (inclusive).
12. Find customers whose city is IN ('Ibadan', 'Abuja', 'Ilorin').

## Part C — ORDER BY and LIMIT

13. Display products from most expensive to least expensive.
14. Display orders from newest to oldest.
15. Return the three cheapest products.
16. Display orders sorted by payment method alphabetically and then quantity from highest to lowest.

## Part D — Aggregate functions

17. Count the total number of orders.
18. Calculate the total number of units ordered.
19. Calculate the average quantity per order.
20. Find the minimum and maximum product prices.
21. Count how many customer records have a recorded signup date.

## Part E — GROUP BY and HAVING

22. Count orders by payment method.
23. Calculate total units ordered by payment method.
24. Count customers by city.
25. Calculate average product price by category.
26. Show payment methods with at least four orders.
27. Show cities with at least two customers.
28. For orders dated from 5 November 2026 onward, calculate total units by payment method.

## Part F — Explain your SQL

In plain language, explain the difference between:
1. WHERE and HAVING.
2. COUNT(*) and COUNT(column).
3. ORDER BY and GROUP BY.
4. COUNT(quantity) and SUM(quantity).
5. LIMIT 3 and ORDER BY quantity DESC LIMIT 3.

## Challenge

The store manager wants to know which payment method has the highest total quantity ordered. Write a query that:
- Groups records by payment method.
- Calculates total quantity for each method.
- Sorts the result from highest to lowest total quantity.

Explain what the query tells the manager. Do not join tables yet.

## Completion checklist

- [ ] I can write row-level filters with WHERE.
- [ ] I understand AND, OR and NOT.
- [ ] I can use IN, BETWEEN, LIKE and IS NULL.
- [ ] I can sort and limit results.
- [ ] I can use COUNT, SUM, AVG, MIN and MAX.
- [ ] I can group records and filter groups.
- [ ] I can explain the result of each query in plain language.
