# Week 2 — Exercise Answer Guide

Attempt the exercises before using this guide. These are model answers; other answers can be accepted when the reasoning is sound.

## Part A — Data structure and types

1. Structured data has a defined row-and-column structure (sales spreadsheet, student score table). Semi-structured data uses labels or nested structures without a rigid table (JSON, XML). Unstructured data does not have a simple predefined tabular structure (photos, audio, free-text reviews).
2. Order_ID: text/identifier; Customer_Name: text; Order_Date: date; Quantity: integer; Unit_Price: decimal/currency; Payment_Status: categorical text.
3. Phone numbers are identifiers, not quantities. Storing as text preserves leading zeroes and symbols such as +.
4. It may mean 11 December or 12 November depending on the convention. Confirm before conversion.
5. An order ID labels a transaction. Arithmetic on it has no meaningful business interpretation.

## Part B — Sources and sampling

1. Primary: survey customers directly; interview campaign customers. Secondary: existing sales records; published market research.
2. The sample may not represent students in other departments, levels or schedules.
3. Population is the full group the question concerns; a sample is the subset observed.
4. A sampling frame is the list/source from which the sample is selected.
5. Followers who are active and interested in the topic may be more likely to respond than quiet followers or non-followers.
6. Large size does not remove systematic selection bias or measurement error.

## Part C — Quality dimensions

1. Completeness — required order dates are absent.
2. Accuracy — recorded amount differs from the receipt. Validity may also be affected if the amount breaks an expected range, but the direct evidence is inaccuracy.
3. Uniqueness — a transaction line may have been recorded twice.
4. Timeliness — the file may be too old for today's stock decision.
5. Validity — status is outside the approved list.
6. Consistency — category spelling/case varies. Standardise only after confirming they mean the same city.

## Part D — Missing values, duplicates and outliers

1. Zero is a real numeric value. Replacing blanks with zero can falsely lower totals or averages and misrepresent unknown values.
2. An exact duplicate matches across all relevant fields. A potential duplicate shares an identifier or key but may differ in other fields and needs investigation.
3. No. Ada may have placed 15 separate orders. Check the order identifier, transaction date and record grain.
4. Possible explanations: typing error, bulk order, special event, different unit, genuine premium item, fraud or unusual activity. Check receipts, order details, product catalogue, other transactions and the business owner.
5. Not automatically. Negative quantity could represent a return or reversal if the system records it that way. Check transaction type and business rules.
6. 88 records have phone numbers. Completeness = 88 ÷ 100 × 100 = **88%**.

## Part E — Correlation and causation

1. December may include seasonal demand, holidays, price changes, promotions or more operating days. Adverts and sales rising together does not isolate the effect of adverts.
2. Hot weather may increase both ice-cream sales and electricity use. Temperature is a possible third variable.
3. Better wording: "Sales increased during the period when the new Instagram campaign ran. Further analysis is needed to estimate how much of the increase, if any, was attributable to the campaign."
4. Did the proposed cause occur first? What other factors could explain the outcome? Is there a credible comparison or research design?

## Part F — Mini-mart scenario

Potential issues include:
- date formats vary,
- city case varies,
- negative quantity,
- missing quantities,
- repeated M004 order details,
- unusually high Beans unit price,
- possible incorrect data types,
- no currency or unit metadata in the column names beyond NGN.

Dimensions:
- date formatting: consistency/validity,
- city case: consistency,
- negative quantity: validity under ordinary-sale assumptions,
- blank quantity: completeness,
- repeated M004: possible uniqueness issue,
- high price: possible accuracy issue, but it is not proven inaccurate from the file alone.

Investigate M004 using a source transaction or order-line key before deleting anything. The high Beans price should be compared with the receipt, product catalogue and nearby transactions. Do not simply replace ₦420,000 with ₦42,000 because it looks plausible.

Possible validation rules:
- dates must parse as valid dates,
- quantities must be positive integers for ordinary sales,
- unit price must be numeric and non-negative,
- order ID must not be blank,
- city must match a standardised approved list.

## Part G — Data dictionary

Example:

| Field | Meaning | Type | Example | Rule |
|---|---|---|---|---|
| Student_ID | Unique student identifier | Text | OAU/2025/001 | Required; preserve leading zeroes |
| Course_Code | Registered course | Text/category | CSC201 | Must match approved course list |
| Exam_Date | Examination date | Date | 2026-11-19 | Valid calendar date |
| Score | Mark achieved | Decimal/integer | 72 | Between 0 and maximum possible mark |
| Attendance_Status | Attendance state | Category | Present | Must match approved values |
| Department | Student's department | Category/text | Computer Science | Must match approved department list |

## Part H — Reflection

A strong answer explains that poor-quality data can produce misleading totals, incorrect comparisons, unfair decisions, wasted resources and loss of trust. It should mention that quality is assessed in relation to the purpose and that analysts should inspect, validate and document data before relying on it.

## Assignment review notes

A strong audit does not claim more than the evidence supports. For example:
- "This price is unusually high and needs verification" is defensible.
- "This price is definitely a typing error" is not defensible without evidence.
- "These rows share an order ID and may be duplicates" is careful.
- "Delete every repeated customer name" is not careful.

The learner should preserve the raw file, use a documented key to investigate duplicates, explain all transformations and state unresolved limitations.
