-- Week 15 Capstone: NaijaGlow Retail Performance
-- MySQL 8.0+ starter script.
-- Create the schema, then import the three CSV files using MySQL Workbench's
-- Table Data Import Wizard (right-click the schema > Table Data Import Wizard).
-- Import to tables named customers, products and sales.
-- CSV files are in the data/ folder.

CREATE DATABASE IF NOT EXISTS naijaglow_capstone;
USE naijaglow_capstone;

-- Create the tables before importing.
CREATE TABLE IF NOT EXISTS customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    CustomerSegment VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitPriceNGN DECIMAL(12,2) NOT NULL,
    UnitCostNGN DECIMAL(12,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS sales (
    OrderLineID VARCHAR(10) PRIMARY KEY,
    OrderID VARCHAR(10) NOT NULL,
    OrderDate DATE NOT NULL,
    CustomerID VARCHAR(10) NOT NULL,
    ProductID VARCHAR(10) NOT NULL,
    Quantity INT NOT NULL,
    SalesChannel VARCHAR(20) NOT NULL,
    DiscountPct DECIMAL(5,2) NOT NULL,
    CONSTRAINT fk_sales_customer FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    CONSTRAINT fk_sales_product FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- Run these checks after importing.
SELECT COUNT(*) AS customer_rows FROM customers;
SELECT COUNT(*) AS product_rows FROM products;
SELECT COUNT(*) AS sales_order_lines FROM sales;
SELECT COUNT(DISTINCT OrderID) AS distinct_orders FROM sales;
SELECT COUNT(*) AS duplicate_line_ids
FROM (SELECT OrderLineID FROM sales GROUP BY OrderLineID HAVING COUNT(*) > 1) AS d;

-- Create an analysis view. NetRevenue is after discount.
CREATE OR REPLACE VIEW v_sales_analysis AS
SELECT
    s.OrderLineID, s.OrderID, s.OrderDate, s.CustomerID,
    c.City, c.CustomerSegment,
    s.ProductID, p.ProductName, p.Category,
    s.SalesChannel, s.Quantity, p.UnitPriceNGN, p.UnitCostNGN,
    s.DiscountPct,
    s.Quantity * p.UnitPriceNGN AS GrossSalesNGN,
    s.Quantity * p.UnitPriceNGN * s.DiscountPct AS DiscountAmountNGN,
    s.Quantity * p.UnitPriceNGN * (1 - s.DiscountPct) AS NetRevenueNGN,
    s.Quantity * p.UnitCostNGN AS ProductCostNGN,
    s.Quantity * p.UnitPriceNGN * (1 - s.DiscountPct)
        - s.Quantity * p.UnitCostNGN AS GrossProfitNGN
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
JOIN products p ON s.ProductID = p.ProductID;

-- Business question 1: overall performance.
SELECT
    SUM(NetRevenueNGN) AS NetRevenueNGN,
    SUM(ProductCostNGN) AS ProductCostNGN,
    SUM(GrossProfitNGN) AS GrossProfitNGN,
    SUM(Quantity) AS UnitsSold,
    COUNT(DISTINCT OrderID) AS Orders
FROM v_sales_analysis;

-- Business question 2: monthly performance.
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS SalesMonth,
       SUM(NetRevenueNGN) AS NetRevenueNGN,
       SUM(GrossProfitNGN) AS GrossProfitNGN,
       COUNT(DISTINCT OrderID) AS Orders
FROM v_sales_analysis
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY SalesMonth;

-- Business question 3: product and category.
SELECT Category, ProductName,
       SUM(NetRevenueNGN) AS NetRevenueNGN,
       SUM(GrossProfitNGN) AS GrossProfitNGN,
       SUM(Quantity) AS UnitsSold
FROM v_sales_analysis
GROUP BY Category, ProductName
ORDER BY NetRevenueNGN DESC;

-- Business question 4: city.
SELECT City, SUM(NetRevenueNGN) AS NetRevenueNGN,
       COUNT(DISTINCT OrderID) AS Orders
FROM v_sales_analysis
GROUP BY City
ORDER BY NetRevenueNGN DESC;

-- Business question 5: channel.
SELECT SalesChannel, SUM(NetRevenueNGN) AS NetRevenueNGN,
       COUNT(DISTINCT OrderID) AS Orders,
       SUM(Quantity) AS UnitsSold,
       SUM(GrossProfitNGN) / NULLIF(SUM(NetRevenueNGN), 0) AS GrossMargin
FROM v_sales_analysis
GROUP BY SalesChannel;

-- Business question 6: new versus returning.
SELECT CustomerSegment, SUM(NetRevenueNGN) AS NetRevenueNGN,
       COUNT(DISTINCT CustomerID) AS Customers,
       COUNT(DISTINCT OrderID) AS Orders
FROM v_sales_analysis
GROUP BY CustomerSegment;

-- Your own question: write at least two more queries and explain why they matter.
