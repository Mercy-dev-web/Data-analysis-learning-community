# Week 3 — Exercise Answer Guide

Attempt the exercises first. The examples below are model answers; other correct explanations are acceptable.

## Part A — Spreadsheet vocabulary

1. A workbook is the complete Excel file, which may contain multiple worksheets.
2. A worksheet is one tab or grid within a workbook.
3. Rows run horizontally and are numbered; columns run vertically and are labelled with letters.
4. A cell is the intersection of a row and a column.
5. D8 is the cell in column D and row 8.
6. A1:A10 is a vertical range in one column. A1:D10 is a rectangular range covering four columns and ten rows.
7. The Formula Bar displays the content of the selected cell and allows it to be viewed or edited.
8. Clearing contents removes what is inside selected cells. Deleting a row removes the entire row and shifts or removes other cells depending on the action.

## Part B — Data types and formatting

1. Student registration number: text, because it is an identifier.
2. Order quantity: whole number/integer, if fractional quantities are not allowed.
3. Sales amount: numeric/currency, with the currency clearly documented.
4. Registration date: date.
5. Customer phone number: text, to preserve leading zeroes and symbols.
6. Discount rate: numeric value displayed as a percentage.
7. Payment status: categorical text.
8. Product weight: decimal number, with unit documented as kilograms.

A phone number is not a quantity for arithmetic. Changing display format changes how a value appears, while changing the value changes the underlying content. Currency must be explicit because 125,000 naira and 125,000 dollars are not interchangeable.

## Part C — Dataset structure

Possible problems:
- A title and blank row interrupt the data table.
- Department and phone number are combined in one field.
- Subtotals are mixed with individual staff records.
- Column headings may not be on the first row of the data range.
- The sheet may contain inconsistent formats.

Better structure: one header row, one row per staff member, separate columns for name, department, phone number and monthly salary, and no inserted subtotal rows within the raw table. Put the report title and summary outside the raw data or on a separate sheet.

## Part D — Practical tasks

The workbook should have three sheets:
- Raw_Data: an unchanged copy of the imported records.
- Working_Data: a formatted Excel Table with clear headings.
- Documentation: description, field list, record count and preparation notes.

Expected actions:
- Table is created with headers enabled.
- Table name is EventRegistrations.
- Registration_Date is displayed consistently as a date.
- Attendance_Fee_NGN is displayed as naira currency.
- Sorts and filters apply to the complete table.
- Freeze Top Row keeps headings visible while scrolling.

The exact row order after sorting depends on the sort settings. The important point is that every row's values remain together.

## Part E — Short answers

1. Preserve the raw-data sheet so you can compare, recover and audit the original records.
2. Sorting changes record order; filtering temporarily hides records that do not meet selected conditions.
3. No. Filtering changes what is displayed, not the underlying records.
4. Sorting one column alone can mismatch values from different records.
5. Tables make data easier to format, filter, expand and reference in later formulas.
6. It keeps the first row visible while scrolling down.
7. CSV does not preserve multiple worksheets, Excel formatting, charts or working workbook features.
8. Hidden sheets can be unhidden; hiding is not encryption or access control.

## Part F — Scenario

1. Use filters on the State, Registration_Date and Membership_Status columns.
2. The dataset needs consistent state names, valid dates and membership status values.
3. Apply filters rather than deleting rows. Keep an untouched source copy.
4. Investigate date conventions and convert consistently only after confirming how dates are represented.
5. The source copy allows comparison, recovery and auditing if the working sheet is changed incorrectly.

## Assignment review checklist

A good workbook:
- has all three required sheets,
- preserves Raw_Data,
- contains a clean rectangular data range,
- uses sensible formats,
- has a correctly named Excel Table,
- sorts complete records,
- filters without deleting records,
- freezes the heading row,
- documents what was done.

Do not penalise a learner because their Excel version uses slightly different menu names or ribbon layouts, provided the result is correct.
