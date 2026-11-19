"""
Week 13 — Python for Data Analysis
Run from this folder, or update the CSV path to match your working directory.
Install pandas and numpy in the active environment if they are not available.
"""

import pandas as pd
import numpy as np

# 1. Create a small DataFrame
sample = {
    "Product": ["Soap", "Lotion", "Perfume", "Soap"],
    "Quantity": [5, 3, 2, 4],
    "Unit_Price_NGN": [800, 4500, 12000, 800],
    "City": ["Lagos", "Ibadan", "Lagos", "Abuja"]
}
sample_df = pd.DataFrame(sample)
print("SAMPLE DATA")
print(sample_df)

# 2. Load the practice dataset
df = pd.read_csv("naija_shop_orders_raw.csv")

# 3. Inspect the raw data
print("\nRAW DATA SHAPE:", df.shape)
print(df.head())
print(df.info())
print("\nMISSING VALUES")
print(df.isna().sum())
print("\nEXACT DUPLICATES:", df.duplicated().sum())

# 4. Make a working copy and clean exact duplicate rows
clean_df = df.drop_duplicates().copy()

# 5. Standardise text fields without inventing missing values
text_columns = [
    "Product", "Category", "City", "Channel", "Payment_Method"
]
for column in text_columns:
    clean_df[column] = clean_df[column].str.strip().str.title()

# Preserve missing cities as missing; do not guess them.
# Convert dates and numeric fields.
clean_df["Order_Date"] = pd.to_datetime(
    clean_df["Order_Date"], errors="coerce"
)
clean_df["Quantity"] = pd.to_numeric(
    clean_df["Quantity"], errors="coerce"
)
clean_df["Unit_Price_NGN"] = pd.to_numeric(
    clean_df["Unit_Price_NGN"], errors="coerce"
)

# 6. Calculate revenue for each row
clean_df["Revenue_NGN"] = (
    clean_df["Quantity"] * clean_df["Unit_Price_NGN"]
)

# 7. Summarise the data
print("\nCLEAN DATA SHAPE:", clean_df.shape)
print("\nTOTAL REVENUE:", clean_df["Revenue_NGN"].sum())
print("TOTAL QUANTITY:", clean_df["Quantity"].sum())
print("AVERAGE ROW REVENUE:", clean_df["Revenue_NGN"].mean())

print("\nREVENUE BY CITY")
print(
    clean_df.groupby("City", dropna=False)["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

print("\nREVENUE BY CATEGORY")
print(
    clean_df.groupby("Category", dropna=False)["Revenue_NGN"]
    .sum()
    .sort_values(ascending=False)
)

print("\nCHANNEL SUMMARY")
channel_summary = clean_df.groupby("Channel").agg(
    Total_Revenue=("Revenue_NGN", "sum"),
    Total_Units=("Quantity", "sum"),
    Order_Rows=("Order_ID", "count")
)
print(channel_summary)

# 8. NumPy example
daily_sales = np.array([12000, 15000, 9000, 18000])
print("\nNUMPY ARRAY MEAN:", daily_sales.mean())
print("NUMPY ARRAY TOTAL:", daily_sales.sum())

# 9. Export the cleaned data
clean_df.to_csv("naija_shop_orders_cleaned.csv", index=False)
print("\nSaved naija_shop_orders_cleaned.csv")
