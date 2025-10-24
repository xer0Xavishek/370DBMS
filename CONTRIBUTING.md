# Contributing to CSE370 DBMS Project

Thank you for your interest in contributing to the CSE370 Database Systems Lab Project! This document provides guidelines and standards for contributing to this repository.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Documentation](#documentation)
- [Testing](#testing)

## 🤝 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive environment for all contributors. We expect all participants to:

- Use welcoming and inclusive language
- Be respectful of differing viewpoints and experiences
- Accept constructive criticism gracefully
- Focus on what is best for the project
- Show empathy towards other community members

## 🚀 Getting Started

> **Note for Team Members**: If you're collaborating directly on this repository (not forking), see [COLLABORATION_GUIDE.md](./COLLABORATION_GUIDE.md) for simplified workflow instructions.

### Prerequisites

1. Git installed on your local machine
2. Database management system (MySQL, PostgreSQL, etc.)
3. SQL client or IDE
4. Basic understanding of database concepts and SQL

### Setup for External Contributors

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/370DBMS.git
   cd 370DBMS
   ```
3. Add upstream remote:
   ```bash
   git remote add upstream https://github.com/xer0Xavishek/370DBMS.git
   ```
4. Create a new branch for your work:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Setup for Team Members (Direct Collaborators)

1. Clone the repository directly:
   ```bash
   git clone https://github.com/xer0Xavishek/370DBMS.git
   cd 370DBMS
   ```
2. Create a new branch for your work:
   ```bash
   git checkout -b feature/your-feature-name
   ```

See [COLLABORATION_GUIDE.md](./COLLABORATION_GUIDE.md) for detailed team collaboration instructions.

## 💡 How to Contribute

### Types of Contributions

We welcome the following types of contributions:

1. **SQL Scripts**: Database creation, queries, procedures, functions
2. **Documentation**: Improving READMEs, adding tutorials, clarifying instructions
3. **Diagrams**: ER diagrams, schema designs, flowcharts
4. **Test Data**: Sample datasets, test scripts
5. **Reports**: Analysis, performance reports, documentation
6. **Bug Fixes**: Fixing errors in queries, procedures, or scripts
7. **Optimization**: Improving query performance, indexing strategies

### Before You Start

1. Check existing issues and pull requests to avoid duplication
2. For major changes, open an issue first to discuss your proposal
3. Ensure your contribution aligns with the project's goals
4. Review the project structure and coding standards

## 📝 Coding Standards

### SQL Style Guide

#### General Rules

- Use **UPPERCASE** for SQL keywords (`SELECT`, `FROM`, `WHERE`, `JOIN`, etc.)
- Use **lowercase** or **snake_case** for table and column names
- Indent nested queries and clauses for readability
- Add comments to explain complex logic
- One clause per line for multi-clause statements

#### Good Example

```sql
-- Retrieve customer order summary with total amount
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM 
    Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE 
    c.status = 'active'
    AND c.created_at >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY 
    c.customer_id, 
    c.customer_name, 
    c.email
HAVING 
    total_orders > 0
ORDER BY 
    total_spent DESC
LIMIT 100;
```

#### Bad Example

```sql
-- Avoid this style
select c.customer_id,c.customer_name,count(o.order_id) as cnt from Customers c left join Orders o on c.customer_id=o.customer_id where c.status='active' group by c.customer_id,c.customer_name order by cnt desc;
```

### Naming Conventions

#### Tables
- Use singular or plural consistently
- PascalCase or snake_case (choose one and be consistent)
- Examples: `Customers`, `Orders`, `order_details`

#### Columns
- Use descriptive names
- snake_case preferred
- Include table name prefix for clarity when needed
- Examples: `customer_id`, `order_date`, `total_amount`

#### Stored Procedures
- Prefix with `sp_` or `proc_`
- Use descriptive action names
- Examples: `sp_CreateOrder`, `sp_UpdateCustomer`, `proc_calculate_discount`

#### Functions
- Prefix with `fn_` or `func_`
- Use descriptive names indicating return value
- Examples: `fn_GetCustomerName`, `fn_CalculateTotal`

#### Triggers
- Prefix with `trg_`
- Include table name and action
- Examples: `trg_Orders_AfterInsert`, `trg_Customers_BeforeUpdate`

### Documentation Standards

#### File Headers

Every SQL file should start with a header:

```sql
-- =============================================
-- Script: create_customers_table.sql
-- Description: Creates the Customers table with constraints
-- Author: [Your Name]
-- Date: [Creation Date]
-- Version: 1.0
-- Dependencies: None
-- =============================================
```

#### Inline Comments

```sql
-- Calculate discount based on customer loyalty level
UPDATE Orders
SET discount_amount = total_amount * 
    CASE 
        WHEN customer_level = 'Gold' THEN 0.20    -- 20% discount
        WHEN customer_level = 'Silver' THEN 0.10  -- 10% discount
        ELSE 0.05                                  -- 5% discount
    END
WHERE order_date = CURDATE();
```

## 📝 Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

#### Types

- **feat**: New feature (query, procedure, table)
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Formatting, missing semicolons, etc.
- **refactor**: Code restructuring without changing functionality
- **test**: Adding or updating tests
- **chore**: Maintenance tasks

#### Examples

```
feat(queries): add customer order history query

Added a new query to retrieve comprehensive order history for customers
including order details, payment status, and shipping information.

Closes #123
```

```
fix(procedures): correct discount calculation in sp_CreateOrder

The discount calculation was using the wrong percentage for Gold tier
customers. Updated the calculation to use 20% instead of 15%.

Fixes #456
```

```
docs(diagrams): add ER diagram for order management

Added comprehensive ER diagram showing relationships between
Customers, Orders, OrderDetails, and Products tables.
```

### Commit Best Practices

- Write clear, concise commit messages
- Commit logical units of work
- Don't commit unrelated changes together
- Test your changes before committing
- Don't commit commented-out code
- Don't commit sensitive information (passwords, keys)

## 🔄 Pull Request Process

### Before Submitting

1. **Update your branch** with the latest changes from upstream:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Test your changes** thoroughly:
   - Run all SQL scripts to ensure they execute without errors
   - Verify queries return expected results
   - Test stored procedures with various inputs
   - Check for SQL injection vulnerabilities

3. **Update documentation**:
   - Update relevant README files
   - Add comments to your code
   - Update diagrams if schema changed

4. **Verify file organization**:
   - Files are in correct directories
   - Naming conventions followed
   - No unnecessary files included

### Submitting a Pull Request

1. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. Go to the original repository on GitHub

3. Click "New Pull Request"

4. Select your branch and provide:
   - Clear title describing the change
   - Detailed description of what changed and why
   - Reference to any related issues
   - Screenshots if applicable (for diagrams, reports)

5. Submit the pull request

### Pull Request Template

```markdown
## Description
Brief description of the changes made.

## Type of Change
- [ ] New feature (SQL script, query, procedure)
- [ ] Bug fix
- [ ] Documentation update
- [ ] Diagram/Schema change
- [ ] Test data or test scripts
- [ ] Performance improvement

## Changes Made
- List specific changes
- Include file names
- Mention any dependencies

## Testing Done
- Describe how you tested the changes
- Include test results
- Note any edge cases tested

## Related Issues
Closes #(issue number)

## Screenshots (if applicable)
Add screenshots of diagrams, query results, etc.

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] Changes tested thoroughly
- [ ] No sensitive information committed
```

### Review Process

1. Wait for review from maintainers
2. Address any requested changes
3. Update your pull request by pushing to the same branch
4. Once approved, your PR will be merged

## 📚 Documentation

### When to Update Documentation

- Adding new tables, queries, or procedures
- Changing database schema
- Updating existing functionality
- Adding new features
- Fixing bugs that affect documented behavior

### Documentation Files to Update

- `README.md`: For major features or changes
- Directory-specific READMEs: For changes in that directory
- `PROJECT_STRUCTURE.md`: For structural changes
- Inline comments: For complex logic
- Diagrams: For schema changes

## ✅ Testing

### Testing Requirements

All contributions should include appropriate testing:

1. **SQL Scripts**: Verify execution without errors
2. **Queries**: Test with sample data, verify results
3. **Stored Procedures**: Test with various inputs, including edge cases
4. **Functions**: Test return values for different scenarios
5. **Triggers**: Verify they fire correctly and perform expected actions

### Test Data

- Use sample data from `tests/sample-data/`
- Create additional test data if needed
- Include cleanup scripts
- Don't use production data

### Test Documentation

Document your tests:
```sql
-- Test: Verify customer creation
-- Expected: New customer record created with auto-generated ID
-- Test Data: Valid customer information
-- Result: Should return new customer_id
```

## ❓ Questions?

If you have questions about contributing:

1. Check existing documentation in the `docs/` directory
2. Review closed issues for similar questions
3. Open a new issue with the "question" label
4. Reach out to project maintainers

## 🙏 Thank You!

Thank you for contributing to the CSE370 DBMS Project! Your contributions help make this a better learning resource for everyone.

---

**Remember**: Quality over quantity. Well-documented, tested contributions are more valuable than numerous untested changes.
