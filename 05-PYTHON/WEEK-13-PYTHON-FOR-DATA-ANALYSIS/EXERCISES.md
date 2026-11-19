# Week 13 Exercises

Use the supplied `naija_shop_orders_raw.csv` dataset unless a question gives its own example. Run each command and inspect the output. Attempt the questions before opening the answer guide.

## Part A — Libraries and DataFrames

1. Import pandas using the alias `pd` and NumPy using the alias `np`.
2. Create a DataFrame from a dictionary with three products, their quantities and unit prices.
3. Load `naija_shop_orders_raw.csv` into a DataFrame called `df`.
4. Display the first five rows and last three rows.
5. Find the number of rows and columns. What does each number represent?
6. Display the column names and data types.
7. Use `describe()` to summarise the numeric columns.

## Part B — Selecting and filtering

8. Select only Product, City and Quantity.
9. Filter the rows where City is Lagos.
10. Filter rows where Quantity is at least 3.
11. Filter rows where City is Lagos AND Channel is Online.
12. Filter rows where City is Ibadan OR City is Abuja.
13. Sort the dataset by Unit_Price_NGN from highest to lowest.
14. Count the number of records for each Payment_Method.

## Part C — Data quality and cleaning

15. Count missing values in every column.
16. Count exact duplicate rows.
17. Display the duplicate rows before removing them.
18. Remove exact duplicate rows and save the result as `clean_df`.
19. Standardise the City column by removing surrounding spaces and applying consistent capitalisation. Do not invent missing cities.
20. Convert Order_Date to a datetime type.
21. Check the data types of Quantity and Unit_Price_NGN. Convert them to numeric values if necessary.
22. Explain why replacing every missing City with "Lagos" would be an irresponsible cleaning decision.

## Part D — Calculations and summaries

23. Create a Revenue_NGN column using Quantity multiplied by Unit_Price_NGN.
24. Calculate total revenue, total quantity and average revenue per order row.
25. Find the highest and lowest order-row revenue.
26. Calculate total revenue by City and sort from highest to lowest.
27. Calculate total quantity by Category.
28. Group by Channel and calculate total revenue, total units and number of order rows.
29. Explain the difference between `count()`, `size()` and `nunique()`.

## Part E — NumPy basics

30. Create a NumPy array containing daily sales: 12000, 15000, 9000, 18000.
31. Calculate the sum, mean, minimum and maximum.
32. Multiply every array value by 0.9 to represent a 10% reduction. Explain why the original array is not automatically changed by this expression.
33. Create a 2-by-3 NumPy array and inspect its `ndim`, `shape` and `size`.

## Part F — Export and explain

34. Export your cleaned dataset to a new CSV file without the DataFrame index.
35. Write five sentences explaining what you checked and changed in the dataset.
36. Identify one limitation of the dataset that affects the conclusions you can make.

## Mini challenge

Answer this business question using pandas:

**Which city and sales channel generated the highest total revenue in the cleaned dataset?**

Show the code you used, the resulting grouped table and a short explanation. Do not guess the answer from a chart or from the first few rows.
