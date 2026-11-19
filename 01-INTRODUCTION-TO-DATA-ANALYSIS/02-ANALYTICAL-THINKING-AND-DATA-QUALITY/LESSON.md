# Week 2 — Analytical Thinking and Data Quality

**Phase:** Foundations  
**Estimated study time:** 8–10 hours  
**Level:** Complete beginner  
**Required output:** A data-quality audit and cleaning log

## 1. Learning objectives

By the end of this week, you should be able to:

1. Explain why analysts must question data before using it.
2. Distinguish structured, semi-structured and unstructured data.
3. Identify common data types and explain why correct data types matter.
4. Describe primary and secondary data sources.
5. Explain population, sample, sampling frame and sampling bias.
6. Assess data using six common quality dimensions.
7. Identify missing values, duplicates, inconsistent values, invalid values and outliers.
8. Explain why unusual values should be investigated rather than automatically deleted.
9. Distinguish correlation from causation.
10. Create a basic data dictionary and document cleaning decisions.

## 2. Analytical thinking: question before calculation

Analytical thinking means approaching a question logically, breaking it into smaller parts, checking assumptions and using evidence before reaching a conclusion.

A good analyst does not simply ask, “What does the spreadsheet show?” The analyst asks:
- Who created these records?
- What does each row represent?
- What does each column mean?
- Which records should be included?
- Are important records missing?
- Could the way data was collected distort the result?
- Does the data actually answer the question?
- What evidence would challenge my first interpretation?

### Example

A mini-mart owner says, “Our sales dropped because customers no longer like our products.”

That is a hypothesis, not an established fact.

Other possible explanations include:
- the shop opened fewer days,
- popular products were out of stock,
- prices changed,
- transactions were not fully recorded,
- a payment channel was omitted,
- the comparison periods cover different numbers of days,
- the customer base changed.

An analyst tests possible explanations rather than accepting the first explanation offered.

## 3. Understanding data structure

### 3.1 Structured data

Structured data is organised according to a defined format, often rows and columns.

Examples:
- a sales spreadsheet,
- a student score table,
- a customer database table,
- a monthly expense report.

A simple sales table might contain:

| Order ID | Order date | Product | Quantity | Unit price |
|---|---|---|---:|---:|
| ORD001 | 2026-10-01 | Rice | 2 | 85000 |
| ORD002 | 2026-10-01 | Beans | 1 | 42000 |

Each row represents an order record and each column represents an attribute.

### 3.2 Semi-structured data

Semi-structured data does not follow a rigid table structure throughout, but it contains labels, tags or other organisation.

Examples:
- JSON files,
- XML documents,
- application logs,
- some email data.

Example of a JSON-like order record:

```json
{
  "order_id": "ORD001",
  "customer": {
    "name": "Ada",
    "city": "Ibadan"
  },
  "items": [
    {"product": "Rice", "quantity": 2}
  ]
}
```

The fields are labelled, but records can contain nested objects and arrays.

### 3.3 Unstructured data

Unstructured data does not arrive in a simple predefined row-and-column format.

Examples:
- customer review text,
- photographs,
- audio recordings,
- videos,
- scanned documents.

A business may analyse review text to understand common complaints, but it may first need to extract or classify information from the text.

**Remember:** the type of data affects the tools and methods needed to work with it.

## 4. Common data types

A data type describes the kind of value stored in a field. Correct data types help software interpret values properly.

| Data type | Meaning | Example |
|---|---|---|
| Integer | Whole number | 12 orders |
| Decimal / float | Number with a fractional part | 12.75 kg |
| Text / string | Characters | "Ibadan" |
| Date | Calendar date | 2026-10-19 |
| Time | Time of day | 14:30 |
| Boolean | True or false | TRUE |
| Categorical | A value belonging to a group | "Paid", "Pending" |

Categorical data may be stored as text or as codes. For example, a satisfaction score from 1 to 5 is numeric in storage but may represent ordered categories.

### Important distinction: numbers that are identifiers

A phone number, student registration number or order ID may contain digits, but it is usually an identifier, not a quantity.

You should not calculate the average of customer phone numbers or add order IDs together. Treat identifiers as labels.

### Dates stored as text

The values `19/10/2026`, `2026-10-19` and `Oct 19, 2026` may refer to the same date, but software may interpret them differently. Standardise date formats only after confirming the intended day, month and year.

## 5. Where does data come from?

### 5.1 Primary data

Primary data is collected directly for the specific purpose of the current investigation.

Examples:
- conducting a customer survey,
- interviewing shop owners,
- observing queue length,
- running an experiment,
- recording product sales at the point of purchase.

**Advantages:** the collection can be designed around the question, and the analyst may have more control over definitions and methods.

**Limitations:** collection can be expensive or slow; poor survey design or incomplete responses can introduce bias.

