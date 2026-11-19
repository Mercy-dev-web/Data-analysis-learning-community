# Week 14 Lesson: Exploratory Data Analysis and Visualisation

## 1. What is EDA?
Exploratory Data Analysis (EDA) is the process of examining a dataset before drawing conclusions or building models. It helps you understand what is present, find patterns, spot data problems and decide which questions deserve further investigation. EDA is not just making attractive charts.

By the end of this lesson, you should be able to summarise distributions, compare groups, explore trends and relationships, choose appropriate charts, investigate unusual values and communicate findings.

**Prerequisite:** Week 13. You should know how to load CSV files, work with pandas DataFrames, filter rows, create calculated columns and group data.

## 2. A repeatable EDA workflow
1. Define the business question.
2. Understand the dataset and its grain (what one row represents).
3. Check missing values, duplicates, types and impossible values.
4. Calculate useful summary statistics.
5. Explore individual variables and their distributions.
6. Compare groups and examine relationships or trends.
7. Select visuals that answer the question.
8. Explain findings, recommendations and limitations.

EDA can reveal association, not automatically cause and effect. If two measures rise together, that alone does not prove one caused the other.

## 3. Load the practice data
The supplied fictional Nigerian retail dataset covers January–June 2026. Each row is one order line. It includes unit cost so that you can calculate gross profit.

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("practice-data/naija_retail_eda.csv")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
df["Revenue_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]
df["Cost_NGN"] = df["Quantity"] * df["Unit_Cost_NGN"]
df["Gross_Profit_NGN"] = df["Revenue_NGN"] - df["Cost_NGN"]

print(df.head())
print(df.shape)
df.info()
print(df.describe())
```
If your notebook is outside the module folder, adjust the file path. Install dependencies with `pip install pandas numpy matplotlib`.

## 4. Descriptive statistics
- **Count:** number of observations.
- **Sum:** total of a numeric measure.
- **Mean:** arithmetic average.
- **Median:** middle value after sorting.
- **Mode:** most frequent value.
- **Range:** maximum minus minimum.
- **Quartiles:** divide sorted observations into four parts; Q1 is 25%, Q2 is the median, Q3 is 75%.
- **IQR:** Q3 minus Q1; spread of the middle half.
- **Standard deviation:** typical spread around the mean, in the original unit. A larger value indicates more variation.

```python
s = df["Revenue_NGN"]
print("Count:", s.count())
print("Total:", s.sum())
print("Mean:", s.mean())
print("Median:", s.median())
print("Mode:", s.mode().tolist())
print("Range:", s.max() - s.min())
print("Quartiles:", s.quantile([.25, .50, .75]))
print("Standard deviation:", s.std())
```
Pandas uses sample standard deviation by default (`ddof=1`). Variance is standard deviation squared and is expressed in squared units. The mean can be pulled by extreme values; the median is often more representative for skewed data. `describe()` gives numbers, but you must interpret them.

## 5. Explore categories
Use `value_counts()` to count categories and `groupby()` to compare measures.

```python
print(df["City"].value_counts())
print(df["Category"].value_counts(normalize=True) * 100)

city_summary = df.groupby("City").agg(
    Order_Lines=("Revenue_NGN", "size"),
    Revenue=("Revenue_NGN", "sum"),
    Average_Line_Revenue=("Revenue_NGN", "mean")
).sort_values("Revenue", ascending=False)
print(city_summary)
```
Be precise about what is counted. There is no customer ID, so you cannot calculate unique customers. Row counts are order lines, not customers.

## 6. Explore time
Convert date fields to datetime, then aggregate by month.

```python
df["Month"] = df["Order_Date"].dt.to_period("M").astype(str)
monthly = df.groupby("Month")["Revenue_NGN"].sum().sort_index()
print(monthly)
```
A line chart is usually useful for a measure over ordered time. A trend shows what happened, not necessarily why.

## 7. Select the right visual

### Bar chart — compare categories
```python
city_revenue = df.groupby("City")["Revenue_NGN"].sum().sort_values()
city_revenue.plot(kind="barh", figsize=(8, 5))
plt.title("Revenue by City")
plt.xlabel("Revenue (NGN)")
plt.ylabel("City")
plt.tight_layout()
plt.show()
```
Use bars for city, product or category comparisons. Sort bars when ranking matters. Start bar axes at zero to avoid exaggerating differences.

### Line chart — change over time
```python
monthly.plot(kind="line", marker="o", figsize=(8, 4))
plt.title("Monthly Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue (NGN)")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
```

### Histogram — distribution
A histogram groups numeric values into bins. It shows clusters, spread and skew.

```python
plt.hist(df["Revenue_NGN"], bins=8, edgecolor="black")
plt.title("Distribution of Order-Line Revenue")
plt.xlabel("Revenue (NGN)")
plt.ylabel("Number of order lines")
plt.tight_layout()
plt.show()
```

### Boxplot — spread and possible outliers
A boxplot shows median, quartiles and possible outliers. A point beyond the whiskers is flagged by a rule, not automatically an error.

```python
plt.boxplot(df["Revenue_NGN"], vert=False)
plt.title("Order-Line Revenue")
plt.xlabel("Revenue (NGN)")
plt.tight_layout()
plt.show()
```

### Scatter plot — two numeric variables
```python
plt.scatter(df["Quantity"], df["Revenue_NGN"])
plt.title("Quantity and Revenue")
plt.xlabel("Quantity")
plt.ylabel("Revenue (NGN)")
plt.tight_layout()
plt.show()
```
A scatter plot can reveal direction, clusters and unusual observations. In this dataset revenue is calculated from quantity × unit price, so the relationship is partly built into the formula.

## 8. Correlation
Correlation describes the direction and strength of a linear association. A value near +1 is strong positive association, near -1 strong negative association, and near 0 little linear association.

```python
cols = ["Quantity", "Unit_Price_NGN", "Revenue_NGN", "Gross_Profit_NGN"]
print(df[cols].corr())
```
Correlation does not prove causation. Outliers, small samples and non-linear patterns can mislead. Do not calculate meaningful correlations on category labels simply encoded as numbers.

## 9. Investigate possible outliers
The IQR rule is one screening method:

```python
q1 = df["Revenue_NGN"].quantile(.25)
q3 = df["Revenue_NGN"].quantile(.75)
iqr = q3 - q1
lower = q1 - 1.5 * iqr
upper = q3 + 1.5 * iqr
flagged = df[(df["Revenue_NGN"] < lower) | (df["Revenue_NGN"] > upper)]
print(flagged)
```
A flagged record may be an error or a genuine unusual transaction. Inspect it in context. Do not delete it simply because a formula flagged it. Document any correction or exclusion.

## 10. Turn analysis into insight
Use this structure:
- **Observation:** what did you find?
- **Evidence:** which figure or chart supports it?
- **Interpretation:** what might it mean?
- **Next step:** what should the business investigate or do?

Weak: “Lagos is doing well.”
Stronger: “Lagos generated the highest total revenue in this six-month sample. The retailer could investigate which products and channels contribute most before deciding whether to increase local promotion.”

Do not claim customer satisfaction, market share, advertising effectiveness or reasons for a sales change unless the dataset contains evidence for those things.

## 11. Common mistakes
- Using a line chart for unordered categories.
- Forgetting to sort dates.
- Relying on the mean alone for skewed data.
- Treating correlation as causation.
- Deleting all flagged outliers.
- Leaving titles, axes or units unclear.
- Comparing totals without considering group sizes.
- Calling order lines customers.
- Calling revenue profit. Gross profit here excludes operating expenses such as salaries, rent, delivery and marketing.

## 12. Completion checklist
- [ ] I can explain EDA and its workflow.
- [ ] I can interpret mean, median, quartiles, range and standard deviation.
- [ ] I can compare categories and monthly trends.
- [ ] I can create bar, line, histogram, boxplot and scatter charts.
- [ ] I can investigate possible outliers.
- [ ] I can explain correlation versus causation.
- [ ] I can write evidence-based insights and state limitations.
- [ ] My notebook runs from top to bottom.

**Next:** Week 15 is the capstone project. You will combine skills from Excel, SQL, Power BI and Python.
