# Week 2 Assignment — Data Quality Audit

<badge>Assessed practical deliverable</badge>

## Objective

Inspect a messy sales dataset, identify quality risks, define rules, document cleaning decisions and produce a validated cleaned copy.

## Dataset

Use [mini_mart_sales_messy.csv](practice-data/mini_mart_sales_messy.csv).

This is a synthetic teaching dataset. It does not represent real customers or a real business. It intentionally contains issues for learning purposes.

## Scenario

You have been given an export of mini-mart sales transactions. The owner wants to use it to understand sales by product, city and date. Before any analysis begins, you have been asked to assess whether the records are fit for that purpose.

## Your tasks

### Task 1 — Understand the dataset

1. State what one row appears to represent.
2. Describe each column in your own words.
3. Identify which fields could act as identifiers.
4. List any assumptions you need to make.
5. Create a data dictionary.

### Task 2 — Audit data quality

Inspect every column and the dataset as a whole.

Identify and report:
- missing values,
- exact or potential duplicates,
- inconsistent categories and formatting,
- invalid values,
- unusual values or possible outliers,
- possible data-type problems,
- any limitations that cannot be resolved from the file alone.

For every issue, include:
- the field or record affected,
- the evidence,
- the quality dimension,
- why it matters,
- what you recommend doing.

### Task 3 — Define validation rules

Write at least six validation rules. Examples:
- Order_ID must not be blank.
- Quantity must be a positive whole number for ordinary sales records, unless returns are explicitly represented.
- Unit_Price_NGN must be numeric and non-negative.
- Order_Date must be a valid date.
- Product must match an approved product list.
- City values must use an agreed standard spelling.

Do not apply a rule blindly if the business process may allow exceptions. State the assumption.

### Task 4 — Clean a copy of the data

Create a separate cleaned file. Preserve the original CSV unchanged.

Your cleaned file should:
- use consistent column names,
- use consistent date formatting,
- standardise confirmed category variations,
- handle missing values transparently,
- flag unresolved issues,
- avoid deleting potential duplicates without evidence,
- retain genuine unusual values.

If you cannot verify a value, do not invent a correction. Flag it for review.

### Task 5 — Validate the cleaned output

Compare the original and cleaned versions.

Report:
- original row count,
- cleaned row count,
- number of rows removed, if any, and why,
- number of values standardised,
- number of missing values remaining,
- number of unresolved issues,
- any changes to totals and why they occurred.

Check that your cleaning has not accidentally removed legitimate transactions or changed values without explanation.

### Task 6 — Write a short audit report

Your report should contain:

1. Purpose and scope.
2. Dataset description.
3. Data dictionary.
4. Quality findings.
5. Validation rules.
6. Cleaning decisions and reasons.
7. Before-and-after checks.
8. Limitations and unresolved questions.
9. Recommendation to the business: is the dataset ready for the intended analysis, ready with caveats, or not yet ready?

## Required submission files

Create a folder named `week-02-data-quality-audit` containing:

- `README.md` — summary and instructions.
- `data-dictionary.md`
- `data-quality-audit.md`
- `cleaning-log.md`
- `mini_mart_sales_cleaned.csv`
- `limitations-and-assumptions.md`

You may use a spreadsheet editor or text editor. You are not expected to know advanced Excel yet. The goal is to practise careful inspection and documentation.

## Assessment

The programme's assessment rubric applies. Particular attention will be given to:
- identifying real issues rather than guessing,
- correct use of quality dimensions,
- sensible validation rules,
- justified cleaning decisions,
- preservation of the raw data,
- clear documentation,
- honest treatment of uncertainty.

**Pass target:** 70%.

## Important rules

- Never overwrite the raw CSV.
- Do not delete rows simply because they look unusual.
- Do not fill blanks with zero without a justified reason.
- Do not invent missing information.
- Do not claim a value is inaccurate without evidence.
- Clearly label assumptions.
- Submit work you completed and can explain.
