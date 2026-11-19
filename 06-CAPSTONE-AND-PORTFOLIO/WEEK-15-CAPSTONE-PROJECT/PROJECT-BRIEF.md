# Week 15 Capstone Project: NaijaGlow Retail Performance

## Your role
You are a junior data analyst hired by **NaijaGlow**, a fictional Nigerian personal-care retailer. Management wants a clearer picture of sales performance and practical recommendations for the next quarter.

You have six months of sales activity, customer details and product information. Your task is to complete an end-to-end analysis using the tools learned in this programme.

**This is an individual capstone.** You may discuss ideas with peers, but your analysis, code, workbook, dashboard and explanations must be your own.

## Business questions
Your final report must answer:
1. How much net revenue, product cost and gross profit did the business generate?
2. How did revenue change month by month?
3. Which product categories and products contributed most to revenue and gross profit?
4. Which cities contributed most to revenue?
5. How do Online and Store channels compare in revenue, order count, units and gross margin?
6. What differences appear between New and Returning customer segments?
7. What should management investigate or do next quarter?

You may add two or three useful questions of your own. Avoid questions the dataset cannot answer, such as customer satisfaction or advertising return on investment.

## Dataset
Use the three CSV files in `data/`:
- `customers.csv`
- `products.csv`
- `sales.csv`

Read [DATA-DICTIONARY.md](DATA-DICTIONARY.md) before analysis. The dataset is fictional. Each sales row is one order line; an order may have multiple lines.

## Required workflow

### Phase 1 — Understand and plan
- Read the scenario, data dictionary and business questions.
- Identify the grain, primary keys and foreign keys.
- Write down the questions you intend to answer.
- Keep an untouched copy of the raw files.

### Phase 2 — Excel: inspect and explore
- Import the CSVs into separate sheets.
- Check row counts, blanks, duplicates, data types and key consistency.
- Use lookup formulas or Power Query to bring product price/cost and customer city/segment into an analysis table.
- Create calculated fields for gross sales, discount amount, net revenue, product cost and gross profit.
- Use PivotTables to compare month, city, product/category, channel and customer segment.
- Build a concise Excel summary/dashboard or clearly formatted PivotTable report.
- Document any data-quality issue and what you did about it.

### Phase 3 — SQL: query the relational data
- Create three tables and load the CSVs into MySQL Workbench.
- Check table counts and key uniqueness.
- Join Sales to Customers and Products.
- Write queries answering the seven business questions.
- Use aggregation, CASE expressions, date grouping, DISTINCT counts and safe calculations.
- Save your SQL script with comments explaining what each query answers.

### Phase 4 — Python: reproduce and extend the analysis
- Load all three CSVs with pandas.
- Inspect, validate and merge the tables using their keys.
- Create the calculated measures.
- Produce summary tables and at least three useful charts.
- Export one clean analysis-ready CSV and one summary CSV.
- Keep the notebook/script reproducible from top to bottom.

### Phase 5 — Power BI: communicate the results
- Load the three tables.
- Create one-to-many relationships from Customers and Products to Sales.
- Confirm the sales table grain and avoid many-to-many relationships.
- Create measures for Net Revenue, Product Cost, Gross Profit, Orders, Units and Gross Margin %.
- Build a two-page report:
  1. **Management Overview:** KPI cards, monthly trend, revenue by category and city, channel comparison, date and city slicers.
  2. **Product and Customer Detail:** product performance, customer segment comparison, channel and city breakdown, detail table and written insights.
- Use clear titles, currency units, sensible sorting and readable formatting.

### Phase 6 — Recommendations
Write a 500–700 word management report:
- Executive summary (the most important finding).
- Three to five evidence-based findings.
- Two or three practical recommendations.
- Risks, assumptions and data limitations.
- Suggested next data to collect.

Recommendations must follow from your evidence. Do not claim a channel caused growth simply because its revenue is higher.

## Deliverables

Submit a folder containing:
1. `README.md` — project overview, business problem, tools, methods, headline findings and links to outputs.
2. `analysis.xlsx` — cleaned analysis table, calculations, PivotTables and Excel summary/dashboard.
3. `analysis.sql` — table creation/import notes, validation checks and business queries.
4. `analysis.ipynb` or `analysis.py` — Python workflow, tables and charts.
5. `naijaglow_report.pbix` — Power BI report.
6. `management_summary.pdf` or `.md` — 500–700 word interpretation and recommendations.
7. `outputs/` — cleaned analysis CSV, summary CSV and chart exports.
8. `evidence/` — screenshots of key outputs if the native file cannot be previewed in GitHub.

Do not upload personal data, passwords, API keys or private information. The supplied dataset is fictional.

## Quality expectations
- All tools use the same business definitions.
- Totals reconcile across Excel, SQL, Python and Power BI.
- Distinct orders are counted with OrderID, not by counting sales rows.
- Revenue and gross profit are clearly distinguished.
- Charts have titles, labels, currency units and appropriate scales.
- Every recommendation is supported by evidence.
- Limitations are stated honestly.

## Assessment rubric (100 marks)

| Area | Marks |
|---|---:|
| Business understanding and analysis plan | 10 |
| Data inspection, quality and preparation | 15 |
| Excel calculations and reporting | 10 |
| SQL joins, queries and validation | 15 |
| Python workflow, calculations and visuals | 15 |
| Power BI data model, measures and report | 20 |
| Insights, recommendations and limitations | 10 |
| Documentation and reproducibility | 5 |
| **Total** | **100** |

**Recommended pass mark: 70%.** If one tool is unavailable to you, explain the limitation and demonstrate the same analysis in another tool; however, your final submission should document which programme tools you used and why.

## Suggested 8–12 hour plan

| Activity | Suggested time |
|---|---:|
| Understand the brief and inspect data | 1 hour |
| Excel | 1–2 hours |
| SQL | 1–2 hours |
| Python | 1–2 hours |
| Power BI | 2–3 hours |
| Report, QA and documentation | 1–2 hours |

## Before you submit
Use the [SUBMISSION-CHECKLIST.md](SUBMISSION-CHECKLIST.md). Week 16 will focus on polishing your project, GitHub portfolio, presentation and career story. Week 15 is about doing the analysis; do not spend all your time decorating the portfolio before the analysis is correct.
