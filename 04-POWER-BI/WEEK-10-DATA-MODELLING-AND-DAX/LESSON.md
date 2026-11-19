# Week 10 Lesson: Data Modelling and DAX

## 1. Why data modelling matters
Imagine a retailer has three files:
- Sales: each purchase record.
- Products: product name and category.
- Customers: customer name and city.

If you import all three files, Power BI needs to know how they connect. A data model defines those connections. A good model helps visuals calculate correctly and makes reports easier to use.

Without a sensible model, you may see duplicated totals, confusing filters, ambiguous relationships or incorrect calculations.

## 2. Understand the grain of a table
**Grain** means what one row represents.

For this week's dataset:
- Sales: one row represents one product line in one transaction.
- Products: one row represents one unique product.
- Customers: one row represents one unique customer.

Before modelling any dataset, ask: “What does one row mean?” If you cannot answer this, pause before creating relationships or measures.

## 3. Fact tables and dimension tables

### Fact table
A fact table stores events or transactions that you want to analyse. It usually contains:
- Keys that connect to descriptive tables.
- Numeric values such as quantity and sales amount.
- Dates or transaction identifiers.

Our Sales table is the fact table.

### Dimension table
A dimension table describes the people, products, places or dates related to those events. It provides the labels used to group and filter the facts.

Our Products, Customers and Date tables are dimensions.

| Table | Role | Example fields |
|---|---|---|
| Sales | Fact | Sale_ID, Sale_Date, Product_ID, Customer_ID, Quantity, Unit_Price_NGN |
| Products | Dimension | Product_ID, Product_Name, Category |
| Customers | Dimension | Customer_ID, Customer_Name, City, Customer_Segment |
| Date | Dimension | Date, Year, Month, Month_Number |

## 4. What is a key?
A **primary key** uniquely identifies a row in a table. Product_ID identifies one product in Products. It must be unique there.

A **foreign key** is a column in another table that refers to the primary key. Product_ID in Sales points to Product_ID in Products. It can repeat because the same product can be sold many times.

Example:

Products:
| Product_ID | Product_Name |
|---|---|
| P01 | Rice 5kg |
| P02 | Vegetable Oil 1L |

Sales:
| Sale_ID | Product_ID | Quantity |
|---|---|---:|
| S001 | P01 | 2 |
| S002 | P01 | 1 |
| S003 | P02 | 3 |

P01 appears more than once in Sales but only once in Products. That is expected.

## 5. Star schema
A star schema places a central fact table in the middle, connected directly to dimension tables.

<pre>
             Customers
                 |
Products ———— Sales ———— Date
                 |
             (Measures)
</pre>

In a typical star schema:
- Dimension tables sit on the “one” side.
- The fact table sits on the “many” side.
- Dimensions filter and group facts.
- Facts provide values to summarise.

This is a common, beginner-friendly model design. It is not necessary to merge every table into one giant table.

## 6. Import the practice files
Use Get Data → Text/CSV to import:
- `sales.csv`
- `products.csv`
- `customers.csv`

For each file, inspect column types in Power Query before loading:
- IDs: Text.
- Sale_Date and Signup_Date: Date.
- Quantity: Whole Number.
- Unit_Price_NGN: Decimal Number or Fixed Decimal.
- Descriptive fields: Text.

The practice dataset is fictional and deliberately small so you can inspect it.

## 7. Create relationships in Model view
After loading the three files:
1. Select Model view.
2. Drag Products[Product_ID] to Sales[Product_ID].
3. Drag Customers[Customer_ID] to Sales[Customer_ID].
4. Confirm each relationship is **one-to-many (1:*)**.
5. Set cross-filter direction to **Single** for these simple relationships.
6. Ensure the dimension is on the “1” side and Sales is on the “*” side.
7. Confirm the relationships are active.

Expected relationships:
- Products[Product_ID] (1) → Sales[Product_ID] (*)
- Customers[Customer_ID] (1) → Sales[Customer_ID] (*)

### What does cardinality mean?
Cardinality describes how many rows can match across the two tables.

- **One-to-many (1:*):** one product can appear in many sales rows.
- **Many-to-one (*:1):** the same relationship viewed from the fact table.
- **One-to-one (1:1):** each key appears once on both sides.
- **Many-to-many (*:*):** keys repeat on both sides. This can create ambiguous or unexpected filtering; do not choose it simply to make a warning disappear.

### What is filter direction?
Filter direction controls how filters travel through a relationship. In this simple star schema, a filter from Products or Customers should flow to Sales. Single direction is a clear default for this model. Avoid switching everything to Both without understanding the consequences.

### Relationship checks
- The dimension key must be unique.
- The related columns must have compatible data types.
- The key values should match.
- Blank or unmatched keys can affect results.
- A relationship does not repair incorrect source data.

## 8. Create a Date table
A dedicated date table makes date-based analysis more consistent. In Power BI Desktop, choose Modeling → New table and enter:

```dax
Date =
CALENDAR (
    MIN ( Sales[Sale_Date] ),
    MAX ( Sales[Sale_Date] )
)
```

Add columns:

```dax
Year = YEAR ( 'Date'[Date] )
Month = FORMAT ( 'Date'[Date], "MMMM" )
Month_Number = MONTH ( 'Date'[Date] )
Year_Month = FORMAT ( 'Date'[Date], "YYYY-MM" )
```

