# Week 5 — Excel Analysis and Reporting

**Estimated study time:** 10–12 hours  
**Level:** Beginner to early intermediate  
**Main tool:** Microsoft Excel

## 1. Learning objectives

By the end of this week, you should be able to:

1. Sort and filter a dataset without separating records from their correct fields.
2. Apply conditional formatting to highlight values, patterns and exceptions.
3. Explain what a PivotTable does and when to use one.
4. Build PivotTables using Rows, Columns, Values and Filters.
5. Change a PivotTable's summary calculation from Sum to Count or Average.
6. Group and compare categories or dates where the data supports it.
7. Create suitable charts from summaries.
8. Build a simple, readable dashboard.
9. Write evidence-based findings and recommendations.
10. Check that a report is accurate, refreshed and understandable.

## 2. From formulas to analysis and reporting

In Week 4, you learned how to calculate totals, averages and conditional results with formulas. In this week, you will use those skills to explore a dataset and communicate what it reveals.

Imagine a mini-mart has 48 sales transactions. The manager wants to know:
- Which product category generated the most revenue?
- Which venue recorded the highest sales?
- Which salesperson handled the most transactions?
- How do sales compare across dates?
- How many payments are still pending?

You could answer some questions with formulas, but building each summary separately can take time. PivotTables allow you to rearrange and summarise data quickly without writing a formula for every category.

A good analyst does not create charts just because Excel can create them. Start with the business question, calculate the answer, choose a suitable visual, then explain what it means.

## 3. Sorting data

Sorting arranges records in a chosen order.

Common sort types:
- **A to Z:** alphabetical order for text.
- **Z to A:** reverse alphabetical order.
- **Smallest to Largest:** numeric ascending order.
- **Largest to Smallest:** numeric descending order.
- **Oldest to Newest:** chronological order.
- **Newest to Oldest:** reverse chronological order.
- **Custom sort:** prioritise more than one field.

### Example

Suppose your table contains Sale_Date, Product, Venue and Revenue_NGN.

You can sort Revenue_NGN from largest to smallest to identify the highest-value transactions.

### Sort by multiple columns

Suppose you want to organise records first by Venue, then by Category, and finally by Sale_Date.

1. Click a cell inside the dataset.
2. Open the Data tab and choose Sort.
3. Choose Venue as the first sort level.
4. Add a level and choose Category.
5. Add another level and choose Sale_Date.
6. Choose the order for each field.
7. Select OK.

Excel applies the levels in sequence.

### Important sorting safety

- Select a cell within the dataset and use the Sort command.
- If Excel asks whether to expand the selection, choose to expand it so entire records move together.
- Never sort only one column of a dataset when the other columns belong to the same records.
- Check for blank rows and inconsistent values before sorting.
- Preserve an untouched copy of the source data.

## 4. Filtering data

Filtering temporarily displays only records that meet selected conditions. It does not delete the other records.

### Turn on filters

1. Click inside your data range or Excel Table.
2. Go to Data.
3. Select Filter.
4. Dropdown arrows appear beside the column headings.
5. Open a dropdown and choose the values or conditions you want to display.

### Types of filters

**Text filters:** equals, does not equal, begins with, contains.

Example: show only records where Category equals Drinks.

**Number filters:** greater than, less than, between, top 10.

Example: show transactions with Quantity_Sold greater than 10.

**Date filters:** before, after, between, this month, last week and other date groupings (options depend on the Excel version and date data).

Example: show sales from 10 November to 15 November.

**Multiple filters:** you can filter more than one column at the same time.

Example: show only Ibadan transactions in the Snacks category with Payment_Status equal to Paid.

### Clear filters

Use the column dropdown to clear a specific filter, or use Data → Clear to clear filters across the range. Always check whether a filter is active before interpreting a visible subtotal.

## 5. Conditional formatting

Conditional formatting changes how cells look when they meet a rule. It helps you notice patterns without reading every value individually.

