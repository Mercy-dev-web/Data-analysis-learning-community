# Week 1 — Introduction to Data Analysis

**Phase:** Foundations  
**Estimated study time:** 8–10 hours  
**Level:** Complete beginner  
**Required output:** A one-page analytical problem brief

## 1. Learning objectives

By the end of this lesson, you should be able to:

1. Explain data analysis in your own words.
2. Distinguish data, information, insight and evidence.
3. Describe why organisations use data analysis.
4. Identify the four broad types of data analysis.
5. Explain the main stages of an analysis project.
6. Turn a vague business request into clear, answerable questions.
7. Distinguish a metric, a KPI and a target.
8. Identify the audience for an analysis and the decision it should support.

Do not rush through the definitions. The goal is to understand how an analyst thinks before learning software.

---

## 2. What is data?

Data is a collection of recorded observations, facts or measurements. It can be numbers, words, dates, categories, images, audio or other recorded information.

Examples:
- A shop records that it sold 12 bags of rice on Monday.
- A university records students' examination scores.
- A hospital records the number of patients who visited a clinic.
- An online vendor records how many people viewed a product and how many placed an order.
- A transport company records trip dates, routes, fuel costs and passenger counts.

A single value rarely tells the whole story. Context gives data meaning.

### Example

Imagine a small food business records these orders:

| Order | Product | Quantity | Unit price (₦) |
|---|---|---:|---:|
| 001 | Fruit cup | 2 | 1,500 |
| 002 | Fruit bowl | 1 | 3,000 |
| 003 | Fruit cup | 3 | 1,500 |

The table contains data. From it, we can calculate total units sold and sales value.

- Total units = 2 + 1 + 3 = 6
- Total sales = (2 × ₦1,500) + (1 × ₦3,000) + (3 × ₦1,500) = ₦10,500

The calculations turn individual records into a summary. But we still need to interpret what the summary means for the business.

## 3. Data, information, insight and evidence

These words are related, but they are not interchangeable.

### Data
The original recorded values.

Example: daily orders were 8, 11, 5, 14 and 12.

### Information
Data organised or summarised so it is easier to understand.

Example: the business received 50 orders over five days, averaging 10 orders per day.

### Insight
A meaningful interpretation that helps explain a pattern or raises a useful question.

Example: orders were lower on the third day than on the other four days. The business may investigate whether the day, stock availability or promotion activity explains the difference.

### Evidence
Information from the data that supports or challenges a claim.

Example: the order log confirms that only five orders were recorded on the third day. It does not, by itself, prove why orders fell.

**Important:** An insight is not automatically a proven cause. Analysts must avoid presenting guesses as facts.

## 4. What is data analysis?

Data analysis is the structured process of examining data, preparing it, applying suitable methods and interpreting the results to answer questions or support decisions.

In simple terms:

**A problem creates a question. Data provides evidence. Analysis helps us understand the evidence. Communication helps people decide what to do.**

Data analysis is not just:
- opening Excel,
- writing SQL queries,
- creating charts,
- building dashboards,
- or running Python code.

Those are tools and activities that may be part of the work. The analysis begins with understanding the problem.

## 5. Why do organisations analyse data?

Organisations use analysis to make decisions with better evidence.

Examples include:

| Organisation | Question | Possible decision |
|---|---|---|
| Retail shop | Which products contribute most to sales? | Decide what to restock |
| Restaurant | Which days have the highest demand? | Plan staff and ingredients |
| University | Which courses have unusually low pass rates? | Investigate teaching or student support |
| Bank | Which loan applications show higher repayment risk? | Improve risk review processes |
| Marketing team | Which campaign brings customers who actually buy? | Adjust campaign budget |
| Transport company | Which routes have the highest operating costs? | Review routes and schedules |

Data can help organisations:
- understand performance,
- identify problems,
- discover opportunities,
- monitor progress,
- allocate resources,
- improve customer experience,
- reduce waste,
- plan future activity.

Analysis supports decisions; it does not remove the need for human judgement or domain knowledge.

## 6. The four broad types of data analysis

These categories describe the kind of question an analysis is trying to answer. They are useful ways to organise analytical thinking.

### 6.1 Descriptive analysis — What happened?

Descriptive analysis summarises historical or current data.

Examples:
- How much revenue did the shop make last month?
- How many students registered for each course?
- How many customers ordered each product?

