# Week 8 Assignment: Multi-Table Retail Analysis

## Business scenario

The retailer has customers, products and orders stored in separate tables. The manager wants a report that shows what customers bought, which products were involved and how order activity differs across customer locations.

Your task is to combine the tables with SQL and present evidence-based findings.

## Database
Use the `retail_practice` database created in Week 6. Do not modify the source records for this assignment.

## Task 1 — Build a detailed order view

Write a query that returns:
- Order ID
- Order date
- Customer name
- Customer city
- Product name
- Product category
- Quantity
- Unit price
- Calculated order-line value (quantity × unit price)

Use readable aliases and join all three tables correctly.

## Task 2 — Answer the manager's questions

Write separate SQL queries to answer:

1. Which products have the highest total quantity ordered? Show all products that appear in orders, ranked from highest to lowest quantity.
2. What is the total order-line value for each product category?
3. Which customer cities have the most order records?
4. Which customers have the highest total order-line value?
5. What is the total number of order records and total units ordered for each payment method?
6. Are there any customers without orders?
7. Are there any products without orders?

For questions 6 and 7, use LEFT JOIN and an IS NULL check. Explain the result even if no records are returned.

## Task 3 — Customer summary

Create a query that starts from Customers and returns every customer, including customers with no orders. Include:
- Customer ID and name
- Number of orders
- Total units ordered
- Total order-line value

Use a LEFT JOIN. Use COUNT on the order ID rather than COUNT(*). Use COALESCE or an equivalent expression if you want missing totals displayed as zero. Explain what COALESCE does.

## Task 4 — Findings

Write 300–450 words explaining:
- The product with the highest total units ordered.
- The category with the highest total order-line value.
- The city with the highest number of orders.
- The customer with the highest total order-line value.
- One useful recommendation supported by the query results.
- One limitation of the practice data.

Do not claim that order-line value is profit. The dataset has no product cost, discount, tax or return information.

## Required submission files

- [ ] `week8_assignment.sql` — all queries with comments.
- [ ] `week8_findings.md` — written findings and recommendation.
- [ ] Screenshot of the detailed three-table join.
- [ ] Screenshot of at least two grouped analysis results.
- [ ] Screenshot of the customer summary.
- [ ] A short note explaining one JOIN issue you encountered and how you checked the result.

## Assessment rubric (100 marks)

| Area | Marks |
|---|---:|
| Correct two-table and three-table JOINs | 25 |
| Correct LEFT JOIN and unmatched-record checks | 15 |
| Correct calculations and aggregations | 20 |
| Query readability, aliases and comments | 10 |
| Validation of row counts and totals | 10 |
| Business findings and recommendation | 15 |
| Reflection and presentation | 5 |
| **Total** | **100** |

**Pass target:** 70%. Review and correct your work if you score below 70%.

## Important
Use the supplied sample database as it is. Do not make up missing records or recommendations. Your findings must match your actual query output.
