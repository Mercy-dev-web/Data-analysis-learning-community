# Week 9 Lesson: Power BI and Power Query

## 1. Learning objectives
By the end of this week, you should be able to import a CSV, inspect it, clean common data issues in Power Query, explain Applied Steps, load the result and create basic visuals.

## 2. What is Power BI?
Power BI is a business intelligence tool used to connect to data, prepare it, analyse it and communicate findings through reports. A retail manager might ask: Which branch recorded the highest sales value? Which category contributed most? Which channel recorded the most transactions?

A report is not just colourful charts. Each visual should help answer a business question.

### Desktop vs Service
- **Power BI Desktop:** Windows application for connecting to data, transforming it, modelling it and authoring reports. Save work as a .pbix file.
- **Power BI Service:** Online service for publishing, sharing and managing reports. Some sharing features depend on licensing and organisation settings.

Use Desktop for this week's exercises. You do not need to publish anything.

## 3. Installation and platform access
On Windows, install Power BI Desktop through the Microsoft Store or Microsoft's official download route in the resources file. Create a folder named `Week-09-Power-BI`. Power BI Desktop is Windows-focused and is not natively available as a full desktop application for macOS/Linux. If you do not have Windows, use a school computer laboratory or another trusted Windows computer. A mobile app or browser access does not provide the same full Desktop authoring experience.

## 4. Explore the interface
The layout varies slightly by version:
- **Ribbon:** Commands such as Home, Insert and View.
- **Report view:** Canvas for arranging visuals.
- **Data view:** Table view of loaded data.
- **Model view:** Relationships between tables; studied in Week 10.
- **Data/Fields pane:** Available tables and columns.
- **Visualizations pane:** Select and configure charts.
- **Filters pane:** Filter a visual, page or report.
- **Power Query Editor:** Prepare data before it is loaded into the model.

## 5. Import the dataset
Use `practice-data/naija_retail_sales_raw.csv`.
1. Open Power BI Desktop.
2. Select Home → Get Data → Text/CSV.
3. Browse to the CSV and inspect the preview.
4. Select **Transform Data**, not Load.
5. Power Query Editor opens.

## 6. What is Power Query?
Power Query is a data preparation tool. It connects to data and records repeatable steps for cleaning and reshaping it. Imagine receiving a shop's sales export with inconsistent branch names, blank cells, duplicate transactions and numbers stored as text. Power Query lets you define steps once and rerun them when the source is refreshed, as long as the source structure remains compatible.

### Important areas
- Queries pane: lists queries.
- Data preview: displays rows and columns.
- Ribbon: transformation commands.
- Query Settings: query properties and **Applied Steps**.

Applied Steps is a record of transformations, for example Source, Promoted Headers, Changed Type, Trimmed Text, Replaced Values and Added Custom. Select a step to inspect the data at that point. Removing an earlier step can affect later steps.

## 7. Clean the data

### A. Set data types
Use the type icon beside a column or the Transform tab.

| Column | Type |
|---|---|
| Order_ID | Text |
| Order_Date | Date |
| Branch, Product, Category | Text |
| Quantity | Whole Number |
| Unit_Price_NGN | Decimal Number or Fixed Decimal |
| Payment_Method, Sales_Channel, Customer_Type | Text |

Order_ID is an identifier, not a quantity to add or average. Check the preview after changing types. If errors appear, inspect the source values.

### B. Trim text
Select Branch, Product, Category, Payment_Method, Sales_Channel and Customer_Type. Choose Transform → Format → Trim. This removes leading and trailing spaces. Clean can remove non-printing characters. Then inspect distinct values: Trim does not correct every spelling or capitalisation difference.

### C. Standardise labels
Values such as `Beverages`, `beverages` and ` beverages ` may be treated as separate categories. After trimming, standardise clear variants using Replace Values or another consistent transformation. Do not merge labels unless they mean the same thing.

### D. Handle nulls
A blank payment method does not mean Cash, and a missing customer type does not mean New. Inspect nulls and decide whether to keep them, label them Unknown, filter them or investigate the source. Document your choice. Never invent a value.

### E. Investigate duplicates
Inspect repeated Order_ID values. Confirm whether the entire transaction is repeated before removing it. Two different purchases can have similar details; duplicate-looking rows are not automatically duplicates. For this practice file, the repeated RT064 record is a full duplicate, so retaining one copy is appropriate.

### F. Keep useful columns
Keep all fields needed for this week's analysis: Order_ID, Order_Date, Branch, Product, Category, Quantity, Unit_Price_NGN, Payment_Method, Sales_Channel and Customer_Type.

## 8. Create a calculated column
Choose Add Column → Custom Column. Name it `Sales_Value_NGN` and enter:

```powerquery
[Quantity] * [Unit_Price_NGN]
```

Set the new column to a numeric type and check a few rows manually. For example, 3 units × ₦2,500 = ₦7,500. This is sales value, not profit: there is no cost or expense data.

## 9. Close & Apply
Select Home → Close & Apply. Power BI loads the transformed table into the model. Save as `Week09_Retail_Report.pbix`. The original CSV is not edited; the transformation steps are stored in the report.

## 10. Create basic visuals
These are introductory visuals; Week 11 covers design in depth.

1. **Card — Total sales value:** add Sales_Value_NGN and set summarisation to Sum.
2. **Bar chart — Sales by branch:** Branch as category, Sales_Value_NGN as Sum.
3. **Column chart — Sales by category:** Category as category, Sales_Value_NGN as Sum.
4. **Bar/column chart — Transactions by channel:** Sales_Channel as category, Order_ID as Count.
5. **Optional line chart — Sales over time:** Order_Date as axis, Sales_Value_NGN as Sum.

Check the aggregation. Count of sales value is not the same as total sales. If Power BI creates a date hierarchy automatically, select the actual date field or a useful date level.

## 11. Refresh
If the source CSV changes, select Refresh. Power Query reruns the saved steps. Refresh may fail if the file is moved, renamed or its columns change. Keep the source file in a stable folder.

## 12. Common mistakes
| Problem | Check |
|---|---|
| CSV imported as one column | Delimiter in import preview |
| Date treated as text | Change type to Date; inspect errors |
| Sales value shows Count | Change summarisation to Sum; check numeric type |
| Branches split into variants | Trim and standardise labels |
| Rows disappear | Review filters and Applied Steps |
| Refresh fails | Source file path and column names |
| Totals too high | Duplicates and aggregation |
| Null replaced with zero | Reconsider meaning; missing is not zero |

## 13. Completion checklist
- [ ] I imported the CSV and opened Power Query.
- [ ] I checked and corrected data types.
- [ ] I inspected text variants, nulls and repeated IDs.
- [ ] I created Sales_Value_NGN.
- [ ] I understand Applied Steps and Close & Apply.
- [ ] I created at least three visuals with correct aggregation.
- [ ] I saved and documented my .pbix file.
