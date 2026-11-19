# Week 4 — Excel Formulas and Functions

**Estimated study time:** 9–12 hours  
**Level:** Beginner  
**Main tool:** Microsoft Excel

## 1. Learning objectives

By the end of this week, you should be able to:

1. Explain the difference between a formula and a function.
2. Create formulas using cell references and arithmetic operators.
3. Understand the order in which Excel performs calculations.
4. Explain and use relative, absolute and mixed references.
5. Use basic mathematical and statistical functions.
6. Count values using COUNT, COUNTA and COUNTBLANK.
7. Use IF with AND and OR to make decisions.
8. Calculate conditional totals, counts and averages using IF and IFS functions.
9. Write criteria for text, numbers and comparisons.
10. Identify common formula errors and correct them.
11. Translate a business question into a suitable Excel formula and interpret the result.

## 2. What is a formula?

A formula is an instruction that tells Excel to calculate something. Every Excel formula begins with an equals sign (`=`).

Examples:
- `=10+5` returns 15.
- `=A2+B2` adds the values in A2 and B2.
- `=B2*C2` multiplies the values in B2 and C2.

If you type `10+5` without the equals sign, Excel may treat it as text rather than a calculation.

### Formula versus function

A **formula** is any calculation you write in Excel. A **function** is a predefined operation that Excel already knows how to perform.

Examples:
- `=A2+B2+C2` is a formula using arithmetic operators.
- `=SUM(A2:C2)` is a formula using the SUM function.

Functions make formulas shorter, easier to read and less prone to typing errors.

## 3. Understanding function syntax

Most Excel functions follow this structure:

`=FUNCTION_NAME(argument1, argument2, ...)`

- The equals sign tells Excel to calculate.
- The function name tells Excel what operation to perform.
- Parentheses contain the required inputs.
- Arguments are separated by commas in many Excel regional settings. Some installations use semicolons; if commas produce an error, check your regional list separator.

Example:

`=SUM(B2:B10)`

SUM is the function name. B2:B10 is the argument, telling Excel which cells to add.

A function may require one argument, several arguments, or optional arguments. Excel usually displays a tooltip as you type.

## 4. Arithmetic operators

| Operator | Meaning | Example | Result |
|---|---|---|---:|
| + | Addition | =10+5 | 15 |
| - | Subtraction | =10-5 | 5 |
| * | Multiplication | =10*5 | 50 |
| / | Division | =10/5 | 2 |
| ^ | Exponent | =2^3 | 8 |
| % | Percentage | =20%*500 | 100 |

### Business example

A mini-mart sells 8 packs of cereal at ₦2,500 each.

Revenue = Quantity × Unit Price

`=8*2500`

Result: ₦20,000.

If quantity is in B2 and unit price is in C2, use:

`=B2*C2`

This is better than typing the numbers directly because the formula updates when the underlying values change.

### Order of operations

Excel follows the conventional order of operations:
1. Parentheses.
2. Exponents.
3. Multiplication and division, from left to right.
4. Addition and subtraction, from left to right.

For example:

`=10+5*2`

Result: 20, because multiplication happens before addition.

`=(10+5)*2`

Result: 30, because the parentheses are calculated first.

Use parentheses when they make your intended calculation clearer.

## 5. Cell references in formulas

A cell reference tells Excel where to find a value.

Suppose:
- B2 contains quantity sold.
- C2 contains unit price.
- D2 should calculate revenue.

In D2 enter:

`=B2*C2`

Excel reads the values from B2 and C2, multiplies them and displays the result in D2.

### Relative references

A relative reference changes when a formula is copied to another cell.

If D2 contains `=B2*C2` and you copy it to D3, Excel adjusts it to `=B3*C3`.

This is useful when applying the same calculation to many records.

### Absolute references

An absolute reference stays fixed when copied. Dollar signs lock both the column and row.

Example: suppose F1 contains a commission rate of 5%. In E2, calculate commission:

`=D2*$F$1`

When copied down, D2 changes to D3, D4 and so on, but $F$1 remains fixed.

Without the dollar signs, Excel would move the rate reference and the formula could produce incorrect results.

Shortcut: in many desktop Excel versions, select a reference inside the formula and press F4 to cycle through reference types. Laptop function-key settings may require Fn+F4.

### Mixed references

A mixed reference locks either the column or the row, but not both.

- `$A1` locks column A but allows the row to change.
- `A$1` locks row 1 but allows the column to change.

