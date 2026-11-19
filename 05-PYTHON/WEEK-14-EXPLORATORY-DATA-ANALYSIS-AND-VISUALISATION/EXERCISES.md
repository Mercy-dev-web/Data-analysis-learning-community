# Week 14 Exercises: EDA and Visualisation

Use `practice-data/naija_retail_eda.csv`. Complete the work in a Jupyter notebook. Show code and briefly explain the result. Attempt the questions before checking the answer guide.

## A. Inspect and describe
1. Load the CSV and convert `Order_Date` to datetime.
2. How many rows and columns are present?
3. What does one row represent? Name two things this dataset cannot identify.
4. Create `Revenue_NGN = Quantity * Unit_Price_NGN`, `Cost_NGN = Quantity * Unit_Cost_NGN` and `Gross_Profit_NGN = Revenue_NGN - Cost_NGN`. Calculate each total.
5. Calculate mean, median, minimum, maximum and standard deviation of order-line revenue. Which measure better describes a typical line if the distribution is skewed?

## B. Explore
6. Find order-line count and revenue by city, sorted highest to lowest.
7. Compare revenue and gross profit by product category.
8. Find revenue and order-line count by sales channel.
9. Calculate monthly revenue from January to June 2026 in chronological order.
10. Which product generated the highest revenue?

## C. Visualise
11. Create a horizontal bar chart of revenue by city.
12. Create a line chart of monthly revenue with a descriptive title and labelled axes.
13. Create a histogram of order-line revenue. Describe its shape.
14. Create a boxplot. Are any records flagged by the 1.5 × IQR rule? Inspect them; do not automatically delete them.
15. Create a scatter plot of quantity against revenue. Explain why the pattern does not prove an independent causal effect.

## D. Interpret
16. Write three insights using Observation → Evidence → Interpretation → Next question/action.
17. State two limitations of the dataset.
18. Recommend one additional field to collect and explain the business question it could answer.

## E. Knowledge check
19. Which chart is usually most suitable for a monthly trend: bar, line, pie or scatter?
20. What does the median tell you?
21. Does correlation prove causation?
22. Should every point flagged by a boxplot be removed? Why?

## Submission
Submit your notebook, exported monthly summary CSV, at least four charts (city bar, monthly line, revenue histogram, revenue boxplot), and a 250–350 word interpretation.

**Suggested time:** 2–3 hours for exercises, in addition to the lessons and assignment.
