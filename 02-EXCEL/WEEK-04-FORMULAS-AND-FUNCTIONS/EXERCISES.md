# Week 4 — Excel Formulas and Functions Exercises

**Instructions:** Complete the questions in Excel. Use the supplied `mini_mart_weekly_sales.csv` dataset for Part D. Write formulas yourself and explain what the result means.

## Part A — Formula foundations

1. What is the difference between a formula and a function?
2. Why does an Excel formula begin with an equals sign?
3. Write a formula to add A2 and B2.
4. Write a formula to multiply quantity in C2 by unit price in D2.
5. What is the result of `=10+5*2`? Explain.
6. What is the result of `=(10+5)*2`? Explain.
7. Explain the difference between a cell reference and a hard-coded number.
8. What is an argument in an Excel function?

## Part B — Cell references

1. Explain what happens to `=B2*C2` when copied from D2 to D3.
2. Cell F1 contains a commission rate. Write a formula to multiply D2 by that rate, keeping F1 fixed when copied down.
3. What does `$A$1` mean?
4. What does `$A1` mean?
5. What does `A$1` mean?
6. Give a practical example where an absolute reference is useful.
7. Give a practical example where a mixed reference is useful.

## Part C — Basic functions

Assume sales values are in F2:F21.

1. Calculate total sales.
2. Calculate average sales.
3. Find the highest sales value.
4. Find the lowest sales value.
5. Count how many cells contain numeric sales values.
6. Count how many cells are not empty in A2:A21.
7. Count blank cells in F2:F21.
8. Explain why COUNT and COUNTA may return different results.
9. Explain why a zero is not the same as a blank cell.

## Part D — Practical formula work

Open `practice-data/mini_mart_weekly_sales.csv` in Excel. Create a new workbook and preserve a copy of the source data.

Add a calculated column named Revenue_NGN using Quantity_Sold multiplied by Unit_Price_NGN.

Then answer all questions with formulas:

1. What is the total revenue?
2. What is the average revenue per transaction?
3. What is the highest transaction revenue?
4. What is the lowest transaction revenue?
5. How many transactions are recorded?
6. How many transactions were paid by Transfer?
7. How many transactions were made in Ibadan?
8. How many transactions were made in Ibadan and paid by Transfer?
9. What is the total revenue from the Drinks category?
10. What is the total revenue from Snacks in Ibadan?
11. What is the average revenue from Bakery products?
12. What is the average revenue from Drinks in Ibadan?
13. How many transactions had quantity sold greater than 5?
14. How many Snacks transactions had quantity sold greater than 3?
15. Create a column named Transaction_Size. Label a transaction "Large" if its revenue is at least ₦10,000; otherwise label it "Regular".
16. Create a column named Review_Flag. Return "Review" if the payment status is Pending OR the quantity sold is zero; otherwise return "OK".
17. Create a column named Eligible_Offer. Return "Eligible" only when the venue is Ibadan AND the category is Snacks; otherwise return "Not Eligible".

## Part E — Function choice

Choose the most suitable function for each question and explain why.

1. Add all values in a revenue column.
2. Count all transactions in a dataset.
3. Count only transactions marked Pending.
4. Count Pending transactions in Ibadan.
5. Add revenue for the Drinks category.
6. Add revenue for Drinks transactions in Ibadan.
7. Calculate average revenue for Snacks.
8. Calculate average revenue for Snacks in Ibadan.
9. Label each transaction Pass or Fail based on a score threshold.
10. Check whether both a venue and payment status meet specified conditions.

## Part F — Formula debugging

Identify the problem and write the corrected formula where possible.

1. `=SUMIF(F2:F20,"Drinks",C2:C20)` when C contains categories and F contains revenue.
2. `=SUMIFS(C2:C20,F2:F20,"Drinks")` when C contains categories and F contains revenue.
3. `=COUNTIF(E2:E20,Paid)`
4. `=IF(D2>=5000,Large,Small)`
5. `=D2*$F$1` is copied down but the result is always zero. Give at least two possible causes.
6. AVERAGEIF returns #DIV/0!. What should you check?
7. A formula shows as text instead of returning a result. Give two possible causes.

## Submission

Save your completed workbook as `Week_04_Formulas_YourName.xlsx`. Add a worksheet named `Formula_Answers` containing the business questions, formulas and results. Submit a short note explaining three findings from your calculations.