### 5.2 Secondary data

Secondary data was collected earlier or by another person or organisation, often for a different purpose.

Examples:
- published government statistics,
- an organisation's historical sales records,
- a research report,
- a public dataset,
- an existing customer database.

**Advantages:** it may be quicker and cheaper to obtain.

**Limitations:** definitions, coverage, collection methods and dates may not match the current question.

### 5.3 Questions to ask about a source

Before using a dataset, document:
- who collected it,
- why it was collected,
- when it was collected,
- how it was collected,
- which people, events or locations it covers,
- what each field means,
- whether access and use are permitted,
- what is missing or excluded.

A dataset being publicly downloadable does not automatically mean every possible use is appropriate. Respect privacy, licences and terms of use.

## 6. Population, sample and sampling

### Population

The full group you want to understand.

Example: all customers who purchased from a mini-mart during October.

### Sample

A subset of that population that is actually observed or surveyed.

Example: 100 customers selected from the mini-mart's October customer records.

### Sampling frame

The list or source from which the sample is selected.

Example: the customer transaction list for October.

### Census

A study that attempts to collect information from every member of the defined population.

A census may still have missing or inaccurate records. Collecting data from everyone does not automatically make it high quality.

### Common sampling methods

**Simple random sampling:** each eligible member has a known, equal chance of selection.

**Systematic sampling:** select records using a fixed interval after an appropriate starting point. For example, every 10th transaction.

**Stratified sampling:** divide the population into meaningful groups (strata), then sample from each group. For example, select customers from each branch.

**Convenience sampling:** select whoever is easiest to reach. It is quick, but it can produce a biased sample.

**Voluntary response sampling:** people choose whether to respond. People with strong opinions may be more likely to participate.

### Sampling bias

Sampling bias occurs when the selection process systematically makes some members of the population more or less likely to be included.

Example: a university asks only students who attend a morning lecture whether the timetable works for everyone. Students who attend afternoon classes or do not attend that lecture are excluded.

The responses may not represent the entire student population.

### Sample size is not the only issue

A very large biased sample can still produce misleading conclusions. A smaller, well-designed sample may be more useful than a large sample collected in a systematically biased way.

Ask:
- Does the sample cover the population?
- Who was excluded?
- How were people selected?
- Did some groups have a lower chance of participating?
- Are non-responses likely to differ from responses?

## 7. What is data quality?

Data quality describes how suitable data is for a particular use.

There is no universal dataset that is simply “good” or “bad” for every task. A dataset can be suitable for one question and unsuitable for another.

For example, a sales file updated yesterday may be suitable for a monthly sales review but unsuitable for analysing a customer's lifetime purchase history if it contains only the latest month.

We will use six widely recognised dimensions.

### 7.1 Accuracy — Does it reflect reality?

Accuracy is about whether recorded values correctly represent the real-world event or object.

Example: a transaction was ₦15,000, but the record says ₦150,000.

A value can look reasonable and still be inaccurate. You often need a reliable source, receipt, audit trail or independent confirmation to check accuracy.

### 7.2 Completeness — Is the required information present?

Completeness concerns whether expected records and important fields are available.

Example: 200 orders were placed, but the file contains only 180 records. Or, all 200 orders are present but 25 have no order date.

A blank is not automatically an error. Some fields may legitimately not apply. Document which fields are required and why.

A simple field completeness rate is:

`Completeness rate = (Non-missing required values ÷ Total expected values) × 100`

Example: if 90 of 100 orders have a recorded payment method, completeness is 90%.

### 7.3 Consistency — Do values agree and follow the same rules?

Consistency checks whether information follows agreed conventions and does not conflict across fields or sources.

Examples:
- "Ibadan", "ibadan" and "IBADAN" are written differently.
- One file records dates as DD/MM/YYYY while another uses MM/DD/YYYY.
- A customer is marked as "Paid" in one table and "Unpaid" in another for the same transaction.
- A quantity is 3 in the order line but 4 in the dispatch record.

Standardising spelling can improve consistency, but do not merge values that have different meanings.

### 7.4 Timeliness — Is it current enough for this task?

Timeliness concerns whether data is available and up to date when it is needed.

Example: a stock manager makes today's restocking decision using an inventory file last updated three weeks ago.

Old data is not always useless. Historical data may be exactly what is needed to analyse past performance. Whether it is timely depends on the question.

### 7.5 Validity — Does it follow the defined rules?

Validity checks whether a value follows an agreed format, type, range or business rule.

Examples:
- quantity should be a positive whole number,
- order date should be a valid date,
- status should be one of "Paid", "Pending" or "Cancelled",
- discount percentage should be between 0 and 100.

A value can be valid but inaccurate. A recorded quantity of 5 is valid if quantities must be positive whole numbers, but it may still be wrong if the customer actually ordered 6.

