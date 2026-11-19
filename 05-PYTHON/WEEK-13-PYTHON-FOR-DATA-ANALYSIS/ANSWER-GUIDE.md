# Week 13 Answer Guide

Attempt the questions before using this guide. These are sample solutions; other approaches may also be correct.

## Exercise solutions

### Part A — Libraries and DataFrames

```python
import pandas as pd
import numpy as np

products = pd.DataFrame({
    "Product": ["Soap", "Lotion", "Perfume"],
    "Quantity": [5, 3, 2],
    "Unit_Price_NGN": [800, 4500, 12000]
})

df = pd.read_csv("naija_shop_orders_raw.csv")
print(df.head())
print(df.tail(3))
print(df.shape)
print(df.columns)
print(df.dtypes)
print(df.describe())
```

The dataset has 21 rows and 9 columns before cleaning. The rows represent records and the columns represent fields.

### Part B — Selecting and filtering

```python
df[["Product", "City", "Quantity"]]
df[df["City"].str.strip().str.title() == "Lagos"]
df[df["Quantity"] >= 3]

df[
    (df["City"].str.strip().str.title() == "Lagos") &
    (df["Channel"] == "Online")
]

df[
    (df["City"].str.strip().str.title() == "Ibadan") |
    (df["City"].str.strip().str.title() == "Abuja")
]

df.sort_values("Unit_Price_NGN", ascending=False)
df["Payment_Method"].value_counts()
```

### Part C — Data quality and cleaning

```python
df.isna().sum()
df.duplicated().sum()
df[df.duplicated(keep=False)]

clean_df = df.drop_duplicates().copy()

for column in ["Product", "Category", "City", "Channel", "Payment_Method"]:
    clean_df[column] = clean_df[column].str.strip().str.title()

clean_df["Order_Date"] = pd.to_datetime(clean_df["Order_Date"])
clean_df["Quantity"] = pd.to_numeric(clean_df["Quantity"])
clean_df["Unit_Price_NGN"] = pd.to_numeric(clean_df["Unit_Price_NGN"])

print(clean_df.isna().sum())
print(clean_df.duplicated().sum())
print(clean_df.dtypes)
```

There are two missing City values. Do not fill them with Lagos or another city without evidence. You can leave them missing or label them "Unknown" if that is clearer for reporting. In a grouped summary, use `dropna=False` if you want missing city values to appear as a separate group.

### Part D — Calculations and summaries

```python
clean_df["Revenue_NGN"] = (
    clean_df["Quantity"] * clean_df["Unit_Price_NGN"]
)

total_revenue = clean_df["Revenue_NGN"].sum()
total_quantity = clean_df["Quantity"].sum()
average_revenue = clean_df["Revenue_NGN"].mean()

revenue_by_city = (
    clean_df.groupby("City", dropna=False)["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

revenue_by_category = clean_df.groupby("Category")["Revenue_NGN"].sum()

channel_summary = clean_df.groupby("Channel").agg(
    Total_Revenue=("Revenue_NGN", "sum"),
    Total_Units=("Quantity", "sum"),
    Order_Rows=("Order_ID", "count")
)

revenue_by_product = (
    clean_df.groupby("Product")["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)
```

### Part E — NumPy

```python
daily_sales = np.array([12000, 15000, 9000, 18000])

print(daily_sales.sum())   # 54000
print(daily_sales.mean())  # 13500.0
print(daily_sales.min())   # 9000
print(daily_sales.max())   # 18000

reduced_prices = daily_sales * 0.9
print(reduced_prices)

matrix = np.array([[1, 2, 3], [4, 5, 6]])
print(matrix.ndim)   # 2
print(matrix.shape)  # (2, 3)
print(matrix.size)   # 6
```

The multiplication creates a new array result; it does not overwrite `daily_sales` unless you assign the result back to that variable or modify the array in place.

### Part F — Export

```python
clean_df.to_csv("naija_shop_orders_cleaned.csv", index=False)
```

## Assignment validation figures

The supplied CSV contains 21 rows before cleaning. There is one exact duplicate row. After removing it, 20 records remain.

### Data-quality checks

| Check | Expected result |
|---|---:|
| Raw rows | 21 |
| Raw columns | 9 |
| Exact duplicate rows | 1 |
| Rows after exact duplicate removal | 20 |
| Missing City values after deduplication | 2 |
| Other missing values | 0 |

Text standardisation changes values such as `LAGOS`, `IBADAN` and ` Ibadan ` to consistent labels. The two missing City values remain missing in the sample solution.

