"""Week 15 NaijaGlow capstone starter.
Run this file from its current location; outputs are written to outputs/.
Install: pip install pandas numpy matplotlib
"""
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

HERE = Path(__file__).parent
DATA = HERE / "data"
OUT = HERE / "outputs"
OUT.mkdir(exist_ok=True)

customers = pd.read_csv(DATA / "customers.csv")
products = pd.read_csv(DATA / "products.csv")
sales = pd.read_csv(DATA / "sales.csv", parse_dates=["OrderDate"])

# 1. Inspect tables and keys before joining.
for name, table in [("customers", customers), ("products", products), ("sales", sales)]:
    print(f"\n{name}: {table.shape}")
    print(table.head())
    print(table.isna().sum())
    print("Duplicate rows:", table.duplicated().sum())

assert customers["CustomerID"].is_unique
assert products["ProductID"].is_unique
assert sales["OrderLineID"].is_unique
assert sales["CustomerID"].isin(customers["CustomerID"]).all()
assert sales["ProductID"].isin(products["ProductID"]).all()

# 2. Join the fact table to its dimensions.
df = sales.merge(customers, on="CustomerID", how="left")
df = df.merge(products, on="ProductID", how="left", validate="many_to_one")

# 3. Create consistent business measures.
df["GrossSalesNGN"] = df["Quantity"] * df["UnitPriceNGN"]
df["DiscountAmountNGN"] = df["GrossSalesNGN"] * df["DiscountPct"]
df["NetRevenueNGN"] = df["GrossSalesNGN"] - df["DiscountAmountNGN"]
df["ProductCostNGN"] = df["Quantity"] * df["UnitCostNGN"]
df["GrossProfitNGN"] = df["NetRevenueNGN"] - df["ProductCostNGN"]
df["GrossMarginPct"] = df["GrossProfitNGN"].div(\n    df["NetRevenueNGN"].where(df["NetRevenueNGN"] != 0)\n)
df["SalesMonth"] = df["OrderDate"].dt.to_period("M").astype(str)

print("\nOverall totals")
print(df[["NetRevenueNGN", "ProductCostNGN", "GrossProfitNGN", "Quantity"]].sum())
print("Distinct orders:", df["OrderID"].nunique())

# 4. Build summaries.
monthly = df.groupby("SalesMonth").agg(
    NetRevenueNGN=("NetRevenueNGN", "sum"),
    GrossProfitNGN=("GrossProfitNGN", "sum"),
    Orders=("OrderID", "nunique")
).reset_index()
city = df.groupby("City")["NetRevenueNGN"].sum().sort_values(ascending=False)
category = df.groupby("Category")["NetRevenueNGN"].sum().sort_values(ascending=False)
channel = df.groupby("SalesChannel").agg(
    NetRevenueNGN=("NetRevenueNGN", "sum"),
    Orders=("OrderID", "nunique"),
    Units=("Quantity", "sum")
).reset_index()

# 5. Export reusable outputs.
df.to_csv(OUT / "cleaned_analysis.csv", index=False)
monthly.to_csv(OUT / "monthly_summary.csv", index=False)
city.rename("NetRevenueNGN").to_csv(OUT / "city_summary.csv")

# 6. Make and save charts.
plt.figure(figsize=(8, 4))
plt.plot(monthly["SalesMonth"], monthly["NetRevenueNGN"], marker="o")
plt.title("NaijaGlow Monthly Net Revenue")
plt.xlabel("Month")
plt.ylabel("Net revenue (NGN)")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig(OUT / "monthly_revenue.png", dpi=150)
plt.show()

plt.figure(figsize=(8, 4))
plt.barh(city.index[::-1], city.values[::-1])
plt.title("Net Revenue by City")
plt.xlabel("Net revenue (NGN)")
plt.ylabel("City")
plt.tight_layout()
plt.savefig(OUT / "revenue_by_city.png", dpi=150)
plt.show()

plt.figure(figsize=(7, 4))
plt.bar(category.index, category.values)
plt.title("Net Revenue by Category")
plt.xlabel("Category")
plt.ylabel("Net revenue (NGN)")
plt.tight_layout()
plt.savefig(OUT / "revenue_by_category.png", dpi=150)
plt.show()

print("\nChannel summary")
print(channel)
print("\nNext: add your own analyses, explain your findings and document limitations.")