### 7.6 Uniqueness — Is each record represented only as intended?

Uniqueness checks whether records that should be unique appear more than once.

Example: the same order ID and order line are entered twice, causing sales to be counted twice.

Be careful: two rows with the same customer name are not necessarily duplicates. One customer can place many legitimate orders.

### Quick comparison

| Dimension | Main question | Example problem |
|---|---|---|
| Accuracy | Is it correct? | Wrong transaction amount |
| Completeness | Is required information present? | Missing order date |
| Consistency | Does it follow the same rules? | "Ibadan" and "ibadan" |
| Timeliness | Is it current enough? | Old stock file |
| Validity | Does it follow the allowed rules? | Negative quantity |
| Uniqueness | Are records duplicated? | Same order line recorded twice |

These six dimensions are commonly used, but frameworks differ. Choose dimensions that matter to the question and explain your checks.

## 8. Common data-quality problems

### 8.1 Missing values

A missing value is information that is absent from a field.

It may appear as:
- an empty cell,
- NULL,
- NA,
- "Not provided",
- a placeholder such as 0 when zero is not a genuine value.

**Why it matters:** missing values can reduce the number of usable records, distort averages, weaken comparisons or indicate a collection problem.

**What to do:**
1. Identify which fields are missing.
2. Calculate how often they are missing.
3. Find out why they are missing if possible.
4. Decide whether to leave them missing, recover them from a reliable source, exclude affected records for a specific calculation, or use a justified imputation method.
5. Document the decision.

**Do not automatically replace every blank with zero.** A missing salary is not the same as a salary of zero. A missing order quantity is not the same as no items ordered.

### 8.2 Duplicate records

A duplicate occurs when the same real-world record is represented more than once.

There are two useful ideas:

- **Exact duplicate:** every relevant field is identical.
- **Potential duplicate:** records share a key or combination of fields that should identify one event, but other fields differ.

Example: the same Order_ID and Product_ID appear twice for a transaction that should have one line.

Before deleting a duplicate:
- identify the correct unique key,
- check whether repeated rows are legitimate,
- compare timestamps or source records,
- preserve the original file,
- record how many rows were removed and why.

### 8.3 Inconsistent formatting and categories

Examples:
- "Lagos", "lagos", "LAGOS "
- phone numbers with different country-code formats,
- dates written in different orders,
- product categories such as "Beverages" and "Beverage".

Standardisation rules should be agreed and applied consistently. Keep a record of category mappings.

### 8.4 Invalid values

A value is invalid when it breaks a defined rule.

Examples:
- quantity = -4 when negative quantities are not allowed in the sales table,
- discount = 150%,
- date = 32/13/2026,
- status = "Done" when only "Paid", "Pending" and "Cancelled" are allowed.

Sometimes a negative value may be legitimate in a returns or adjustment table. Understand the business process before flagging it as an error.

### 8.5 Outliers

An outlier is an observation that is unusually far from other observations or from an expected pattern.

Example: most orders are between ₦2,000 and ₦50,000, but one order is ₦2,500,000.

Possible explanations:
- a typing error,
- a genuine bulk order,
- a special event,
- a different unit of measurement,
- fraud or unusual activity,
- a valid but rare observation.

**Do not automatically delete outliers.** First investigate the source and context. Compare with receipts, related records, business rules and other periods. If the value is genuine, it may be important.

### 8.6 Incorrect data types

Examples:
- sales amounts imported as text,
- dates treated as ordinary text,
- quantities stored with currency symbols,
- identifiers interpreted as numbers and losing leading zeroes.

Check the meaning of a field before converting it.

### 8.7 Inconsistent units

A product weight might be recorded in grams in some rows and kilograms in others. Adding the values without conversion produces a meaningless total.

Document the original unit, target unit and conversion rule.

## 9. Data cleaning: a careful workflow

Data cleaning means identifying and handling quality problems so the dataset is fit for a defined purpose. Cleaning does not mean making every cell look neat.

Follow this sequence:

1. **Keep the original.** Never overwrite the only copy of raw data.
2. **Understand the task.** Identify the questions the data must answer.
3. **Understand the structure.** Determine what each row and column represents.
4. **Inspect the data.** Review column names, types, ranges and example records.
5. **Profile quality.** Count missing values, duplicates, invalid values and unusual observations.
6. **Investigate.** Check source records and business context.
7. **Choose treatments.** Correct, standardise, flag, retain or exclude with a reason.
8. **Document.** Record the original issue, action, reason and impact.
9. **Validate again.** Recheck row counts, totals, types, ranges and key rules.
10. **Save separately.** Keep raw and cleaned outputs distinct.

### Example cleaning log

