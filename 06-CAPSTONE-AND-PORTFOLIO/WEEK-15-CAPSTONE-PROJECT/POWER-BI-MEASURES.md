# Week 15 — Power BI Model and DAX Measures

Use this guide after importing the three capstone CSV files into Power BI Desktop.

## 1. Load the tables

Import customers.csv as Customers, products.csv as Products, and sales.csv as Sales.

Check that IDs are text, OrderDate is Date, Quantity is a whole number, UnitPriceNGN, UnitCostNGN and DiscountPct are decimal numbers. DiscountPct contains decimal fractions such as 0.05 for 5%, not the whole number 5.

## 2. Create relationships

In Model view, create these active relationships:
- Customers[CustomerID] (1) → Sales[CustomerID] (*)
- Products[ProductID] (1) → Sales[ProductID] (*)

Use single-direction filtering from dimension tables to Sales. CustomerID and ProductID must be unique on the dimension side. Do not create a many-to-many relationship to hide duplicate key problems.

## 3. Create the measures

Select the Sales table, choose New measure, and create each measure below. Enter one measure at a time.

### Gross Sales

    Gross Sales NGN =
    SUMX (
        Sales,
        Sales[Quantity] * RELATED ( Products[UnitPriceNGN] )
    )

This calculates quantity multiplied by the product's unit price for every sales line, then adds the results.

### Discount Amount

    Discount Amount NGN =
    SUMX (
        Sales,
        Sales[Quantity]
            * RELATED ( Products[UnitPriceNGN] )
            * Sales[DiscountPct]
    )

DiscountPct is stored as a fraction: 0.05 means 5%.

### Net Revenue

    Net Revenue NGN =
    [Gross Sales NGN] - [Discount Amount NGN]

### Product Cost

    Product Cost NGN =
    SUMX (
        Sales,
        Sales[Quantity] * RELATED ( Products[UnitCostNGN] )
    )

### Gross Profit

    Gross Profit NGN =
    [Net Revenue NGN] - [Product Cost NGN]

This subtracts product cost only. It does not subtract rent, salaries, delivery, marketing or other operating expenses. Do not label it net profit.

### Gross Margin %

    Gross Margin % =
    DIVIDE ( [Gross Profit NGN], [Net Revenue NGN] )

Format this measure as Percentage.

### Units Sold

    Units Sold =
    SUM ( Sales[Quantity] )

### Order Lines

    Order Lines =
    COUNTROWS ( Sales )

There are 36 order lines in the supplied data.

### Orders

    Orders =
    DISTINCTCOUNT ( Sales[OrderID] )

There are 18 distinct orders. Do not use Order Lines as the number of orders.

### Unique Customers

    Unique Customers =
    DISTINCTCOUNT ( Sales[CustomerID] )

This counts customers who appear in the Sales table, not every customer record in the Customers table.

## 4. Build report visuals

Suggested visuals:
- Cards: Net Revenue NGN, Gross Profit NGN, Orders and Units Sold.
- Line chart: Net Revenue NGN by OrderDate, grouped by month.
- Bar chart: Net Revenue NGN by ProductName or Category.
- Bar chart: Net Revenue NGN by City.
- Column chart: Net Revenue NGN by SalesChannel.
- Slicers: OrderDate, City, Category or SalesChannel.

Use dimension table fields for categories and measures for values.

## 5. Validation checks

| Measure | Expected |
|---|---:|
| Sales rows / Order Lines | 36 |
| Distinct Orders | 18 |
| Units Sold | 73 |
| Gross Sales | ₦687,500 |
| Discount Amount | ₦37,875 |
| Net Revenue | ₦649,625 |
| Product Cost | ₦382,700 |
| Gross Profit | ₦266,925 |

If your figures differ, check that all CSV files were imported completely, DiscountPct is a decimal fraction, relationships and keys are correct, measures use the intended columns, and order lines have not been counted as distinct orders.

## 6. Interpretation reminders

- Higher revenue does not automatically mean higher gross margin.
- A city with higher revenue may also have more orders or units.
- Compare customer segment totals with customer and order counts.
- This is a small synthetic dataset. It is for learning, not evidence about a real retailer or the Nigerian market.
