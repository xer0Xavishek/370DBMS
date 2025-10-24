-- =============================================
-- Query File: example_basic_queries.sql
-- Description: Example basic SQL queries for learning
-- Author: CSE370 Team
-- Date: 2024
-- =============================================

USE cse370_dbms;

-- =============================================
-- Query 1: Select all customers
-- Description: Retrieve all customer records
-- =============================================
SELECT 
    customer_id,
    customer_name,
    email,
    phone,
    city,
    country
FROM 
    Customers
ORDER BY 
    customer_name;

-- =============================================
-- Query 2: Get customers from a specific city
-- Description: Filter customers by city
-- Parameters: city = 'New York'
-- =============================================
SELECT 
    customer_id,
    customer_name,
    email,
    city
FROM 
    Customers
WHERE 
    city = 'New York'
ORDER BY 
    customer_name;

-- =============================================
-- Query 3: Count customers by country
-- Description: Aggregate count of customers per country
-- =============================================
SELECT 
    country,
    COUNT(*) AS customer_count
FROM 
    Customers
GROUP BY 
    country
ORDER BY 
    customer_count DESC;

-- =============================================
-- Query 4: Get all products with low stock
-- Description: Find products with stock less than 10
-- =============================================
SELECT 
    product_id,
    product_name,
    category,
    price,
    stock_quantity
FROM 
    Products
WHERE 
    stock_quantity < 10
ORDER BY 
    stock_quantity ASC;

-- =============================================
-- Query 5: Get recent orders
-- Description: Retrieve orders from the last 30 days
-- =============================================
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
FROM 
    Orders
WHERE 
    order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY 
    order_date DESC;

-- =============================================
-- Query 6: Customer order summary (JOIN example)
-- Description: Show customer names with their order information
-- =============================================
SELECT 
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM 
    Customers c
    INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_date >= '2024-01-01'
ORDER BY 
    o.order_date DESC;

-- =============================================
-- Query 7: Calculate total sales by product
-- Description: Aggregate sales for each product
-- =============================================
SELECT 
    p.product_name,
    p.category,
    COUNT(od.order_detail_id) AS times_ordered,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.subtotal) AS total_revenue
FROM 
    Products p
    LEFT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    p.category
ORDER BY 
    total_revenue DESC;

-- =============================================
-- Query 8: Find customers with no orders
-- Description: List customers who haven't placed any orders
-- =============================================
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.created_at
FROM 
    Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_id IS NULL
ORDER BY 
    c.customer_name;

-- =============================================
-- Query 9: Top 10 customers by total spending
-- Description: Rank customers by total order amount
-- =============================================
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM 
    Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name,
    c.email
HAVING 
    total_orders > 0
ORDER BY 
    total_spent DESC
LIMIT 10;

-- =============================================
-- Query 10: Products never ordered
-- Description: Find products with no order history
-- =============================================
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock_quantity
FROM 
    Products p
    LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE 
    od.order_detail_id IS NULL
ORDER BY 
    p.product_name;
