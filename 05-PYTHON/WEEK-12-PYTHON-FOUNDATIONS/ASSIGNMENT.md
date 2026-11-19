# Week 12 Assignment: Build a Mini Shop Sales Summary

## Scenario

A small Nigerian retail business wants a simple Python program to summarise its sales. The owner currently calculates totals manually. Your task is to build a beginner-friendly program that calculates useful figures and classifies performance.

This assignment assesses Python fundamentals, not pandas. Do not use pandas or NumPy.

## Dataset

Use the file [mini_shop_sales.csv](practice-data/mini_shop_sales.csv). It contains fictional sales records for a small shop.

Columns:
- `Order_ID`
- `Product`
- `Category`
- `Quantity`
- `Unit_Price_NGN`
- `City`
- `Payment_Method`

Revenue for each row is:

`Quantity × Unit_Price_NGN`

The file has 12 order records. Treat each row as one order line for this exercise.

## Tasks

### Task 1 — Load and inspect the file (15 marks)

Use Python's built-in `csv` module to open the file. Print each product, quantity and unit price. Explain briefly what a CSV file is and what `csv.DictReader` does.

### Task 2 — Calculate revenue (20 marks)

For each row:
1. Convert quantity to an integer.
2. Convert unit price to a number.
3. Calculate row revenue.
4. Print the product and its revenue in naira.

Do not multiply numeric values while they are still strings.

### Task 3 — Summarise the sales (25 marks)

Calculate and display:
- Total revenue.
- Total quantity sold.
- Number of order rows.
- Average revenue per order row.
- Highest and lowest row revenue.

Use appropriate built-in functions where possible.

### Task 4 — Create reusable functions (15 marks)

Create at least two functions:
- A function that calculates revenue from quantity and unit price.
- A function that classifies total revenue against a target of ₦100,000.

Your classification should distinguish achieved from not achieved.

### Task 5 — Communicate the result (15 marks)

Use f-strings to print a clear summary. Write three short observations based on the figures. Do not claim that revenue is profit; costs are not supplied.

### Task 6 — Code quality (10 marks)

Your code should:
- Use meaningful variable names.
- Include comments where they help.
- Use consistent indentation.
- Run from top to bottom without errors.
- Avoid unnecessary complexity.

## Submission

Submit:
1. Your Python file: `week12_sales_summary.py`.
2. A screenshot or notebook export showing the program running.
3. A short explanation (150–250 words) of what the program does and what the results tell the shop owner.

## Marking guide

| Area | Marks |
|---|---:|
| CSV loading and inspection | 15 |
| Correct revenue calculations | 20 |
| Correct summary metrics | 25 |
| Reusable functions | 15 |
| Clear output and observations | 15 |
| Code quality | 10 |
| **Total** | **100** |

**Pass target: 70/100.** Attempt the work independently before consulting the answer guide.
