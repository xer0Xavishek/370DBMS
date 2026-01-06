# SQL Scripts

This directory contains database creation and initialization scripts.

##  Contents

- **create_database.sql**: Database creation script
- **create_tables.sql**: Table creation scripts with constraints


##  Script Execution Order

1. `create_database.sql` - Create the database
2. `create_tables.sql` - Create all tables with constraints


##  Guidelines

- Each script should be idempotent when possible
- Use `IF EXISTS` checks before dropping objects
- Include rollback scripts or procedures
- Comment all major sections
- Use proper transaction management

