# Week 14 Practical Assignment: Explore a Nigerian Retail Dataset

## Scenario
You are a junior analyst supporting a fictional Nigerian retailer. Management wants to understand sales performance from January to June 2026. Your task is to explore patterns, communicate what the data shows and explain what it cannot tell us. You are not building a predictive model.

## Dataset
Use `practice-data/naija_retail_eda.csv`. Each row is an order line. Fields include date, city, category, channel, product, quantity, unit price and unit cost. This is fictional practice data.

## Task 1 — Prepare and understand
1. Load the CSV and convert `Order_Date` to datetime.
2. Inspect rows, shape, types, missing values and duplicates.
3. Explain the dataset grain.
4. Create `Revenue_NGN`, `Cost_NGN` and `Gross_Profit_NGN`.
5. Check for impossible or suspicious values and explain your checks.

## Task 2 — Explore
Calculate and interpret:
- total revenue, quantity and gross profit;
- mean, median, minimum, maximum and standard deviation of order-line revenue;
- revenue and gross profit by category;
- revenue by city and channel;
- monthly revenue January–June;
- revenue by product.

Do not just paste outputs. Explain the important numbers.

## Task 3 — Create at least five visuals
1. Monthly revenue line chart.
2. Revenue by city horizontal bar chart.
3. Revenue by category bar chart.
4. Order-line revenue histogram or boxplot (preferably both).
5. Quantity versus revenue scatter plot, with a note about its limitations.

Every chart needs a clear title, labelled axes and units. Avoid 3D charts and unnecessary decoration.

## Task 4 — Management summary
Write **250–350 words** including at least three evidence-based insights, figures supporting each, two recommendations or follow-up questions, and at least two dataset limitations.

Do not claim a channel caused higher sales. Do not call revenue profit. Gross profit here is revenue minus supplied product cost only; operating expenses are not included.

## Task 5 — Reproducibility
Export a monthly summary CSV containing at least `Month`, `Revenue_NGN` and `Order_Lines`. Save a notebook that runs from top to bottom. Use relative file paths where practical.

## Submission checklist
- [ ] Jupyter notebook (`.ipynb`) with code, charts and explanations.
- [ ] Monthly summary CSV.
- [ ] Five or more labelled charts.
- [ ] 250–350 word management summary.
- [ ] Data-quality checks and documented decisions.
- [ ] Limitations stated honestly.

## Assessment rubric (100 marks)

| Area | Marks |
|---|---:|
| Loading, preparation and data-quality checks | 15 |
| Correct calculations and descriptive statistics | 20 |
| Appropriate charts and formatting | 25 |
| Interpretation and evidence-based insights | 20 |
| Recommendations and limitations | 10 |
| Reproducibility and organisation | 10 |
| **Total** | **100** |

**Recommended pass mark: 70%.** Accuracy and honest interpretation matter more than decoration.

## Recommended effort (8–12 hours)
- 2 hours: lessons and videos.
- 2 hours: exercises.
- 3–5 hours: assignment and charts.
- 1–2 hours: interpretation, checking and documentation.
