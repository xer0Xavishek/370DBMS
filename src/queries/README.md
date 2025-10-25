# SQL Queries

This directory contains SQL query files for data retrieval and analysis.

##  Query Categories

### Basic Queries
- Simple SELECT statements
- Filtering with WHERE clause
- Sorting with ORDER BY
- Limiting results with LIMIT/TOP

### Intermediate Queries
- JOINs (INNER, LEFT, RIGHT, FULL)
- Subqueries
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY and HAVING clauses

### Advanced Queries
- Complex multi-table JOINs
- Nested subqueries
- Common Table Expressions (CTEs)
- Window functions
- Recursive queries

##  File Naming Convention

- Use descriptive names: `get_customer_orders.sql`
- Group related queries: `report_sales_analysis.sql`
- Number for execution order: `01_basic_queries.sql`

##  Query Template

```sql
-- =============================================
-- Query: Get Customer Order Summary
-- Description: Retrieves order summary for each customer
-- Author: [Your Name]
-- Date: [Date]
-- Parameters: None
-- Returns: customer_id, customer_name, total_orders, total_amount
-- =============================================

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_amount
FROM 
    Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name
ORDER BY 
    total_amount DESC;
```

##  Best Practices

- **Performance**: Use indexes, avoid SELECT *, limit result sets
- **Readability**: Format queries consistently, use aliases
- **Maintainability**: Comment complex logic, use meaningful names
- **Testing**: Include expected results as comments
- **Parameterization**: Use variables for reusable queries

##  Query Optimization Tips

1. Use EXPLAIN to analyze query execution plans
2. Create appropriate indexes on frequently queried columns
3. Avoid functions on indexed columns in WHERE clause
4. Use JOINs instead of subqueries when possible
5. Consider materialized views for complex, frequently-run queries

##  Testing Queries

```sql
-- Test with small dataset first
SELECT * FROM table_name LIMIT 10;

-- Verify joins are correct
-- Check for NULL values
-- Validate aggregate calculations
-- Measure execution time
```

##  Examples

See the query files in this directory for practical examples of:
- Customer analysis queries
- Sales reporting queries
- Inventory management queries
- Performance analytics queries
