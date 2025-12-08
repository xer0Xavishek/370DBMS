-- =============================================
-- Script: create_database.sql
-- Description: Sript to create the database
-- Author: CSE370 Fall-25 sec-02 Group 3
-- Date: 2025
-- Version: 1.0
-- Dependencies: None
-- =============================================

-- Drop database if it exists (use with caution)
-- DROP DATABASE IF EXISTS skillswap;

-- Create database
CREATE DATABASE IF NOT EXISTS skillswap
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE skillswap;

SELECT 'Database created successfully!' AS Status;