### Overall metrics

| Metric | Expected result |
|---|---:|
| Total revenue | ₦201,100 |
| Total quantity sold | 55 |
| Order rows after deduplication | 20 |
| Average revenue per order row | ₦10,055 |
| Highest row revenue | ₦24,000 |
| Lowest row revenue | ₦2,400 |

### Revenue by city

| City | Revenue |
|---|---:|
| Lagos | ₦78,400 |
| Ibadan | ₦52,000 |
| Missing / unknown city | ₦37,000 |
| Abuja | ₦22,000 |
| Osogbo | ₦11,700 |

If you label missing cities as "Unknown", the same ₦37,000 appears under that label.

### Revenue by category

| Category | Revenue |
|---|---:|
| Skincare | ₦147,500 |
| Personal Care | ₦53,600 |

### Revenue and quantity by channel

| Channel | Revenue | Units | Order rows |
|---|---:|---:|---:|
| Online | ₦132,000 | 26 | 11 |
| Store | ₦69,100 | 29 | 9 |

### Revenue by product

| Product | Revenue |
|---|---:|
| Body Lotion | ₦54,000 |
| Face Serum | ₦48,000 |
| Face Cream | ₦45,500 |
| Hair Oil | ₦24,500 |
| Hand Wash | ₦19,500 |
| Bar Soap | ₦9,600 |

Body Lotion generated the highest revenue at ₦54,000.

### Payment-method record counts

- Transfer: 9
- Card: 6
- Cash: 5

## Assignment sample solution

Save this script in the same folder as the CSV, or adjust the file path.

```python
import pandas as pd

# Load and inspect the raw data
df = pd.read_csv("naija_shop_orders_raw.csv")
print("Raw shape:", df.shape)
print(df.head())
df.info()
print(df.isna().sum())
print("Exact duplicates:", df.duplicated().sum())

# Remove exact duplicate records
clean_df = df.drop_duplicates().copy()

# Standardise text fields while preserving missing values
text_columns = [
    "Product", "Category", "City", "Channel", "Payment_Method"
]
for column in text_columns:
    clean_df[column] = clean_df[column].str.strip().str.title()

# Convert types
clean_df["Order_Date"] = pd.to_datetime(
    clean_df["Order_Date"], errors="coerce"
)
clean_df["Quantity"] = pd.to_numeric(
    clean_df["Quantity"], errors="coerce"
)
clean_df["Unit_Price_NGN"] = pd.to_numeric(
    clean_df["Unit_Price_NGN"], errors="coerce"
)

# Create revenue
clean_df["Revenue_NGN"] = (
    clean_df["Quantity"] * clean_df["Unit_Price_NGN"]
)

# Overall summary
print("\nOVERALL SUMMARY")
print("Total revenue:", clean_df["Revenue_NGN"].sum())
print("Total units:", clean_df["Quantity"].sum())
print("Order rows:", clean_df["Order_ID"].count())
print("Average row revenue:", clean_df["Revenue_NGN"].mean())
print("Highest row revenue:", clean_df["Revenue_NGN"].max())
print("Lowest row revenue:", clean_df["Revenue_NGN"].min())

# Business summaries
print("\nREVENUE BY CITY")
print(
    clean_df.groupby("City", dropna=False)["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

print("\nREVENUE BY CATEGORY")
print(
    clean_df.groupby("Category")["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

print("\nCHANNEL SUMMARY")
print(clean_df.groupby("Channel").agg(
    Total_Revenue=("Revenue_NGN", "sum"),
    Total_Units=("Quantity", "sum"),
    Order_Rows=("Order_ID", "count")
))

print("\nREVENUE BY PRODUCT")
print(
    clean_df.groupby("Product")["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

# Export a separate cleaned copy
clean_df.to_csv("naija_shop_orders_cleaned.csv", index=False)
print("\nCleaned data exported.")
```

## Example observations

A learner's explanation may include observations such as:

1. Total recorded revenue is ₦201,100 across 20 unique order records.
2. Online orders account for ₦132,000, more revenue than store orders in this dataset.
3. Skincare contributes ₦147,500, making it the larger of the two recorded categories.
4. Lagos has the highest known-city revenue at ₦78,400.
5. Two records have no city information, representing ₦37,000 in revenue. This limits a complete geographic comparison.

These observations describe the supplied records only. They do not prove why customers behave this way or establish profitability. There is no cost, customer-level or marketing-spend information in this dataset.
