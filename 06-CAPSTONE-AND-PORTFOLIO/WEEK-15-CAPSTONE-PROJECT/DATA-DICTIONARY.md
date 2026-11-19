# Capstone Dataset: Data Dictionary and Validation

## Business scenario
A fictional Nigerian personal-care retailer wants to understand sales performance across six months in 2026. The three CSV files form a small relational dataset for use in Excel, MySQL, Power BI and Python.

## Files and grain

| File | Grain | Expected rows | Purpose |
|---|---|---:|---|
| `customers.csv` | One row per customer | 8 | Customer attributes |
| `products.csv` | One row per product | 6 | Product, category, price and cost |
| `sales.csv` | One row per order line | 36 | Transaction activity |

There are 18 distinct orders, with two order lines per order. Both lines belonging to an OrderID now share the same OrderDate, CustomerID and SalesChannel. Products may differ between the lines. Count distinct `OrderID` values when counting orders; count rows or OrderLineID when counting order lines.

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
| OrderID | Order identifier; repeats when an order has multiple lines |
| OrderDate | Transaction date (YYYY-MM-DD); consistent across lines in the same order |
| CustomerID | Customer foreign key; consistent across lines in the same order |
| ProductID | Product foreign key |
| Quantity | Units sold on this line |
| SalesChannel | Online or Store; consistent across lines in the same order |
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

The Sales table is the fact table. Customers and Products are dimension tables. The grain of Sales is one order line.

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

### Net revenue by month

| Month | Net revenue |
|---|---:|
| 2026-01 | ₦77,200 |
| 2026-02 | ₦127,025 |
| 2026-03 | ₦110,825 |
| 2026-04 | ₦109,875 |
| 2026-05 | ₦110,450 |
| 2026-06 | ₦114,250 |

### Net revenue by city

| City | Net revenue |
|---|---:|
| Lagos | ₦265,825 |
| Abuja | ₦167,825 |
| Ibadan | ₦115,850 |
| Osogbo | ₦100,125 |

### Net revenue by category

| Category | Net revenue |
|---|---:|
| Skincare | ₦546,350 |
| Body Care | ₦58,875 |
| Hair Care | ₦44,400 |

### Net revenue by channel

| Channel | Net revenue |
|---|---:|
| Online | ₦403,500 |
| Store | ₦246,125 |

### Net revenue by customer segment

| Segment | Net revenue |
|---|---:|
| Returning | ₦422,875 |
| New | ₦226,750 |

These are validation totals, not the analysis conclusions. Explain what they mean, compare relevant denominators (such as order counts or units), and investigate useful follow-up questions. Revenue alone does not establish profitability, loyalty or channel effectiveness.
