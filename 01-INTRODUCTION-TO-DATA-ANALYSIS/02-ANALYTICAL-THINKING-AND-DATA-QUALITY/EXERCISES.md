# Week 2 — Practice Exercises

Attempt all questions before checking the answer guide. Explain your reasoning. Where a question asks what you would do, there may be several acceptable answers if they are justified.

## Part A — Data structure and types

1. Explain the difference between structured, semi-structured and unstructured data. Give two examples of each.
2. A dataset contains `Order_ID`, `Customer_Name`, `Order_Date`, `Quantity`, `Unit_Price` and `Payment_Status`. Suggest a suitable data type for each field.
3. Why should a phone number usually be stored as text rather than an integer?
4. A date appears as `11/12/2026`. Why should an analyst confirm the date convention before converting it?
5. Explain why an order ID is not a measure that should be averaged.

## Part B — Data sources and sampling

1. Give two examples of primary data and two examples of secondary data for a marketing project.
2. A university wants to understand student satisfaction but surveys only students in one department. What is the possible problem?
3. Explain the difference between a population and a sample.
4. What is a sampling frame?
5. A vendor shares a survey link on Instagram and asks followers to respond. Identify one possible source of sampling bias.
6. Why can a large sample still produce misleading results?

## Part C — Data quality dimensions

For each example, identify the main data-quality dimension affected and explain your choice.

1. A sales file has no order dates for 18% of its records.
2. A receipt shows ₦12,500, but the spreadsheet records ₦125,000.
3. The same order line has been entered twice.
4. A stock report is used three weeks after its last update for today's restocking decision.
5. The approved payment statuses are Paid, Pending and Cancelled, but a record says "Finished".
6. A city is recorded as "Ibadan", "ibadan" and "IBADAN".

Some issues may affect more than one dimension. Identify the most direct one and mention any secondary effect.

## Part D — Missing values, duplicates and outliers

1. Why is replacing every blank cell with zero dangerous?
2. What is the difference between an exact duplicate and a potential duplicate?
3. A customer named Ada appears in 15 rows. Should you delete 14 rows? Explain.
4. A restaurant records one order of ₦800,000 while most orders are below ₦30,000. List at least four possible explanations and describe how you would investigate.
5. A quantity field contains -2. Is this automatically wrong? What business context would you check?
6. A dataset has 100 records and 12 have no phone number. Calculate the completeness rate for the phone-number field, assuming a phone number is required for every record.

## Part E — Correlation and causation

1. A business notices that more adverts and more sales occurred in December. Why is it not enough to conclude that adverts caused the sales increase?
2. Give an example of two variables that may be correlated because of a third variable.
3. Rewrite this claim more carefully: "Our new Instagram campaign caused all our sales to increase."
4. State three questions an analyst should ask before making a causal claim.

## Part F — Scenario: mini-mart records

A mini-mart exports the following records:

| Order_ID | Date | Product | Quantity | Unit_Price_NGN | City |
|---|---|---|---:|---:|---|
| M001 | 01/10/2026 | Rice | 2 | 85000 | Ibadan |
| M002 | 2026-10-01 | Beans | 1 | 42000 | IBADAN |
| M003 | 02/10/2026 | Oil | -1 | 18000 | Lagos |
| M004 | 03/10/2026 | Rice |  | 85000 | Ibadan |
| M004 | 03/10/2026 | Rice |  | 85000 | Ibadan |
| M005 | 04/10/2026 | Beans | 1 | 420000 | Abeokuta |

Answer:

1. Identify at least six potential data-quality issues.
2. For each issue, state which dimension it may affect.
3. Which issue would you investigate first, and why?
4. Which values might be standardised safely after confirmation?
5. Which record should not be deleted without further investigation?
6. What additional fields or source documents would help you investigate?
7. Write three validation rules for this dataset.
8. Explain why the high Beans price should be investigated rather than automatically changed to ₦42,000.

## Part G — Data dictionary

Create a data dictionary for these fields:

- Student_ID
- Course_Code
- Exam_Date
- Score
- Attendance_Status
- Department

For each field, state:
- meaning,
- data type,
- example,
- validation rule.

## Part H — Short reflection

In 150–250 words, answer:

"Why is data quality an important responsibility for a data analyst, and what can happen when an organisation makes decisions using poor-quality data?"

## Submission

Save your responses as `week-02-exercises-yourname.md` or in a clearly organised document. Use complete explanations, not just one-word answers.