Examples:
- Highlight revenue greater than ₦10,000.
- Mark Pending payments.
- Identify duplicate transaction IDs.
- Use data bars to compare sales amounts.
- Use colour scales to show low and high values.

### Apply a rule to highlight values

1. Select the cells you want to format, for example Revenue_NGN.
2. Open Home → Conditional Formatting.
3. Choose Highlight Cells Rules.
4. Select Greater Than.
5. Enter 10000.
6. Choose a format.
7. Select OK.

Excel highlights the cells that meet the condition.

### Highlight text such as Pending

1. Select the Payment_Status values.
2. Choose Home → Conditional Formatting → Highlight Cells Rules → Text that Contains.
3. Enter Pending.
4. Select a format and confirm.

### Use data bars

1. Select a numeric range such as Revenue_NGN.
2. Choose Conditional Formatting → Data Bars.
3. Select a style.

Longer bars represent larger values. Data bars are useful for quick comparisons, but they do not replace a clear chart or a numeric label.

### Colour scales

Colour scales apply different colours according to relative values in the selected range. They can help reveal high and low values. Explain what the scale represents; colour alone is not a complete analysis.

### Duplicate values

Select a field such as Transaction_ID and choose Conditional Formatting → Highlight Cells Rules → Duplicate Values. This can help detect repeated identifiers.

Do not automatically delete duplicates. First determine whether the repeated record is genuinely an error or a valid repeated event.

### Conditional formatting best practices

- Apply rules to the correct range.
- Use a small number of meaningful formats.
- Do not use colour as the only way to communicate important information.
- Check that the rule still covers new rows when the dataset grows.
- A highlighted value is a signal to investigate, not proof of a problem.

## 6. What is a PivotTable?

A PivotTable is an Excel feature that summarises a larger dataset into a compact report. It allows you to group records and calculate totals, counts, averages and other summaries.

For example, 48 transaction rows can become a summary of total revenue by product category.

A PivotTable does not normally change or delete the source records. It creates a separate summary that can be rearranged.

### Before creating a PivotTable

Your source data should:
- have one clear heading per column,
- have no completely blank rows or columns inside the dataset,
- contain one record per row,
- use consistent data types,
- avoid merged cells in the source,
- have meaningful column names.

Convert your source range to an Excel Table with Ctrl+T (Windows) or the relevant Insert Table command. Confirm that the table has headers. Give the table a meaningful name, such as `MiniMartSales`.

Using a Table helps the source range expand when new records are added. You may still need to refresh the PivotTable.

## 7. Create your first PivotTable

1. Click a cell inside the Excel Table.
2. Select Insert → PivotTable.
3. Confirm the Table/Range is correct.
4. Choose New Worksheet.
5. Select OK.
6. Excel creates a blank PivotTable and displays the PivotTable Fields list.
7. Drag fields into the four areas described below.

The exact ribbon labels may differ slightly between desktop, Mac and web versions.

## 8. Understand the four PivotTable areas

<AsyncImage query="Microsoft Excel PivotTable Fields Rows Columns Values Filters pane screenshot" aspectRatio="16:9" width="100%"/>

### Rows

Fields placed in Rows appear down the left side of the PivotTable.

Example: put Category in Rows to list Bakery, Drinks and Snacks.

### Columns

Fields placed in Columns create headings across the top.

Example: put Payment_Status in Columns to compare Paid and Pending for each category.

### Values

Fields placed in Values are summarised.

Examples:
- Sum of Revenue_NGN.
- Count of Transaction_ID.
- Average of Quantity_Sold.

### Filters

Fields placed in Filters allow you to filter the entire PivotTable.

Example: put Venue in Filters to view a selected venue.

### First PivotTable: revenue by category

1. Drag Category to Rows.
2. Drag Revenue_NGN to Values.
3. Check that the calculation says Sum of Revenue_NGN.
4. Format the result as currency or number with thousands separators.
5. Rename the value heading to Total Revenue (NGN), if appropriate.

