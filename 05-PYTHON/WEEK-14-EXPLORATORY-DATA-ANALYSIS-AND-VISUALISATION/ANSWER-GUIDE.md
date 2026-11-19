# Week 14 Answer Guide: EDA and Visualisation

Attempt the exercises first. Your chart appearance may differ; focus on correct calculations, clear labels and honest interpretation.

## 1. Dataset validation
The file contains **24 rows and 8 columns**. Each row is an order line, not a unique customer or complete basket. There is no customer ID, order ID, discount, advertising spend or operating-expense data.

Create:
```python
df["Revenue_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]
df["Cost_NGN"] = df["Quantity"] * df["Unit_Cost_NGN"]
df["Gross_Profit_NGN"] = df["Revenue_NGN"] - df["Cost_NGN"]
```

Expected totals:
- Order lines: 24
- Total quantity: 62
- Total revenue: ₦504,000
- Total product cost: ₦294,200
- Total gross profit: ₦209,800
- Average revenue per order line: ₦21,000
- Highest-revenue product: Face Serum — ₦168,000

## 2. Monthly revenue

| Month | Revenue |
|---|---:|
| 2026-01 | ₦83,000 |
| 2026-02 | ₦73,000 |
| 2026-03 | ₦84,000 |
| 2026-04 | ₦66,000 |
| 2026-05 | ₦86,000 |
| 2026-06 | ₦112,000 |

## 3. Revenue by city

| City | Revenue |
|---|---:|
| Lagos | ₦202,000 |
| Ibadan | ₦150,000 |
| Abuja | ₦107,000 |
| Osogbo | ₦45,000 |

## 4. Revenue by category

| Category | Revenue |
|---|---:|
| Skincare | ₦303,000 |
| Personal Care | ₦201,000 |

## 5. Revenue by sales channel

| Channel | Revenue |
|---|---:|
| Online | ₦311,000 |
| Store | ₦193,000 |

## 6. Revenue by product

| Product | Revenue |
|---|---:|
| Face Serum | ₦168,000 |
| Face Cream | ₦135,000 |
| Body Lotion | ₦96,000 |
| Hair Oil | ₦60,000 |
| Hand Wash | ₦45,000 |

## 7. Example summary and export

```python
df["Month"] = df["Order_Date"].dt.to_period("M").astype(str)
monthly = df.groupby("Month").agg(
    Revenue_NGN=("Revenue_NGN", "sum"),
    Order_Lines=("Revenue_NGN", "size")
).reset_index()
monthly.to_csv("monthly_revenue_summary.csv", index=False)
```

## 8. Interpretation guidance
- The city with the highest total is the largest revenue contributor in this sample, not necessarily the most profitable city.
- Compare channel revenue alongside line counts. Differences may reflect number of order lines, quantities, prices or a combination.
- Monthly changes identify periods to investigate. The file has no promotion, stock availability or advertising-spend data to explain why changes occurred.
- Quantity and revenue will be associated partly because revenue is calculated as quantity multiplied by unit price.

## 9. Outliers
Use the IQR method in the lesson. A flagged point is a prompt for investigation, not an automatic deletion. Check whether it is a valid larger order line or an error.

## 10. Knowledge check
19. **Line chart** — months are ordered in time.
20. **Median** — the middle observation in sorted data; less sensitive to extreme values than the mean.
21. **No.** Correlation is association, not proof of cause and effect.
22. **No.** Inspect the observation and retain it if valid and relevant.

## 11. What a strong submission looks like
Your notebook runs top-to-bottom, calculations are correct, charts fit the questions, insights cite evidence, revenue and gross profit are distinguished, causal claims are avoided, and limitations are stated. If your figures differ, check the supplied CSV, formulas and grouping fields. Do not silently delete records to force a match.
