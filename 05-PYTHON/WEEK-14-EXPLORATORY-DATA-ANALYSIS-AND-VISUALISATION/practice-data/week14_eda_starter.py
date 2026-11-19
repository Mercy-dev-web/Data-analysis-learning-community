"""Week 14 starter: run from any folder using this script's own location."""
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

HERE = Path(__file__).parent
OUT = HERE / "outputs"
OUT.mkdir(exist_ok=True)
df = pd.read_csv(HERE / "naija_retail_eda.csv")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
df["Revenue_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]
df["Cost_NGN"] = df["Quantity"] * df["Unit_Cost_NGN"]
df["Gross_Profit_NGN"] = df["Revenue_NGN"] - df["Cost_NGN"]
df["Month"] = df["Order_Date"].dt.to_period("M").astype(str)

print("Shape:", df.shape)
print(df.head())
df.info()
print("Missing values:\n", df.isna().sum())
print("Duplicate rows:", df.duplicated().sum())
print(df[["Quantity", "Revenue_NGN", "Gross_Profit_NGN"]].describe())
print("Total revenue:", df["Revenue_NGN"].sum())
print("Total gross profit:", df["Gross_Profit_NGN"].sum())
print("Revenue by city:\n", df.groupby("City")["Revenue_NGN"].sum().sort_values(ascending=False))

monthly = df.groupby("Month").agg(
    Revenue_NGN=("Revenue_NGN", "sum"),
    Order_Lines=("Revenue_NGN", "size"),
    Gross_Profit_NGN=("Gross_Profit_NGN", "sum")
).reset_index()
monthly.to_csv(OUT / "monthly_revenue_summary.csv", index=False)

def save_show(name):
    plt.tight_layout()
    plt.savefig(OUT / name, dpi=150)
    plt.show()

plt.figure(figsize=(8, 4))
plt.plot(monthly["Month"], monthly["Revenue_NGN"], marker="o")
plt.title("Monthly Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue (NGN)")
plt.xticks(rotation=45)
save_show("monthly_revenue.png")

city = df.groupby("City")["Revenue_NGN"].sum().sort_values()
plt.figure(figsize=(8, 4))
plt.barh(city.index, city.values)
plt.title("Revenue by City")
plt.xlabel("Revenue (NGN)")
plt.ylabel("City")
save_show("revenue_by_city.png")

category = df.groupby("Category")["Revenue_NGN"].sum().sort_values()
plt.figure(figsize=(7, 4))
plt.bar(category.index, category.values)
plt.title("Revenue by Category")
plt.xlabel("Category")
plt.ylabel("Revenue (NGN)")
save_show("revenue_by_category.png")

plt.figure(figsize=(8, 4))
plt.hist(df["Revenue_NGN"], bins=8, edgecolor="black")
plt.title("Distribution of Order-Line Revenue")
plt.xlabel("Revenue (NGN)")
plt.ylabel("Number of order lines")
save_show("revenue_histogram.png")

plt.figure(figsize=(8, 3))
plt.boxplot(df["Revenue_NGN"], vert=False)
plt.title("Order-Line Revenue Boxplot")
plt.xlabel("Revenue (NGN)")
save_show("revenue_boxplot.png")

plt.figure(figsize=(7, 4))
plt.scatter(df["Quantity"], df["Revenue_NGN"])
plt.title("Quantity and Revenue")
plt.xlabel("Quantity")
plt.ylabel("Revenue (NGN)")
save_show("quantity_vs_revenue.png")

print("Done. Monthly summary and charts are in:", OUT)
