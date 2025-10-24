-- =============================================
-- Script: example_sample_data.sql
-- Description: Sample data for testing and development
-- Author: CSE370 Team
-- Date: 2024
-- Note: This is example data - do not use in production
-- =============================================

USE cse370_dbms;

-- =============================================
-- Insert Sample Customers
-- =============================================
INSERT INTO Customers (customer_name, email, phone, address, city, country, postal_code) VALUES
('John Doe', 'john.doe@example.com', '555-0101', '123 Main St', 'New York', 'USA', '10001'),
('Jane Smith', 'jane.smith@example.com', '555-0102', '456 Oak Ave', 'Los Angeles', 'USA', '90001'),
('Bob Johnson', 'bob.johnson@example.com', '555-0103', '789 Pine Rd', 'Chicago', 'USA', '60601'),
('Alice Williams', 'alice.williams@example.com', '555-0104', '321 Elm St', 'Houston', 'USA', '77001'),
('Charlie Brown', 'charlie.brown@example.com', '555-0105', '654 Maple Dr', 'Phoenix', 'USA', '85001'),
('Diana Prince', 'diana.prince@example.com', '555-0106', '987 Cedar Ln', 'Philadelphia', 'USA', '19101'),
('Edward Norton', 'edward.norton@example.com', '555-0107', '147 Birch St', 'San Antonio', 'USA', '78201'),
('Fiona Green', 'fiona.green@example.com', '555-0108', '258 Walnut Ave', 'San Diego', 'USA', '92101'),
('George Lucas', 'george.lucas@example.com', '555-0109', '369 Cherry Rd', 'Dallas', 'USA', '75201'),
('Helen Parker', 'helen.parker@example.com', '555-0110', '741 Ash Dr', 'San Jose', 'USA', '95101');

-- =============================================
-- Insert Sample Products
-- =============================================
INSERT INTO Products (product_name, description, category, price, stock_quantity) VALUES
('Laptop Pro 15', 'High-performance laptop with 16GB RAM', 'Electronics', 1299.99, 25),
('Wireless Mouse', 'Ergonomic wireless mouse with USB receiver', 'Electronics', 29.99, 150),
('USB-C Cable', 'Durable USB-C to USB-C cable, 6ft', 'Accessories', 14.99, 200),
('Desk Chair', 'Comfortable office chair with lumbar support', 'Furniture', 249.99, 30),
('Monitor 27"', '27-inch 4K UHD monitor', 'Electronics', 399.99, 40),
('Keyboard Mechanical', 'RGB mechanical gaming keyboard', 'Electronics', 89.99, 75),
('Desk Lamp', 'LED desk lamp with adjustable brightness', 'Furniture', 39.99, 60),
('Notebook Set', 'Pack of 5 spiral notebooks', 'Office Supplies', 12.99, 300),
('Pen Pack', 'Pack of 10 ballpoint pens', 'Office Supplies', 6.99, 500),
('Backpack', 'Laptop backpack with multiple compartments', 'Accessories', 49.99, 80),
('Phone Stand', 'Adjustable phone stand for desk', 'Accessories', 19.99, 120),
('Webcam HD', '1080p HD webcam with microphone', 'Electronics', 79.99, 45),
('Headphones', 'Noise-cancelling wireless headphones', 'Electronics', 199.99, 55),
('Mouse Pad', 'Large extended gaming mouse pad', 'Accessories', 24.99, 100),
('Coffee Mug', 'Insulated stainless steel coffee mug', 'Miscellaneous', 18.99, 90);

-- =============================================
-- Insert Sample Orders
-- =============================================
INSERT INTO Orders (customer_id, order_date, total_amount, status, payment_method) VALUES
(1, '2024-01-15', 1349.98, 'delivered', 'Credit Card'),
(2, '2024-01-16', 429.98, 'delivered', 'PayPal'),
(3, '2024-01-17', 89.99, 'delivered', 'Credit Card'),
(1, '2024-01-20', 249.99, 'delivered', 'Credit Card'),
(4, '2024-01-22', 1699.97, 'shipped', 'Debit Card'),
(5, '2024-01-25', 44.98, 'delivered', 'Credit Card'),
(2, '2024-01-28', 199.99, 'processing', 'PayPal'),
(6, '2024-02-01', 79.99, 'delivered', 'Credit Card'),
(7, '2024-02-03', 529.97, 'delivered', 'Credit Card'),
(3, '2024-02-05', 19.99, 'cancelled', 'Credit Card'),
(8, '2024-02-08', 1549.98, 'processing', 'Debit Card'),
(9, '2024-02-10', 299.97, 'pending', 'Credit Card'),
(10, '2024-02-12', 89.98, 'pending', 'PayPal'),
(1, '2024-02-15', 69.98, 'pending', 'Credit Card');

-- =============================================
-- Insert Sample Order Details
-- =============================================
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price, subtotal) VALUES
-- Order 1: Laptop + Mouse
(1, 1, 1, 1299.99, 1299.99),
(1, 2, 1, 29.99, 29.99),
(1, 3, 1, 14.99, 14.99),
-- Order 2: Monitor + Keyboard
(2, 5, 1, 399.99, 399.99),
(2, 6, 1, 89.99, 89.99),
-- Order 3: Keyboard
(3, 6, 1, 89.99, 89.99),
-- Order 4: Desk Chair
(4, 4, 1, 249.99, 249.99),
-- Order 5: Laptop + Monitor + Keyboard
(5, 1, 1, 1299.99, 1299.99),
(5, 5, 1, 399.99, 399.99),
-- Order 6: Desk Lamp + Notebooks
(6, 7, 1, 39.99, 39.99),
(6, 8, 1, 12.99, 12.99),
-- Order 7: Headphones
(7, 13, 1, 199.99, 199.99),
-- Order 8: Webcam
(8, 12, 1, 79.99, 79.99),
-- Order 9: Monitor + Mouse Pad + USB Cable
(9, 5, 1, 399.99, 399.99),
(9, 14, 1, 24.99, 24.99),
(9, 3, 2, 14.99, 29.98),
-- Order 10: Phone Stand
(10, 11, 1, 19.99, 19.99),
-- Order 11: Laptop + Desk Chair
(11, 1, 1, 1299.99, 1299.99),
(11, 4, 1, 249.99, 249.99),
-- Order 12: Backpack + Coffee Mug
(12, 10, 1, 49.99, 49.99),
(12, 15, 1, 18.99, 18.99),
-- Order 13: Mouse + USB Cable
(13, 2, 1, 29.99, 29.99),
(13, 3, 1, 14.99, 14.99),
-- Order 14: Notebook + Pens
(14, 8, 1, 12.99, 12.99),
(14, 9, 2, 6.99, 13.98);

-- =============================================
-- Verify data inserted
-- =============================================
SELECT 'Sample data inserted successfully!' AS Status;

SELECT 
    (SELECT COUNT(*) FROM Customers) AS total_customers,
    (SELECT COUNT(*) FROM Products) AS total_products,
    (SELECT COUNT(*) FROM Orders) AS total_orders,
    (SELECT COUNT(*) FROM OrderDetails) AS total_order_details;
