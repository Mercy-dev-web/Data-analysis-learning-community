# Week 11 Answer Guide

Attempt the assignment before reading this guide. There is more than one acceptable design. The important things are accuracy, clarity and a logical reason for each visual.

## 1. Suggested visual choices
1. Total sales value → Card.
2. Sales by category → Bar chart.
3. Sales over time → Line chart.
4. Sales by city → Bar or column chart.
5. Exact values by product → Table or matrix.
6. Online vs in-store → Bar or column chart.

A different visual can be acceptable if it communicates the answer more clearly and accurately.

## 2. Suggested Page 1 structure
- Top: report title and date range.
- Next row: Total Sales, Total Units and Unique Customers cards.
- Middle: Sales by Category and Sales by City.
- Bottom: Sales Trend by Date.
- Slicers: Date, Category and/or City, positioned consistently.

## 3. Suggested Page 2 structure
- Sales by Product.
- Units by Product.
- Sales by Channel.
- Detail table with product, category, units and sales value.
- A text box containing two or three findings.

## 4. Data validation using the Week 10 practice files
If you used the supplied Week 10 files and formulas correctly, your main checks should include:
- Total Sales: ₦155,850.
- Total Units: 81.
- Unique Customers in Sales: 9.
- Grocery Sales: ₦90,100.
- Online Sales: ₦74,650.
- Sales by city: Ibadan ₦53,900; Lagos ₦52,950; Abuja ₦25,600; Ikeja ₦23,400.

These figures are validation checks, not a substitute for building the visuals. Your chart should respond when a slicer is used.

## 5. Insight examples
**Category:** “Groceries generated ₦90,100, the highest category sales value in this sample. The manager could inspect the individual grocery products and review stock availability. This does not establish that groceries are the most profitable category because costs are not supplied.”

**City:** “Ibadan recorded ₦53,900, higher than the other cities in this sample. The business could review product mix and order patterns in Ibadan before deciding whether to expand activity there.”

**Channel:** “Online sales value was ₦74,650. Compare this with the in-store result and investigate channel costs, returns and customer behaviour before making a channel investment decision.”

Do not invent a trend or claim that one factor caused a result. Read your own chart and quote the values displayed by your model.

## 6. Common issues and fixes
| Issue | What to check |
|---|---|
| Card shows count instead of sales | Use the [Total Sales] measure |
| Category chart repeats the same value | Check the Products-to-Sales relationship |
| Date chart sorts alphabetically | Use Date[Date], not a text month name |
| Slicer does not affect a chart | Check Edit interactions and model relationships |
| Labels overlap | Resize visual, reduce labels or use a bar chart |
| Currency has too many decimals | Format the measure as currency with 0–2 decimals |
| Too many colours | Use a smaller consistent palette |
| Page feels crowded | Remove redundant visuals and create a second page |
| Visual is attractive but unclear | Add a specific title, unit and useful context |

## 7. What makes a strong submission?
A strong report:
- Answers a small set of clear business questions.
- Uses accurate measures.
- Makes comparisons easy to see.
- Has a sensible reading order.
- Allows useful filtering.
- Includes concise findings supported by numbers.
- States limitations honestly.
