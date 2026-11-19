# Week 12 Lesson: Python Foundations

## 1. Why Python matters to a data analyst

Python is a general-purpose programming language. Analysts use it to automate repetitive work, clean and transform data, calculate metrics, explore datasets, create visualisations and build repeatable workflows.

Imagine a small online shop receiving hundreds of orders. Doing every calculation manually would take time and make mistakes more likely. A Python program can calculate totals, apply discounts, check order values and repeat the same steps consistently.

Python is not a replacement for Excel, SQL or Power BI. Each tool has strengths:

- **Excel:** quick calculations, spreadsheet analysis and familiar reporting.
- **SQL:** retrieving and combining data stored in relational databases.
- **Power BI:** data modelling, interactive reports and business communication.
- **Python:** automation, flexible analysis and repeatable data workflows.

This week focuses on Python fundamentals. In Week 13, you will use libraries such as pandas to work with datasets.

## 2. Setting up your environment

You need a place to write and run Python code.

### Recommended beginner route: Anaconda and Jupyter Notebook

1. Visit [Anaconda Distribution](https://www.anaconda.com/download).
2. Download the installer for your operating system.
3. Install it using the standard beginner options.
4. Open Anaconda Navigator.
5. Launch Jupyter Notebook (or JupyterLab if that is the option available).
6. Create a new notebook using a Python 3 kernel.
7. Rename it `week12_python_practice.ipynb`.

Anaconda bundles Python and commonly used tools, which reduces the number of separate installations a beginner has to manage. Alex The Analyst demonstrates this setup in the recommended course.

### Alternative: VS Code

If Python and VS Code are already installed, you can use them. Install the official Python extension, create a file ending in `.py`, and run it using the Python interpreter. Do not install several environments just because different tutorials use different tools. Choose one setup and learn it well.

### Understanding a Jupyter Notebook

A notebook contains cells:

- **Code cell:** contains Python code that you execute.
- **Markdown cell:** contains headings, notes and explanations.
- **Kernel:** the Python process that executes your code and remembers variables while it is running.

Run a selected cell with Shift + Enter. Cells run in an order, but you can run them out of order. If a variable is not recognised, check whether the cell that creates it has run. Restarting the kernel clears the current in-memory variables.

## 3. Your first Python program

Type this into a code cell:

```python
print("Hello, data analyst!")
print("I am learning Python.")
```

`print()` displays information. Text must be placed inside quotation marks.

Python is case-sensitive. `name`, `Name` and `NAME` are different names.

## 4. Comments and indentation

A comment explains code and is ignored by Python:

```python
# Calculate the total value of an order
quantity = 3
unit_price = 2500
total = quantity * unit_price
print(total)
```

Indentation means spaces at the beginning of a line. Python uses indentation to identify blocks of code. Four spaces is the common convention.

```python
if total > 5000:
    print("Large order")
```

The indented line belongs to the if statement. Missing or inconsistent indentation can cause an error.

## 5. Variables

A variable is a named place to store a value.

```python
customer_name = "Amina"
quantity_sold = 4
unit_price = 3500
revenue = quantity_sold * unit_price

print(customer_name)
print(revenue)
```

Variable naming rules and good habits:

- Use meaningful names such as `total_sales` instead of `x`.
- A name can contain letters, numbers and underscores.
- A name cannot begin with a number.
- Do not use spaces in variable names; use underscores.
- Avoid Python reserved words such as `if`, `for` and `class`.

Python can infer the type of a value, so you do not need to declare it in advance.

## 6. Common data types

| Type | Meaning | Example |
|---|---|---|
| int | Whole number | `25` |
| float | Decimal number | `1250.50` |
| str | Text | `"Lagos"` |
| bool | True or False | `True` |

Use `type()` to inspect a value:

```python
quantity = 5
price = 1250.50
city = "Ibadan"
is_paid = True

print(type(quantity))
print(type(price))
print(type(city))
print(type(is_paid))
```

Note: `True` and `False` begin with capital letters in Python.

## 7. Type conversion

Sometimes a value arrives in a different type from the one you need.

```python
quantity_text = "4"
quantity = int(quantity_text)

price_text = "2500.50"
price = float(price_text)

print(quantity * price)
```

Common conversion functions:

- `int(value)` converts to an integer when possible.
- `float(value)` converts to a decimal number when possible.
- `str(value)` converts a value to text.
- `bool(value)` converts a value to a Boolean.

A conversion can fail. For example, `int("four")` raises a ValueError because the word cannot be converted to an integer.

## 8. Operators

### Arithmetic operators

| Operator | Meaning | Example | Result |
|---|---|---|---|
| `+` | Addition | `10 + 3` | 13 |
| `-` | Subtraction | `10 - 3` | 7 |
| `*` | Multiplication | `10 * 3` | 30 |
| `/` | Division | `10 / 4` | 2.5 |
| `//` | Floor division | `10 // 4` | 2 |
| `%` | Remainder | `10 % 4` | 2 |
| `**` | Exponent | `2 ** 3` | 8 |

Example: a vendor sells 6 packs at ₦2,500 each.

```python
quantity = 6
unit_price = 2500
revenue = quantity * unit_price
print(revenue)  # 15000
```

### Comparison operators

Comparison operators return `True` or `False`.

- `==` equal to
- `!=` not equal to
- `>` greater than
- `<` less than
- `>=` greater than or equal to
- `<=` less than or equal to

Do not confuse `=` and `==`. A single equals sign assigns a value; a double equals sign compares two values.

### Logical operators

- `and`: both conditions must be true.
- `or`: at least one condition must be true.
- `not`: reverses a Boolean result.

```python
sales = 85000
target = 70000
orders = 12

print(sales >= target and orders >= 10)  # True
print(sales >= target or orders >= 20)   # True
print(not sales >= target)               # False
```

## 9. Strings

A string is text. Strings can use single or double quotation marks.

```python
brand = "Glow Theory"
city = "Lagos"

print(brand.upper())
print(brand.lower())
print(brand.replace("Glow", "Pure"))
print(len(brand))
print(city[0])
```

Useful string operations:

- `.upper()` makes text uppercase.
- `.lower()` makes text lowercase.
- `.strip()` removes whitespace from the beginning and end.
- `.replace(old, new)` replaces text.
- `len(text)` returns the number of characters.
- `text[0]` accesses the first character (Python indexing starts at zero).

### f-strings

An f-string makes it easier to insert values into text:

```python
product = "Body Lotion"
quantity = 3
unit_price = 4500
total = quantity * unit_price

print(f"{quantity} units of {product} cost ₦{total:,}.")
```

The comma in `{total:,}` adds thousands separators for readability.

## 10. Data structures

Data structures help you store collections of values.

### Lists

A list is ordered and changeable. It allows duplicate values.

```python
products = ["Soap", "Lotion", "Perfume"]
print(products[0])       # Soap
products.append("Cream")
products[1] = "Body Lotion"
print(products)
print(len(products))
```

List positions start at zero. `append()` adds an item to the end.

### Tuples

A tuple is ordered but cannot be changed after creation.

```python
months = ("January", "February", "March")
print(months[1])
```

Use a tuple when the collection should remain fixed.

### Dictionaries

A dictionary stores information as key-value pairs.

```python
product = {
    "name": "Face Cream",
    "price": 6500,
    "category": "Skincare"
}

print(product["name"])
print(product["price"])
product["price"] = 7000
product["brand"] = "Glow Theory"
```

A dictionary is useful when each record has named fields.

### Sets

A set stores unique values and does not preserve a reliable positional order.

```python
cities = {"Lagos", "Ibadan", "Lagos", "Abuja"}
print(cities)
print(len(cities))  # 3 unique cities
```

Sets are useful when you need distinct values. Do not use numeric positions to access set items.

## 11. Conditional statements

A conditional statement lets a program make a decision.

```python
sales = 125000

if sales >= 100000:
    performance = "Target achieved"
elif sales >= 70000:
    performance = "Close to target"
else:
    performance = "Below target"

print(performance)
```

Python checks the conditions from top to bottom. The first true condition runs. The `else` block runs when none of the earlier conditions is true.

## 12. Loops

Loops repeat instructions.

### for loop

Use a for loop when you want to go through items in a collection:

```python
products = ["Soap", "Lotion", "Perfume"]

for product in products:
    print(product)
```

Use `range()` to generate a sequence of numbers:

```python
for number in range(1, 6):
    print(number)
```

The ending number is excluded, so `range(1, 6)` produces 1, 2, 3, 4 and 5.

### while loop

A while loop repeats as long as its condition remains true:

```python
attempts = 1

while attempts <= 3:
    print(f"Attempt {attempts}")
    attempts += 1
```

Be careful: if the condition never becomes false, the loop can run forever. Make sure something inside the loop changes the condition.

## 13. Functions

A function is a reusable block of code. It can receive information through parameters and send a result back using `return`.

```python
def calculate_revenue(quantity, unit_price):
    revenue = quantity * unit_price
    return revenue

result = calculate_revenue(5, 3000)
print(result)  # 15000
```

- `def` begins a function definition.
- `quantity` and `unit_price` are parameters.
- `5` and `3000` are arguments passed when calling the function.
- `return` sends the result back to the caller.

A function can also have a default parameter:

```python
def apply_discount(amount, discount_rate=0.10):
    return amount * (1 - discount_rate)

print(apply_discount(10000))      # 9000.0
print(apply_discount(10000, 0.2)) # 8000.0
```

## 14. Reading a simple CSV file (preview only)

A CSV file stores tabular data as text. Python has a built-in `csv` module. This is a small preview; Week 13 will teach proper data analysis with pandas.

Place `mini_shop_sales.csv` in the same folder as your notebook or script:

```python
import csv

with open("mini_shop_sales.csv", mode="r", newline="", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    for row in reader:
        print(row["Product"], row["Quantity"], row["Unit_Price_NGN"])
```

If Python says the file cannot be found, check your current working directory and the file's location. Do not assume the notebook is running from the folder you expect.

## 15. Errors and debugging

Errors are part of programming. Read the last line of the error message first, then inspect the line number and the code around it.

| Error | Common cause | What to check |
|---|---|---|
| SyntaxError | Python cannot understand the code | Missing colon, bracket or quotation mark |
| NameError | A name has not been defined | Spelling and whether the variable was created |
| TypeError | An operation does not support that type | Whether you are mixing text and numbers |
| ValueError | A value is unsuitable for a conversion or operation | The actual content being converted |
| IndentationError | Incorrect indentation | Spaces at the beginning of each line |
| ZeroDivisionError | Dividing by zero | Check the denominator before dividing |
| FileNotFoundError | File path does not exist | File name and working directory |

Example of a type error:

```python
price = "2500"
quantity = 3
# print(price * quantity) repeats text; it does not calculate numeric revenue.
price = float(price)
print(price * quantity)
```

## 16. A small analyst-style program

```python
sales = [15000, 22000, 18000, 30000, 25000]

total_sales = sum(sales)
number_of_days = len(sales)
average_sales = total_sales / number_of_days
highest_sales = max(sales)
lowest_sales = min(sales)

print(f"Total sales: ₦{total_sales:,}")
print(f"Average daily sales: ₦{average_sales:,.2f}")
print(f"Highest daily sales: ₦{highest_sales:,}")
print(f"Lowest daily sales: ₦{lowest_sales:,}")
```

This uses built-in functions `sum()`, `len()`, `max()` and `min()`. You will use these ideas again when working with real datasets.

## 17. Week 12 recap

You have met the building blocks of Python: values, variables, types, operators, strings, collections, decisions, loops and functions. You should now be able to read a short program and explain what each part does.

**Do not rush into copying advanced data-analysis notebooks.** Understand the basics first. Week 13 introduces Python libraries for working with datasets.
