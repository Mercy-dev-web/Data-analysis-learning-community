# Week 13 Lesson: Python for Data Analysis

## 1. From Python basics to data analysis

In Week 12, you learned variables, lists, dictionaries, conditions, loops and functions. Those are the foundations of Python. But analysts often work with datasets containing hundreds, thousands or millions of rows. Processing every row manually with basic Python can become inconvenient.

Python libraries provide reusable tools for specific tasks. This week introduces two important libraries:

- **pandas:** works with tabular data such as CSV files, Excel sheets and database query results.
- **NumPy:** supports efficient numerical operations using arrays.

pandas is the main focus. NumPy supports the numerical foundation behind many data tools.

## 2. Install and import the libraries

If you installed Anaconda for Week 12, pandas and NumPy may already be available. In a notebook, run:

```python
import pandas as pd
import numpy as np
```

The aliases `pd` and `np` are widely used conventions. They are not special Python keywords; they are short names you choose when importing the libraries.

If a library is missing, install it in your environment:

```bash
python -m pip install pandas numpy
```

In a Jupyter notebook, you may use:

```python
%pip install pandas numpy
```

Install packages in the same Python environment that runs your notebook. If the import still fails, check which kernel or interpreter is active and restart it after installation.

## 3. What is a DataFrame?

A pandas **DataFrame** is a two-dimensional table with labelled rows and columns. It is similar to a worksheet in Excel or a table returned by a SQL query.

A **Series** is a one-dimensional labelled collection, often representing one column.

```python
import pandas as pd

sales = {
    "Product": ["Soap", "Lotion", "Perfume"],
    "Quantity": [5, 3, 2],
    "Unit_Price": [800, 4500, 12000]
}

df = pd.DataFrame(sales)
print(df)
```

The DataFrame has rows and columns. Each column has a name and a data type.

## 4. Import a CSV file

A CSV (comma-separated values) file is a common way to store tabular data.

```python
import pandas as pd

df = pd.read_csv("naija_shop_orders_raw.csv")
print(df.head())
```

The file path is relative to the notebook's current working directory. If you see a FileNotFoundError, check the location of the notebook and CSV file. You can also supply a full path.

Other useful import options:

```python
df = pd.read_csv("naija_shop_orders_raw.csv", encoding="utf-8")
```

For Excel files, pandas provides `pd.read_excel()`. Depending on your environment, you may need an Excel-reading package such as openpyxl.

## 5. Inspect the dataset before analysing

Never assume a dataset is ready just because it opened successfully.

```python
df.head()       # first five rows
df.tail()       # last five rows
df.sample(5)    # five random rows
df.shape        # (number of rows, number of columns)
df.columns      # column names
df.info()       # data types and non-null counts
df.describe()   # summary statistics for numeric columns
df.describe(include="all")  # summary for all columns
```

Understand the outputs:

- `shape` returns a tuple: rows first, columns second.
- `info()` helps identify missing values and data types.
- `describe()` gives count, mean, standard deviation, minimum, quartiles and maximum for numeric columns.
- `nunique()` counts distinct values in a column.
- `value_counts()` counts how often each value appears.

```python
df["City"].value_counts(dropna=False)
df["Payment_Method"].nunique()
df.isna().sum()
```

The count in `describe()` may be lower than the total number of rows when values are missing.

## 6. Selecting columns and rows

### Select one column

```python
df["Product"]
```

This returns a Series.

### Select multiple columns

```python
df[["Product", "Quantity", "Unit_Price_NGN"]]
```

This returns a DataFrame. Notice the double square brackets: the outer brackets select from the DataFrame, and the inner brackets contain a list of column names.

### Select rows by position with iloc

```python
df.iloc[0]       # first row
df.iloc[0:5]     # first five rows
df.iloc[0, 1]    # first row, second column
```

### Select rows by label or condition with loc

```python
df.loc[0, "Product"]
df.loc[df["City"] == "Lagos"]
```

Use `loc` when selecting by labels or Boolean conditions, and `iloc` when selecting by integer position.

## 7. Filtering data

A filter keeps rows that meet a condition.

```python
lagos_orders = df[df["City"] == "Lagos"]
high_value_orders = df[df["Unit_Price_NGN"] >= 5000]
```

### Multiple conditions

Use `&` for AND and `|` for OR. Put each condition in parentheses.

```python
lagos_high_value = df[
    (df["City"] == "Lagos") &
    (df["Unit_Price_NGN"] >= 5000)
]

lagos_or_ibadan = df[
    (df["City"] == "Lagos") |
    (df["City"] == "Ibadan")
]
```

