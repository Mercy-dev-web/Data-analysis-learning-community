# Week 11 Lesson: Data Visualisation and Dashboard Design

## 1. From analysis to communication
A data analyst does more than calculate totals. The analyst must help someone understand what happened, where it happened, what may explain it and what action should be considered.

A report can contain correct numbers and still be poor if:
- The audience cannot identify the most important information.
- Charts are difficult to interpret.
- The page is overcrowded.
- Labels, titles or units are missing.
- Filters behave unexpectedly.
- The report shows numbers without explaining their meaning.

The goal is not to make the page look fancy. The goal is to make the information easy to understand and useful for a decision.

## 2. Start with the audience and business question
Before choosing a chart, ask:
1. Who will use this report?
2. What decision are they trying to make?
3. What questions should the report answer?
4. What level of detail do they need?
5. What time period and definitions should be clear?

Example: a retail manager may want to know:
- How much sales value did the business record?
- Which product categories contributed most?
- Which city recorded the highest sales value?
- Are sales changing over time?
- How much of the sales value came from online orders?

A report should be built around these questions, not around every field in the dataset.

## 3. Choose the right visual

| Business question | Recommended visual | Why |
|---|---|---|
| Which category has the highest sales? | Bar chart | Easy category comparison |
| How did sales change over time? | Line chart | Shows a trend |
| What is the total sales value? | Card | Highlights one important KPI |
| How many units were sold? | Card | Shows a single summary value |
| How do cities compare? | Bar or column chart | Compares locations |
| What are the exact figures by product? | Table or matrix | Shows detailed values |
| How does one measure relate to another? | Scatter chart | Shows relationship between two numeric measures |
| How much does each category contribute to a total? | Bar chart or a simple part-to-whole visual | Makes contribution easier to compare |

### Common chart types
**Card:** Shows one important number, such as Total Sales. Give it a clear label and unit.

**Bar chart:** Uses horizontal bars. Useful for comparing categories, products or cities, especially when labels are long.

**Column chart:** Uses vertical bars. Useful for comparing a small number of categories or periods.

**Line chart:** Connects values across an ordered sequence, often dates. Use it to show trends, not unrelated categories.

**Table:** Shows exact values across rows and columns. Use it when the audience needs detail.

**Matrix:** Similar to a pivot table. It can group data into rows and columns and show subtotals.

**Slicer:** A visual filter that lets report users select a category, city, date or other field.

**Scatter chart:** Displays the relationship between two numeric measures. It is useful for investigating patterns, not for showing a simple ranking.

### Visuals to use carefully
- Pie and donut charts can become difficult to compare when there are many categories. Use only when there are a few parts and the part-to-whole question is important.
- 3D charts distort perception and should generally be avoided.
- Gauges are not automatically useful. Use one when there is a meaningful target or threshold.
- Avoid adding visuals just because Power BI offers them.

## 4. Visualisation design principles

### A. Visual hierarchy
Visual hierarchy means arranging information so the audience notices the most important things first.

A practical order:
1. Report title and reporting period.
2. Key KPIs.
3. Main comparisons or trends.
4. Supporting detail.
5. Notes, definitions and data limitations.

Make the most important information easy to find. Do not give every visual the same visual weight.

### B. Keep the page simple
- Give every visual a reason to exist.
- Remove repeated information.
- Avoid unnecessary shapes, borders and decorative images.
- Leave enough space between visuals.
- Use readable font sizes.
- Do not force too many charts onto one page.

A clean report with four useful visuals is usually better than a crowded report with twelve.

### C. Use colour with purpose
- Choose a small, consistent palette.
- Use one accent colour to highlight an important point.
- Keep text readable against its background.
- Do not rely on red and green alone to communicate good or bad.
- Keep the same category colours consistent across pages.
- Use conditional formatting only when it helps the audience spot something meaningful.

Colour should support the message, not compete with it.

### D. Titles, labels and units
Avoid vague titles such as “Chart 1” or “Sales”.

Better titles:
- Total Sales by Product Category
- Monthly Sales Value (₦)
- Units Sold by Branch
- Sales Value by Customer City

Include units where necessary. A figure of 125,000 is unclear if the audience cannot tell whether it means naira, units, customers or something else.

## 5. Build a report layout
For this assignment, create two pages.

### Page 1 — Retail Performance Overview
Suggested layout:

```
+-----------------------------------------------------------+
| Retail Performance Overview             Reporting period |
+-----------------------------------------------------------+
| Total Sales | Total Units | Unique Customers | Sales/Unit |
+-----------------------------------------------------------+
| Sales by Category              | Sales by City             |
|                                |                           |
+-----------------------------------------------------------+
| Sales Trend by Date                                        |
+-----------------------------------------------------------+
| Category slicer | City slicer | Sales Channel slicer       |
+-----------------------------------------------------------+
```

You can adjust the layout, but keep the reading order clear. The report should fit on one screen without requiring unnecessary scrolling.

### Page 2 — Product and Customer Detail
Suggested visuals:
- Sales value by product.
- Units sold by product.
- Sales value by customer city or customer segment.
- A table showing product, category, units and sales value.
- A short text box with two or three findings.

Do not repeat every visual from Page 1. Page 2 should provide detail that supports the overview.

