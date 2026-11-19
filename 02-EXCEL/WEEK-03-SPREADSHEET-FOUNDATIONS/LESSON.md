# Week 3 — Spreadsheet Foundations

**Estimated study time:** 8–10 hours  
**Level:** Complete beginner  
**Main tool:** Microsoft Excel (Excel for the web is acceptable for most activities)

## 1. Learning objectives

By the end of this week, you should be able to:

1. Explain what a spreadsheet is and how analysts use it.
2. Distinguish a workbook from a worksheet.
3. Identify rows, columns, cells, ranges and cell addresses.
4. Enter, edit, select, copy, move and delete data safely.
5. Recognise common spreadsheet data types.
6. Apply appropriate text, date, number and currency formatting.
7. Structure a dataset so that it is easy to sort, filter and analyse.
8. Convert a data range into an Excel Table and explain its benefits.
9. Sort and filter records without separating values from their rows.
10. Use basic worksheet management features, Freeze Panes, Find and Replace, and save work in appropriate formats.

## 2. What is a spreadsheet?

A spreadsheet is a digital document that organises information in a grid of rows and columns. It can store records, perform calculations, summarise information and support reporting.

Examples of spreadsheet use:
- a shop tracking daily sales,
- a student tracking examination scores,
- a marketing team recording campaign performance,
- an organisation managing event registrations,
- a business monitoring expenses and inventory.

Spreadsheets are useful because they let people organise, inspect, calculate and communicate information. They are not automatically reliable: poorly structured or incorrectly edited spreadsheets can lead to incorrect conclusions.

## 3. Workbook, worksheet, rows, columns and cells

### Workbook

A workbook is the complete Excel file. It can contain one or more worksheets.

Example: `Community_Event_Analysis.xlsx` is a workbook.

### Worksheet

A worksheet is an individual tab inside a workbook. You can use different worksheets to separate related parts of a task.

Example:
- Raw Data
- Working Data
- Documentation

### Rows

Rows run horizontally and are identified by numbers: 1, 2, 3, and so on.

In a typical dataset, each row after the header represents one record. For example, one row may represent one event registration.

### Columns

Columns run vertically and are identified by letters: A, B, C, and so on.

In a typical dataset, each column represents one variable or attribute, such as Registration_ID, Department or Registration_Date.

### Cells

A cell is the intersection of a row and a column.

For example:
- A1 is column A, row 1.
- C5 is column C, row 5.
- F12 is column F, row 12.

The cell address is also called a cell reference.

### Range

A range is a group of one or more cells.

Examples:
- A1:A10 — cells A1 through A10 in column A.
- B2:D8 — a rectangular block from B2 to D8.
- A:A — the entire column A.
- 1:1 — the entire first row.

**Try it:** Open a blank workbook. Click cell C5 and observe the Name Box. Type `Hello` and press Enter. Click A1:A5 by selecting A1 and dragging down to A5.

## 4. Understanding the Excel interface

The main parts you should recognise:

- **Ribbon:** the command area organised into tabs such as Home, Insert, Page Layout, Formulas, Data and View.
- **Name Box:** displays the active cell address and can be used to move to a specific cell or range.
- **Formula Bar:** displays the contents of the active cell. It can show text, a number or a formula.
- **Worksheet tabs:** allow you to move between sheets.
- **Status Bar:** displays useful information such as selection statistics and view controls.
- **Quick Access Toolbar:** provides shortcuts to frequently used actions, depending on the Excel version and configuration.

The interface may look slightly different in Excel for the web, Windows or Mac. The core spreadsheet concepts remain the same.

## 5. Entering and editing data

### Entering data

1. Open Excel and create a blank workbook.
2. Select a cell.
3. Type the value.
4. Press Enter to confirm and move to another cell.
5. Use Tab to move across a row.

You can enter text, numbers and dates. Excel may automatically interpret what you type, so always check that the result is correct.

### Editing a cell

- Double-click the cell to edit within it.
- Select the cell and edit its content in the Formula Bar.
- Select the cell and type a new value to replace its existing content.
- Press Delete to clear cell contents. This is different from deleting the entire cell and shifting neighbouring cells.

### Undo and Redo

Undo reverses a recent action. Redo restores an action that was undone. Learn the toolbar buttons and common keyboard shortcuts:
- Undo: Ctrl+Z on Windows.
- Redo: Ctrl+Y on Windows (shortcut behaviour can vary by application/version).

Use Undo carefully, especially after sorting or deleting data.

### Copy, cut and paste

- Copy duplicates selected content.
- Cut moves selected content.
- Paste places copied or cut content elsewhere.

When working with a dataset, make sure you select the intended cells. Pasting over existing records can silently replace important information.

### Fill handle

The fill handle is the small square at the bottom-right corner of a selected cell or range. It can copy values or extend a recognised series.

Example: enter January in A1 and February in A2, select both, then drag the fill handle down. Excel may continue the month sequence.

Always inspect the generated values. AutoFill can infer a pattern you did not intend.

## 6. Selecting and navigating

