# Week 9 Answer Guide

Attempt the exercises and assignment before reading this guide. Focus on why each transformation is appropriate.

## 1. Expected issues
The CSV intentionally includes extra spaces, inconsistent capitalisation in Branch/Category, blank Payment_Method values and one fully duplicated transaction ID (RT064). Inspect your own preview and record the actual row counts.

## 2. Suitable types
Order_ID: Text; Order_Date: Date; Branch/Product/Category/Payment_Method/Sales_Channel/Customer_Type: Text; Quantity: Whole Number; Unit_Price_NGN: Decimal or Fixed Decimal.

## 3. Cleaning decisions
- Trim text columns to remove leading/trailing spaces.
- Standardise obvious variants such as `ikeja` and `Ikeja` to one label.
- Do not guess missing payment methods. Keep null or use a documented Unknown label.
- RT064 appears twice as an identical full record; retain one copy. If duplicate IDs have different details, investigate rather than deleting blindly.

## 4. Custom column
Use Add Column → Custom Column:

```powerquery
[Quantity] * [Unit_Price_NGN]
```

For example, 3 × ₦2,500 = ₦7,500. This is transaction sales value, not profit.

## 5. Visual field setup
| Visual | Category/axis | Value | Aggregation |
|---|---|---|---|
| Card | — | Sales_Value_NGN | Sum |
| Bar | Branch | Sales_Value_NGN | Sum |
| Column | Category | Sales_Value_NGN | Sum |
| Bar/column | Sales_Channel | Order_ID | Count |
| Line | Order_Date | Sales_Value_NGN | Sum |

## 6. Validation
1. Check several row calculations with a calculator.
2. Confirm RT064 is not counted twice.
3. Compare the card total with the sum of cleaned transaction values.
4. Review filters and Applied Steps.
5. Check that sales value is Sum and transaction ID is Count.

Totals can vary slightly across category/channel visuals depending on how you handle null category values. Document the choice.

## 7. Strong interpretation
A sound finding states what the data shows and supports it with a value. For example: “The Ikeja branch recorded the highest sales value in this sample.” Do not say it is the most profitable: product costs, rent, salaries and other expenses are absent.

Avoid claiming that customers prefer a payment method when some payment records are missing, or predicting future growth from this short sample.

## 8. Reflection guide
- Power Query records repeatable transformation steps; editing a CSV changes the source itself.
- An Applied Step is one recorded transformation.
- Order_ID identifies a transaction; it is not a measure to add or average.
- Sales value is quantity × selling price. Profit requires costs and expenses.
- Count counts records/values; Sum adds numeric amounts. They answer different questions.

Learners can make different defensible choices about nulls. Award credit for transparent, justified decisions rather than insisting on one arbitrary treatment.
