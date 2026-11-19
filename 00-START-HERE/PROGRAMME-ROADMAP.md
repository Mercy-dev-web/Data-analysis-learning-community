# The 16-Week Data Analysis Roadmap

This roadmap is the required sequence for the community. It is designed for a complete beginner and moves from understanding data problems to delivering and presenting an end-to-end analysis.

**Time commitment:** 8–12 hours each week.  
**Progression standard:** aim for 70% or higher on assessed work.  
**Rule:** do not skip a week because you have seen a tool before. Complete the practical deliverable or demonstrate equivalent competence.

## Before Week 1: Set up

You need:
- A laptop or desktop computer.
- A spreadsheet application such as Microsoft Excel or a compatible alternative.
- Internet access for downloading learning materials and datasets.
- A GitHub account.
- A folder on your computer for raw data, working files and final submissions.

Create a learning folder with three subfolders: `raw-data`, `working-files` and `final-submissions`. Never overwrite the original dataset. Keep a separate copy for analysis.

## The weekly study cycle

| Activity | Suggested time |
|---|---:|
| Read lesson and take notes | 1–2 hours |
| Watch or follow demonstrations | 1–2 hours |
| Reproduce examples | 1–2 hours |
| Independent exercises | 2 hours |
| Weekly assignment | 2–3 hours |
| Review and progress log | 30–60 minutes |

The exact time will vary. If you cannot explain what you did, you have not finished learning it.

---

## Phase 1 — Understand data analysis

### Week 1: Introduction to data analysis

**Focus:** What data analysis is, why organisations use it and how an analyst approaches a problem.

Learn:
- Data, information, insight and evidence.
- Descriptive, diagnostic, predictive and prescriptive analysis.
- The data analysis lifecycle: understand the problem, collect, inspect, clean, analyse, communicate and review.
- Business questions, stakeholders, objectives and key performance indicators (KPIs).
- The difference between an observation, an interpretation and a recommendation.

Practise:
- Turn vague requests into clear analytical questions.
- Identify the information needed to answer a question.
- Distinguish a metric from a target.

**Deliverable:** a one-page problem brief for a familiar organisation. State the problem, stakeholder, questions, metrics, data required and possible limitations.

**Progress check:** explain the analysis lifecycle and write at least five answerable questions about a business scenario.

### Week 2: Analytical thinking and data quality

**Focus:** Learn to question data before trusting it.

Learn:
- Rows, columns, records, fields and observations.
- Qualitative and quantitative data; nominal, ordinal, discrete and continuous variables.
- Structured and unstructured data.
- Population, sample, sampling bias and representativeness.
- Missing values, duplicates, inconsistent labels, invalid values and outliers.
- Accuracy, completeness, consistency, validity, uniqueness and timeliness.
- Correlation versus causation; why an association does not automatically prove cause.

Practise:
- Inspect a small dataset.
- Create a data dictionary.
- Identify data quality problems and propose treatment.
- Record assumptions and decisions.

**Deliverable:** a data-quality audit with an issue log and a short explanation of how each issue could affect analysis.

**Gate 1:** correctly identify common data types and at least five data-quality risks. Do not begin the tool-heavy phase until you can explain why data quality matters.

---

## Phase 2 — Excel for analysis

### Week 3: Spreadsheet foundations

**Focus:** Become comfortable navigating and structuring data in Excel.

Learn:
- Workbooks, worksheets, cells, ranges, rows and columns.
- Data entry, editing, formatting and number formats.
- Good data layout: one observation per row, one variable per column, one header row.
- Sorting, filtering, tables and freeze panes.
- Relative, absolute and mixed cell references.
- Basic arithmetic and formula construction.

Practise:
- Convert a messy range into a structured table.
- Sort and filter a transaction dataset.
- Understand how cell references identify values and how references move when copied. Full formula calculations are taught in Week 4.

**Deliverable:** a structured transaction workbook with a clearly labelled data table and basic calculated columns.

### Week 4: Excel formulas and functions

**Focus:** Use formulas to answer questions accurately.

Learn and practise:
- SUM, AVERAGE, MIN, MAX and COUNT.
- COUNTA and COUNTBLANK.
- COUNTIF and COUNTIFS.
- SUMIF and SUMIFS.
- AVERAGEIF and AVERAGEIFS.
- IF, AND, OR and NOT.
- IFERROR.
- Text functions such as LEFT, RIGHT, MID, TRIM, UPPER, LOWER and PROPER.
- Date functions such as TODAY, YEAR, MONTH and DAY.
- Lookup concepts and functions such as XLOOKUP or VLOOKUP, where available.
- Absolute references and formula auditing.

