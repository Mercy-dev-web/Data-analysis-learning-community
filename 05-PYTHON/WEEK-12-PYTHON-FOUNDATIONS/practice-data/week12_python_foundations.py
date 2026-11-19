"""
Week 12 — Python Foundations practice file
Run this file from a Python environment.
Complete each TODO before checking the lesson or answer guide.
"""

# 1. Variables and data types
shop_name = "Mercy's Mini Shop"
city = "Ibadan"
number_of_orders = 12
is_open = True

print(shop_name, city, number_of_orders, is_open)
print(type(shop_name), type(number_of_orders))

# 2. Arithmetic
quantity = 4
unit_price = 2500
order_total = quantity * unit_price
print(f"Order total: NGN {order_total:,}")

# 3. Comparisons and logical operators
sales_target = 100000
actual_sales = 125000
orders = 14
print("Target achieved:", actual_sales >= sales_target)
print("Strong performance:", actual_sales >= sales_target and orders >= 10)

# 4. Strings
product_name = "  body lotion  "
clean_product_name = product_name.strip().title()
print(clean_product_name)

# 5. Collections
products = ["Soap", "Lotion", "Perfume"]
products.append("Face Cream")
print("First product:", products[0])
print("All products:", products)

product_record = {
    "name": "Face Cream",
    "price": 6500,
    "category": "Skincare"
}
print("Product price:", product_record["price"])

# 6. Conditions
if actual_sales >= sales_target:
    print("The shop achieved its sales target.")
else:
    print("The shop did not achieve its sales target.")

# 7. Loops
daily_sales = [18000, 25000, 12000, 30000, 20000]

for day_sales in daily_sales:
    print(f"Daily sales: NGN {day_sales:,}")

# TODO: calculate the total with a loop (do not use sum() here).
running_total = 0
for day_sales in daily_sales:
    running_total += day_sales
print("Running total:", running_total)

# 8. Functions
def calculate_revenue(sold_quantity, price_per_unit):
    """Return quantity multiplied by unit price."""
    return sold_quantity * price_per_unit


def classify_target(revenue, target=100000):
    """Return a simple target status."""
    if revenue >= target:
        return "Target achieved"
    return "Below target"


print(calculate_revenue(5, 3000))
print(classify_target(actual_sales))

# 9. Built-in summary functions
print("Total:", sum(daily_sales))
print("Number of days:", len(daily_sales))
print("Average:", sum(daily_sales) / len(daily_sales))
print("Highest:", max(daily_sales))
print("Lowest:", min(daily_sales))

# Extension: try changing the values and explaining the new output.
