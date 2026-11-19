# Week 5 Assignment — Mini-Mart Sales Performance Report

**Assessment:** Practical Excel reporting project  
**Recommended time:** 10–12 hours  
**Recommended pass target:** 70%

## Scenario

A mini-mart manager has supplied transaction records from 2–17 November 2026. The manager wants a report that summarises sales performance and makes it easy to compare venues, product categories, salespeople and payment status.

You are responsible for preparing the data, analysing it and presenting the results in Excel.

The supplied data is fictional and created for learning.

## Dataset

Use [mini_mart_sales_reporting.csv](practice-data/mini_mart_sales_reporting.csv).

## Task 1 — Prepare your workbook

Create `Week_05_Mini_Mart_Report_YourName.xlsx` with these sheets:

1. `Raw_Data` — unchanged source data.
2. `Working_Data` — working copy converted to an Excel Table named `MiniMartReport`.
3. `PivotTables` — all summary PivotTables.
4. `Dashboard` — the management report.
5. `Findings` — observations, recommendations, source and limitations.

Add a calculated column named Revenue_NGN to Working_Data using Quantity_Sold × Unit_Price_NGN. Use a formula, not manually typed results.

## Task 2 — Sort, filter and format

- Sort records by Sale_Date.
- Apply a useful multi-level sort by Venue and Category.
- Demonstrate filters for Venue, Category and Payment_Status.
- Apply conditional formatting to highlight Pending payments.
- Apply data bars or another suitable conditional format to Revenue_NGN.
- Check Transaction_ID for duplicates and document what you find.

## Task 3 — Create PivotTables

Create at least five PivotTables:

1. Total Revenue by Category.
2. Total Revenue by Venue.
3. Transaction Count by Salesperson.
4. Total Revenue by Venue and Category.
5. Transaction Count by Category and Payment_Status.

At least one additional PivotTable should show average Quantity_Sold by Category.

Use the correct summary calculation (Sum, Count or Average). Format the results and give each PivotTable a descriptive heading.

## Task 4 — Create charts

Create at least three charts from your PivotTable summaries:

- Revenue by Category.
- Revenue by Venue.
- Daily Revenue.

Choose chart types that fit the questions. Give every chart a descriptive title and readable labels.

## Task 5 — Build a dashboard

Your Dashboard sheet must include:

- A clear title and period covered.
- KPI cards for Total Revenue, Transaction Count, Average Transaction Revenue and Pending Transaction Count.
- At least three charts.
- One or two slicers if your Excel version supports them. If not, use PivotTable report filters.
- Consistent formatting and readable labels.
- Two or three short findings.

The dashboard must be understandable without someone explaining every item.

## Task 6 — Write findings and recommendations

On the Findings sheet, answer:

1. Which category generated the highest revenue?
2. Which venue generated the highest revenue?
3. Which salesperson recorded the most transactions?
4. What does the payment-status summary show?
5. What should the manager investigate or do next?

For each finding, reference the PivotTable or chart that supports it. Do not claim that revenue equals profit; the dataset does not include product cost or operating expenses.

## Required submission

Create a folder named `week-05-excel-analysis-reporting` containing:

- `Week_05_Mini_Mart_Report_YourName.xlsx`
- `README.md` with a short project overview, three findings and one limitation.
- `screenshots/` (optional) with screenshots of the completed dashboard.

## Assessment rubric

| Criteria | Marks |
|---|---:|
| Workbook structure and preservation of raw data | 10 |
| Sorting, filtering and conditional formatting | 10 |
| Correct PivotTables and summary calculations | 25 |
| Appropriate charts and labels | 15 |
| Dashboard layout, readability and usefulness | 20 |
| Findings, recommendations and limitations | 15 |
| Documentation and file organisation | 5 |
| **Total** | **100** |

**Recommended pass target:** 70%.

## Submission rules

- Do not overwrite Raw_Data.
- Use formulas for calculated revenue.
- Refresh PivotTables after changes.
- Use appropriate chart types.
- Make sure all figures are traceable to the source.
- Document assumptions and limitations.
- Be prepared to explain your dashboard and how you created the summaries.
