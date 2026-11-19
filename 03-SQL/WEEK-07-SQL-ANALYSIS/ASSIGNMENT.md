# Week 7 Assignment: Retail Orders Analysis with SQL

## Business scenario

You are supporting a small retailer. The manager wants a quick summary of customer locations, product prices and order activity. You have been given access to the `retail_practice` database.

This week's task is to answer questions using SQL. Work with one table at a time; joins are reserved for Week 8.

## Required submission

Create a file called `week7_assignment.sql`. Include a short SQL comment before every query to state the business question it answers.

### Task 1 — Order activity
1. Count all order records.
2. Calculate the total units ordered.
3. Calculate the average quantity per order.
4. Count orders by payment method.
5. Calculate total units by payment method.

### Task 2 — Product review
6. Display products with a unit price above ₦3,000.
7. Display the five most expensive products, highest price first.
8. Calculate the average unit price for each product category.
9. Display only categories with an average unit price above ₦3,000.

### Task 3 — Customer locations
10. Count customers in each city.
11. Display only cities with at least two customers.
12. Display customers from Ibadan, Lagos or Abuja.

### Task 4 — A date-based question
13. Count orders placed between 5 November and 12 November 2026, inclusive.
14. Calculate total units ordered by payment method during that same date range.

### Task 5 — Interpret the results
Write 250–400 words answering:
- Which payment method has the most order records?
- Which payment method has the highest total number of units?
- Which product category has the highest average price?
- Which cities have at least two registered customers?
- What is one useful follow-up question the manager could ask?

Use your query outputs as evidence. Do not invent a business explanation that the data cannot support.

## Required files
- [ ] `week7_assignment.sql` with all 14 queries and comments.
- [ ] `week7_findings.md` with your written interpretation.
- [ ] Screenshot of at least three query results, including one GROUP BY result.
- [ ] A brief note describing one error you encountered and how you fixed it.

## Assessment rubric (100 marks)

| Area | Marks |
|---|---:|
| Correct filtering and date conditions | 15 |
| Correct sorting and LIMIT use | 10 |
| Correct aggregate calculations | 20 |
| Correct GROUP BY and HAVING use | 20 |
| Clear, readable and commented SQL | 15 |
| Evidence-based interpretation | 15 |
| Reflection and presentation | 5 |
| **Total** | **100** |

**Pass target:** 70%. Review and correct your work if you score below 70%.

## Submission integrity
Submit queries you understand. You may consult documentation, but do not copy a query without being able to explain each clause. Do not include passwords or private data in screenshots.