The resulting summary answers: how much revenue did each category generate?

### Second PivotTable: transaction count by venue

1. Drag Venue to Rows.
2. Drag Transaction_ID to Values.
3. Open Value Field Settings.
4. Select Count.
5. Confirm.

This answers: how many transactions were recorded at each venue?

### Third PivotTable: category by payment status

1. Drag Category to Rows.
2. Drag Payment_Status to Columns.
3. Drag Transaction_ID to Values.
4. Ensure the Values calculation is Count.

This creates a cross-tabulation showing the number of Paid and Pending transactions in each category.

## 9. Change the summary calculation

Excel may default to Sum for numeric fields and Count for text fields. Always check the calculation.

1. In the Values area, open the dropdown beside the field.
2. Choose Value Field Settings.
3. Select Sum, Count, Average, Max, Min or another suitable option.
4. Confirm.

**Important:** Counting a numeric field may ignore blanks. Counting a populated transaction identifier is often a better way to count records.

### Sum versus Count versus Average

- Sum: total of the numeric values.
- Count: number of non-empty values counted by the selected field.
- Average: arithmetic mean of numeric values.

Do not report a count as a sales total or an average as total revenue.

## 10. Format and improve PivotTables

Useful improvements:
- Choose a clear PivotTable style.
- Use Tabular Form where it makes multiple row fields easier to read.
- Format revenue as currency or a number with thousands separators.
- Rename generic labels such as Sum of Revenue_NGN to Total Revenue (NGN).
- Show or hide subtotals where appropriate.
- Keep grand totals when they help the reader.
- Adjust column widths and avoid clipped headings.

Avoid excessive colours and decorative formatting. The purpose is to make comparisons easier.

## 11. Refresh a PivotTable

A PivotTable is based on its source data at the time it was created or last refreshed.

If you change the source:
1. Click inside the PivotTable.
2. Choose PivotTable Analyze → Refresh, or right-click and choose Refresh.
3. Check that the summary reflects the latest records.

If you add rows outside the original source range, the PivotTable may not include them. Excel Tables help reduce this problem because the Table can expand, but refresh the PivotTable and verify the source.

## 12. Group dates

If Sale_Date is stored as real Excel dates, you may group dates in a PivotTable by month, quarter or year.

1. Place Sale_Date in Rows.
2. Right-click one of the dates in the PivotTable.
3. Choose Group.
4. Select the required time units, such as Months and Years.
5. Confirm.

If Group is unavailable, check that the source column contains valid dates rather than text, and check for blank or invalid date entries. Grouping options can vary across Excel versions.

A short dataset covering only a few days may not support meaningful monthly or yearly analysis. Do not create a time-period claim from too little data.

## 13. Charts: turn summaries into visuals

A chart helps readers compare values, identify patterns or understand composition.

Choose the chart based on the question.

### Column or bar chart

Best for comparing categories or locations.

Example: total revenue by product category.

- Column charts are useful when category names are short.
- Bar charts work well when category names are long or there are many categories.

### Line chart

Best for showing a measure over time when dates are ordered.

Example: daily revenue across the sales period.

Do not use a line chart to connect unrelated categories.

### Pie or doughnut chart

Can show parts of a whole when there are only a few categories and the values represent a meaningful total.

Avoid using many slices or comparing many similar-sized values. A bar chart is often clearer.

### Combo chart

Can show two related measures with different scales, such as revenue and transaction count over time. Use carefully and label both axes.

### Create a chart

1. Select the summary table or PivotTable.
2. Choose Insert → Charts or PivotChart.
3. Select a suitable chart type.
4. Add a meaningful title.
5. Label axes when needed.
6. Format values clearly.
7. Remove unnecessary decoration.

A chart title should describe the information, for example: **Total Revenue by Product Category (NGN)**, not simply "Chart 1".

