# Capstone Dataset: Data Dictionary and Validation

## Business scenario
A fictional Nigerian personal-care retailer wants to understand sales performance across six months in 2026. The three CSV files form a small relational dataset for use in Excel, MySQL, Power BI and Python.

## Files and grain

| File | Grain | Expected rows | Purpose |
|---|---|---:|---|
| `customers.csv` | One row per customer | 8 | Customer attributes |
| `products.csv` | One row per product | 6 | Product, category, price and cost |
| `sales.csv` | One row per order line | 36 | Transaction activity |

An order can contain more than one order line. There are 18 order IDs in the sample. Do not count order lines and call them orders. Count distinct `OrderID` values when counting orders.

## customers.csv

| Column | Meaning |
|---|---|
| CustomerID | Unique customer key |
| CustomerName | Fictional customer name |
| City | Customer city |
| CustomerSegment | New or Returning segment label |

## products.csv

| Column | Meaning |
|---|---|
| ProductID | Unique product key |
| ProductName | Product description |
| Category | Product category |
| UnitPriceNGN | Selling price per unit before discount |
| UnitCostNGN | Product cost per unit supplied for this exercise |

## sales.csv

| Column | Meaning |
|---|---|
| OrderLineID | Unique order-line key |
| OrderID | Order identifier; can repeat across lines |
| OrderDate | Transaction date (YYYY-MM-DD) |
| CustomerID | Customer foreign key |
| ProductID | Product foreign key |
| Quantity | Units sold on this line |
| SalesChannel | Online or Store |
| DiscountPct | Discount fraction: 0, 0.05 or 0.10 |

## Calculated measures

- **Gross sales before discount:** Quantity × UnitPriceNGN.
- **Discount amount:** Gross sales before discount × DiscountPct.
- **Net revenue:** Gross sales before discount − Discount amount.
- **Product cost:** Quantity × UnitCostNGN.
- **Gross profit:** Net revenue − Product cost.
- **Gross margin %:** Gross profit ÷ net revenue. Use a safe divide-by-zero method.

Revenue is not profit. Gross profit here excludes other business expenses such as salaries, rent, delivery, payment fees and marketing. Do not call it net profit.

## Relationships

- Customers.CustomerID (one) → Sales.CustomerID (many)
- Products.ProductID (one) → Sales.ProductID (many)

The sales table is the fact table. Customers and Products are dimension tables. The grain of Sales is one order line.

## Validation figures

Use these to check your work after calculating Net Revenue and Gross Profit:
- Customers: 8
- Products: 6
- Sales order lines: 36
- Distinct orders: 18
- Units sold: 73
- Net revenue: ₦649,625
- Product cost: ₦382,700
- Gross profit: ₦266,925
- Revenue by month: 2026-01 ₦77,200; 2026-02 ₦127,025; 2026-03 ₦110,825; 2026-04 ₦109,875; 2026-05 ₦110,450; 2026-06 ₦114,250
- Revenue by city: Lagos ₦232,350; Abuja ₦172,050; Ibadan ₦160,225; Osogbo ₦85,000
- Revenue by category: Skincare ₦546,350; Hair Care ₦44,400; Body Care ₦58,875
- Revenue by channel: Online ₦440,250; Store ₦209,375

These are validation totals, not the analysis conclusions. Your job is to explain what they mean and investigate useful comparisons.