Useful ways to select data:
- Click a cell to select one cell.
- Drag across cells to select a range.
- Click a column letter to select a column.
- Click a row number to select a row.
- Use Ctrl+A within a data region to select the current region or, in some contexts, the whole sheet.
- Use the Name Box to jump directly to a range such as A1:G31.

Useful navigation shortcuts on Windows:
- Ctrl+Home: move to the beginning of the worksheet.
- Ctrl+End: move to the last used cell.
- Ctrl+Arrow key: move to the edge of a data region.
- Ctrl+S: save the workbook.
- Ctrl+C / Ctrl+V: copy / paste.
- Ctrl+X: cut.

Shortcuts can differ on Mac and in browsers. Menu commands are acceptable if shortcuts are unavailable.

## 7. Data types and number formats

A cell's underlying value and its display format are not always the same thing.

### Text

Examples: customer name, city, product category and registration ID.

Identifiers such as `REG0001` should be preserved as text. A numeric-looking student ID or phone number is usually an identifier, not a value for arithmetic.

### Numbers

Examples: quantity, score, age and number of registrations.

### Dates and times

Examples: 19-Nov-2026 or 14:30.

A date may be stored internally as a serial number and displayed in a date format. Changing the display format does not necessarily change the underlying date.

### Currency

Use a currency or accounting number format for money. If a dataset contains Nigerian naira, display the currency clearly, for example ₦15,000.00. Keep the unit clear in the column name or documentation.

### Percentages

A percentage format changes how a numeric value is displayed. For example, 0.25 displayed as a percentage becomes 25%.

### Why formatting matters

Suppose a date is stored as a date value but displayed as a serial number. The data may be correct but difficult to interpret. Formatting helps people read the information.

**Important:** formatting is not the same as cleaning. Making a cell look like a date does not prove the underlying value is a valid date.

## 8. Basic formatting

The Home tab contains common formatting controls.

You should practise:
- font type and size,
- bold and italic,
- font colour and fill colour,
- horizontal and vertical alignment,
- borders,
- Wrap Text,
- number formats,
- decimal places,
- column width and row height.

### A sensible formatting approach

1. Make header labels clear and consistent.
2. Use one readable font.
3. Format dates consistently.
4. Format money as currency and quantities as numbers.
5. Widen columns so important values are visible.
6. Use Wrap Text for long headings.
7. Avoid excessive colours, merged cells and decorative formatting in raw datasets.

**Analyst rule:** keep raw data simple. Save elaborate presentation formatting for reports and dashboards, not the source table.

## 9. How to structure a dataset correctly

A well-structured dataset usually follows these principles:

1. One row represents one observation or record at a clearly defined level.
2. One column represents one variable.
3. The first row contains clear, unique column headings.
4. Each column contains one kind of information.
5. There are no completely blank rows or columns inside the data table.
6. Avoid merged cells inside the dataset.
7. Do not place subtotals or explanatory paragraphs inside the raw data.
8. Keep units clear, preferably in column names or a data dictionary.
9. Use consistent categories and formats.
10. Preserve a unique identifier where one exists.

### Example of a poorly structured table

| Event registrations |  |  |
|---|---|---|
| Date: November 2026 |  |  |
| Student | Department | Details |
| Ada | Computer Science | 19/11/2026, Paid |
| Tunde | Economics | 20/11/2026, Pending |

Problems:
- The title and date notes are mixed into the data.
- The Details column contains multiple pieces of information.
- There is no registration identifier.
- The date and payment status are not separate fields.

### A better structure

| Registration_ID | Student_Name | Department | Registration_Date | Payment_Status |
|---|---|---|---|---|
| REG001 | Ada | Computer Science | 2026-11-19 | Paid |
| REG002 | Tunde | Economics | 2026-11-20 | Pending |

Now each column contains one variable, and each row represents one registration.

## 10. Excel Tables

An Excel Table is a structured range of related data. It is more than a coloured range of cells.

### How to create a Table

1. Click any cell inside your dataset.
2. Select Insert → Table, or use Ctrl+T on Windows.
3. Check the selected range.
4. Tick "My table has headers" if the first row contains field names.
5. Confirm.

### Benefits of Tables

- Consistent table formatting.
- Filter buttons on column headings.
- Easier expansion when new rows are added.
- Structured references when you learn formulas.
- Better support for sorting and filtering.
- Tables can be given meaningful names, such as `EventRegistrations`.

### Naming a Table

1. Click inside the table.
2. Open the Table Design tab (the name may vary by version).
3. Find the Table Name box.
4. Enter a short meaningful name without spaces, such as `EventRegistrations`.

Do not use a table name that is confusing or identical to another table name in the workbook.

## 11. Sorting data

Sorting changes the order in which records appear.

Examples:
- sort registration dates from oldest to newest,
- sort scores from highest to lowest,
- sort departments alphabetically.

### Safe sorting steps

1. Click a cell inside the table.
2. Use the filter arrow in the column heading or the Data tab.
3. Choose the required sort order.
4. Check that the entire record moved together.