**Deliverable:** a formula-based analysis sheet answering a minimum of ten business questions. Include formulas, not just typed answers.

### Week 5: Cleaning, analysis and reporting in Excel

**Focus:** Turn raw spreadsheet data into a trustworthy report.

Learn:
- Remove duplicates carefully.
- Find and handle blanks and inconsistent entries.
- Text to Columns, Find and Replace, Flash Fill and data validation.
- PivotTables and PivotCharts.
- Conditional formatting.
- Basic descriptive statistics: mean, median, mode, range, variance and standard deviation.
- Quartiles, percentiles and ranking.
- Dashboard layout, clear labels and appropriate chart selection.
- Reconciliation: check totals and compare results with the source.

**Deliverable — Project 1:** an Excel business analysis. Include a cleaned dataset, analysis sheet, PivotTable or equivalent summary, at least three useful visualisations, findings and recommendations.

**Gate 2:** submit the workbook and a short written explanation. A workbook that looks attractive but contains unchecked formulas does not pass.

---

## Phase 3 — SQL for querying data

### Week 6: Database and SQL foundations

**Focus:** Understand how relational databases store information and how to retrieve records.

Learn:
- Database, table, row, column and schema.
- Primary keys and foreign keys.
- Relationships and basic normalisation concepts.
- SQL syntax and statement structure.
- CREATE DATABASE, CREATE TABLE, INSERT INTO, USE and SELECT.
- Selecting all or specific columns, DISTINCT and basic aliases.
- Inspecting tables with SHOW TABLES and DESCRIBE.

Practise:
- Create and select a database.
- Inspect the supplied tables and their keys.
- Retrieve all columns or selected columns from one table.
- Explain what each query returns. Filtering, sorting and aggregation are developed in Week 7.

**Deliverable:** a set of at least 15 clearly formatted queries with a plain-language note describing what each query returns.

### Week 7: SQL aggregation and analysis

**Focus:** Summarise records to answer business questions.

Learn:
- WHERE and comparison operators.
- AND, OR and NOT.
- IN, BETWEEN, LIKE and IS NULL.
- ORDER BY and LIMIT.
- COUNT, SUM, AVG, MIN and MAX.
- GROUP BY and HAVING.
- Aliases, query readability and validation.

**Deliverable:** answer at least ten business questions using grouped and calculated results. Include the question, SQL query, result interpretation and any assumptions.

### Week 8: SQL joins and intermediate querying

**Focus:** Combine related tables without creating misleading results.

Learn:
- INNER JOIN, LEFT JOIN, RIGHT JOIN and FULL OUTER JOIN concepts (availability varies by database).
- Joining on keys.
- One-to-one, one-to-many and many-to-many relationships.
- Duplicate rows caused by joins.
- UNION and UNION ALL.
- Subqueries and CTEs for multi-step analysis.
- Window functions such as ROW_NUMBER, RANK and aggregate OVER clauses, as an introduction.
- Query validation and performance awareness.

**Deliverable — Project 2:** a SQL analysis using at least two related tables. Submit the questions, queries, outputs or screenshots, interpretations and a short conclusion.

**Gate 3:** demonstrate filtering, aggregation and joins. Explain how you checked that joins did not inflate totals.

---

## Phase 4 — Power BI for reporting

### Week 9: Power BI and Power Query

**Focus:** Import and transform data before building visuals.

Learn:
- Power BI Desktop interface and report workflow.
- Importing data from files and other supported sources.
- Power Query Editor.
- Data types, column names, filtering and removing errors.
- Replace values, split/merge columns and remove duplicates.
- Append versus merge queries.
- Applied steps and refresh.
- Why cleaning should be repeatable.

**Deliverable:** a Power BI file with a documented Power Query transformation process and a cleaned dataset.

### Week 10: Data modelling and DAX foundations

**Focus:** Build a model that supports accurate calculations.

Learn:
- Fact tables and dimension tables.
- Star schema and grain.
- Relationships, cardinality and filter direction.
- Date tables and basic date analysis.
- Calculated columns versus measures.
- DAX syntax and evaluation context at an introductory level.
- SUM, COUNTROWS, DISTINCTCOUNT, DIVIDE, CALCULATE and basic filter logic.

