-- =============================================
-- Script: create_tables.sql
-- Description: Script to create the database and seed data
-- Author: CSE370 Fall-25 sec-02 Group 3
-- Date: 2025
-- Version: 1.0
-- =============================================

CREATE DATABASE IF NOT EXISTS skillswap;
USE skillswap;

-- Disable FK checks to allow dropping tables in any order
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS `report`;
DROP TABLE IF EXISTS `user_badge`;
DROP TABLE IF EXISTS `badge`;
DROP TABLE IF EXISTS `message`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `session`;
DROP TABLE IF EXISTS `learns`;
DROP TABLE IF EXISTS `teaches`;
DROP TABLE IF EXISTS `skill`;
DROP TABLE IF EXISTS `learner`;
DROP TABLE IF EXISTS `teacher`;
DROP TABLE IF EXISTS `user_accessibility_need`;
DROP TABLE IF EXISTS `user`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `user` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `email` VARCHAR(120) UNIQUE NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `role` ENUM('admin','user') DEFAULT 'user',
    `preferred_language` VARCHAR(50),
    `city` VARCHAR(80),
    `country` VARCHAR(80),

    `skillpoints` INT DEFAULT 0,
    
    -- Admin & Behaviour Tracking
    `warning_count` INT DEFAULT 0,
    `is_suspended` BOOLEAN DEFAULT FALSE,
    
    -- Profile
    `profile_picture` VARCHAR(255) DEFAULT 'default.png'
);