Common outputs include totals, averages, counts, tables and charts.

### 6.2 Diagnostic analysis — Why might it have happened?

Diagnostic analysis investigates possible explanations for an observed result.

Examples:
- Why did sales fall last week?
- Why did delivery delays increase?
- Why did one branch record more customer complaints?

An analyst may compare time periods, products, locations or customer groups. A pattern can suggest a possible explanation, but additional evidence may be needed to establish cause.

### 6.3 Predictive analysis — What is likely to happen?

Predictive analysis uses historical patterns and statistical or machine-learning methods to estimate future or unknown outcomes.

Examples:
- What sales volume might we expect next month?
- Which products may experience higher demand?
- Which customers may be at risk of leaving?

Predictions are estimates, not guarantees. Their reliability depends on data quality, assumptions and whether future conditions resemble the past.

### 6.4 Prescriptive analysis — What should we do?

Prescriptive analysis considers possible actions and helps identify a suitable decision under stated goals and constraints.

Examples:
- How should a limited marketing budget be allocated?
- How much stock should a shop order given expected demand and storage limits?
- Which delivery routes should be prioritised to reduce cost?

Recommendations should state the objective, assumptions and trade-offs.

### Quick comparison

| Type | Main question | Example output |
|---|---|---|
| Descriptive | What happened? | Monthly sales summary |
| Diagnostic | Why might it have happened? | Comparison of sales by product and day |
| Predictive | What may happen? | Forecast of next month's sales |
| Prescriptive | What should we do? | Suggested stock or budget plan |

A project can involve more than one type. For example, a sales project may first describe what happened, then investigate why, and finally recommend an action.

## 7. The data analysis lifecycle

There is no single workflow used by every organisation, but most analysis projects include the stages below.

### Stage 1 — Understand the problem

Find out:
- What decision needs to be made?
- Who will use the analysis?
- What is not working, or what opportunity is being explored?
- What does success look like?
- What is the deadline and scope?

Do not start with a chart. Start with the problem.

### Stage 2 — Define analytical questions

Break the main problem into smaller questions that data can help answer.

For example, “How can our shop improve sales?” is too broad.

More specific questions could be:
- Which products generate the highest sales value?
- Which products sell most frequently?
- Which days have the highest order volume?
- How does this month's performance compare with last month?

### Stage 3 — Identify and collect data

Find out what information is required and whether it is available.

Possible sources:
- sales records,
- customer feedback,
- website analytics,
- surveys,
- operational logs,
- public datasets,
- approved internal databases.

Record where the data came from, when it was collected and any known limitations.

### Stage 4 — Inspect and prepare data

Understand the columns and records. Check for:
- missing values,
- duplicate records,
- inconsistent spelling or categories,
- incorrect data types,
- impossible values,
- unusual observations.

Cleaning is not permission to delete anything that looks inconvenient. Investigate and document decisions.

### Stage 5 — Analyse

Choose a method that answers the question. Depending on the task, this may involve:
- counting and summarising,
- comparing groups,
- calculating rates,
- examining trends,
- joining tables,
- statistical analysis,
- forecasting.

Use the simplest suitable method before reaching for a complicated one.

### Stage 6 — Interpret and validate

Ask:
- What does the result mean?
- Does it answer the original question?
- Are the calculations correct?
- Do totals reconcile with the source?
- Could missing or biased data affect the result?
- What other explanation might exist?

### Stage 7 — Communicate findings

Present the important results in language the intended audience understands. A report or dashboard should make it easy to see:
- the question,
- the important evidence,
- the conclusion,
- the recommended action,
- the limitations.

### Stage 8 — Review the outcome

Where possible, check whether the decision was implemented and whether the expected result occurred. This can create a new analysis question.

## 8. From a vague request to an analytical question

A stakeholder might say:

> “Our business is not doing well. Analyse the sales.”

This is a request, not yet a well-defined analysis brief.

An analyst should ask clarifying questions:
1. What does “not doing well” mean: lower revenue, fewer orders, lower profit or fewer repeat customers?
2. Which period should be examined?
3. Which branches, products or customer groups are in scope?
4. What decision will the analysis support?
5. Which records are available?
6. Are there known changes, such as prices, stock shortages or promotions?

A clearer project question could be:

> “Which product categories and sales channels contributed most to the change in monthly revenue between August and September, and what should the sales manager investigate?”