**Deliverable:** a small, correctly related data model with at least five useful measures. Validate important measures against a manual or Excel calculation.

### Week 11: Visualisation and dashboard design

**Focus:** Communicate findings, not merely decorate a page.

Learn:
- Choosing visuals based on the question and data.
- KPI cards, bar/column charts, line charts, tables and matrices.
- Slicers, filters, drill-through and interactions.
- Titles that communicate meaning.
- Colour, contrast, accessibility and visual hierarchy.
- Avoiding clutter, misleading scales and unnecessary chart types.
- Writing insight-led annotations and recommendations.

**Deliverable:** a Power BI report with a clear overview page and at least one detail page. Include a short report guide explaining the audience, key findings and limitations.

**Gate 4:** explain the model, key measures and design choices. Reconcile headline numbers with the source data.

---

## Phase 5 — Python for data analysis

### Week 12: Python foundations

**Focus:** Learn enough Python to write and understand basic analysis code.

Learn:
- Python environment and notebooks.
- Variables, data types and type conversion.
- Strings, numbers and booleans.
- Lists, tuples, dictionaries and sets.
- Indexing and slicing.
- Conditions and loops.
- Functions, parameters and return values.
- Imports, comments and readable code.
- Basic error messages and debugging.

**Deliverable:** a notebook with short exercises demonstrating each core concept.

### Week 13: Python and pandas

**Focus:** Use Python libraries to work with tabular data.

Learn:
- NumPy and pandas: what they are used for.
- Series and DataFrames.
- Reading and writing CSV and Excel files.
- Inspecting data with head, tail, info, describe and shape.
- Selecting and filtering rows and columns.
- Sorting and creating calculated columns.
- Handling missing values and duplicates.
- Grouping, aggregation and merging.
- Dates and data types.

**Deliverable:** a notebook that loads a dataset, inspects it, cleans it and answers at least eight questions.

### Week 14: Exploratory analysis and visualisation

**Focus:** Explore patterns and communicate them with code.

Learn:
- Exploratory data analysis (EDA) workflow.
- Univariate and bivariate analysis.
- Distribution, outliers and relationships.
- Grouped comparisons and trend analysis.
- Matplotlib and/or Seaborn fundamentals.
- Chart selection, labels, titles and interpretation.
- Reproducible notebooks and clear markdown explanations.
- Limitations of the data and analysis.

**Deliverable:** an EDA notebook with a clear question, documented cleaning, at least four purposeful visualisations, findings and limitations.

**Gate 5:** submit a readable notebook that runs from top to bottom and produces the reported results.

---

## Phase 6 — Capstone and portfolio

### Week 15: End-to-end capstone project

**Focus:** Apply the complete analysis process to a realistic problem.

Required stages:
1. Define a real, specific problem and its audience.
2. Write the main question and supporting questions.
3. Find and cite an appropriate dataset.
4. Inspect the data and create a data dictionary.
5. Clean and document the data.
6. Analyse it using suitable tools from the programme.
7. Validate important figures.
8. Identify findings supported by evidence.
9. Make practical recommendations.
10. Document limitations and next steps.

**Deliverable:** a complete project folder with the problem brief, source information, cleaned data or reproducible cleaning steps, analysis files, visual output and written report.

Choose a problem that can be answered with the data available. Do not make claims the dataset cannot support.

### Week 16: Portfolio, GitHub and presentation

**Focus:** Make your work understandable to another person.

Learn:
- Repository structure and useful file names.
- Writing a project README.
- Explaining the problem, data source, methods, findings and recommendations.
- Screenshots and links to dashboards where sharing is permitted.
- Documenting assumptions, limitations and tools.
- Presenting a project in 5–7 minutes.
- Answering questions about decisions and results.
- Identifying the next skills to practise.

**Final deliverable:** a portfolio containing at least three documented projects: Excel, SQL and capstone. Present the capstone and submit a personal reflection on strengths, gaps and next steps.

---

## Completion requirements

A learner is considered to have completed the programme when they have:
- Worked through all 16 weeks in order.
- Submitted the required weekly deliverables.
- Met the recommended 70% threshold on assessed milestones, or completed revisions where needed.
- Completed the Excel, SQL and capstone projects.
- Published clear project documentation.
- Presented the capstone and explained their analytical decisions.

## Important note

This is a structured foundation, not a promise that 16 weeks makes someone an expert. Data analysis improves through repeated work on unfamiliar datasets, feedback, domain knowledge and careful communication.
