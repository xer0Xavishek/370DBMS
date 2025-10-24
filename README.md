# CSE370 - Database Systems Lab Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📚 Project Overview

This repository contains the lab project work for **CSE370 - Database Systems**. The project demonstrates the practical application of database concepts including database design, SQL queries, stored procedures, and database management principles.

## 🎯 Objectives

- Design and implement a complete database system
- Create Entity-Relationship (ER) diagrams and schemas
- Write efficient SQL queries and stored procedures
- Perform database analysis and optimization
- Document all aspects of the database project

## 📁 Project Structure

```
370DBMS/
├── docs/               # Project documentation
├── diagrams/           # Visual representations
│   ├── erd/           # Entity-Relationship Diagrams
│   └── schema/        # Database schema diagrams
├── src/               # Source code
│   ├── sql/           # Database creation scripts
│   ├── queries/       # SQL query files
│   └── procedures/    # Stored procedures and functions
├── reports/           # Project reports
│   └── analysis/      # Analysis and optimization reports
└── tests/             # Testing resources
    └── sample-data/   # Sample data for testing
```

## 🚀 Getting Started

### Prerequisites

- Database Management System (MySQL, PostgreSQL, Oracle, etc.)
- SQL client or IDE (MySQL Workbench, pgAdmin, DBeaver, etc.)
- Basic understanding of SQL and database concepts

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/xer0Xavishek/370DBMS.git
   cd 370DBMS
   ```

2. Set up your database:
   - Create a new database in your DBMS
   - Run the SQL scripts from the `src/sql/` directory
   - Load sample data from `tests/sample-data/` (optional)

3. Start exploring the queries and procedures in the `src/` directory

## 📖 Documentation

Detailed documentation can be found in the [`docs/`](./docs/) directory:
- Project requirements and specifications
- Database design documentation
- Implementation details
- User guides and tutorials

## 🔧 Usage

### Running SQL Scripts

```sql
-- Example: Run database creation script
SOURCE src/sql/create_database.sql;

-- Example: Run sample queries
SOURCE src/queries/example_queries.sql;
```

### Testing

Test scripts and sample data are available in the `tests/` directory. Use these to validate your database implementation and query results.

## 📊 Diagrams

All visual representations including ER diagrams and schema designs are stored in the [`diagrams/`](./diagrams/) directory:
- **ERD**: Entity-Relationship Diagrams showing database structure
- **Schema**: Detailed schema diagrams with relationships and constraints

## 📝 Reports

Project reports, analysis, and documentation are available in the [`reports/`](./reports/) directory.

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for details on:
- Code style and standards
- Commit message conventions
- Pull request process

For more information about the project structure, see [PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md).

## 👥 Authors

- **CSE370 Database Systems Lab Students**

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Course Instructor and Teaching Assistants
- CSE370 Database Systems Course Materials
- Database design best practices and resources

## 📧 Contact

For questions or feedback, please open an issue on this repository.

---

**Course**: CSE370 - Database Systems  
**Institution**: [Your Institution Name]  
**Academic Year**: [Year]
