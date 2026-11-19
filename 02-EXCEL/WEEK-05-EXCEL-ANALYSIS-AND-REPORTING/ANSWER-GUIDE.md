# Week 5 — Answer Guide

Attempt the exercises and assignment before reading this guide. Equivalent correct PivotTable layouts and chart choices are acceptable.

## Before you start: create Revenue_NGN

The source columns are:

A Transaction_ID, B Sale_Date, C Venue, D Category, E Product, F Salesperson, G Quantity_Sold, H Unit_Price_NGN, I Payment_Method, J Payment_Status.

Add Revenue_NGN in K. In K2 enter:

`=G2*H2`

Copy the formula down. If you convert the source to an Excel Table, a structured formula such as `=[@Quantity_Sold]*[@Unit_Price_NGN]` may be used.

## Part A — Sorting and filtering

1. Sort Sale_Date oldest to newest.
2. Use a multi-level sort with Venue first and Category second.
3. Filter Venue to Ibadan.
4. Filter Payment_Status to Pending.
5. Use a Number Filter on Quantity_Sold greater than 10.
6. Filter Category to Snacks and Venue to Oyo.
7. Use a date filter from 8 November through 14 November 2026.
8. Sorting only Product separates product names from the other fields in their records. Always sort the complete table/range.

## Part B — Conditional formatting

1. Select Revenue_NGN and use Highlight Cells Rules → Greater Than → 10000.
2. Select Payment_Status and use Text that Contains → Pending.
3. Select Revenue_NGN and choose Data Bars.
4. Select Quantity_Sold and choose a Colour Scale.
5. Select Transaction_ID and choose Duplicate Values.
6. Example: highlighting unusually high transaction amounts may reveal a value that needs checking.
7. Repeated identifiers could be an error, but could also be valid depending on the identifier design. Investigate before deleting.

## Part C — PivotTable field layouts

Use these model layouts:

| Question | Rows | Columns | Values |
|---|---|---|---|
| Revenue by Category | Category | — | Sum of Revenue_NGN |
| Revenue by Venue | Venue | — | Sum of Revenue_NGN |
| Transactions by Salesperson | Salesperson | — | Count of Transaction_ID |
| Average quantity by Category | Category | — | Average of Quantity_Sold |
| Revenue by Venue and Category | Venue | Category | Sum of Revenue_NGN |
| Payment status by Category | Category | Payment_Status | Count of Transaction_ID |
| Revenue by Payment Method | Payment_Method | — | Sum of Revenue_NGN |
| Revenue by Product | Product | — | Sum of Revenue_NGN |
| Revenue by Date | Sale_Date | — | Sum of Revenue_NGN |

To filter to Ibadan, add Venue to Filters and select Ibadan, or use the row filter.

## Part D — Chart choices

1. Revenue by Category: clustered column or bar chart; compare a small number of categories.
2. Revenue by Venue: bar or column chart; compare venue totals.
3. Daily Revenue: line chart; dates are sequential and the question is about change over time.
4. Payment status by Category: clustered column chart or a 100% stacked column chart if comparing proportions. Clearly label the series.

A pie chart is not required. Use one only when showing a small number of parts of a meaningful whole.

## Part E — Interpretation

Use your own PivotTable results. Do not copy an answer from another learner because your source may be sorted or filtered differently. Your written response should:
- identify the highest category and venue based on Sum of Revenue_NGN,
- identify the salesperson with the highest Count of Transaction_ID,
- compare Paid and Pending counts,
- state that the dataset covers only 2–17 November 2026,
- state that product costs and expenses are not included, so profit cannot be calculated.

## Dashboard model

Suggested layout:

- Top: report title and date range.
- KPI row: Total Revenue, Transaction Count, Average Transaction Revenue, Pending Transaction Count.
- Middle: Revenue by Category and Revenue by Venue.
- Lower section: Daily Revenue and payment-status summary.
- Side/top filter area: Venue and Category slicers or PivotTable filters.
- Bottom: two or three concise findings and one limitation.

KPI formulas may use:
- Total Revenue: `=SUM(Working_Data[Revenue_NGN])`
- Transaction Count: `=COUNTA(Working_Data[Transaction_ID])`
- Average Transaction Revenue: `=AVERAGE(Working_Data[Revenue_NGN])`
- Pending Transaction Count: `=COUNTIF(Working_Data[Payment_Status],"Pending")`

If your Table name differs, use its actual name. Alternatively, use suitable cell ranges.

## Findings and recommendations: model writing

Use this structure rather than making unsupported claims:

- **Finding:** State what the PivotTable or chart shows.
- **Evidence:** Include the value, category and date scope.
- **Implication:** Explain why it may matter to the manager.
- **Recommendation:** Suggest a next step that can be tested.

Example: "The category with the highest recorded revenue in this sample was [category]. The manager could review stock availability and compare product margins before changing purchasing quantities."

Do not claim that a category is most profitable. Revenue is not profit.

## Final quality check

- Is Raw_Data unchanged?
- Is Revenue_NGN calculated using a formula?
- Are all PivotTables using the correct field and calculation?
- Have PivotTables been refreshed?
- Do charts match the PivotTable values?
- Are dashboard labels readable?
- Are findings supported by the report?
- Are the date range and data limitations stated?
