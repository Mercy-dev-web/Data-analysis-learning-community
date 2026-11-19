# Week 8 Exercises: SQL JOINs

Use the `retail_practice` database from Week 6. Run `USE retail_practice;` first. Save your work in `week8_exercises.sql`.

## Part A — INNER JOIN

1. Display each order ID with the name of the customer who placed it.
2. Display each order ID with the product name.
3. Display customer name, product name and quantity for every order.
4. Display order date, customer name and payment method.
5. Display product name, category and quantity for each order.

## Part B — LEFT JOIN and unmatched records

6. Display all customers and any order IDs they have.
7. Write a query to find customers who have never placed an order.
8. Display all products and any matching order IDs.
9. Write a query to find products that have never been ordered.

Note: In the supplied sample, all customers and all products appear in at least one order, so questions 7 and 9 should return no rows. Explain why a zero-row result can be correct.

## Part C — Three-table joins and calculations

10. Display order ID, customer name, product name, quantity and unit price.
11. Add a calculated column called `order_line_value` equal to quantity multiplied by unit price.
12. Display customer name, city, product name and order date.
13. Display product name, category, quantity and payment method.

## Part D — Grouped analysis using joins

14. Calculate total units ordered for each product.
15. Calculate total order-line value for each product category.
16. Count order records by customer city.
17. Calculate total order-line value by customer city.
18. Show product categories with total order-line value above ₦10,000.

## Part E — Explain and validate

19. Why might one customer appear many times in an INNER JOIN result?
20. What is the difference between INNER JOIN and LEFT JOIN?
21. What does a NULL in the right-side columns of a LEFT JOIN often indicate?
22. Why should you check row counts and totals after joining tables?
23. Explain how a wrong join condition can inflate a SUM.

## Challenge

The retailer wants a report showing each customer, the number of orders they placed, and the total value of those orders. Include customers even if they have no orders.

Write a query using a LEFT JOIN. Use COUNT on the order ID and calculate order value carefully. Explain why you chose COUNT(o.order_id) rather than COUNT(*).

## Completion checklist

- [ ] I can join two tables using matching keys.
- [ ] I can explain INNER JOIN and LEFT JOIN.
- [ ] I can use aliases to make queries readable.
- [ ] I can join three tables.
- [ ] I can find unmatched records.
- [ ] I can calculate values from columns in different tables.
- [ ] I can aggregate a joined result and validate the totals.
