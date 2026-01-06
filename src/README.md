# Source Code

This directory contains all SQL scripts and database code for the project.

1. Create database in xampp shell
2. move skillswap folder to htdocs
3. go to http://localhost/phpmyadmin/
4. import skilswap.sql
5. http://localhost/skillswap/



##  Structure

### `/sql` - Database Scripts
- Database creation and initialization scripts
- Table creation scripts
- Data insertion scripts
- Database setup and configuration

### `/queries` - SQL Queries
- SELECT queries for data retrieval
- Complex queries with JOINs and subqueries
- Aggregate functions and GROUP BY queries
- Query optimization examples

### `/procedures` - Stored Procedures and Functions
- Stored procedures for common operations
- User-defined functions
- Triggers for data integrity
- Cursors and error handling

##  Coding Standards

### Naming Conventions
- Tables: `PascalCase` or `snake_case` (be consistent)
- Columns: `snake_case`
- Stored Procedures: `sp_ProcedureName` or `proc_name`
- Functions: `fn_FunctionName` or `func_name`
- Triggers: `trg_TableName_Action`

### SQL Style
- Use uppercase for SQL keywords (SELECT, FROM, WHERE, etc.)
- Indent nested queries
- Comment complex logic
- Use meaningful aliases
- One clause per line for readability

### Example
```sql
-- Good: Readable and well-formatted
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM 
    Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE 
    c.status = 'active'
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    COUNT(o.order_id) > 5
ORDER BY 
    total_orders DESC;
```

##  Usage

### Running Scripts
```bash
# MySQL
mysql -u username -p database_name < src/sql/create_tables.sql


# SQL Server
sqlcmd -S server -d database_name -i src/sql/create_tables.sql
```

##  Documentation

- Add comments to explain complex queries
- Document stored procedure parameters
- Include example usage for procedures
- Note performance considerations

##  Best Practices

- Test all scripts before committing
- Use transactions where appropriate
- Handle errors gracefully
- Validate input parameters
- Consider security (SQL injection prevention)
- Optimize for performance
