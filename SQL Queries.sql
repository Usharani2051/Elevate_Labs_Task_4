CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Get all columns from the Orders table
SELECT *
FROM Orders;

-- Get only order_id, order_status, and purchase date from Orders
SELECT order_id, order_status, order_purchase_timestamp
FROM Orders;

-- Get all customers who are in the state of São Paulo (SP)
SELECT *
FROM Customers
WHERE customer_state = 'SP';

-- List all customers sorted by city name in ascending order
SELECT customer_id, customer_city, customer_state
FROM Customers
ORDER BY customer_city ASC 
LIMIT 20;

-- Count how many customers are in each state
SELECT customer_state, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY customer_state;





-- Show products sorted by product weight (heavy weight first)
SELECT product_id, product_category_name, product_weight_g
FROM Products
ORDER BY product_weight_g DESC 
LIMIT 15;

-- Count number of orders per country
SELECT customer_city, COUNT(order_id) AS total_orders
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY customer_city;


-- Get all orders placed on or after January 1, 2018
-- Sort them from oldest to newest
SELECT order_id, order_purchase_timestamp
FROM Orders
WHERE order_purchase_timestamp >= '2018-01-01'
ORDER BY order_purchase_timestamp ASC;


-- 1.1:  Get all orders from a specific state
SELECT *
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_state = 'SP'
ORDER BY o.order_purchase_timestamp DESC;

-- 1.2  Count orders per city
SELECT c.customer_city, COUNT(o.customer_id) AS total_orders
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC;

-- 2.1: INNER JOIN - Orders with payment info
SELECT o.order_id, p.payment_type, p.payment_value
FROM Orders o
INNER JOIN Payments p ON o.order_id = p.order_id;

-- 2.2: LEFT JOIN - All products and their order count
SELECT pr.product_id, pr.product_category_name, COUNT(oi.order_id) AS times_ordered
FROM Products pr
LEFT JOIN OrderItems oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_category_name;

-- 2.3: RIGHT JOIN - Sellers with products ordered
SELECT oi.seller_id, pr.product_id, pr.product_category_name
FROM OrderItems oi
RIGHT JOIN Products pr ON oi.product_id = pr.product_id;

-- 3.1: Get customers who have placed more than 5 orders
SELECT customer_id, total_orders
FROM (
    SELECT customer_id, COUNT(order_id) AS total_orders
    FROM Orders
    GROUP BY customer_id
) AS order_counts
WHERE total_orders > 5;

-- 3.2: Find products with price above average
SELECT product_id, price
FROM OrderItems
WHERE price > (SELECT AVG(price) FROM OrderItems);

-- 4.1: Total revenue
SELECT SUM(price + shipping_charges) AS total_revenue
FROM OrderItems;

-- 4.2: Average delivery time (in days)
SELECT AVG(DATEDIFF(order_delivered_timestamp, order_purchase_timestamp)) AS avg_delivery_days
FROM Orders
WHERE order_delivered_timestamp IS NOT NULL;

-- 5.1: View for monthly sales
CREATE VIEW monthly_sales AS
SELECT DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
       SUM(price + shipping_charges) AS total_sales
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY month;

SHOW CREATE VIEW monthly_sales;

-- 5.2: View for top products
CREATE VIEW top_products AS
SELECT pr.product_category_name, COUNT(oi.product_id) AS total_sold
FROM Products pr
JOIN OrderItems oi ON pr.product_id = oi.product_id
GROUP BY pr.product_category_name
ORDER BY total_sold DESC;

SHOW CREATE VIEW top_products;

-- Index on customer_id for faster joins
CREATE INDEX idx_orders_customer_id ON Orders(customer_id(20));

SHOW INDEXES FROM Orders;

-- Index on product_id for product lookups
CREATE INDEX idx_orderitems_product_id ON OrderItems(product_id(20));
SHOW INDEXES FROM OrderItems;

-- Index on order_purchase_timestamp for time-based queries
CREATE INDEX idx_orders_purchase_date ON Orders(order_purchase_timestamp(20));
SHOW INDEXES FROM Orders;


