-- Week 15 Capstone starter queries (MySQL 8)
-- Import data/naija_retail_capstone.csv into retail_orders.
-- Net Revenue = Quantity * Unit_Price_NGN - Discount_NGN
-- Gross Profit = Net Revenue - Quantity * Unit_Cost_NGN

SELECT * FROM retail_orders LIMIT 10;

-- Overall performance
SELECT COUNT(*) AS order_lines, SUM(Quantity) AS units_sold,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue,
 SUM(Quantity * Unit_Cost_NGN) AS product_cost,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN - Quantity * Unit_Cost_NGN) AS gross_profit
FROM retail_orders;

-- Monthly trend
SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue
FROM retail_orders GROUP BY DATE_FORMAT(Order_Date,'%Y-%m') ORDER BY month;

-- Product performance
SELECT Product, SUM(Quantity) AS units,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN - Quantity * Unit_Cost_NGN) AS gross_profit
FROM retail_orders GROUP BY Product ORDER BY net_revenue DESC;

-- City performance
SELECT City, SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue
FROM retail_orders GROUP BY City ORDER BY net_revenue DESC;

-- Channel comparison
SELECT Sales_Channel, COUNT(*) AS order_lines,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN - Quantity * Unit_Cost_NGN) AS gross_profit
FROM retail_orders GROUP BY Sales_Channel;

-- Customers with multiple order lines (not necessarily distinct shopping visits)
SELECT Customer_ID, COUNT(*) AS order_lines
FROM retail_orders GROUP BY Customer_ID HAVING COUNT(*) > 1;

-- Discount totals by month
SELECT DATE_FORMAT(Order_Date,'%Y-%m') AS month, SUM(Discount_NGN) AS discounts,
 SUM(Quantity * Unit_Price_NGN - Discount_NGN) AS net_revenue
FROM retail_orders GROUP BY DATE_FORMAT(Order_Date,'%Y-%m') ORDER BY month;
-- Note: this teaching file contains one line per Order_ID. Real orders may have
-- multiple item lines; model order headers and order items separately where needed.
