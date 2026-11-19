"""Week 15 capstone starter. Install: pip install pandas numpy matplotlib"""
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

DATA = Path(__file__).parent.parent / "data" / "naija_retail_capstone.csv"
df = pd.read_csv(DATA)
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
df["Gross_Line_Sales_NGN"] = df["Quantity"] * df["Unit_Price_NGN"]
df["Net_Revenue_NGN"] = df["Gross_Line_Sales_NGN"] - df["Discount_NGN"]
df["Product_Cost_NGN"] = df["Quantity"] * df["Unit_Cost_NGN"]
df["Gross_Profit_NGN"] = df["Net_Revenue_NGN"] - df["Product_Cost_NGN"]
df["Gross_Margin_Pct"] = (100 * df["Gross_Profit_NGN"] / df["Net_Revenue_NGN"]).where(df["Net_Revenue_NGN"] > 0)

print("Shape:", df.shape)
print(df.head())
df.info()
print("Missing values:\n", df.isna().sum())
print("Duplicate rows:", df.duplicated().sum())
print("Order ID duplicates:", df["Order_ID"].duplicated().sum())
print(df[["Quantity","Net_Revenue_NGN","Gross_Profit_NGN"]].describe())
print("Net revenue:", df["Net_Revenue_NGN"].sum())
print("Gross profit:", df["Gross_Profit_NGN"].sum())

df["Month"] = df["Order_Date"].dt.to_period("M").astype(str)
monthly = df.groupby("Month").agg(Net_Revenue_NGN=("Net_Revenue_NGN","sum"),
    Gross_Profit_NGN=("Gross_Profit_NGN","sum"),
    Order_Lines=("Order_ID","count")).reset_index()
print(monthly)

for field in ["City","Sales_Channel","Category","Product"]:
    print("\n", field)
    print(df.groupby(field).agg(Net_Revenue=("Net_Revenue_NGN","sum"),
        Gross_Profit=("Gross_Profit_NGN","sum"),
        Order_Lines=("Order_ID","count")).sort_values("Net_Revenue",ascending=False))

plt.figure(figsize=(8,4))
plt.plot(monthly["Month"],monthly["Net_Revenue_NGN"],marker="o")
plt.title("Monthly Net Revenue"); plt.xlabel("Month"); plt.ylabel("Net Revenue (NGN)")
plt.xticks(rotation=45); plt.tight_layout(); plt.show()
# Extend this notebook with product, city and channel charts, discount analysis,
# returning-customer analysis, written insights and limitations.