**Critical warning:** never sort only one column of a multi-column dataset unless you deliberately intend to separate it from the other columns. Doing so can mismatch names, dates, departments and payment statuses.

### Multi-level sorting

You can sort by more than one field. For example:
1. Department A to Z.
2. Within each department, Registration_Date oldest to newest.

Use the Sort dialog to add levels.

## 12. Filtering data

Filtering temporarily displays only records that meet selected conditions. It does not delete the other records.

Examples:
- show only Computer Science registrations,
- show only Pending payments,
- show registrations after a particular date,
- show records from one event location.

### How to filter

1. Click inside the table.
2. Open the filter arrow for the relevant heading.
3. Select or search for the values you want.
4. Apply the filter.
5. Clear the filter when you want to see all records again.

Filtering is useful for answering focused questions without changing the underlying dataset.

## 13. Find and Replace

Find helps locate a value. Replace changes matching values.

Example: search for `Comp Sci` to locate inconsistent department labels.

Before using Replace:
- confirm that the old value has one intended meaning,
- check whether the replacement will affect unrelated text,
- consider replacing within the selected column rather than the whole workbook,
- inspect the results.

Do not use broad replacements that may change legitimate values.

## 14. Freeze Panes

When a worksheet contains many rows, the header may disappear as you scroll.

Freeze Panes keeps selected rows or columns visible.

Typical uses:
- freeze the top row to keep column headings visible,
- freeze the first column to keep an identifier visible,
- freeze both top rows and left columns when appropriate.

To freeze the top row, use View → Freeze Panes → Freeze Top Row. Menu wording may vary by version.

## 15. Managing worksheets and workbooks

Practise:
- adding a worksheet,
- renaming a worksheet,
- moving or copying a worksheet,
- changing worksheet tab colour,
- hiding and unhiding a worksheet,
- saving a workbook,
- using Save As to create a separate copy.

Use meaningful sheet names such as `Raw_Data`, `Working_Data` and `Documentation`.

A hidden worksheet is not a secure place for confidential information. Hiding a sheet does not provide privacy or access control.

## 16. Excel file formats: XLSX and CSV

### XLSX

The standard Excel workbook format. It can store multiple worksheets, formatting, tables, formulas, charts and other workbook features.

### CSV

CSV means comma-separated values. It stores plain tabular text, usually as one sheet's data. It does not preserve Excel formatting, multiple worksheets, formulas as working formulas, charts or table features.

Use CSV when exchanging simple tabular data between systems. Use XLSX when you need a workbook with multiple sheets and Excel features.

When opening a CSV, check:
- date interpretation,
- leading zeroes in identifiers,
- delimiters,
- text encoding,
- decimal separators.

Do not assume that a CSV import has interpreted every column correctly.

## 17. Worked practical example

Imagine an OAU student association has 30 registrations for a career event. The committee wants to:
- see registrations by department,
- identify unpaid registrations,
- sort by registration date,
- keep the headings visible while reviewing records,
- preserve the original export.

A sensible workbook structure is:

**Sheet 1 — Raw_Data:** untouched source export.

**Sheet 2 — Working_Data:** a copy converted to a Table, with consistent headings and appropriate display formats.

**Sheet 3 — Documentation:** a short description of the dataset, its columns, any changes made and limitations.

The committee can then filter Payment_Status to Pending or sort Registration_Date from oldest to newest without altering the raw source.

## 18. Common beginner mistakes

1. Confusing a workbook with a worksheet.
2. Putting multiple variables in one column.
3. Using merged cells inside a dataset.
4. Leaving blank rows in the middle of a data table.
5. Formatting an identifier as a number and losing leading zeroes.
6. Assuming number formatting changes the actual value.
7. Sorting only one column and mismatching records.
8. Deleting filtered rows by mistake.
9. Overwriting the raw data.
10. Saving a workbook as CSV and expecting multiple sheets and formatting to remain.
11. Using too many colours and decorative styles.
12. Forgetting to save changes.

## 19. Week 3 practice and assessment

Complete [the exercises](EXERCISES.md), then complete the [spreadsheet foundations assignment](ASSIGNMENT.md) with the supplied CSV file.

Check your work with the [answer guide](ANSWER-GUIDE.md) after attempting the tasks.

## 20. Completion checklist

- [ ] I can explain workbook, worksheet, row, column, cell and range.
- [ ] I can navigate and select cells and ranges.
- [ ] I can enter, edit, copy and move data.
- [ ] I understand common data types and identifiers.
- [ ] I can apply appropriate number and date formats.
- [ ] I can structure a clean dataset.
- [ ] I can create and name an Excel Table.
- [ ] I can sort and filter without damaging records.
- [ ] I can freeze headings and manage worksheets.
- [ ] I understand XLSX and CSV differences.
- [ ] I have completed the practical workbook assignment.

**Next week:** Excel formulas and functions — calculations, cell references in formulas, SUM, AVERAGE, COUNT, logical functions and conditional calculations.
