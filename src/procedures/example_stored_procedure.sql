-- =============================================
-- Procedure: sp_CreateOrder
-- Description: Creates a new order with validation
-- Author: CSE370 Team
-- Date: 2024
-- Parameters:
--   p_customer_id INT - Customer identifier
--   p_order_date DATE - Order date
--   p_total_amount DECIMAL - Total order amount
--   p_payment_method VARCHAR - Payment method
-- Returns: order_id of newly created order via OUT parameter
-- =============================================

USE cse370_dbms;

-- Drop procedure if exists
DROP PROCEDURE IF EXISTS sp_CreateOrder;

DELIMITER //

CREATE PROCEDURE sp_CreateOrder(
    IN p_customer_id INT,
    IN p_order_date DATE,
    IN p_total_amount DECIMAL(10,2),
    IN p_payment_method VARCHAR(50),
    OUT p_order_id INT
)
BEGIN
    DECLARE v_customer_exists INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_order_id = -1;
        SELECT 'Error: Transaction rolled back due to exception' AS error_message;
    END;
    
    -- Start transaction
    START TRANSACTION;
    
    -- Validate customer exists
    SELECT COUNT(*) INTO v_customer_exists
    FROM Customers
    WHERE customer_id = p_customer_id;
    
    IF v_customer_exists = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid customer ID - customer does not exist';
    END IF;
    
    -- Validate total amount
    IF p_total_amount < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Total amount cannot be negative';
    END IF;
    
    -- Insert order
    INSERT INTO Orders (
        customer_id,
        order_date,
        total_amount,
        payment_method,
        status
    )
    VALUES (
        p_customer_id,
        p_order_date,
        p_total_amount,
        p_payment_method,
        'pending'
    );
    
    -- Get the newly created order_id
    SET p_order_id = LAST_INSERT_ID();
    
    -- Commit transaction
    COMMIT;
    
    -- Return success message
    SELECT 
        p_order_id AS order_id,
        'Order created successfully' AS message;
    
END //

DELIMITER ;

-- =============================================
-- Example Usage:
-- =============================================
-- CALL sp_CreateOrder(1, '2024-01-15', 599.99, 'Credit Card', @new_order_id);
-- SELECT @new_order_id AS order_id;
