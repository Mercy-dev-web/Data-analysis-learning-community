# Week 10 Practice Exercises

Use the three CSV files in `practice-data`. Import all three into Power BI Desktop.

## Part A — Understand the tables
1. State the grain of Sales, Products and Customers.
2. Identify the primary key in Products and Customers.
3. Identify the foreign keys in Sales.
4. Explain why Product_ID repeats in Sales but must be unique in Products.
5. Classify each table as fact or dimension.

## Part B — Build the model
1. Create Products → Sales using Product_ID.
2. Create Customers → Sales using Customer_ID.
3. Set both to one-to-many, single direction and active.
4. Explain why the dimension table is on the “one” side.
5. Create a Date table and connect it to Sales[Sale_Date].
6. Take a screenshot of Model view.

## Part C — Create a calculated column
Create:

```dax
Sales_Value_NGN =
Sales[Quantity] * Sales[Unit_Price_NGN]
```

Manually verify three rows. Explain why this is a calculated column rather than a measure.

## Part D — Create measures
Create:
1. Total Sales = SUM of Sales_Value_NGN.
2. Total Units = SUM of Quantity.
3. Number of Sales Rows = COUNTROWS of Sales.
4. Unique Customers = DISTINCTCOUNT of Customer_ID.
5. Average Sales per Line = AVERAGE of Sales_Value_NGN.
6. Average Unit Price = AVERAGE of Unit_Price_NGN.
7. Sales per Unit = DIVIDE(Total Sales, Total Units).

## Part E — CALCULATE
Create measures for:
1. Grocery Sales (Products[Category] = "Groceries").
2. Online Sales (Sales[Sales_Channel] = "Online").
3. Ikeja Sales (Customers[City] = "Ikeja").

Explain how each filter affects the result.

## Part F — Test the model
Create a card for Total Sales and a bar chart for Total Sales by Category. Add a City slicer. Select Ibadan, then Ikeja. Record how the card changes. If it does not change, troubleshoot your relationships.

## Reflection questions
1. What is the difference between a fact table and a dimension table?
2. Why is a star schema useful?
3. What does one-to-many mean?
4. What does filter direction control?
5. Why should you not automatically use Both directions?
6. What is the difference between a calculated column and a measure?
7. What does CALCULATE do?
8. Why is Sales_Value_NGN not profit?
