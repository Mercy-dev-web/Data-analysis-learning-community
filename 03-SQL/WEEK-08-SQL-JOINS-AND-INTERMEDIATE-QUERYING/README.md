# Week 8: SQL Joins and Intermediate Querying

**Theme:** Combining related tables to answer business questions  
**Estimated effort:** 8–12 hours  
**Level:** Beginner to intermediate  
**Tool:** MySQL Workbench

## Learning outcomes
By the end of this week, you should be able to:
- Explain why analysts need to combine tables.
- Understand table aliases and qualified column names.
- Write INNER JOIN and LEFT JOIN queries.
- Explain RIGHT JOIN and how it relates to LEFT JOIN.
- Join three tables using matching primary and foreign keys.
- Identify unmatched records using a LEFT JOIN and NULL checks.
- Aggregate joined data without accidentally inflating totals.
- Explain how one-to-many relationships affect the number of result rows.
- Translate multi-table business questions into SQL.

## Learning sequence
1. Read [the lesson](LESSON.md).
2. Watch the [recommended videos and review the documentation](VIDEO-AND-READING-RESOURCES.md).
3. Run the Week 6 database script if your practice database is not available.
4. Work through the [exercises](EXERCISES.md).
5. Complete the [assignment](ASSIGNMENT.md).
6. Use the [answer guide](ANSWER-GUIDE.md) to check your work after attempting it.

## Practice file
- `practice-data/week8_join_practice.sql` — commented examples for INNER JOIN, LEFT JOIN, three-table joins, unmatched records and grouped analysis.

## What you should finish with
A set of readable SQL queries that combine Customers, Orders and Products, plus a short explanation of the business findings and any limitations.

## Important
The Week 6 practice model stores one product per order row. In a real sales system, one order can contain several products, usually represented with an OrderItems (or OrderDetails) table. We discuss this modelling distinction in the lesson.