This question identifies:
- a comparison period,
- dimensions to investigate,
- a measurable outcome,
- an audience,
- a possible next decision.

## 9. Metrics, KPIs and targets

These terms are often confused.

### Metric
A measurement used to describe an activity or outcome.

Examples:
- number of orders,
- total revenue,
- average order value,
- number of website visits.

### KPI — Key Performance Indicator
A metric selected because it is important for monitoring progress toward a specific objective.

Example: if the objective is to improve customer retention, the repeat-customer rate may be a KPI.

Not every metric is a KPI. A metric becomes a KPI because of its importance to a goal.

### Target
The desired level of performance for a metric or KPI within a defined period.

Example:
- KPI: monthly repeat-customer rate.
- Target: increase it to 35% by the end of the quarter.

Always define how a metric is calculated. For example, “customer retention” can mean different things in different organisations.

## 10. A worked business example

### Scenario: A small Nigerian online food vendor

The owner says:

> “I post regularly on Instagram, but I am not sure whether the marketing is helping the business.”

The analyst should not immediately conclude that Instagram is ineffective. First, define what “helping” means.

**Possible objective:** understand whether Instagram activity is contributing to enquiries and completed orders.

**Stakeholder:** business owner.

**Potential questions:**
1. How many enquiries came from Instagram each week?
2. How many enquiries became paid orders?
3. What was the total sales value from orders attributed to Instagram?
4. Which content types generated the most enquiries?
5. How much was spent on the campaigns?
6. Are there enough records to compare performance fairly?

**Possible metrics:**
- Instagram-attributed enquiries.
- Paid orders attributed to Instagram.
- Enquiry-to-order conversion rate = paid orders ÷ enquiries × 100.
- Revenue attributed to Instagram.
- Campaign spend.
- Return on ad spend, if campaign revenue and ad spend are measured consistently.

**Important limitations:**
- Some customers may see a post and order later through another channel.
- Attribution may be incomplete.
- A small number of orders can make percentages unstable.
- Revenue is not the same as profit.
- A comparison does not prove that Instagram caused the sales.

**Possible recommendation:** improve order-source tracking before deciding whether to increase or reduce the marketing budget.

Notice that the recommendation is about improving evidence, not making an unsupported claim.

## 11. A simple problem brief template

Use this structure before beginning any analysis project:

| Section | What to write |
|---|---|
| Problem | What issue or opportunity needs attention? |
| Background | What context should the analyst understand? |
| Stakeholder | Who needs the analysis? |
| Objective | What should the analysis help achieve? |
| Main question | What is the central question? |
| Supporting questions | What smaller questions will help answer it? |
| Metrics | What will be measured, and how? |
| Data required | What fields or records are needed? |
| Scope | What period, location, products or groups are included? |
| Limitations | What might prevent a reliable answer? |
| Intended decision | What action could the findings support? |

## 12. Common beginner mistakes

1. **Starting with a tool instead of a question.** Choosing Power BI before understanding the business problem can lead to irrelevant charts.
2. **Confusing revenue with profit.** Revenue is money earned from sales; profit accounts for relevant costs.
3. **Assuming correlation proves causation.** Two things moving together does not prove one caused the other.
4. **Making conclusions from too little data.** A few observations may not represent the wider situation.
5. **Ignoring the audience.** A technical report may not help a manager who needs a clear decision.
6. **Treating every metric as a KPI.** Focus on measurements connected to the objective.
7. **Hiding uncertainty.** State limitations rather than pretending the data is perfect.
8. **Making recommendations without evidence.** Every recommendation should connect to a finding and acknowledge trade-offs.

## 13. Week 1 knowledge check

Complete the questions in `EXERCISES.md` before opening `ANSWER-GUIDE.md`.

## 14. Week 1 completion checklist

You are ready to move on when you can:
- [ ] Explain data analysis without memorising a definition.
- [ ] Distinguish data, information, insight and evidence.
- [ ] Give an example of each of the four types of analysis.
- [ ] Describe the analysis lifecycle in the correct order.
- [ ] Turn a vague request into clear analytical questions.
- [ ] Explain the difference between a metric, KPI and target.
- [ ] Write a one-page problem brief.
- [ ] State at least two limitations that could affect an analysis.

**Next week:** Analytical thinking and data quality. You will learn how to inspect data carefully and recognise issues that can make an analysis misleading.