Example: you are building a multiplication table. You may need to lock the row heading when copying across and the column heading when copying down. Mixed references make this possible.

### Quick comparison

| Reference | Example | What stays fixed? |
|---|---|---|
| Relative | A1 | Nothing |
| Absolute | $A$1 | Column A and row 1 |
| Mixed | $A1 | Column A only |
| Mixed | A$1 | Row 1 only |

## 6. Basic calculation and summary functions

For the examples below, assume sales amounts are in D2:D11.

### SUM — add values

Adds numbers in cells or ranges.

Syntax: `=SUM(number1, [number2], ...)`

Example: `=SUM(D2:D11)`

Business question: What is the total revenue recorded?

### AVERAGE — calculate the arithmetic mean

Adds numeric values and divides by the number of numeric values.

Syntax: `=AVERAGE(number1, [number2], ...)`

Example: `=AVERAGE(D2:D11)`

Business question: What is the average transaction revenue?

Important: AVERAGE ignores blank cells and text cells. A zero is a number and is included in the average.

### MIN — smallest value

Example: `=MIN(D2:D11)`

Business question: What was the smallest transaction amount?

### MAX — largest value

Example: `=MAX(D2:D11)`

Business question: What was the largest transaction amount?

### COUNT — count numeric cells

Example: `=COUNT(D2:D11)`

COUNT counts cells containing numbers. It does not count text values.

### COUNTA — count non-empty cells

Example: `=COUNTA(A2:A11)`

COUNTA counts cells that contain any value, including text and numbers. A cell containing a formula that returns an empty text string may still be treated as non-empty.

### COUNTBLANK — count empty cells

Example: `=COUNTBLANK(E2:E11)`

COUNTBLANK counts blank cells in a range.

### Do not confuse the count functions

Imagine cells A2:A6 contain:

| Cell | Value |
|---|---|
| A2 | 100 |
| A3 | Mercy |
| A4 | 0 |
| A5 | *(blank)* |
| A6 | 250 |

- COUNT(A2:A6) returns 3: 100, 0 and 250.
- COUNTA(A2:A6) returns 4: every non-empty cell.
- COUNTBLANK(A2:A6) returns 1.

Zero is not blank. Text is not a number. This distinction matters when assessing data completeness.

## 7. IF — make a decision

IF tests a condition and returns one result when the condition is TRUE and another when it is FALSE.

Syntax:

`=IF(logical_test, value_if_true, value_if_false)`

Example: if E2 contains a student's score:

`=IF(E2>=50,"Pass","Fail")`

- If E2 is 65, the result is Pass.
- If E2 is 42, the result is Fail.

### Business example: sales target

Suppose D2 contains sales revenue and F1 contains a target of ₦20,000.

`=IF(D2>=$F$1,"Target Met","Below Target")`

This classifies each transaction against the target. Be careful: a transaction-level target is not necessarily the same as a daily or monthly business target. Always define what the target applies to.

### Nested IF

You can put one IF inside another to create more than two outcomes.

Example: a simple score grading rule:

`=IF(A2>=70,"Excellent",IF(A2>=50,"Pass","Fail"))`

Excel checks the first condition. If it is false, it checks the next IF.

Nested IF formulas can become difficult to maintain. Keep rules simple and explain the thresholds. Newer Excel versions also support IFS, which can be easier to read for multiple conditions, but IF is the focus here.

## 8. AND and OR — combine conditions

AND and OR return logical values: TRUE or FALSE.

### AND

AND returns TRUE only when **all** supplied conditions are TRUE.

Syntax: `=AND(logical1, [logical2], ...)`

Example:

`=AND(B2="Ibadan",C2="Paid")`

Returns TRUE only if the venue is Ibadan and the payment status is Paid.

Used with IF:

`=IF(AND(B2="Ibadan",C2="Paid"),"Include","Review")`

### OR

OR returns TRUE when **at least one** supplied condition is TRUE.

Example:

`=OR(C2="Cash",C2="Transfer")`

Returns TRUE if the payment method is Cash or Transfer.

Used with IF:

`=IF(OR(C2="Cash",C2="Transfer"),"Accepted Method","Check Method")`

### AND versus OR

Imagine a scholarship requires:
- a score of at least 70, AND
- attendance of at least 80%.

Both must be met. Use AND.

Imagine a business accepts payment by cash OR transfer. Either is acceptable. Use OR.

