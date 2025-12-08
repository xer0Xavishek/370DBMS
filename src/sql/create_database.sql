-- =============================================
-- Script: example_create_database.sql
-- Description: Example script to create the database
-- Author: CSE370 Team
-- Date: 2024
-- Version: 1.0
-- Dependencies: None
-- =============================================

-- Drop database if it exists (use with caution)
-- DROP DATABASE IF EXISTS cse370_dbms;

-- Create database
CREATE DATABASE IF NOT EXISTS cse370_dbms
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- Select the database
USE cse370_dbms;

-- Display success message
SELECT 'Database created successfully!' AS Status;