CREATE TABLE `user_accessibility_need` (
    `user_id` INT,
    `need` VARCHAR(255),
    PRIMARY KEY (`user_id`, `need`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE
);

CREATE TABLE `teacher` (
    `teacher_id` INT PRIMARY KEY,
    `total_hours_taught` INT DEFAULT 0,
    `average_rating` DECIMAL(3,2),

    FOREIGN KEY (`teacher_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE
);

CREATE TABLE `learner` (
    `learner_id` INT PRIMARY KEY,
    `total_hours_learned` INT DEFAULT 0,
    `learner_level` VARCHAR(50),

    FOREIGN KEY (`learner_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE
);

CREATE TABLE `skill` (
    `skill_id` INT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL,
    `category` VARCHAR(100),
    `difficulty_level` VARCHAR(50),
    `difficulty_notes` VARCHAR(255),
    `est_learning_time` INT,
    `is_verified` BOOLEAN DEFAULT FALSE
);

CREATE TABLE `teaches` (
    `teacher_id` INT,
    `skill_id` INT,
    `proficiency_level` VARCHAR(100),

    PRIMARY KEY (`teacher_id`, `skill_id`),

    FOREIGN KEY (`teacher_id`) REFERENCES `teacher`(`teacher_id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`) REFERENCES `skill`(`skill_id`)
        ON DELETE CASCADE
);

CREATE TABLE `learns` (
    `learner_id` INT,
    `skill_id` INT,
    `interest_level` VARCHAR(100),

    PRIMARY KEY (`learner_id`, `skill_id`),

    FOREIGN KEY (`learner_id`) REFERENCES `learner`(`learner_id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`) REFERENCES `skill`(`skill_id`)
        ON DELETE CASCADE
);


CREATE TABLE `session` (
    `teacher_id` INT,
    `learner_id` INT,
    `session_no` INT,
    `status` ENUM('pending','accepted','completed') DEFAULT 'pending',
    `scheduled_time` DATETIME,
    `duration_hours` INT,
    `skillpoints_transferred` INT,
    `skill_id` INT,

    PRIMARY KEY (`teacher_id`, `session_no`),

    FOREIGN KEY (`teacher_id`) REFERENCES `teacher`(`teacher_id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`learner_id`) REFERENCES `learner`(`learner_id`)
        ON DELETE CASCADE,

    FOREIGN KEY (`skill_id`) REFERENCES `skill`(`skill_id`)
        ON DELETE SET NULL
);

CREATE TABLE `review` (
    `review_id` INT AUTO_INCREMENT PRIMARY KEY,

    `teacher_id` INT,
    `learner_id` INT,
    `session_no` INT,

    `rating` INT CHECK (`rating` BETWEEN 1 AND 5),
    `comment` TEXT,
    `created_at` DATETIME,

    FOREIGN KEY (`teacher_id`, `session_no`)
        REFERENCES `session`(`teacher_id`, `session_no`)
        ON DELETE CASCADE
);

CREATE TABLE `message` (
    `message_id` INT AUTO_INCREMENT PRIMARY KEY,
    `sender_id` INT NOT NULL,
    `receiver_id` INT NOT NULL,

    `content` TEXT,
    `timestamp` DATETIME,

    `session_teacher_id` INT,
    `session_learner_id` INT,
    `session_no` INT,

    FOREIGN KEY (`sender_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE,

    FOREIGN KEY (`receiver_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE,

    FOREIGN KEY (`session_teacher_id`, `session_no`)
        REFERENCES `session`(`teacher_id`, `session_no`)
        ON DELETE SET NULL
);


CREATE TABLE `badge` (
    `badge_id` INT AUTO_INCREMENT PRIMARY KEY,
    `badge_name` VARCHAR(100),
    `badge_description` TEXT
);

CREATE TABLE `user_badge` (
    `user_id` INT,
    `badge_id` INT,

    `awarded_date` DATE,
    `awarded_by` INT, 

    PRIMARY KEY (`user_id`, `badge_id`),

    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`badge_id`) REFERENCES `badge`(`badge_id`)
        ON DELETE CASCADE,

    FOREIGN KEY (`awarded_by`) REFERENCES `user`(`user_id`)
        ON DELETE SET NULL
);


CREATE TABLE `report` (
    `report_id` INT AUTO_INCREMENT PRIMARY KEY,
    `session_teacher_id` INT,
    `session_no` INT,
    `reporter_user_id` INT,
    `description` TEXT,
    `status` ENUM('open','closed'),
    `created_at` DATETIME,
    `resolution_text` TEXT,
    `resolved_at` DATETIME,
    `resolved_by_user_id` INT,

    FOREIGN KEY (`session_teacher_id`, `session_no`)
        REFERENCES `session`(`teacher_id`, `session_no`)
        ON DELETE CASCADE,

    FOREIGN KEY (`reporter_user_id`)
        REFERENCES `user`(`user_id`)
        ON DELETE CASCADE,

    FOREIGN KEY (`resolved_by_user_id`)
        REFERENCES `user`(`user_id`)
        ON DELETE SET NULL
);

-- ================= SEED DATA (Adapted for Schema) =================

-- 1. Insert Users
INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `role`, `city`, `country`, `skillpoints`) VALUES
('Rahim', 'Uddin', 'rahim@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 25),
('Sumaiya', 'Akib', 'sumaiya@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 30),
('Tanvir', 'Hossain', 'tanvir@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 15),
('Nusrat', 'Jahan', 'nusrat@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 50),
('Sreema', 'Admin', 'sreema@skillswap.com', 'admin123', 'admin', 'Dhaka', 'Bangladesh', 100),
('Avishek', 'Admin', 'avishek@skillswap.com', 'admin123', 'admin', 'Dhaka', 'Bangladesh', 100),
('Main', 'Admin', 'admin@skillswap.com', 'admin123', 'admin', 'Dhaka', 'Bangladesh', 100);

-- Initialize Teacher & Learner profiles
INSERT INTO `teacher` (`teacher_id`) SELECT `user_id` FROM `user`;
INSERT INTO `learner` (`learner_id`) SELECT `user_id` FROM `user`;

-- 2. Insert Skills
INSERT INTO `skill` (`title`, `category`, `difficulty_level`, `est_learning_time`, `is_verified`) VALUES
('Bangla Photography', 'Art', 'Beginner', 10, TRUE),
('Chittagonian Cooking', 'Lifestyle', 'Intermediate', 5, TRUE),
('Web Development with PHP', 'Coding', 'Advanced', 40, TRUE),
('Guitar Basics', 'Music', 'Beginner', 15, FALSE),
('IELTS Preparation', 'Education', 'Intermediate', 20, TRUE);

-- 3. Teaches
INSERT INTO `teaches` (`teacher_id`, `skill_id`, `proficiency_level`) VALUES
(1, 1, 'Expert'),
(2, 2, 'Expert'),
(3, 3, 'Professional'),
(4, 5, 'Expert');

-- 4. Sessions (Composite Key Logic)
-- Rahim (1) teaching Sumaiya (2)
INSERT INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`) VALUES
(1, 2, 1, 'completed', '2025-12-01 10:00:00', 2, 20, 1);

-- Sumaiya (2) teaching Tanvir (3)
INSERT INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`) VALUES
(2, 3, 1, 'accepted', '2025-12-25 16:00:00', 1, 10, 2);

-- 5. Review
INSERT INTO `review` (`teacher_id`, `learner_id`, `session_no`, `rating`, `comment`, `created_at`) VALUES
(1, 2, 1, 5, 'Great photography session!', NOW());
