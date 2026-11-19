-- Week 6 practice database
-- Fictional retail data for learning only.
-- Re-running this script safely recreates the practice database.

CREATE DATABASE IF NOT EXISTS retail_practice;
USE retail_practice;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    payment_method VARCHAR(30),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Amina Yusuf', 'Ibadan', '2026-01-10'),
(2, 'Tunde Bello', 'Lagos', '2026-01-12'),
(3, 'Kemi Ade', 'Osogbo', '2026-02-03'),
(4, 'Chuka Okoro', 'Abuja', '2026-02-11'),
(5, 'Zainab Musa', 'Ibadan', '2026-03-01'),
(6, 'Femi Adebayo', 'Ilorin', '2026-03-18'),
(7, 'Ada Nwosu', 'Lagos', '2026-04-02'),
(8, 'Seyi Balogun', 'Ibadan', '2026-04-15');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Rice 5kg', 'Groceries', 12500.00),
(102, 'Cooking Oil 1L', 'Groceries', 3200.00),
(103, 'Laundry Detergent', 'Household', 2800.00),
(104, 'Bathing Soap Pack', 'Personal Care', 1500.00),
(105, 'Tomato Paste Carton', 'Groceries', 8400.00),
(106, 'Toothpaste', 'Personal Care', 1900.00);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, payment_method) VALUES
(1001, 1, 101, '2026-11-01', 2, 'Transfer'),
(1002, 2, 102, '2026-11-02', 1, 'Card'),
(1003, 1, 104, '2026-11-03', 3, 'Cash'),
(1004, 3, 103, '2026-11-04', 2, 'Transfer'),
(1005, 4, 105, '2026-11-05', 1, 'Card'),
(1006, 5, 101, '2026-11-06', 1, 'Transfer'),
(1007, 6, 106, '2026-11-07', 2, 'Cash'),
(1008, 7, 102, '2026-11-08', 2, 'Transfer'),
(1009, 8, 103, '2026-11-09', 1, 'Card'),
(1010, 2, 105, '2026-11-10', 2, 'Transfer'),
(1011, 3, 104, '2026-11-11', 1, 'Cash'),
(1012, 5, 106, '2026-11-12', 3, 'Card'),
(1013, 4, 101, '2026-11-13', 1, 'Transfer'),
(1014, 7, 103, '2026-11-14', 2, 'Cash'),
(1015, 1, 102, '2026-11-15', 1, 'Card');

-- Quick checks after the script runs:
SHOW TABLES;
DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
