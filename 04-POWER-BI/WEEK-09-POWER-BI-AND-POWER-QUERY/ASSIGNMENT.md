# Week 9 Assignment: Prepare and Report Retail Sales Data

**Pass target: 70/100**

## Scenario
A small Nigerian retail business has shared a CSV export of sales transactions from different branches. The file contains inconsistencies and missing values. Prepare it in Power Query and create a simple Power BI report.

## Dataset
Use `practice-data/naija_retail_sales_raw.csv`. It is fictional learning data, not audited business accounts.

## Part A — Import and inspect (10 marks)
1. Import the CSV in Power BI Desktop.
2. Open Power Query Editor.
3. Set suitable data types.
4. Record original row count and at least four issues.

## Part B — Clean and transform (30 marks)
- Trim relevant text columns.
- Standardise inconsistent Branch and Category labels.
- Investigate missing Payment_Method and Customer_Type values; do not invent information.
- Investigate repeated Order_IDs and remove only a confirmed duplicate.
- Set Order_Date, Quantity and Unit_Price_NGN types correctly.
- Add Sales_Value_NGN = Quantity × Unit_Price_NGN.
- Keep columns needed for the analysis.

Include a screenshot of Applied Steps and explain your decisions.

## Part C — Report (30 marks)
Create one report page with:
- Card: total sales value (Sum of Sales_Value_NGN).
- Bar chart: sales value by branch.
- Column chart: sales value by category.
- Chart: transaction count by sales channel.
- Optional line chart: sales value over time.

Add a clear title and readable labels. Correctness and interpretation matter more than decoration.

## Part D — Business findings (20 marks)
Write 200–300 words answering:
1. Which branch recorded the highest sales value?
2. Which category contributed the most sales value?
3. Which channel recorded the most transactions?
4. What data-quality problem could have affected the analysis?
5. What should the manager investigate next?

Support your answers with report values. Do not claim that the highest-sales branch is the most profitable: costs and expenses are not provided.

## Part E — Documentation (10 marks)
Submit:
- Week09_Retail_Report.pbix
- Screenshot of the report page.
- Screenshot of Applied Steps.
- Short README or PDF explaining cleaning decisions and findings.

| Area | Marks |
|---|---:|
| Import and inspection | 10 |
| Cleaning and transformation | 30 |
| Report visuals | 30 |
| Findings and interpretation | 20 |
| Documentation | 10 |
| **Total** | **100** |

A colourful report with incorrect aggregation or unexplained row removal will lose marks. If below 70%, review feedback and resubmit.