**Remember:** AND makes a condition stricter as you add requirements. OR makes it easier for at least one requirement to be satisfied.

## 9. Criteria: how Excel understands conditions

Conditional functions rely on criteria.

Examples:
- `"Ibadan"` — text equals Ibadan.
- `"Paid"` — text equals Paid.
- `">=5000"` — greater than or equal to 5,000.
- `"<100"` — less than 100.
- `"<>Cancelled"` — not equal to Cancelled.
- `"A*"` — text beginning with A.
- `"???"` — exactly three characters, using wildcards.

Text criteria and criteria containing comparison operators are usually enclosed in double quotation marks.

If the condition is stored in a cell, you can refer to that cell. For a threshold in H1, use:

`=COUNTIF(D2:D20,">"&H1)`

The ampersand joins the comparison operator text to the value in H1.

## 10. COUNTIF — count using one condition

COUNTIF counts cells that meet one criterion.

Syntax:

`=COUNTIF(range, criteria)`

Example: column C contains payment status.

`=COUNTIF(C2:C31,"Paid")`

This counts how many records have a Paid status.

Another example:

`=COUNTIF(D2:D31,">=10")`

Counts values in D2:D31 that are at least 10.

Business question: How many transactions were made in Ibadan?

`=COUNTIF(B2:B31,"Ibadan")`

## 11. COUNTIFS — count using multiple conditions

COUNTIFS counts records where all specified criteria are met.

Syntax:

`=COUNTIFS(criteria_range1, criteria1, [criteria_range2, criteria2], ...)`

Example: count paid transactions in Ibadan:

`=COUNTIFS(B2:B31,"Ibadan",E2:E31,"Paid")`

A record must meet both conditions:
- Venue is Ibadan.
- Payment status is Paid.

Example: count sales transactions in the Snacks category with quantity greater than 5:

`=COUNTIFS(C2:C31,"Snacks",D2:D31,">5")`

**Important:** COUNTIFS uses AND logic across its criteria pairs. It does not mean "condition 1 OR condition 2". For OR conditions, you may add separate COUNTIF results or use another suitable approach.

## 12. SUMIF — add values using one condition

SUMIF adds values that meet one condition.

Syntax:

`=SUMIF(range, criteria, [sum_range])`

- range: where Excel checks the condition.
- criteria: the condition to satisfy.
- sum_range: the values to add. It is optional if the same range should be summed.

Example: column C contains product category; column F contains revenue.

`=SUMIF(C2:C31,"Snacks",F2:F31)`

This adds revenue for rows where the category is Snacks.

Another example: total sales in Ibadan:

`=SUMIF(B2:B31,"Ibadan",F2:F31)`

**Remember the order:** SUMIF starts with the criteria range, then the criteria, then the sum range.

## 13. SUMIFS — add values using multiple conditions

SUMIFS adds values only when all specified conditions are met.

Syntax:

`=SUMIFS(sum_range, criteria_range1, criteria1, [criteria_range2, criteria2], ...)`

Example: total revenue for Snacks sold in Ibadan:

`=SUMIFS(F2:F31,C2:C31,"Snacks",B2:B31,"Ibadan")`

A transaction must match both conditions before its revenue is included.

### SUMIF versus SUMIFS — a very important difference

| Function | Argument order |
|---|---|
| SUMIF | criteria_range, criteria, [sum_range] |
| SUMIFS | sum_range, criteria_range1, criteria1, ... |

The sum range comes first in SUMIFS, but third in SUMIF. Mixing them up is a common beginner error.

## 14. AVERAGEIF — average using one condition

AVERAGEIF calculates the average of values that meet one condition.

Syntax:

`=AVERAGEIF(range, criteria, [average_range])`

Example: average revenue for Snacks:

`=AVERAGEIF(C2:C31,"Snacks",F2:F31)`

Excel checks the category in column C and averages the corresponding revenue in column F.

## 15. AVERAGEIFS — average using multiple conditions

AVERAGEIFS calculates the average of values that meet multiple conditions.

Syntax:

`=AVERAGEIFS(average_range, criteria_range1, criteria1, [criteria_range2, criteria2], ...)`

Example: average revenue for Snacks sold in Ibadan:

`=AVERAGEIFS(F2:F31,C2:C31,"Snacks",B2:B31,"Ibadan")`

Notice that AVERAGEIFS starts with the average range, followed by criteria range/criteria pairs.