## 14. PivotCharts and slicers

A PivotChart is linked to a PivotTable and changes when the PivotTable is filtered or rearranged.

To create one:
1. Select a cell in the PivotTable.
2. Choose Insert → PivotChart.
3. Select a chart type.
4. Confirm.

A slicer is a clickable visual filter for a PivotTable or PivotChart.

To add a slicer:
1. Select the PivotTable.
2. Choose PivotTable Analyze → Insert Slicer.
3. Select a field, such as Venue or Category.
4. Confirm.
5. Click slicer buttons to filter the report.

Slicer availability and interface details vary by Excel version. If your version does not support the feature, use the PivotTable's built-in filters.

## 15. Build a simple dashboard

A dashboard is a single view that helps someone understand the most important information quickly.

For this assignment, your dashboard should include:

### A. Clear title

Example: **Mini-Mart Sales Performance Report**

Include the period covered and note that the dataset is a practice dataset.

### B. Key performance indicators (KPIs)

Show a few important metrics, such as:
- Total Revenue (NGN).
- Number of Transactions.
- Average Transaction Revenue.
- Pending Transaction Count.

A KPI should have a clear label and a correctly calculated value.

### C. Charts

Use two or three charts that answer different questions:
- Revenue by Category.
- Revenue by Venue.
- Daily Revenue.

Do not repeat the same information in multiple charts.

### D. Filters

If your Excel version supports slicers, add one or two meaningful filters such as Venue and Category. Otherwise use report filters in the PivotTables.

### E. Findings

Add two or three short observations supported by the summaries. Explain the period and scope.

### Dashboard design principles

- Put the most important information near the top.
- Use consistent number formats.
- Keep chart titles specific.
- Avoid unnecessary 3D charts.
- Do not overload the page with too many colours or charts.
- Use readable font sizes.
- Align objects and leave enough whitespace.
- Make sure filters and charts work together as intended.
- Do not crop or hide important labels.

## 16. From results to findings and recommendations

A **result** is a calculated value. A **finding** explains what the result shows. A **recommendation** suggests an action based on the finding.

Example:
- Result: Snacks generated the highest revenue in the supplied period.
- Finding: Snacks contributed more revenue than the other two categories in this dataset.
- Recommendation: The manager could review stock availability for the leading snack products and compare their margins before increasing orders.

Do not assume the highest revenue category is also the most profitable. Profit requires cost data.

A good finding should:
1. Be supported by a calculation or chart.
2. State the scope and period.
3. Avoid claims the data cannot support.
4. Be written in plain language.

## 17. Common mistakes

1. Sorting only one column and breaking the relationship between fields.
2. Creating a PivotTable from data with blank headings.
3. Using Count when the business question requires Sum.
4. Forgetting to refresh a PivotTable after source data changes.
5. Using a chart type that does not fit the question.
6. Treating a high revenue value as high profit without cost information.
7. Creating too many charts and making the dashboard difficult to read.
8. Leaving generic titles such as "Sum of Revenue".
9. Reporting a filtered result as though it represented the entire dataset.
10. Removing duplicates without checking whether they are genuine duplicates.

## 18. Week 5 completion checklist

- [ ] I can sort by one or more fields safely.
- [ ] I can filter text, number and date fields.
- [ ] I can apply conditional formatting rules.
- [ ] I can explain what a PivotTable does.
- [ ] I can create PivotTables from an Excel Table.
- [ ] I understand Rows, Columns, Values and Filters.
- [ ] I can use Sum, Count and Average in a PivotTable.
- [ ] I can refresh a PivotTable.
- [ ] I can create and format suitable charts.
- [ ] I can create a simple dashboard.
- [ ] I can write findings supported by evidence.
- [ ] I have completed and documented the assignment.

**Next:** The programme moves to SQL foundations. Before leaving Excel, keep your workbook as a portfolio project and make sure you can explain how each summary was created.