| Issue | Evidence | Action | Reason |
|---|---|---|---|
| City case differs | "IBADAN" and "Ibadan" | Standardise to "Ibadan" | Same confirmed city |
| Missing payment method | 4 records blank | Leave blank and flag | No reliable source to recover it |
| Duplicate order line | Same order and product line twice | Investigate source before removal | Could inflate sales |
| Very high order value | One value far above usual range | Verify receipt | Could be bulk purchase or entry error |

A good cleaning log makes the work reproducible and allows another analyst to understand what changed.

## 10. Correlation does not prove causation

### Correlation

Correlation describes an association between two variables: they tend to change together in some way.

Example: during a particular month, ice-cream sales and electricity use may both rise.

### Causation

Causation means a change in one factor produces a change in another, under a defensible causal explanation.

The fact that two variables move together does not prove one caused the other.

Possible explanations for an observed association:
- one variable affects the other,
- the second affects the first,
- a third variable influences both,
- the association is coincidental,
- the data collection process creates the pattern.

### Example: advertising and sales

A vendor spends more on Instagram adverts in December and also records higher sales.

Can we conclude that the adverts caused the increase?

Not yet. December may also involve:
- seasonal demand,
- more customers visiting the area,
- price promotions,
- increased stock,
- holiday spending,
- other marketing activity.

To investigate the effect of advertising, the analyst needs a stronger design and suitable comparison, not just two lines moving upward.

### Ask these questions

1. Did the supposed cause happen before the outcome?
2. What other factors may explain the pattern?
3. Are the measurements reliable?
4. Is there a suitable comparison group or baseline?
5. What evidence would challenge the explanation?

Use careful language: "is associated with", "coincided with" or "may help explain" when causation has not been established.

## 11. Data dictionaries

A data dictionary explains what fields in a dataset mean and how they should be interpreted.

Example:

| Field | Meaning | Data type | Rule / example |
|---|---|---|---|
| Order_ID | Unique transaction identifier | Text | Must not be blank |
| Order_Date | Date order was placed | Date | Valid calendar date |
| Product | Product sold | Text/category | Must match approved product list |
| Quantity | Units sold | Integer | Greater than zero for a sale |
| Unit_Price_NGN | Price per unit in naira | Decimal | Zero or greater; verify unusual values |
| Payment_Status | Payment state | Category | Paid, Pending, Cancelled |
| City | Customer delivery city | Category/text | Standardised city name |

A dictionary prevents different analysts from interpreting the same field differently.

## 12. Practical worked example

Suppose a dataset contains these records:

| Order ID | City | Quantity | Unit price (₦) |
|---|---|---:|---:|
| A101 | Ibadan | 2 | 2,000 |
| A102 | IBADAN | 1 | 2,000 |
| A103 | Lagos | -3 | 2,000 |
| A104 | Ibadan |  | 2,000 |
| A104 | Ibadan |  | 2,000 |
| A105 | Abeokuta | 1 | 250,000 |

What should the analyst do?

- Standardise "IBADAN" only after confirming it means the same city.
- Investigate the negative quantity. It might be a return, an adjustment or a mistake.
- Find out why quantity is missing in A104.
- Investigate whether the two A104 rows are a true duplicate. Do not assume based only on the visible fields.
- Verify the ₦250,000 unit price. It may be a typing error or a genuine premium product.
- Keep the raw data unchanged and record all decisions.

The analyst should not silently delete rows or replace missing quantities with zero.

## 13. Common beginner mistakes

1. Deleting every row with a blank cell.
2. Replacing missing values with zero without understanding their meaning.
3. Removing duplicate names when people can share names.
4. Treating every unusual value as an error.
5. Assuming a valid-looking value is accurate.
6. Assuming a large sample is automatically representative.
7. Ignoring how data was collected.
8. Treating correlation as proof of cause.
9. Cleaning data without preserving the original.
10. Failing to document changes.

## 14. Week 2 knowledge check and assignment

Complete [the exercises](EXERCISES.md), then perform the [data-quality audit assignment](ASSIGNMENT.md) using the provided CSV file.

Use the [answer guide](ANSWER-GUIDE.md) only after making your own attempt.

## 15. Completion checklist

- [ ] I can explain structured, semi-structured and unstructured data.
- [ ] I can identify common data types and identifiers.
- [ ] I understand primary and secondary data.
- [ ] I can explain population, sample and sampling bias.
- [ ] I can describe the six data-quality dimensions.
- [ ] I can identify missing values, duplicates, invalid values and outliers.
- [ ] I know why outliers must be investigated.
- [ ] I can explain why correlation does not prove causation.
- [ ] I can create a basic data dictionary.
- [ ] I can document and validate cleaning decisions.

**Next week:** Spreadsheet Foundations — you will learn how to work with rows, columns, tables, references and basic spreadsheet operations.
