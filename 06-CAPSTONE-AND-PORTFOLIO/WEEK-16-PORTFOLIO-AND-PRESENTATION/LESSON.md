# Lesson — Turning Your Analysis into a Portfolio

## 1. What is a data portfolio?

A data portfolio is a small collection of work samples that helps someone understand how you approach data problems. It should show more than attractive charts. A useful project makes clear:

- What question you were trying to answer.
- What data you used and where it came from.
- How you checked and prepared the data.
- What analysis you performed and why.
- What you found.
- What action you recommend.
- What the data cannot tell us.

A portfolio is evidence of work you completed. It is not a certificate, a job title or proof that you have used a tool professionally.

## 2. Quality before quantity

A few complete, explainable projects are more useful than many unfinished repositories. For each project, check that:

- The files open and the instructions work.
- The README describes the project in plain language.
- The analysis can be followed or reproduced where practical.
- The visuals have clear titles, labels, units and context.
- The conclusions match the results.
- Limitations are stated.
- Your own contribution is clear.

Do not publish a project just because you have uploaded files. Review it as if a stranger is opening it for the first time.

## 3. Organising GitHub

### Your profile

Your GitHub profile is a landing page. Keep it simple:

- Use a clear profile description.
- Add a profile README if you have useful information to share.
- Pin a small number of your strongest repositories.
- Make repository names and descriptions meaningful.
- Remove or archive clutter when it makes navigation difficult.

GitHub profile README instructions: https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme

### Your project repository

A possible structure for the Week 15 project:

```text
retail-sales-analysis/
├── README.md
├── data/
│   └── README.md
├── excel/
│   └── retail-analysis.xlsx
├── sql/
│   └── capstone_queries.sql
├── python/
│   └── capstone_analysis.ipynb
├── power-bi/
│   ├── retail-dashboard.pbix
│   └── screenshots/
│       ├── management-overview.png
│       └── product-channel-detail.png
└── presentation/
    └── retail-sales-findings.pdf
```

This is an example, not a rule. If a file is too large for GitHub or contains restricted data, do not force it into the repository. Explain how to access an appropriate public sample or provide screenshots and a description instead.

### Keep your repository understandable

- Use descriptive file and folder names.
- Put setup instructions in the README.
- Include a data dictionary when field meanings are not obvious.
- Explain the grain of the dataset (what one row represents).
- Include software/library requirements if code depends on them.
- Remove temporary exports, duplicate files and unused drafts.
- Do not commit passwords, API keys, private data or machine-specific paths.

## 4. Writing a strong project README

A project README is the front door to your work. A reader should understand the project without opening every file.

Use this sequence:

1. **Title:** say what the project investigates.
2. **Overview:** give the business situation and reason for the analysis.
3. **Questions:** list the questions you set out to answer.
4. **Dataset:** describe source, time period, row grain, important fields and any restrictions.
5. **Tools:** list only tools you actually used.
6. **Process:** explain data checks, cleaning and analysis.
7. **Key findings:** state the most important results with values and context.
8. **Recommendations:** connect findings to practical next steps.
9. **Limitations:** identify what cannot be concluded.
10. **Files and reproduction:** tell the reader where the workbook, SQL, notebook and dashboard evidence are located.
11. **Credits:** acknowledge sources, collaborators and substantial assistance.

### Finding versus recommendation

A finding describes evidence in the data. A recommendation proposes an action based on that evidence.

Example:
- Finding: “In this six-month sample, Body Lotion generated the highest net revenue among the listed products.”
- Recommendation: “The retailer could review Body Lotion stock levels before the next planning cycle, while checking current inventory and supplier lead times.”

Do not turn a finding into a claim about why something happened unless the data supports that explanation.

## 5. Tell the analysis as a story

A useful presentation follows this flow:

**Business context → Question → Evidence → Insight → Recommendation → Limitation**

Avoid presenting every chart you created. Select the visuals that help answer the main question.

For the Week 15 retail capstone, possible questions include:
- How did net revenue change across the six months?
- Which products or categories contributed most to net revenue and gross profit?
- How did results differ by city or sales channel?
- How much discount was given, and how did gross margin vary?
- What should management investigate or do next?

Use only questions your analysis actually answers. Check every number against your workbook, SQL output, notebook or Power BI model before putting it on a slide.

## 6. Explain metrics precisely

The Week 15 dataset includes quantity, unit price, unit cost and discount. Keep these definitions consistent:

- Gross line sales = Quantity × Unit Price
- Net Revenue = Gross line sales − Discount
- Product Cost = Quantity × Unit Cost
- Gross Profit = Net Revenue − Product Cost
- Gross Margin % = Gross Profit ÷ Net Revenue

Gross profit in this project subtracts product cost only. It does not subtract rent, salaries, delivery, marketing, tax or other operating expenses. Do not call it net profit.

The dataset is synthetic and limited to six months. It cannot prove advertising effectiveness, customer satisfaction, market share, or the cause of a sales change.

## 7. Make visuals readable

Before exporting a screenshot or slide, check:

- The chart title says what is being measured.
- Axes and units are clear (for example, ₦ rather than an unexplained number).
- Dates are in chronological order.
- Categories are readable and not unnecessarily crowded.
- Colours are consistent and accessible.
- Important comparisons are not hidden by poor scales.
- Filters and selected periods are visible when relevant.
- The chart supports a sentence explaining why it matters.

Do not use 3D charts or decorative effects that make comparisons harder. Avoid screenshots where labels are too small to read.

## 8. Present with confidence and honesty

You do not have to memorise a script. Practise explaining:

- Why you chose the question.
- What one row in the dataset represents.
- One data-quality issue you checked.
- One decision you made during analysis.
- Two findings.
- One recommendation.
- One limitation.
- What you would do with more time or better data.

If you do not know an answer, say so. Explain how you would investigate it rather than inventing an answer.

## 9. CV and LinkedIn: describe projects accurately

A personal project can be listed under **Projects** or **Portfolio**, not under paid employment unless it genuinely was a job. State that it was an independent, academic, community or guided project as appropriate.

A useful bullet formula is:

**Action + method/tool + scope + result or output**

Example template:
“Analysed [type of dataset] using [tools], checked [quality issues], and built [report/dashboard] to examine [business questions].”

Only insert details you can demonstrate. Do not invent percentage improvements, revenue gains, business impact or stakeholder adoption.

On LinkedIn, the Projects section can describe the project, skills used and supporting media. Check the current profile options because the interface may change: https://www.linkedin.com/help/linkedin/answer/a8064614

## 10. Responsible portfolio practice

- Use public, synthetic or permission-cleared data.
- Remove personal identifiers where appropriate.
- Follow dataset licences and attribution requirements.
- Do not publish confidential company or customer information.
- Do not expose credentials in notebooks or screenshots.
- Credit tutorials, templates, datasets, collaborators and AI assistance where relevant.
- Do not claim that a tutorial project was entirely original.
- Be prepared to explain and reproduce the work you publish.

## 11. Your next learning cycle

After the programme, choose the next skill based on a project or role requirement—not because a tool is popular. Possible next steps:

- Strengthen SQL through more complex business questions.
- Practise Excel modelling and repeatable reporting.
- Improve Power BI modelling, DAX and report usability.
- Build confidence in pandas and exploratory analysis.
- Learn basic statistics and experiment interpretation.
- Work with a new dataset and document what changes.
- Practise communicating findings to a non-technical audience.

Keep revisiting old projects. A portfolio should improve as your judgement and skills improve.
