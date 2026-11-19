# Week 12 Exercises

Attempt each question yourself before checking the answer guide. Write and run your code; do not only read it.

## Part A — Variables and data types

1. Create variables for a customer's name, city, age and whether the customer has paid. Use appropriate data types.
2. Create `quantity = 7` and `unit_price = 3200`. Calculate and print the total order value.
3. Use `type()` to identify the data type of `"4500"`, `4500`, `4500.75` and `False`.
4. Convert the text value `"12500"` to a number and add 2500 to it.
5. Explain the difference between `=` and `==`.

## Part B — Operators and strings

6. A vendor records revenue of ₦95,000 against a target of ₦80,000. Write a comparison that checks whether the target was achieved.
7. Check whether both conditions are true: revenue is at least ₦80,000 and orders are at least 10.
8. Check whether a customer is eligible for free delivery if the order value is at least ₦20,000 OR the customer is a premium member.
9. Given `brand = "  glow theory  "`, remove the extra spaces and convert the result to title case.
10. Use an f-string to display: "Amina purchased 3 items for ₦7,500." Build the sentence using variables.

## Part C — Data structures

11. Create a list of five products. Print the first and last items.
12. Add a new product to the list, then change the second product.
13. Create a tuple containing the months January to March. Print February.
14. Create a dictionary for one product with name, price and category. Print the price and add a brand key.
15. Given a list of cities with duplicates, use a set to find the number of unique cities.

## Part D — Conditions and loops

16. Write an if/elif/else statement that classifies a score: 70 and above = Excellent; 50–69 = Pass; below 50 = Needs improvement.
17. Loop through `[12000, 15000, 9000, 18000]` and print each value.
18. Use `range()` to print numbers 1 to 10.
19. Use a loop to calculate the total of `[12000, 15000, 9000, 18000]`. Do not use `sum()` for this question.
20. Write a while loop that prints 1, 2, 3, 4 and 5.

## Part E — Functions

21. Write a function called `calculate_total` that accepts quantity and unit price and returns their product.
22. Write a function called `classify_sales` that accepts sales and returns "Target achieved" if sales are at least 100000; otherwise return "Below target".
23. Write a function that accepts an amount and a discount rate, with a default discount rate of 10%, and returns the discounted amount.
24. Explain the difference between a parameter and an argument.
25. Explain why a function is useful to an analyst.

## Part F — Debugging

26. Correct this code:

```python
sales = "5000"
quantity = 3
total = sales * quantity
print("Total:", total)
```

27. Correct this code:

```python
score = 75
if score >= 50
    print("Pass")
```

28. What is wrong with this loop?

```python
number = 1
while number <= 5:
    print(number)
```

29. What error would you expect from `int("hello")`? Explain why.
30. A notebook says `NameError: name 'revenue' is not defined`. List two things you would check.

## Mini challenge

A small shop records daily sales as:

```python
daily_sales = [18000, 25000, 12000, 30000, 20000]
```

Write a program that displays:
- Total sales.
- Number of days recorded.
- Average daily sales.
- Highest and lowest daily sales.
- Whether the shop achieved a daily average target of ₦20,000.

Use at least one function and an f-string.