Use `~` to reverse a condition:

```python
not_lagos = df[~(df["City"] == "Lagos")]
```

Do not use Python's `and` and `or` directly between pandas Series conditions. Use `&` and `|`.

## 8. Sorting

```python
df.sort_values("Unit_Price_NGN")
df.sort_values("Unit_Price_NGN", ascending=False)
df.sort_values(["City", "Unit_Price_NGN"], ascending=[True, False])
```

Sorting does not change the original DataFrame unless you assign the result or use an in-place operation. A clear approach is:

```python
highest_price_first = df.sort_values(
    "Unit_Price_NGN",
    ascending=False
)
```

## 9. Missing values

A missing value means information is not recorded or available. In pandas, missing values are often represented by `NaN`, `None` or `NaT`, depending on the data type.

First inspect:

```python
df.isna().sum()
df.isna().mean() * 100
```

The first returns the number of missing values per column. The second estimates the percentage missing in each column.

### Remove rows with missing values

```python
df_without_missing_city = df.dropna(subset=["City"])
```

This removes rows where City is missing. It does not automatically remove rows with missing values in every other column.

### Fill missing values

```python
df["City"] = df["City"].fillna("Unknown")
```

For a numeric field, a median may be useful in some situations:

```python
median_quantity = df["Quantity"].median()
df["Quantity"] = df["Quantity"].fillna(median_quantity)
```

But do not fill values automatically. Ask:
- Why might the value be missing?
- Is the field important to the analysis?
- Is there a reliable way to recover it?
- Would filling it distort the result?

For example, replacing a missing city with "Lagos" without evidence would invent information. "Unknown" is more honest if the city cannot be recovered.

## 10. Duplicate records

A duplicate is a repeated record. It may be an accidental copy, or it may represent a legitimate repeated event. Investigate before deleting.

```python
df.duplicated().sum()
df[df.duplicated()]
```

Remove exact duplicate rows:

```python
df = df.drop_duplicates()
```

Check duplicates using a key column:

```python
df[df.duplicated(subset=["Order_ID"], keep=False)]
```

Do not assume every repeated customer or product is a duplicate. A customer can place many orders. A product can appear in many order rows. The correct duplicate check depends on what one row is supposed to represent.

## 11. Correcting data types

A column may contain numbers stored as text, or dates stored as strings.

```python
df["Quantity"] = pd.to_numeric(df["Quantity"], errors="coerce")
df["Order_Date"] = pd.to_datetime(df["Order_Date"], errors="coerce")
```

- `pd.to_numeric()` converts values to numeric form.
- `pd.to_datetime()` converts date-like values to datetime.
- `errors="coerce"` converts invalid values into missing values. Inspect those newly missing values; do not ignore them.

Check the result:

```python
df.dtypes
```

## 12. Cleaning inconsistent text

Text can look different because of capitalisation or extra spaces.

```python
df["City"] = df["City"].str.strip().str.title()
df["Product"] = df["Product"].str.strip().str.title()
df["Category"] = df["Category"].str.strip().str.title()
```

For example, " lagos ", "LAGOS" and "Lagos" can be standardised to "Lagos".

Standardisation should preserve meaning. Do not blindly title-case fields where case matters, such as email addresses, codes or identifiers.

You can replace known inconsistent labels:

```python
df["Payment_Method"] = df["Payment_Method"].replace({
    "Bank Transfer": "Transfer",
    "bank transfer": "Transfer"
})
```

## 13. Creating calculated columns

A DataFrame can calculate a new column from existing columns.

For a shop, revenue is quantity multiplied by unit price:

```python
df["Revenue_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]
```

This calculation is applied to the column values. You do not need to write a loop through each row.

A discount example:

```python
df["Discount_Rate"] = 0.10
df["Discount_NGN"] = df["Revenue_NGN"] * df["Discount_Rate"]
df["Net_Revenue_NGN"] = df["Revenue_NGN"] - df["Discount_NGN"]
```

Only calculate a metric when the required fields and business definition are available. Revenue is not profit. Profit requires cost information.

## 14. Summary statistics and aggregation

Useful numeric methods include:

```python
df["Revenue_NGN"].sum()
df["Revenue_NGN"].mean()
df["Revenue_NGN"].median()
df["Revenue_NGN"].min()
df["Revenue_NGN"].max()
df["Revenue_NGN"].std()
df["Order_ID"].count()
```

### Grouping with groupby

Grouping lets you answer questions such as:
- Which city generated the highest revenue?
- Which product category sold the most units?
- Which sales channel had the most orders?

