# Week 10 Answer Guide

Try the exercises first. The goal is to understand the reasoning, not simply copy formulas.

## 1. Table roles and grain
- Sales: fact table; one row per product line in a sale.
- Products: dimension table; one row per product.
- Customers: dimension table; one row per customer.
- Product_ID and Customer_ID are unique keys in their respective dimension tables and repeating foreign keys in Sales.

## 2. Expected model
- Products[Product_ID] (1) → Sales[Product_ID] (*)
- Customers[Customer_ID] (1) → Sales[Customer_ID] (*)
- Date[Date] (1) → Sales[Sale_Date] (*)

Use single-direction filtering from dimensions to Sales. If Power BI refuses the “one” side, inspect duplicate keys and data types.

## 3. DAX formulas

Calculated column in Sales:
```dax
Sales_Value_NGN =
Sales[Quantity] * Sales[Unit_Price_NGN]
```

Measures:
```dax
Total Sales =
SUM ( Sales[Sales_Value_NGN] )

Total Units =
SUM ( Sales[Quantity] )

Number of Sales Rows =
COUNTROWS ( Sales )

Unique Customers =
DISTINCTCOUNT ( Sales[Customer_ID] )

Average Sales per Line =
AVERAGE ( Sales[Sales_Value_NGN] )

Average Unit Price =
AVERAGE ( Sales[Unit_Price_NGN] )

Sales per Unit =
DIVIDE ( [Total Sales], [Total Units] )

Grocery Sales =
CALCULATE (
    [Total Sales],
    Products[Category] = "Groceries"
)

Online Sales =
CALCULATE (
    [Total Sales],
    Sales[Sales_Channel] = "Online"
)

Ikeja Sales =
CALCULATE (
    [Total Sales],
    Customers[City] = "Ikeja"
)
```

## 4. Dataset validation
Use these checks after creating Sales_Value_NGN:
- Sales rows: 24.
- Total units: 90.
- Total sales value: ₦273,850.
- Unique customers appearing in Sales: 8.
- Grocery sales: ₦196,650.
- Online sales: ₦142,650.
- Sales by city: Lagos ₦88,300; Ibadan ₦79,750; Ikeja ₦64,300; Abuja ₦41,500.

If your results differ, check that all 24 rows loaded, data types are numeric, and the relationships are correct. A card should use the Total Sales measure, not Count of Sales_Value_NGN.

## 5. Calculated column vs measure
Sales_Value_NGN is calculated for each transaction line and stored in the model. Total Sales is a measure that sums those row values for the current filter context. A category or city selection changes the measure result, not the stored row-level column.

## 6. CALCULATE explanation
CALCULATE evaluates an expression after applying a filter. Grocery Sales evaluates Total Sales for products in the Groceries category. The Products-to-Sales relationship allows that filter to affect sales rows.

## 7. Good interpretation
A strong report describes the values and their scope. For example: “In this sample, Grocery products generated the largest sales value.” Avoid saying that groceries are the most profitable because cost of goods, operating expenses and returns are not included.

## 8. Common mistakes
- Connecting Sales to a dimension using a non-unique column.
- Joining on names instead of stable IDs.
- Using many-to-many to bypass duplicate-key problems.
- Creating a calculated column when a dynamic measure is required.
- Counting sales values instead of summing them.
- Confusing transaction rows with unique receipts.
- Treating sales value as profit.
