# Stored Procedures and Functions

This directory contains stored procedures, functions, and triggers for the database.

## 📋 Contents

### Stored Procedures
- Business logic implementation
- Data manipulation operations (INSERT, UPDATE, DELETE)
- Transaction management
- Error handling

### User-Defined Functions
- Reusable calculations
- Data transformation
- Custom aggregations
- Scalar and table-valued functions

### Triggers
- Data integrity enforcement
- Audit logging
- Cascading operations
- Validation rules

## 📝 Naming Conventions

```sql
-- Stored Procedures
sp_CreateOrder, sp_UpdateCustomer, sp_DeleteProduct

-- Functions
fn_CalculateDiscount, fn_GetFullName, fn_ValidateEmail

-- Triggers
trg_Orders_AfterInsert, trg_Customers_BeforeUpdate
```

## 📄 Stored Procedure Template

```sql
-- =============================================
-- Procedure: sp_CreateOrder
-- Description: Creates a new order with validation
-- Author: [Your Name]
-- Date: [Date]
-- Parameters:
--   @customer_id INT - Customer identifier
--   @order_date DATE - Order date
--   @total_amount DECIMAL - Total order amount
-- Returns: order_id of newly created order
-- =============================================

DELIMITER //

CREATE PROCEDURE sp_CreateOrder(
    IN p_customer_id INT,
    IN p_order_date DATE,
    IN p_total_amount DECIMAL(10,2),
    OUT p_order_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Transaction rolled back' AS error_message;
    END;
    
    START TRANSACTION;
    
    -- Validate customer exists
    IF NOT EXISTS (SELECT 1 FROM Customers WHERE customer_id = p_customer_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid customer ID';
    END IF;
    
    -- Insert order
    INSERT INTO Orders (customer_id, order_date, total_amount)
    VALUES (p_customer_id, p_order_date, p_total_amount);
    
    SET p_order_id = LAST_INSERT_ID();
    
    COMMIT;
    
    SELECT p_order_id AS order_id;
END //

DELIMITER ;
```

## 📄 Function Template

```sql
-- =============================================
-- Function: fn_CalculateDiscount
-- Description: Calculates discount based on order amount
-- Parameters:
--   p_order_amount DECIMAL - Order total amount
-- Returns: DECIMAL - Discount percentage
-- =============================================

DELIMITER //

CREATE FUNCTION fn_CalculateDiscount(p_order_amount DECIMAL(10,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(5,2);
    
    IF p_order_amount >= 1000 THEN
        SET discount = 15.00;
    ELSEIF p_order_amount >= 500 THEN
        SET discount = 10.00;
    ELSEIF p_order_amount >= 100 THEN
        SET discount = 5.00;
    ELSE
        SET discount = 0.00;
    END IF;
    
    RETURN discount;
END //

DELIMITER ;
```

## 📄 Trigger Template

```sql
-- =============================================
-- Trigger: trg_Orders_AfterInsert
-- Description: Logs order creation for audit trail
-- Table: Orders
-- Event: AFTER INSERT
-- =============================================

DELIMITER //

CREATE TRIGGER trg_Orders_AfterInsert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO OrderAudit (
        order_id,
        action,
        action_date,
        user
    )
    VALUES (
        NEW.order_id,
        'INSERT',
        NOW(),
        USER()
    );
END //

DELIMITER ;
```

## 🎯 Best Practices

- **Error Handling**: Always include error handling
- **Transactions**: Use transactions for data consistency
- **Validation**: Validate all input parameters
- **Documentation**: Comment all parameters and return values
- **Testing**: Test with various input scenarios
- **Security**: Prevent SQL injection, validate permissions
- **Performance**: Avoid cursors when possible, use set-based operations

## 🔧 Usage Examples

```sql
-- Call stored procedure
CALL sp_CreateOrder(101, '2024-01-15', 599.99, @new_order_id);
SELECT @new_order_id;

-- Use function
SELECT 
    order_id,
    total_amount,
    fn_CalculateDiscount(total_amount) AS discount_percent
FROM Orders;

-- View triggers
SHOW TRIGGERS FROM database_name;
```

## ✅ Testing

- Test with valid inputs
- Test with invalid inputs (boundary conditions)
- Test error handling
- Verify transactions rollback correctly
- Check performance with large datasets