```python
revenue_by_city = (
    df.groupby("City")["Revenue_NGN"]
      .sum()
      .sort_values(ascending=False)
)
print(revenue_by_city)
```

Group by more than one field:

```python
category_channel = (
    df.groupby(["Category", "Channel"])
      .agg(
          Total_Revenue=("Revenue_NGN", "sum"),
          Units_Sold=("Quantity", "sum"),
          Order_Rows=("Order_ID", "count")
      )
      .reset_index()
)
```

The `agg()` method allows you to calculate multiple summaries. `reset_index()` turns grouped labels back into ordinary columns.

### Count and nunique are different

- `count()` counts non-missing values.
- `nunique()` counts distinct values.
- `size()` counts rows in each group, including rows with missing values in other columns.

Choose the measure that answers your question.

## 15. Working with NumPy

NumPy's main structure is an array. An array can hold numerical values and perform operations across them efficiently.

```python
import numpy as np

daily_sales = np.array([12000, 15000, 9000, 18000])
print(daily_sales.mean())
print(daily_sales.sum())
print(daily_sales.max())
```

Operations apply to all array elements:

```python
prices = np.array([1000, 2500, 4000])
discounted_prices = prices * 0.9
print(discounted_prices)
```

Useful properties:
- `ndim`: number of dimensions.
- `shape`: size along each dimension.
- `dtype`: data type of the array.
- `size`: total number of elements.

```python
matrix = np.array([[1, 2, 3], [4, 5, 6]])
print(matrix.ndim)   # 2
print(matrix.shape)  # (2, 3)
print(matrix.size)   # 6
```

For now, understand arrays and simple calculations. pandas is the main tool for this week's tabular analysis.

## 16. Exporting your cleaned data

After cleaning, save a new file:

```python
df.to_csv("naija_shop_orders_cleaned.csv", index=False)
```

The `index=False` argument prevents pandas from adding the DataFrame row index as an extra column.

Keep the raw source file unchanged. Save the cleaned output separately so another analyst can compare the original and prepared data.

## 17. A complete beginner workflow

A sensible first workflow looks like this:

1. Import libraries.
2. Load the dataset.
3. Inspect its size, columns, types and sample rows.
4. Check missing values and duplicates.
5. Investigate inconsistent values.
6. Clean only where there is a defensible reason.
7. Create calculated columns.
8. Group and summarise the data.
9. Validate totals and counts.
10. Export the cleaned data and document decisions.

Example starter:

```python
import pandas as pd

df = pd.read_csv("naija_shop_orders_raw.csv")

print(df.shape)
print(df.head())
print(df.info())
print(df.isna().sum())
print("Exact duplicates:", df.duplicated().sum())

df = df.drop_duplicates()
df["City"] = df["City"].str.strip().str.title()
df["Quantity"] = pd.to_numeric(df["Quantity"], errors="coerce")
df["Unit_Price_NGN"] = pd.to_numeric(
    df["Unit_Price_NGN"], errors="coerce"
)
df["Order_Date"] = pd.to_datetime(
    df["Order_Date"], errors="coerce"
)
df["Revenue_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]

print(df.groupby("City")["Revenue_NGN"].sum())
df.to_csv("naija_shop_orders_cleaned.csv", index=False)
```

This is a starting demonstration, not a universal cleaning recipe. The assignment asks you to make and explain your own decisions.

## 18. Common mistakes

| Mistake | Why it happens | How to fix it |
|---|---|---|
| FileNotFoundError | Wrong working directory or path | Check where the notebook runs and where the file is saved |
| KeyError | Column name is misspelled or has extra spaces | Print `df.columns` and inspect exact names |
| Comparing numbers stored as text | Column has object/string type | Convert using `pd.to_numeric()` |
| Using `and` instead of `&` | Confusing Python scalar logic with pandas Series | Use parentheses and `&` / `|` |
| Unexpected missing values | Invalid conversion used `errors="coerce"` | Inspect rows where conversion failed |
| Deleting valid repeated records | Duplicate definition was not considered | Check row grain and key fields first |
| Incorrect revenue | Wrong formula or data type | Verify quantity × unit price and test sample rows |
| Exported index column | Default CSV export includes index | Use `index=False` |

## 19. Week 13 recap

You have learned to use pandas to load, inspect, filter, clean, transform, group and export tabular data. You have also met NumPy arrays and basic numerical operations.

The important habit is to inspect before changing anything. A clean-looking dataset is not necessarily an accurate dataset. Document decisions, validate results and be honest about what the data cannot tell you.

Week 14 will focus on exploratory analysis and visualisation: moving from prepared data to patterns, questions and evidence-based insights.
