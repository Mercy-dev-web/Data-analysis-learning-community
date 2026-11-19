# Week 9 Practice Exercises

Use `practice-data/naija_retail_sales_raw.csv`. Attempt each task before checking the answer guide.

## 1. Inspect
1. Import the CSV and choose Transform Data.
2. Record row and column counts.
3. Classify each field as identifier, date, category or numeric measure.
4. List at least four data-quality issues.

## 2. Set types
Set Order_ID to Text, Order_Date to Date, Quantity to Whole Number, Unit_Price_NGN to Decimal Number and descriptive fields to Text. Inspect errors.

## 3. Clean text
Trim Branch, Product, Category, Payment_Method, Sales_Channel and Customer_Type. Inspect distinct Branch and Category values and standardise obvious variants.

## 4. Investigate missing values
Find nulls in Payment_Method and Customer_Type. Explain why replacing a missing payment method with Cash would be misleading. Choose and document a treatment.

## 5. Investigate duplicates
Inspect repeated Order_IDs. Confirm whether repeated records are identical. Remove only the confirmed full duplicate and record the before/after row counts.

## 6. Create a calculated column
Create Sales_Value_NGN using:

```powerquery
[Quantity] * [Unit_Price_NGN]
```

Verify three rows manually.

## 7. Build visuals
After Close & Apply, create a total-sales card, sales-by-branch bar chart, sales-by-category column chart and transaction-count-by-channel chart. For each visual, write the question it answers and the aggregation used.

## 8. Explain
Write 150–250 words describing three cleaning steps, one issue you did not automatically “fix”, how you validated sales value and one dataset limitation.

## Reflection
1. How is Power Query different from editing the CSV in Excel?
2. What is an Applied Step?
3. Why is Order_ID text?
4. Why is Sales_Value_NGN not profit?
5. What happens if you use Count instead of Sum for sales value?