If no records meet the conditions, Excel may return a divide-by-zero error. Check whether the criteria are correct and whether matching records exist.

## 16. A complete worked example

Suppose a small shop has the following records:

| Product | Category | Venue | Quantity | Unit Price | Revenue |
|---|---|---|---:|---:|---:|
| Bread | Bakery | Ibadan | 4 | 1500 | 6000 |
| Juice | Drinks | Oyo | 3 | 1200 | 3600 |
| Biscuits | Snacks | Ibadan | 5 | 500 | 2500 |
| Water | Drinks | Ibadan | 10 | 300 | 3000 |
| Chin Chin | Snacks | Oyo | 2 | 1000 | 2000 |

Assume the table begins in row 2, with columns A:F in the order shown.

Revenue in F2:

`=D2*E2`

Copy the formula down.

Questions and formulas:

1. Total revenue: `=SUM(F2:F6)` → ₦17,100.
2. Average transaction revenue: `=AVERAGE(F2:F6)` → ₦3,420.
3. Largest transaction: `=MAX(F2:F6)` → ₦6,000.
4. Number of numeric revenue values: `=COUNT(F2:F6)` → 5.
5. Number of Snacks transactions: `=COUNTIF(B2:B6,"Snacks")` → 2.
6. Revenue from Drinks: `=SUMIF(B2:B6,"Drinks",F2:F6)` → ₦6,600.
7. Revenue from Snacks in Ibadan: `=SUMIFS(F2:F6,B2:B6,"Snacks",C2:C6,"Ibadan")` → ₦2,500.
8. Average revenue from Drinks: `=AVERAGEIF(B2:B6,"Drinks",F2:F6)` → ₦3,300.
9. Number of transactions in Ibadan with quantity at least 5: `=COUNTIFS(C2:C6,"Ibadan",D2:D6,">=5")` → 2.
10. Classify each transaction as High if revenue is at least ₦5,000, otherwise Standard: `=IF(F2>=5000,"High","Standard")`.

These examples show how formulas turn raw records into answers to business questions.

## 17. Common errors and troubleshooting

### #DIV/0!

You attempted to divide by zero or calculate an average when there are no numeric values to average. Check the denominator and the criteria.

### #VALUE!

A formula received a value of the wrong type. For example, arithmetic may fail if a number is stored as text.

### #NAME?

Excel does not recognise a function name or text in the formula. Check spelling and quotation marks.

### #REF!

A formula refers to a cell or range that no longer exists, often because referenced cells were deleted.

### Wrong result, but no error

This can be harder to notice. Check:
- the selected ranges,
- the criteria spelling,
- extra spaces in text,
- numbers stored as text,
- whether you used SUMIF or SUMIFS argument order correctly,
- whether all criteria ranges have matching dimensions,
- whether the formula was copied with the correct cell references.

### Formula displays instead of calculating

Check whether:
- the cell is formatted as Text,
- you forgot the equals sign,
- Show Formulas is turned on,
- the formula begins with an apostrophe.

## 18. Best practices for analysts

1. Use cell references instead of typing fixed values into every formula.
2. Store changing assumptions, such as a target or commission rate, in a separate cell.
3. Use absolute references when a value must stay fixed as a formula is copied.
4. Label calculation columns clearly.
5. Check totals against a second method where possible.
6. Test conditional formulas on a few records manually.
7. Make sure criteria match the actual values in the dataset.
8. Avoid hiding errors with IFERROR before understanding why they occurred.
9. Document assumptions and business rules.
10. Explain what a calculated result means; a formula result alone is not an insight.

## 19. Week 4 completion checklist

- [ ] I understand formulas and functions.
- [ ] I can use arithmetic operators and parentheses.
- [ ] I understand relative, absolute and mixed references.
- [ ] I can use SUM, AVERAGE, MIN and MAX.
- [ ] I can distinguish COUNT, COUNTA and COUNTBLANK.
- [ ] I can write IF formulas.
- [ ] I can combine conditions using AND and OR.
- [ ] I can use COUNTIF and COUNTIFS.
- [ ] I can use SUMIF and SUMIFS.
- [ ] I can use AVERAGEIF and AVERAGEIFS.
- [ ] I can troubleshoot common formula errors.
- [ ] I have completed the assignment and can explain my formulas.

**Next week:** Excel analysis and reporting — sorting and filtering for questions, conditional formatting, PivotTables, charts and communicating findings.
