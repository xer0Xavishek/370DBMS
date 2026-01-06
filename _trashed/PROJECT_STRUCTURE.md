# Project Structure Documentation

This document provides a comprehensive overview of the CSE370 DBMS project directory structure, conventions, and organization principles.

## 📁 Directory Structure Overview

```
370DBMS/
├── docs/                      # Project documentation
│   └── README.md             # Documentation guidelines
│
├── diagrams/                  # Visual representations
│   ├── erd/                  # Entity-Relationship Diagrams
│   │   ├── README.md         # ER diagram guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   ├── schema/               # Database schema diagrams
│   │   ├── README.md         # Schema diagram guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   └── README.md             # Diagrams overview and standards
│
├── src/                       # Source code
│   ├── sql/                  # Database creation scripts
│   │   ├── README.md         # SQL scripts guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   ├── queries/              # SQL query files
│   │   ├── README.md         # Query documentation
│   │   └── .gitkeep          # Preserve directory in git
│   ├── procedures/           # Stored procedures and functions
│   │   ├── README.md         # Procedures guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   └── README.md             # Source code overview
│
├── reports/                   # Project reports
│   ├── analysis/             # Analysis reports
│   │   ├── README.md         # Analysis guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   └── README.md             # Reports overview
│
├── tests/                     # Testing resources
│   ├── sample-data/          # Sample datasets
│   │   ├── README.md         # Sample data guidelines
│   │   └── .gitkeep          # Preserve directory in git
│   └── README.md             # Testing documentation
│
├── CONTRIBUTING.md            # Contribution guidelines
├── PROJECT_STRUCTURE.md       # This file
└── README.md                  # Project overview and getting started
```

## 🎯 Directory Purposes

### `/docs` - Documentation

**Purpose**: Central location for all project documentation

**Contents**:
- Project requirements and specifications
- Database design documentation
- Implementation guides
- API documentation
- User manuals
- Technical specifications

**File Types**: Markdown (`.md`), PDF (`.pdf`), Word (`.docx`)

**Best Practices**:
- Keep documentation synchronized with code
- Use clear, technical language
- Include examples and diagrams
- Version control all documentation

---

### `/diagrams` - Visual Representations

**Purpose**: Store all visual database representations

**Subdirectories**:

#### `/diagrams/erd` - Entity-Relationship Diagrams
- Conceptual, logical, and physical ER diagrams
- Shows entities, attributes, and relationships
- Includes cardinality and participation constraints

#### `/diagrams/schema` - Schema Diagrams
- Detailed table structures
- Column definitions with data types
- Primary and foreign key relationships
- Indexes and constraints

**File Types**: PNG (`.png`), JPEG (`.jpg`), PDF (`.pdf`), Draw.io (`.drawio`), Mermaid (`.mmd`)

