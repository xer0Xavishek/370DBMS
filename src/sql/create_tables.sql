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
------------------------------------------------------
-- 2. TEACHER (Subclass of USER)
------------------------------------------------------
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
    total_hours_taught INT DEFAULT 0,
    average_rating DECIMAL(3,2),

    FOREIGN KEY (teacher_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);
------------------------------------------------------
-- 3. LEARNER (Subclass of USER)
------------------------------------------------------
CREATE TABLE learner (
    learner_id INT PRIMARY KEY,
    total_hours_learned INT DEFAULT 0,
    learner_level VARCHAR(50),

    FOREIGN KEY (learner_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);
------------------------------------------------------
-- 4. SKILL
------------------------------------------------------
CREATE TABLE skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(60),

    -- composite attribute difficulty(level,notes)
    difficulty_level VARCHAR(50),
    difficulty_notes VARCHAR(255),

    est_learning_time INT,
    is_verified BOOLEAN DEFAULT FALSE
);
------------------------------------------------------
-- 5. TEACHES (M:N relationship, with attribute)
------------------------------------------------------
CREATE TABLE teaches (
    teacher_id INT,
    skill_id INT,
    proficiency_level VARCHAR(100),

    PRIMARY KEY (teacher_id, skill_id),

    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
        ON DELETE CASCADE
);
------------------------------------------------------
-- 6. LEARNS (M:N relationship with optional attribute)
------------------------------------------------------
CREATE TABLE learns (
    learner_id INT,
    skill_id INT,
    interest_level VARCHAR(100),

    PRIMARY KEY (learner_id, skill_id),

    FOREIGN KEY (learner_id) REFERENCES learner(learner_id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
        ON DELETE CASCADE
);

------------------------------------------------------
-- 7. SESSION (Weak Entity)
-- Identified by (teacher_id, learner_id, session_no)
------------------------------------------------------
CREATE TABLE session (
    teacher_id INT,
    learner_id INT,
    session_no INT,
    
    status ENUM('pending','accepted','completed') DEFAULT 'pending',
    scheduled_time DATETIME,
    duration_hours INT,
    skillpoints_transferred INT,

    skill_id INT, -- involved_in relationship

    PRIMARY KEY (teacher_id, learner_id, session_no),

    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
        ON DELETE CASCADE,
    FOREIGN KEY (learner_id) REFERENCES learner(learner_id)
        ON DELETE CASCADE,

    FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
        ON DELETE SET NULL
);
------------------------------------------------------
-- 8. REVIEW (Weak entity of SESSION)
------------------------------------------------------
CREATE TABLE review (
    teacher_id INT,
    learner_id INT,
    session_no INT,
    review_no INT,

    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (teacher_id, learner_id, session_no, review_no),

    FOREIGN KEY (teacher_id, learner_id, session_no)
        REFERENCES session(teacher_id, learner_id, session_no)
        ON DELETE CASCADE
);
------------------------------------------------------
-- 9. MESSAGE (sender + receiver)
------------------------------------------------------
CREATE TABLE message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,

    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,

    content TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    session_teacher_id INT,
    session_learner_id INT,
    session_no INT,

    FOREIGN KEY (sender_id) REFERENCES user(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (receiver_id) REFERENCES user(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (session_teacher_id, session_learner_id, session_no)
        REFERENCES session(teacher_id, learner_id, session_no)
        ON DELETE SET NULL
);

------------------------------------------------------
-- 10. BADGE
------------------------------------------------------
CREATE TABLE badge (
    badge_id INT AUTO_INCREMENT PRIMARY KEY,
    badge_name VARCHAR(100),
    badge_description VARCHAR(255)
);
------------------------------------------------------
-- 11. USER-BADGE Relationship (EARNS)
------------------------------------------------------
CREATE TABLE user_badge (
    user_id INT,
    badge_id INT,

    awarded_date DATE,
    awarded_by INT, -- admin user id

    PRIMARY KEY (user_id, badge_id),

    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (badge_id) REFERENCES badge(badge_id)
        ON DELETE CASCADE,

    FOREIGN KEY (awarded_by) REFERENCES user(user_id)
        ON DELETE SET NULL
);

------------------------------------------------------
-- 12. REPORT
------------------------------------------------------
CREATE TABLE report (
    report_id INT AUTO_INCREMENT PRIMARY KEY,

    session_teacher_id INT,
    session_learner_id INT,
    session_no INT,

    reporter_id INT NOT NULL,
    resolver_id INT,

    description TEXT,
    status ENUM('open','closed') DEFAULT 'open',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    resolution_text TEXT,
    resolved_at DATETIME,

    FOREIGN KEY (session_teacher_id, session_learner_id, session_no)
        REFERENCES session(teacher_id, learner_id, session_no)
        ON DELETE CASCADE,

    FOREIGN KEY (reporter_id) REFERENCES user(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (resolver_id) REFERENCES user(user_id)
        ON DELETE SET NULL
);