# Sample Data

This directory contains sample datasets for testing and development.

## 📋 Contents

Sample data files should include:
- Customer records
- Product catalogs
- Order histories
- Transaction data
- Reference data (categories, statuses, etc.)

## 📝 Data File Formats

### SQL Insert Scripts
```sql
-- sample_customers.sql
INSERT INTO Customers (customer_id, customer_name, email, phone) VALUES
(1, 'John Doe', 'john.doe@example.com', '555-0101'),
(2, 'Jane Smith', 'jane.smith@example.com', '555-0102'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '555-0103');
```

### CSV Files
```csv
customer_id,customer_name,email,phone
1,John Doe,john.doe@example.com,555-0101
2,Jane Smith,jane.smith@example.com,555-0102
3,Bob Johnson,bob.johnson@example.com,555-0103
```

### JSON Files
```json
[
  {
    "customer_id": 1,
    "customer_name": "John Doe",
    "email": "john.doe@example.com",
    "phone": "555-0101"
  }
]
```

## 🎯 Data Characteristics

### Volume
- Small dataset: 10-100 records (for quick tests)
- Medium dataset: 1,000-10,000 records (for integration tests)
- Large dataset: 100,000+ records (for performance tests)

### Quality
- Realistic but anonymized data
- Covers various scenarios
- Includes edge cases (NULL values, special characters)
- Maintains referential integrity

### Compliance
- No real personal information (GDPR, privacy)
- No production data
- Sanitized test data only

## 📥 Loading Sample Data

### MySQL
```bash
# From SQL file
mysql -u username -p database_name < sample_customers.sql

# From CSV file
LOAD DATA LOCAL INFILE 'customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### PostgreSQL
```bash
# From SQL file
psql -U username -d database_name -f sample_customers.sql

# From CSV file
COPY Customers(customer_id, customer_name, email, phone)
FROM '/path/to/customers.csv'
DELIMITER ','
CSV HEADER;
```

### SQL Server
```sql
-- From CSV using BULK INSERT
BULK INSERT Customers
FROM 'C:\data\customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
```

## 🔧 Data Generation Tools

### Online Tools
- **Mockaroo**: Generate realistic test data
- **GenerateData.com**: Custom data generation
- **Faker**: Python library for fake data

### SQL Scripts
```sql
-- Generate sample data using SQL
DELIMITER //
CREATE PROCEDURE generate_sample_customers(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= num_records DO
        INSERT INTO Customers (customer_name, email)
        VALUES (
            CONCAT('Customer_', i),
            CONCAT('customer', i, '@example.com')
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Usage
CALL generate_sample_customers(1000);
```

## 📊 Sample Data Sets

### Recommended Datasets

1. **Customers Dataset**
   - 50-100 customer records
   - Various demographics
   - Different customer types

2. **Products Dataset**
   - Multiple categories
   - Various price ranges
   - Different stock levels

3. **Orders Dataset**
   - Historical orders (last 12 months)
   - Various order statuses
   - Different payment methods

4. **Transactions Dataset**
   - Complete transaction history
   - Success and failure cases
   - Edge cases (refunds, cancellations)

## 🧹 Cleanup Scripts

Always provide cleanup scripts to remove test data:

```sql
-- cleanup_sample_data.sql
DELETE FROM OrderDetails WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id >= 1000);
DELETE FROM Orders WHERE customer_id >= 1000;
DELETE FROM Customers WHERE customer_id >= 1000;

-- Reset auto-increment if needed
ALTER TABLE Customers AUTO_INCREMENT = 1;
```

## ✅ Best Practices

- Keep sample data separate from test scripts
- Document data relationships and dependencies
- Version control sample data files
- Use consistent data formats
- Include data loading instructions
- Provide cleanup scripts
- Test with fresh data regularly
- Don't commit large binary files
- Use compression for large datasets

## 🔗 Data Relationships

Document the relationships between sample data:
```
Customers (1) --> (N) Orders
Orders (1) --> (N) OrderDetails
Products (1) --> (N) OrderDetails
```

Ensure referential integrity when loading:
1. Load parent tables first (Customers, Products)
2. Load child tables next (Orders)
3. Load junction tables last (OrderDetails)
