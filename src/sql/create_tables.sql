-- =============================================
-- Script: create_tables.sql
-- Description: Sript to create the database
-- Author: CSE370 Fall-25 sec-02 Group 3
-- Date: 2025
-- Version: 1.0
-- =============================================

USE skillswap;

------------------------------------------------------
-- 1. USER (SuperClass)
------------------------------------------------------
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- composite attribute split
    first_name VARCHAR(50),
    last_name VARCHAR(50),

    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('admin','user') DEFAULT 'user',

    preferred_language VARCHAR(50),

    -- multivalued -> separate table (BCNF requirement)
    city VARCHAR(80),
    country VARCHAR(80),

    skillpoints INT DEFAULT 0
);
------------------------------------------------------
-- 1A. USER Multivalued Attribute (accessibility_needs)
------------------------------------------------------
CREATE TABLE user_accessibility_need (
    user_id INT,
    need VARCHAR(255),
    PRIMARY KEY (user_id, need),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);
