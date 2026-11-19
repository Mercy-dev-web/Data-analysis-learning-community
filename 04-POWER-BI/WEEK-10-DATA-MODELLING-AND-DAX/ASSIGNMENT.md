# Week 10 Assignment: Build a Retail Data Model and DAX Measures

**Pass target: 70/100**

## Scenario
A retail company wants a reusable Power BI model for analysing sales by product, customer city, category and time. The data is supplied in three separate CSV files.

## Files
- `practice-data/sales.csv`
- `practice-data/products.csv`
- `practice-data/customers.csv`

## Part A — Inspect and document (10 marks)
For each table, state its grain, role (fact/dimension), key columns and data types. Identify any key-quality issues.

## Part B — Build relationships (25 marks)
Create a model with:
- Products[Product_ID] (1) → Sales[Product_ID] (*)
- Customers[Customer_ID] (1) → Sales[Customer_ID] (*)
- Date[Date] (1) → Sales[Sale_Date] (*)

Use single-direction filtering for the simple star schema. Ensure the relationships are active. Submit a Model view screenshot and explain your choices.

## Part C — DAX calculations (30 marks)
Create:
- Sales_Value_NGN calculated column.
- Total Sales measure.
- Total Units measure.
- Number of Sales Rows measure.
- Unique Customers measure.
- Average Sales per Line measure.
- Sales per Unit measure using DIVIDE.
- Grocery Sales measure using CALCULATE.

Format currency measures as Nigerian naira where possible and use sensible decimal places.

## Part D — Report page (20 marks)
Create a report page with:
- Cards for Total Sales, Total Units and Unique Customers.
- Bar chart for Total Sales by Category.
- Column chart for Total Sales by City.
- A date or category slicer.

Test that slicers affect the report correctly.

## Part E — Interpretation (15 marks)
Write 200–300 words answering:
1. Which category has the highest sales value?
2. Which city has the highest sales value?
3. How many unique customers appear in the sales data?
4. What changes when you filter to Online sales?
5. What limitation should the business remember when interpreting sales value?

Do not claim that the highest sales category or city is the most profitable. The dataset contains no costs or expenses.

## Submission checklist
- [ ] `Week10_Retail_Model.pbix`
- [ ] Model view screenshot.
- [ ] Screenshot showing your measures.
- [ ] Report page screenshot.
- [ ] Short written interpretation.
- [ ] Explanation of grain, keys and relationships.

| Assessment area | Marks |
|---|---:|
| Table inspection | 10 |
| Relationships and model | 25 |
| DAX calculations | 30 |
| Report page and testing | 20 |
| Interpretation | 15 |
| **Total** | **100** |

A model with incorrect relationships or measures that do not respond to filters needs revision even if the report looks attractive.
