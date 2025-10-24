# Tests

This directory contains test scripts, test data, and testing documentation for the database project.

## 📋 Testing Types

### Unit Tests
- Individual stored procedure testing
- Function validation
- Trigger behavior verification
- Constraint testing

### Integration Tests
- Multi-table operations
- Transaction testing
- Referential integrity checks
- Cascading operations

### Performance Tests
- Load testing
- Stress testing
- Query performance benchmarks
- Concurrent user simulation

### Data Validation Tests
- Data type validation
- Constraint verification
- Business rule validation
- Data integrity checks

## 📁 Structure

### `/sample-data`
Contains sample datasets for testing and development purposes.

## 📝 Test Naming Convention

- `test_[feature]_[scenario].sql`
- Example: `test_orders_create_valid.sql`
- Example: `test_orders_create_invalid_customer.sql`

## 📄 Test Template

```sql
-- =============================================
-- Test: Create Order with Valid Data
-- Description: Verifies order creation succeeds with valid input
-- Test ID: TEST-001
-- Author: [Your Name]
-- Date: [Date]
-- =============================================

-- Setup: Create test data
INSERT INTO Customers (customer_id, customer_name, email)
VALUES (9999, 'Test Customer', 'test@example.com');

-- Execute: Call the procedure/query being tested
CALL sp_CreateOrder(9999, '2024-01-15', 599.99, @order_id);

-- Verify: Check results
SELECT 
    CASE 
        WHEN @order_id IS NOT NULL THEN 'PASS'
        ELSE 'FAIL'
    END AS test_result,
    @order_id AS order_id;

-- Verify order exists in database
SELECT 
    CASE 
        WHEN COUNT(*) = 1 THEN 'PASS'
        ELSE 'FAIL'
    END AS verification_result
FROM Orders
WHERE order_id = @order_id
  AND customer_id = 9999
  AND total_amount = 599.99;

-- Cleanup: Remove test data
DELETE FROM Orders WHERE order_id = @order_id;
DELETE FROM Customers WHERE customer_id = 9999;

-- Test Summary
SELECT 'TEST-001: Create Order with Valid Data' AS test_name, 
       'COMPLETED' AS status;
```

## 🎯 Testing Best Practices

### Test Design
- Test one thing at a time
- Use descriptive test names
- Include positive and negative tests
- Test edge cases and boundary conditions
- Make tests repeatable and independent

### Test Data
- Use realistic but anonymized data
- Include edge cases (NULL, empty, maximum values)
- Create cleanup scripts
- Don't use production data

### Test Organization
- Group related tests
- Number tests for execution order
- Document test dependencies
- Maintain test documentation

### Assertions
- Clear pass/fail criteria
- Expected vs actual output
- Meaningful error messages
- Detailed failure information

## 🔧 Test Execution

### Manual Testing
```bash
# Run all tests in sequence
mysql -u username -p database_name < tests/run_all_tests.sql

# Run specific test
mysql -u username -p database_name < tests/test_orders_create.sql
```

### Automated Testing
```bash
# Using test framework
npm test
python -m pytest tests/

# Using SQL test framework
# (depends on your DBMS and testing tool)
```

## 📊 Test Coverage

Track test coverage for:
- [ ] All tables have CRUD tests
- [ ] All stored procedures tested
- [ ] All functions tested
- [ ] All triggers tested
- [ ] All constraints tested
- [ ] Error handling tested
- [ ] Performance benchmarks exist

## 📈 Test Reporting

### Test Results Format
```
Test Suite: Order Management
=============================================
TEST-001: Create Order (Valid)       [PASS]
TEST-002: Create Order (Invalid)     [PASS]
TEST-003: Update Order               [PASS]
TEST-004: Delete Order               [FAIL] - Details: ...
TEST-005: Get Order Details          [PASS]
=============================================
Total Tests: 5
Passed: 4
Failed: 1
Success Rate: 80%
```

## 🐛 Debugging Failed Tests

1. Review test output and error messages
2. Check test data setup
3. Verify database state before test
4. Run test in isolation
5. Check for race conditions
6. Review recent code changes
7. Add logging/debug statements

## ✅ Testing Checklist

Before committing:
- [ ] All tests pass
- [ ] New features have tests
- [ ] Edge cases covered
- [ ] Performance acceptable
- [ ] No data left in database after tests
- [ ] Documentation updated
- [ ] Test results logged

## 🔗 Resources

- SQL testing best practices
- Database testing frameworks
- Performance testing tools
- Test data generators
