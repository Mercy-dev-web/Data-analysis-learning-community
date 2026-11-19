# Week 4 Assignment — Mini-Mart Sales Performance Analysis

**Assessed practical deliverable**

## Scenario

A neighbourhood mini-mart wants to understand its weekly sales. The manager has a transaction export but needs a simple Excel analysis showing revenue, payment patterns and product category performance.

You are the junior data analyst. Use Excel formulas to calculate the required metrics and answer the manager's questions.

## Dataset

Use [mini_mart_weekly_sales.csv](practice-data/mini_mart_weekly_sales.csv). It is synthetic practice data; all transactions and people are fictional.

## Task 1 — Prepare the workbook

Create `Week_04_Mini_Mart_Sales_Analysis_YourName.xlsx` with these sheets:

- `Raw_Data` — unchanged imported source.
- `Working_Data` — working copy converted into an Excel Table named `MiniMartSales`.
- `Formula_Answers` — business questions, formulas, results and explanations.
- `Documentation` — source, field descriptions, assumptions and limitations.

## Task 2 — Calculate revenue

Add a column called `Revenue_NGN` to Working_Data.

Revenue = Quantity_Sold × Unit_Price_NGN.

Use cell references or a Table formula. Do not type a separate hard-coded revenue value for each row.

## Task 3 — Calculate summary metrics

Use appropriate formulas to calculate:
- total revenue,
- average transaction revenue,
- highest transaction revenue,
- lowest transaction revenue,
- number of transactions,
- number of numeric revenue values,
- number of blank payment statuses, if any.

## Task 4 — Answer conditional business questions

Use the appropriate functions to calculate:

1. Number of Transfer payments.
2. Number of transactions in Ibadan.
3. Number of Ibadan transactions paid by Transfer.
4. Total revenue from Drinks.
5. Total revenue from Snacks in Ibadan.
6. Average revenue from Bakery products.
7. Average revenue from Drinks in Ibadan.
8. Number of transactions with quantity greater than 5.
9. Number of Snacks transactions with quantity greater than 3.

Use COUNTIF, COUNTIFS, SUMIF, SUMIFS, AVERAGEIF and AVERAGEIFS where appropriate. Your workbook should demonstrate all six functions.

## Task 5 — Apply decision logic

Add these two columns:

**Transaction_Size**
- "Large" if Revenue_NGN is at least ₦10,000.
- "Regular" otherwise.

**Review_Flag**
- "Review" if Payment_Status is Pending OR Quantity_Sold is zero.
- "OK" otherwise.

Add a third column, **Eligible_Offer**:
- "Eligible" only if Venue is Ibadan AND Category is Snacks.
- "Not Eligible" otherwise.

Use IF, AND and OR. Make sure the business rules are applied exactly as written.

## Task 6 — Explain the results

On Formula_Answers, include:
- the business question,
- the formula used,
- the calculated result,
- one sentence explaining what the result means.

Then write three short findings based on your results. Do not make claims that the dataset cannot support. For example, this one-week dataset cannot prove a long-term sales trend.

## Required submission

Create a folder named `week-04-excel-formulas` containing:

1. `Week_04_Mini_Mart_Sales_Analysis_YourName.xlsx`
2. `README.md` — a short explanation of the analysis and three findings.
3. `screenshots/` — optional screenshots of your formula results.

## Assessment rubric

| Criteria | Marks |
|---|---:|
| Workbook structure and raw-data preservation | 10 |
| Correct revenue calculation using cell references | 10 |
| Correct basic summary functions | 10 |
| Correct COUNTIF and COUNTIFS | 15 |
| Correct SUMIF and SUMIFS | 15 |
| Correct AVERAGEIF and AVERAGEIFS | 15 |
| Correct IF, AND and OR logic | 10 |
| Interpretation, documentation and presentation | 15 |
| **Total** | **100** |

**Recommended pass target:** 70%.

## Submission rules

- Attempt the work independently before checking the answer guide.
- Do not overwrite Raw_Data.
- Do not type answers manually where a formula is required.
- Keep formulas visible and understandable.
- Make sure criteria ranges and calculation ranges cover matching records.
- Document assumptions.
- Be ready to explain why you selected each function.
