# Week 4 — Answer Guide

Attempt the exercises and assignment before using this guide. These are model answers; equivalent correct formulas are acceptable.

## Part A — Formula foundations

1. A formula is an instruction/calculation in Excel. A function is a predefined operation used inside a formula.
2. The equals sign tells Excel to calculate the expression.
3. `=A2+B2`
4. `=C2*D2`
5. 20. Multiplication is performed before addition.
6. 30. Parentheses are calculated first.
7. A cell reference uses a value stored in a cell and updates when the cell changes. A hard-coded number is typed directly into the formula and does not automatically follow changes to a separate assumption cell.
8. An argument is an input supplied to a function, such as a range, criterion or number.

## Part B — Cell references

1. It adjusts from `=B2*C2` to `=B3*C3`.
2. `=D2*$F$1`
3. Both column A and row 1 are fixed.
4. Column A is fixed; the row can change.
5. Row 1 is fixed; the column can change.
6. A fixed VAT rate, commission rate or target stored in one cell and used in many copied formulas.
7. A multiplication table or a two-way calculation grid where one header row or column must remain fixed.

## Part C — Basic functions

1. `=SUM(F2:F21)`
2. `=AVERAGE(F2:F21)`
3. `=MAX(F2:F21)`
4. `=MIN(F2:F21)`
5. `=COUNT(F2:F21)`
6. `=COUNTA(A2:A21)`
7. `=COUNTBLANK(F2:F21)`
8. COUNT counts numeric values; COUNTA counts non-empty cells, including text.
9. Zero is a numeric value. A blank cell has no entered value.

## Part D — Dataset formula guidance

Assuming the imported columns are:
A Transaction_ID, B Sale_Date, C Product, D Category, E Venue, F Quantity_Sold, G Unit_Price_NGN, H Payment_Method, I Payment_Status.

Add Revenue_NGN in J. In J2 use:

`=F2*G2`

Copy down.

Example formulas (adjust the last row if your Excel import has a different number of records):

1. Total revenue: `=SUM(J2:J31)`
2. Average revenue: `=AVERAGE(J2:J31)`
3. Highest revenue: `=MAX(J2:J31)`
4. Lowest revenue: `=MIN(J2:J31)`
5. Number of transactions: `=COUNTA(A2:A31)`
6. Transfer transactions: `=COUNTIF(H2:H31,"Transfer")`
7. Ibadan transactions: `=COUNTIF(E2:E31,"Ibadan")`
8. Ibadan + Transfer: `=COUNTIFS(E2:E31,"Ibadan",H2:H31,"Transfer")`
9. Drinks revenue: `=SUMIF(D2:D31,"Drinks",J2:J31)`
10. Snacks revenue in Ibadan: `=SUMIFS(J2:J31,D2:D31,"Snacks",E2:E31,"Ibadan")`
11. Average Bakery revenue: `=AVERAGEIF(D2:D31,"Bakery",J2:J31)`
12. Average Drinks revenue in Ibadan: `=AVERAGEIFS(J2:J31,D2:D31,"Drinks",E2:E31,"Ibadan")`
13. Quantity greater than 5: `=COUNTIF(F2:F31,">5")`
14. Snacks with quantity greater than 3: `=COUNTIFS(D2:D31,"Snacks",F2:F31,">3")`
15. Transaction size in K2: `=IF(J2>=10000,"Large","Regular")`
16. Review flag in L2: `=IF(OR(I2="Pending",F2=0),"Review","OK")`
17. Offer eligibility in M2: `=IF(AND(E2="Ibadan",D2="Snacks"),"Eligible","Not Eligible")`

Copy the decision formulas down the table.

## Part E — Function choice

1. SUM.
2. COUNTA on a populated transaction identifier column, or COUNT if the identifier is numeric.
3. COUNTIF.
4. COUNTIFS.
5. SUMIF.
6. SUMIFS.
7. AVERAGEIF.
8. AVERAGEIFS.
9. IF.
10. AND, usually inside IF if a label is required.

## Part F — Formula debugging

1. The criteria range should be the category column, not the revenue column. Correct: `=SUMIF(C2:C20,"Drinks",F2:F20)` if C contains category and F contains revenue.
2. SUMIFS starts with the sum range. Correct: `=SUMIFS(F2:F20,C2:C20,"Drinks")`.
3. Text criteria need quotation marks: `=COUNTIF(E2:E20,"Paid")`.
4. Text results need quotation marks: `=IF(D2>=5000,"Large","Small")`.
5. Possible causes: F1 is blank; the rate is stored as text; D2 is zero or text; the formula references the wrong cell; the referenced cell is formatted or interpreted unexpectedly. Inspect the values and formula.
6. Check that at least one row meets the criteria, that the criteria are spelled correctly, and that the average range contains numeric values.
7. The cell may be formatted as Text; the formula may lack the equals sign; Show Formulas may be enabled; or an apostrophe may precede the formula.

## Assignment review

The correct workbook:
- preserves the source records,
- calculates revenue from quantity and unit price,
- demonstrates all required functions,
- uses the correct criteria and sum/average ranges,
- applies AND and OR logic exactly as specified,
- documents the formulas and explains the results.

The model formulas above assume the supplied file's column order and 30 data rows. If you add or remove records, adjust the ranges or use the Excel Table's structured references.