**Best Practices**:
- Save both source and exported formats
- Use consistent notation (Crow's Foot, Chen, UML)
- Keep diagrams updated with schema changes
- Label all components clearly

---

### `/src` - Source Code

**Purpose**: All executable database code

**Subdirectories**:

#### `/src/sql` - Database Scripts
- `create_database.sql`: Database initialization
- `create_tables.sql`: Table definitions
- `create_indexes.sql`: Index definitions
- `create_views.sql`: View definitions
- `insert_data.sql`: Initial data loading
- `alter_tables.sql`: Schema modifications
- `drop_scripts.sql`: Cleanup scripts

**Execution Order**: 
1. Create database
2. Create tables
3. Create indexes
4. Create views
5. Insert data

#### `/src/queries` - SQL Queries
- Data retrieval queries
- Reporting queries
- Analytics queries
- Complex JOIN operations
- Aggregate functions

**File Naming**: 
- Descriptive names: `get_customer_orders.sql`
- Query category: `report_monthly_sales.sql`
- Numbered execution: `01_basic_queries.sql`

#### `/src/procedures` - Stored Procedures & Functions
- Stored procedures for business logic
- User-defined functions for calculations
- Triggers for data integrity
- Cursors for row-by-row processing

**Naming Conventions**:
- Procedures: `sp_ProcedureName` or `proc_name`
- Functions: `fn_FunctionName` or `func_name`
- Triggers: `trg_TableName_Event`

**Best Practices**:
- Comment all code thoroughly
- Include error handling
- Use transactions appropriately
- Validate input parameters
- Document parameters and return values

---

### `/reports` - Reports and Analysis

**Purpose**: Project deliverables and analysis documentation

**Subdirectories**:

#### `/reports/analysis` - Analysis Reports
- Performance analysis
- Query optimization reports
- Normalization analysis
- Security audits
- Scalability studies

**File Types**: Markdown (`.md`), PDF (`.pdf`), Word (`.docx`), Excel (`.xlsx`)

**Report Structure**:
1. Executive Summary
2. Introduction
3. Methodology
4. Results/Findings
5. Discussion
6. Conclusions
7. Recommendations
8. References

**Best Practices**:
- Use professional formatting
- Include visuals (charts, graphs)
- Cite sources
- Provide actionable recommendations
- Version control drafts

---

### `/tests` - Testing Resources

**Purpose**: Test scripts, test data, and validation

**Subdirectories**:

#### `/tests/sample-data` - Sample Datasets
- Small datasets for unit testing
- Medium datasets for integration testing
- Large datasets for performance testing
- Reference data and lookup tables

**Data Formats**: SQL (`.sql`), CSV (`.csv`), JSON (`.json`)

**Testing Types**:
- Unit tests: Individual components
- Integration tests: Multi-component operations
- Performance tests: Load and stress testing
- Validation tests: Data integrity checks

**Best Practices**:
- Use realistic but anonymized data
- Include edge cases
- Provide cleanup scripts
- Document test scenarios
- Maintain referential integrity

---

## 📄 Root Level Files

### `README.md`
- Project overview and introduction
- Getting started guide
- Installation instructions
- Usage examples
- Links to detailed documentation

### `CONTRIBUTING.md`
- Contribution guidelines
- Code style standards
- Commit message conventions
- Pull request process
- Testing requirements

### `PROJECT_STRUCTURE.md` (this file)
- Directory structure explanation
- File organization principles
- Naming conventions
- Best practices

### `.gitkeep` Files
- Preserve empty directories in Git
- Git doesn't track empty directories
- `.gitkeep` is a convention to keep structure
- Should be present in all directories

## 🎨 Naming Conventions

### Files

**SQL Scripts**:
```
create_[object_name].sql        # Creation scripts
insert_[table_name].sql         # Data insertion
alter_[table_name].sql          # Modifications
drop_[object_name].sql          # Deletion
```

**Queries**:
```
get_[description].sql           # Retrieval queries
report_[name].sql               # Reporting queries
analyze_[topic].sql             # Analysis queries
```

**Tests**:
```
test_[feature]_[scenario].sql   # Test scripts
sample_[table_name].sql         # Sample data
```

**Documentation**:
```
README.md                       # Overview and guidelines
[topic]_guide.md               # Specific guides
[feature]_documentation.md      # Feature docs
```

### Database Objects

**Tables**: `PascalCase` or `snake_case` (be consistent)
- `Customers`, `Orders`, `OrderDetails`
- `customers`, `orders`, `order_details`

**Columns**: `snake_case`
- `customer_id`, `order_date`, `total_amount`

**Indexes**: `idx_[table]_[columns]`
- `idx_customers_email`
- `idx_orders_customer_date`

**Constraints**: `[type]_[table]_[column]`
- `pk_customers_id`
- `fk_orders_customer_id`
- `uk_customers_email`
- `chk_orders_amount_positive`

## 🔄 Version Control

### What to Commit
- ✅ Source code (SQL scripts)
- ✅ Documentation (Markdown, PDF)
- ✅ Diagrams (images and source files)
- ✅ Test scripts
- ✅ Sample data (small datasets)
- ✅ Configuration files
- ✅ README files
- ✅ `.gitkeep` files

### What NOT to Commit
- ❌ Database files (`.db`, `.mdf`, `.ibd`)
- ❌ Large datasets (> 10 MB)
- ❌ Temporary files
- ❌ IDE-specific files
- ❌ Passwords or credentials
- ❌ Binary files without source
- ❌ Log files
- ❌ Build artifacts

### `.gitignore` Recommendations

```gitignore
# Database files
*.db
*.sqlite
*.mdf
*.ldf
*.ibd
*.frm

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Temporary files
tmp/
temp/
*.tmp

# Logs
*.log

# Large data files
*.csv
*.json
*.xml
# (except small sample files)
```

## 📊 File Organization Best Practices

### 1. Logical Grouping
- Group related files together
- Use subdirectories for categories
- Keep flat structure where possible
- Don't nest too deeply (max 3-4 levels)

### 2. Consistent Naming
- Use consistent case (snake_case or PascalCase)
- Descriptive but concise names
- Include context in name
- Avoid abbreviations unless common

### 3. Documentation
- Every directory has a README
- Complex files have header comments
- Link related files in documentation
- Keep docs up to date

### 4. Modularity
- One concern per file
- Reusable components
- Clear dependencies
- Avoid duplication

### 5. Scalability
- Structure supports growth
- Easy to add new components
- Logical categorization
- Flexible organization

## 🔍 Finding Files

### By Purpose

**Need to create database?** → `/src/sql/create_database.sql`

**Need to write a query?** → `/src/queries/`

**Need to create stored procedure?** → `/src/procedures/`

**Need ER diagram?** → `/diagrams/erd/`

**Need sample data?** → `/tests/sample-data/`

**Need documentation?** → `/docs/`

**Need to write a report?** → `/reports/`

### By Type

**SQL Scripts**: `/src/sql/`, `/src/queries/`, `/src/procedures/`

**Visual Content**: `/diagrams/erd/`, `/diagrams/schema/`

**Text Documentation**: `/docs/`, All `README.md` files

**Data Files**: `/tests/sample-data/`

**Reports**: `/reports/`, `/reports/analysis/`

## 🚀 Workflow Examples

### Creating a New Table

1. Design the table (on paper or tool)
2. Create ER diagram → `/diagrams/erd/`
3. Update schema diagram → `/diagrams/schema/`
4. Write CREATE TABLE script → `/src/sql/`
5. Create sample data → `/tests/sample-data/`
6. Write test queries → `/tests/`
7. Document the table → `/docs/`
8. Update main README if significant

### Adding a New Query

1. Write the query → `/src/queries/`
2. Add header comment with description
3. Test with sample data
4. Document in query README
5. Update main README if important

### Creating a Report

1. Gather data and perform analysis
2. Create visualizations (charts, graphs)
3. Write report → `/reports/` or `/reports/analysis/`
4. Include code snippets and examples
5. Add to reports README
6. Reference in main README

## ✅ Checklist for New Contributors

- [ ] Read `README.md` for project overview
- [ ] Review `CONTRIBUTING.md` for guidelines
- [ ] Understand `PROJECT_STRUCTURE.md` (this file)
- [ ] Explore directory structure
- [ ] Review existing code for style examples
- [ ] Set up local database environment
- [ ] Run existing scripts to understand flow
- [ ] Check issues for contribution opportunities

## 📚 Additional Resources

- [SQL Style Guide](https://www.sqlstyle.guide/)
- [Database Design Best Practices](https://www.vertabelo.com/blog/database-design-best-practices/)
- [Git Best Practices](https://www.git-tower.com/learn/git/ebook/en/command-line/appendix/best-practices)
- [Markdown Guide](https://www.markdownguide.org/)

## 🔄 Maintaining Structure

### Regular Maintenance

1. **Review**: Periodically review structure for improvements
2. **Clean**: Remove obsolete files
3. **Update**: Keep documentation current
4. **Refactor**: Reorganize if needed
5. **Archive**: Move old versions to archive directory

### When to Restructure

- Project scope significantly changes
- Current structure causes confusion
- New major features need different organization
- Team grows and needs better organization

### How to Propose Changes

1. Open an issue describing the problem
2. Propose new structure with rationale
3. Get feedback from team
4. Create pull request with changes
5. Update all documentation
6. Notify team of changes

---

**Last Updated**: 2024  
**Version**: 1.0  
**Maintainer**: CSE370 DBMS Project Team

For questions about project structure, please open an issue or refer to `CONTRIBUTING.md`.
