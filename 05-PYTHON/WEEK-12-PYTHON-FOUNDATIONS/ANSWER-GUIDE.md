# Week 12 Answer Guide

Use this guide after attempting the exercises. There may be other correct ways to solve a problem.

## Exercise solutions

### Part A

```python
customer_name = "Amina"
city = "Ibadan"
age = 24
has_paid = True

quantity = 7
unit_price = 3200
total = quantity * unit_price
print(total)  # 22400

values = ["4500", 4500, 4500.75, False]
for value in values:
    print(type(value))

amount = int("12500")
print(amount + 2500)  # 15000
```

A single `=` assigns a value. `==` checks whether two values are equal.

### Part B

```python
revenue = 95000
target = 80000
orders = 12

print(revenue >= target)  # True
print(revenue >= target and orders >= 10)  # True

order_value = 18000
is_premium = True
free_delivery = order_value >= 20000 or is_premium
print(free_delivery)  # True

brand = "  glow theory  "
brand = brand.strip().title()
print(brand)  # Glow Theory

customer = "Amina"
items = 3
total = 7500
print(f"{customer} purchased {items} items for ₦{total:,}.")
```

### Part C

```python
products = ["Soap", "Lotion", "Perfume", "Cream", "Serum"]
print(products[0], products[-1])
products.append("Cleanser")
products[1] = "Body Lotion"

months = ("January", "February", "March")
print(months[1])

product = {"name": "Face Cream", "price": 6500, "category": "Skincare"}
print(product["price"])
product["brand"] = "Glow Theory"

cities = ["Lagos", "Ibadan", "Lagos", "Abuja", "Ibadan"]
unique_cities = set(cities)
print(len(unique_cities))  # 3
```

### Part D

```python
score = 65
if score >= 70:
    print("Excellent")
elif score >= 50:
    print("Pass")
else:
    print("Needs improvement")

sales = [12000, 15000, 9000, 18000]
for value in sales:
    print(value)

for number in range(1, 11):
    print(number)

total = 0
for value in sales:
    total += value
print(total)  # 54000

number = 1
while number <= 5:
    print(number)
    number += 1
```

### Part E

```python
def calculate_total(quantity, unit_price):
    return quantity * unit_price

print(calculate_total(4, 2500))  # 10000

def classify_sales(sales):
    if sales >= 100000:
        return "Target achieved"
    return "Below target"

def discounted_amount(amount, discount_rate=0.10):
    return amount * (1 - discount_rate)

print(discounted_amount(10000))  # 9000.0
```

A parameter is the variable named in the function definition. An argument is the actual value passed to the function call. Functions make code reusable, easier to test and easier to maintain.

### Part F

26. Convert the string to a number first:

```python
sales = float("5000")
quantity = 3
total = sales * quantity
print("Total:", total)  # 15000.0
```

27. Add the missing colon:

```python
score = 75
if score >= 50:
    print("Pass")
```

28. The loop never changes `number`, so its condition remains true. Add `number += 1` inside the loop.

29. It raises a `ValueError`: the text "hello" cannot be converted to an integer.

30. Check that the cell defining `revenue` has run, and check the spelling/capitalisation of the variable.

## Mini challenge sample

```python
daily_sales = [18000, 25000, 12000, 30000, 20000]

def calculate_average(values):
    return sum(values) / len(values)

total_sales = sum(daily_sales)
average_sales = calculate_average(daily_sales)

print(f"Total sales: ₦{total_sales:,}")
print(f"Days recorded: {len(daily_sales)}")
print(f"Average daily sales: ₦{average_sales:,.2f}")
print(f"Highest sales: ₦{max(daily_sales):,}")
print(f"Lowest sales: ₦{min(daily_sales):,}")

if average_sales >= 20000:
    print("Average target achieved")
else:
    print("Average target not achieved")
```

Expected results:
- Total sales: ₦105,000
- Days recorded: 5
- Average daily sales: ₦21,000.00
- Highest sales: ₦30,000
- Lowest sales: ₦12,000
- Average target achieved

## Assignment validation figures

The supplied CSV contains 12 rows. Expected figures:

- Total quantity sold: 32
- Total revenue: ₦146,000
- Average revenue per order row: ₦12,166.67 (approximately)
- Highest row revenue: ₦30,000
- Lowest row revenue: ₦4,000

Payment-method counts:
- Transfer: 5
- Card: 4
- Cash: 3

City row counts:
- Lagos: 4
- Ibadan: 3
- Abuja: 3
- Osogbo: 2

Revenue is not profit. The dataset does not contain costs, so do not calculate or claim profit.

## Assignment sample solution

Save this as `week12_sales_summary.py` in the same folder as the CSV, or adjust the file path to match your folder structure.

```python
import csv

def calculate_revenue(quantity, unit_price):
    return quantity * unit_price

def classify_revenue(total_revenue, target=100000):
    if total_revenue >= target:
        return "Target achieved"
    return "Target not achieved"

revenues = []
quantities = []
order_count = 0

with open("mini_shop_sales.csv", mode="r", newline="", encoding="utf-8") as file:
    reader = csv.DictReader(file)

    for row in reader:
        quantity = int(row["Quantity"])
        unit_price = float(row["Unit_Price_NGN"])
        revenue = calculate_revenue(quantity, unit_price)

        quantities.append(quantity)
        revenues.append(revenue)
        order_count += 1

        print(f"{row['Product']}: ₦{revenue:,.2f}")

total_revenue = sum(revenues)
total_quantity = sum(quantities)
average_revenue = total_revenue / order_count

print("\nSALES SUMMARY")
print(f"Total revenue: ₦{total_revenue:,.2f}")
print(f"Total quantity sold: {total_quantity}")
print(f"Order rows: {order_count}")
print(f"Average revenue per order row: ₦{average_revenue:,.2f}")
print(f"Highest row revenue: ₦{max(revenues):,.2f}")
print(f"Lowest row revenue: ₦{min(revenues):,.2f}")
print(classify_revenue(total_revenue))
```

The code assumes the CSV is in the current working directory. If you receive a FileNotFoundError, check the file path rather than changing the calculations.