Select the Date table, then use Table tools → Mark as date table and select Date[Date] if the option is available in your version. Sort Month by Month_Number: select Month, then Column tools → Sort by column → Month_Number.

Create the relationship:
- Date[Date] (1) → Sales[Sale_Date] (*)

Use Date[Date] for date filtering in report visuals. A dedicated date table is useful even when the source already contains a date column.

## 9. What is DAX?
DAX means Data Analysis Expressions. It is the formula language used in Power BI to create calculations in the model.

DAX looks somewhat like Excel formulas, but it works with tables, columns, relationships and filter context. Do not assume every Excel formula behaves exactly the same way in DAX.

## 10. Calculated columns vs measures

### Calculated column
A calculated column produces a value for every row. It is calculated during data refresh and stored in the model.

Example: create a Sales column in Sales:

```dax
Sales_Value_NGN =
Sales[Quantity] * Sales[Unit_Price_NGN]
```

Each sales row gets its own sales value. A calculated column can be used in categories, slicers and row-level calculations.

### Measure
A measure calculates a result when a visual requests it. It responds to filters and selections in the report.

Example:

```dax
Total Sales =
SUM ( Sales[Sales_Value_NGN] )
```

If a user filters the report to Ikeja customers or one product category, the measure recalculates for the selected data.

**Remember:** A calculated column adds a value to each row. A measure returns an aggregated result for the current filter context. For totals and KPIs, measures are usually the right choice.

## 11. Your first DAX measures

Create each measure by selecting the Sales table and choosing Modeling → New measure.

### Total Sales
```dax
Total Sales =
SUM ( Sales[Sales_Value_NGN] )
```
Adds all sales values in the current filter context.

### Total Units
```dax
Total Units =
SUM ( Sales[Quantity] )
```
Adds quantities sold.

### Number of Sales Rows
```dax
Number of Sales Rows =
COUNTROWS ( Sales )
```
Counts rows in the Sales table. Since this dataset has one row per product line, this is a count of sales lines, not necessarily unique receipts in a dataset where receipts can contain multiple products.

### Unique Customers
```dax
Unique Customers =
DISTINCTCOUNT ( Sales[Customer_ID] )
```
Counts different customer IDs appearing in the current Sales rows.

### Average Sales Value per Line
```dax
Average Sales per Line =
AVERAGE ( Sales[Sales_Value_NGN] )
```
Returns the average sales value of a sales row. It is not average customer spend.

### Average Selling Price
```dax
Average Unit Price =
AVERAGE ( Sales[Unit_Price_NGN] )
```
Returns the average unit price across sales rows. It is not weighted by quantity.

### Sales per Unit (weighted)
```dax
Sales per Unit =
DIVIDE ( [Total Sales], [Total Units] )
```
Divides total sales value by total units. DIVIDE safely handles a zero denominator by returning blank unless an alternate result is supplied.

## 12. Understand CALCULATE
CALCULATE evaluates an expression under a modified filter context. It is one of the most important DAX functions.

Example: calculate sales only for the Groceries category:

```dax
Grocery Sales =
CALCULATE (
    [Total Sales],
    Products[Category] = "Groceries"
)
```

The measure starts with Total Sales, then applies a category filter. Because Products is related to Sales, the filter can flow to the fact table.

Another example:

```dax
Online Sales =
CALCULATE (
    [Total Sales],
    Sales[Sales_Channel] = "Online"
)
```

Do not memorise CALCULATE as “just a filter function”. Its broader role is to evaluate an expression after changing filter context. More advanced uses will come later.

## 13. Use measures in visuals
Create:
- Card: Total Sales.
- Card: Total Units.
- Card: Unique Customers.
- Bar chart: Total Sales by Products[Category].
- Column chart: Total Sales by Customers[City].
- Table: Product_Name, Total Units and Total Sales.
- Slicer: Date[Year_Month] or Products[Category].

Test the model: select one category and confirm the cards and charts update. If dimension filters do not affect Sales, inspect the relationship.

## 14. Common DAX and modelling errors
| Problem | Likely cause / check |
|---|---|
| Relationship will not create | Duplicate dimension key or mismatched data types |
| Duplicate values on “one” side | Dimension key is not unique |
| Visual does not respond to a slicer | Missing/inactive relationship or wrong field |
| Total is unexpectedly repeated | Wrong relationship or duplicated source rows |
| DAX says column cannot be found | Check table/column spelling |
| Formula uses a measure where a column is expected | Understand row context vs measure evaluation |
| Average seems strange | Decide whether you need average row value or weighted average |
| Month names sort alphabetically | Sort Month by Month_Number |
| Many-to-many appears | Check grain and keys before accepting it |

## 15. Week 10 checklist
- [ ] I can explain table grain, fact and dimension tables.
- [ ] I can identify primary and foreign keys.
- [ ] I built two one-to-many relationships.
- [ ] I understand single-direction filtering.
- [ ] I created and connected a Date table.
- [ ] I can explain a calculated column vs a measure.
- [ ] I created at least six working measures.
- [ ] I tested whether filters change measure results.
- [ ] I saved my .pbix file and documented my model.