## 6. Build visuals in Power BI Desktop
1. Open your Week 10 `.pbix` file.
2. Select Report view.
3. Choose a visual from the Visualizations pane.
4. Drag the appropriate fields into the visual's field wells.
5. Use measures for aggregated business values.
6. Add a clear title in the Format pane.
7. Format currency measures as Nigerian naira where possible.
8. Sort categories by the relevant measure, usually descending for rankings.
9. Resize and position visuals so the page reads naturally.
10. Repeat for the second page.

Examples:
- Card: `[Total Sales]`
- Bar chart: Axis = `Products[Category]`; Values = `[Total Sales]`
- Column chart: Axis = `Customers[City]`; Values = `[Total Sales]`
- Line chart: X-axis = `Date[Date]`; Y-axis = `[Total Sales]`
- Table: `Products[Product_Name]`, `[Total Units]`, `[Total Sales]`

Use the measures created in Week 10. Avoid dragging a raw numeric column into a visual without checking how Power BI aggregates it.

## 7. Slicers and filtering
A slicer allows the report user to interact with the report.

Useful slicers for the retail model:
- Date[Year_Month] or Date[Date].
- Products[Category].
- Customers[City].
- Sales[Sales_Channel].

To add a slicer:
1. Select the Slicer visual.
2. Drag a field into it.
3. Choose a suitable style, such as list or dropdown.
4. Resize it so the options are readable.
5. Test more than one selection.

A slicer should answer a useful question. Too many slicers can make a report difficult to use.

## 8. Visual interactions
When a user selects a bar in one chart, Power BI may filter or highlight other visuals.

To inspect this:
1. Select a chart.
2. Open the Format ribbon and choose Edit interactions.
3. Review the icons shown on other visuals.
4. Choose Filter, Highlight or None where appropriate.
5. Test the report from the reader's point of view.

Example: selecting Groceries in Sales by Category should update the relevant cards and detail visuals. If it does not, check your model, relationships and interaction settings.

## 9. Drill-down, drill-through and tooltips

**Drill-down:** Moves through levels in a hierarchy inside the same visual. For example, Year → Quarter → Month → Day. It requires a hierarchy or multiple levels in the visual.

**Drill-through:** Opens a separate report page filtered to the selected item, such as a page showing detail for one city or product. It is useful when the overview should stay simple but users need more detail.

**Tooltip:** Shows additional information when the user points to a data point. Use it for supporting details, not for essential findings that every reader must see.

These features are optional extensions for this week. First make sure the main report works clearly.

## 10. Report themes and consistency
A report theme controls common colours and formatting.

In Power BI Desktop:
1. Open the Design or View ribbon, depending on your version.
2. Open Themes.
3. Choose a built-in theme or customise one.
4. Check every page after applying it.
5. Adjust any visual whose labels or contrast are no longer clear.

A theme is a starting point, not a substitute for good design. Keep titles, number formats, chart colours and slicer placement consistent.

## 11. Accessibility
Make reports usable by more people:
- Use sufficient contrast between text and background.
- Do not communicate meaning using colour alone.
- Use descriptive visual titles.
- Add alternative text to meaningful visuals where appropriate.
- Keep font sizes readable.
- Use consistent slicer placement across pages.
- Avoid clutter and overlapping labels.
- Test the report at normal viewing size.

Power BI includes accessibility features such as alt text, keyboard navigation, tab order and high-contrast support. Use them where appropriate.

## 12. Turn charts into insights
A chart shows information. An insight explains what matters.

Use this simple structure:
- **Observation:** What does the data show?
- **Evidence:** Which value or comparison supports it?
- **Meaning:** Why might the business care?
- **Next step:** What should be checked or done next?

Example:
“Groceries recorded the highest sales value in this sample at ₦90,100. The manager could review which grocery products contribute most and check whether stock levels are sufficient. Sales value alone does not prove that the category is the most profitable because product costs are not included.”

Avoid:
- “The chart is beautiful.”
- “Sales are good.”
- “The business should increase everything.”
- Claiming that one factor caused another when the data only shows a relationship.

## 13. Report vs dashboard
These terms are related but not identical in Power BI:
- A **report** can have multiple pages, interactive visuals, slicers and drill-through.
- A **dashboard** in Power BI Service is a single-page canvas made from pinned tiles. Dashboard creation and sharing happen in the online Power BI Service.

For this week's assignment, you are creating a multi-page Power BI report in Power BI Desktop. People often casually call this a dashboard, but learn the distinction.

## 14. Quality assurance before sharing
Check:
- Do totals match the Week 10 measures?
- Do slicers filter the intended visuals?
- Are charts sorted correctly?
- Are dates in chronological order?
- Are currency and units labelled?
- Are titles specific?
- Can the audience understand the page without you explaining every visual?
- Are there unsupported claims about profit or causation?
- Is the report readable without scrolling excessively?

## 15. Week 11 checklist
- [ ] I can match a business question to a suitable chart.
- [ ] My report has a clear title and reporting period.
- [ ] My key KPIs are easy to identify.
- [ ] My charts have clear titles, labels and units.
- [ ] My slicers work correctly.
- [ ] I checked visual interactions.
- [ ] I used a consistent theme and colours.
- [ ] My report is readable and not overcrowded.
- [ ] I wrote at least three evidence-based insights.
- [ ] I saved the .pbix file and checked it before submission.
