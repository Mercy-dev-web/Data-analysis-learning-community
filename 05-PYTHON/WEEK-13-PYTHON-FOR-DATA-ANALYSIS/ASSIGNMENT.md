# Week 13 Assignment: Clean and Analyse a Nigerian Retail Dataset with pandas

## Scenario

A small retail business has exported order records from its sales system. The file contains inconsistent text, missing city information and a repeated row. The owner wants a reliable summary of sales by city, category and sales channel.

Your task is to use Python and pandas to inspect the raw data, clean it responsibly, calculate revenue and prepare summary tables.

## Dataset

Use [naija_shop_orders_raw.csv](practice-data/naija_shop_orders_raw.csv).

The dataset is fictional and contains deliberately introduced quality issues. Each valid row represents one order record for this exercise.

Columns:
- `Order_ID`: order identifier.
- `Order_Date`: date of the order.
- `Product`: product name.
- `Category`: product category.
- `Quantity`: units sold.
- `Unit_Price_NGN`: unit selling price in naira.
- `City`: customer/order city.
- `Channel`: sales channel.
- `Payment_Method`: payment method.

Revenue is defined as:

`Quantity × Unit_Price_NGN`

The dataset does not contain cost data. Do not describe revenue as profit.

## Tasks

### Task 1 — Load and inspect (15 marks)

1. Import pandas and NumPy.
2. Load the raw CSV into a DataFrame.
3. Display the first five rows, shape, columns and data types.
4. Use `info()`, `describe()` and `isna().sum()`.
5. Identify the data-quality issues you notice before making changes.

### Task 2 — Clean the data (25 marks)

1. Check and remove the exact duplicate record. State how many records were removed.
2. Standardise text in Product, Category, City, Channel and Payment_Method where appropriate.
3. Convert Order_Date to datetime.
4. Ensure Quantity and Unit_Price_NGN are numeric.
5. Investigate missing City values. You may retain them as missing or label them "Unknown"; explain your decision. Do not guess a city.
6. Recheck missing values, duplicates and data types after cleaning.

### Task 3 — Create useful fields (10 marks)

Create `Revenue_NGN` by multiplying Quantity by Unit_Price_NGN. Check at least two rows manually to verify the calculation.

### Task 4 — Answer business questions (25 marks)

Create summary tables that answer:

1. What is total revenue and total quantity sold?
2. What is revenue by city?
3. What is revenue by category?
4. What is revenue and quantity by sales channel?
5. Which product generated the highest revenue?
6. What is the average order-row revenue?

Use `groupby()`, `agg()`, sorting and appropriate summary functions.

### Task 5 — Export and document (15 marks)

1. Export your cleaned dataset to `naija_shop_orders_cleaned.csv` using `index=False`.
2. Save your Python work as `week13_retail_analysis.ipynb` or `week13_retail_analysis.py`.
3. Write 200–300 words explaining your cleaning decisions, findings and at least one limitation.

### Task 6 — Code quality (10 marks)

Use clear variable names, logical sections, comments where useful and code that runs from top to bottom. Avoid hiding errors by blindly filling or deleting values.

## Submission checklist

- [ ] Notebook or Python script.
- [ ] Cleaned CSV export.
- [ ] Evidence of the inspection and cleaning checks.
- [ ] Summary tables for all six business questions.
- [ ] 200–300 word explanation.
- [ ] At least one limitation stated honestly.

## Marking guide

| Area | Marks |
|---|---:|
| Load and inspect | 15 |
| Cleaning and validation | 25 |
| Calculated revenue field | 10 |
| Business summaries | 25 |
| Export and written explanation | 15 |
| Code quality | 10 |
| **Total** | **100** |

**Pass target: 70/100.** Attempt the assignment independently before consulting the answer guide.
