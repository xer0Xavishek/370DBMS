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

-- Table creation statements remain the same
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
    `warning_count` INT DEFAULT 0,
    `is_suspended` BOOLEAN DEFAULT FALSE,
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

-- ================= ENHANCED SEED DATA WITH FOOTBALLER NAMES =================

-- 1. Insert Users (Football Players)
INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `role`, `preferred_language`, `city`, `country`, `skillpoints`, `warning_count`, `is_suspended`) VALUES
-- Admins
('Lionel', 'Messi', 'messi@skillswap.com', 'password123', 'admin', 'Spanish', 'Miami', 'USA', 500, 0, FALSE),
('Cristiano', 'Ronaldo', 'ronaldo@skillswap.com', 'password123', 'admin', 'Portuguese', 'Riyadh', 'Saudi Arabia', 450, 0, FALSE),
('Pep', 'Guardiola', 'guardiola@skillswap.com', 'password123', 'admin', 'Catalan', 'Manchester', 'UK', 600, 0, FALSE),

-- Regular Users/Players
('Kylian', 'Mbappé', 'mbappe@skillswap.com', 'password123', 'user', 'French', 'Paris', 'France', 150, 0, FALSE),
('Erling', 'Haaland', 'haaland@skillswap.com', 'password123', 'user', 'Norwegian', 'Manchester', 'UK', 120, 0, FALSE),
('Kevin', 'De Bruyne', 'debruyne@skillswap.com', 'password123', 'user', 'Dutch', 'Manchester', 'UK', 200, 0, FALSE),
('Mohamed', 'Salah', 'salah@skillswap.com', 'password123', 'user', 'Arabic', 'Liverpool', 'UK', 180, 1, FALSE),
('Virgil', 'van Dijk', 'vandijk@skillswap.com', 'password123', 'user', 'Dutch', 'Liverpool', 'UK', 95, 0, FALSE),
('Harry', 'Kane', 'kane@skillswap.com', 'password123', 'user', 'English', 'Munich', 'Germany', 110, 0, FALSE),
('Luka', 'Modrić', 'modric@skillswap.com', 'password123', 'user', 'Croatian', 'Madrid', 'Spain', 220, 0, FALSE),
('Neymar', 'Jr', 'neymar@skillswap.com', 'password123', 'user', 'Portuguese', 'Riyadh', 'Saudi Arabia', 85, 2, TRUE), -- Suspended
('Robert', 'Lewandowski', 'lewandowski@skillswap.com', 'password123', 'user', 'Polish', 'Barcelona', 'Spain', 135, 0, FALSE),
('Son', 'Heung-min', 'son@skillswap.com', 'password123', 'user', 'Korean', 'London', 'UK', 160, 0, FALSE),
('Jude', 'Bellingham', 'bellingham@skillswap.com', 'password123', 'user', 'English', 'Madrid', 'Spain', 75, 0, FALSE),
('Thibaut', 'Courtois', 'courtois@skillswap.com', 'password123', 'user', 'Dutch', 'Madrid', 'Spain', 90, 0, FALSE),
('Joshua', 'Kimmich', 'kimmich@skillswap.com', 'password123', 'user', 'German', 'Munich', 'Germany', 110, 0, FALSE);

-- Initialize Teacher & Learner profiles for all users
INSERT INTO `teacher` (`teacher_id`) SELECT `user_id` FROM `user`;
INSERT INTO `learner` (`learner_id`) SELECT `user_id` FROM `user`;

-- Update teacher stats
UPDATE `teacher` SET 
    `total_hours_taught` = CASE `teacher_id`
        WHEN 1 THEN 50  -- Messi
        WHEN 2 THEN 45  -- Ronaldo
        WHEN 3 THEN 100 -- Guardiola
        WHEN 4 THEN 25  -- Mbappé
        WHEN 5 THEN 20  -- Haaland
        WHEN 6 THEN 40  -- De Bruyne
        WHEN 7 THEN 35  -- Salah
        WHEN 8 THEN 15  -- van Dijk
        WHEN 9 THEN 30  -- Kane
        WHEN 10 THEN 60 -- Modrić
        WHEN 11 THEN 10 -- Neymar
        WHEN 12 THEN 25 -- Lewandowski
        WHEN 13 THEN 28 -- Son
        WHEN 14 THEN 8  -- Bellingham
        WHEN 15 THEN 18 -- Courtois
        WHEN 16 THEN 22 -- Kimmich
    END,
    `average_rating` = CASE `teacher_id`
        WHEN 1 THEN 4.9
        WHEN 2 THEN 4.8
        WHEN 3 THEN 5.0
        WHEN 4 THEN 4.7
        WHEN 5 THEN 4.5
        WHEN 6 THEN 4.8
        WHEN 7 THEN 4.6
        WHEN 8 THEN 4.3
        WHEN 9 THEN 4.4
        WHEN 10 THEN 4.9
        WHEN 11 THEN 3.5
        WHEN 12 THEN 4.7
        WHEN 13 THEN 4.6
        WHEN 14 THEN 4.2
        WHEN 15 THEN 4.4
        WHEN 16 THEN 4.5
    END;

-- Update learner stats
UPDATE `learner` SET 
    `total_hours_learned` = CASE `learner_id`
        WHEN 1 THEN 15  -- Messi
        WHEN 2 THEN 10  -- Ronaldo
        WHEN 3 THEN 5   -- Guardiola
        WHEN 4 THEN 40  -- Mbappé
        WHEN 5 THEN 35  -- Haaland
        WHEN 6 THEN 20  -- De Bruyne
        WHEN 7 THEN 25  -- Salah
        WHEN 8 THEN 45  -- van Dijk
        WHEN 9 THEN 30  -- Kane
        WHEN 10 THEN 10 -- Modrić
        WHEN 11 THEN 50 -- Neymar
        WHEN 12 THEN 20 -- Lewandowski
        WHEN 13 THEN 35 -- Son
        WHEN 14 THEN 60 -- Bellingham
        WHEN 15 THEN 25 -- Courtois
        WHEN 16 THEN 18 -- Kimmich
    END,
    `learner_level` = CASE 
        WHEN `learner_id` IN (1,2,3) THEN 'Expert'
        WHEN `learner_id` IN (4,5,6,7,8,9,10) THEN 'Advanced'
        ELSE 'Intermediate'
    END;

-- 2. Insert Accessibility Needs
INSERT INTO `user_accessibility_need` (`user_id`, `need`) VALUES
(4, 'Visual impairment support'),
(4, 'Subtitles for videos'),
(7, 'Dyslexia-friendly materials'),
(10, 'Color blind mode'),
(13, 'Large text options');

-- 3. Insert Skills (Football-related and general skills)
INSERT INTO `skill` (`title`, `category`, `difficulty_level`, `difficulty_notes`, `est_learning_time`, `is_verified`) VALUES
('Football Dribbling Techniques', 'Sports', 'Intermediate', 'Focus on close control and change of direction', 15, TRUE),
('Penalty Kick Mastery', 'Sports', 'Beginner', 'Psychology and technique combined', 8, TRUE),
('Free Kick Taking', 'Sports', 'Advanced', 'Curve, power, and placement', 20, TRUE),
('Football Tactics Analysis', 'Sports', 'Advanced', 'Understanding formations and strategies', 30, TRUE),
('Goalkeeping Fundamentals', 'Sports', 'Intermediate', 'Positioning and reflexes training', 25, TRUE),
('Spanish Language', 'Language', 'Beginner', 'Basic conversation and football terms', 40, TRUE),
('Portuguese Cooking', 'Culinary', 'Intermediate', 'Traditional dishes and techniques', 20, TRUE),
('Media Interview Skills', 'Communication', 'Beginner', 'Handling press conferences', 10, TRUE),
('Fitness & Nutrition Planning', 'Health', 'Intermediate', 'Athlete-focused meal plans', 25, TRUE),
('Social Media Management', 'Marketing', 'Beginner', 'Building personal brand online', 15, TRUE),
('Video Editing for Highlights', 'Technology', 'Intermediate', 'Creating football highlight reels', 18, FALSE),
('Yoga for Athletes', 'Health', 'Beginner', 'Flexibility and recovery routines', 12, TRUE),
('French Language Basics', 'Language', 'Beginner', 'Essential phrases for travel', 30, FALSE),
('Guitar for Beginners', 'Music', 'Beginner', 'Basic chords and songs', 20, FALSE),
('Photography Composition', 'Arts', 'Intermediate', 'Capturing sports moments', 22, TRUE);

-- 4. Teaches (Who teaches what)
INSERT INTO `teaches` (`teacher_id`, `skill_id`, `proficiency_level`) VALUES
-- Messi teaches dribbling
(1, 1, 'World Class'),
-- Ronaldo teaches free kicks
(2, 3, 'World Class'),
-- Guardiola teaches tactics
(3, 4, 'Master'),
-- Mbappé teaches speed training
(1, 5, 'Expert'),
-- De Bruyne teaches passing
(6, 1, 'Expert'),
(6, 4, 'Expert'),
-- Salah teaches finishing
(7, 2, 'Expert'),
-- van Dijk teaches defending
(8, 4, 'Expert'),
-- Modrić teaches midfield play
(10, 1, 'World Class'),
(10, 4, 'Expert'),
-- Lewandowski teaches positioning
(12, 2, 'Expert'),
-- Son teaches languages
(13, 6, 'Fluent'),
(13, 13, 'Fluent'),
-- Bellingham (young player learning to teach)
(14, 1, 'Advanced'),
-- Courtois teaches goalkeeping
(15, 5, 'World Class'),
-- Kimmich teaches German and tactics
(16, 4, 'Expert');

-- 5. Learns (What users want to learn)
INSERT INTO `learns` (`learner_id`, `skill_id`, `interest_level`) VALUES
-- Young players learning from veterans
(4, 1, 'High'),  -- Mbappé learning dribbling from Messi
(4, 3, 'High'),  -- Mbappé learning free kicks from Ronaldo
(5, 2, 'Medium'), -- Haaland learning penalties
(5, 9, 'High'),  -- Haaland learning nutrition
(6, 4, 'High'),  -- De Bruyne learning tactics from Guardiola
(9, 6, 'High'),  -- Kane learning Spanish
(11, 1, 'High'), -- Neymar learning advanced dribbling
(14, 4, 'High'), -- Bellingham learning tactics
(14, 10, 'Medium'), -- Bellingham learning social media
-- Veterans learning new skills
(1, 7, 'Medium'), -- Messi learning Portuguese cooking
(1, 14, 'Low'),   -- Messi learning guitar
(2, 6, 'High'),   -- Ronaldo learning Spanish
(3, 11, 'Medium'), -- Guardiola learning video editing
(10, 12, 'High'); -- Modrić learning yoga

-- 6. Sessions (Teaching sessions between users)
INSERT INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`) VALUES
-- Completed sessions
(1, 4, 1, 'completed', '2025-10-15 14:00:00', 2, 30, 1),  -- Messi teaching Mbappé dribbling
(2, 4, 1, 'completed', '2025-10-20 16:00:00', 1, 20, 3),  -- Ronaldo teaching Mbappé free kicks
(3, 6, 1, 'completed', '2025-10-25 10:00:00', 3, 45, 4),  -- Guardiola teaching De Bruyne tactics
(10, 14, 1, 'completed', '2025-11-05 15:00:00', 2, 25, 4), -- Modrić teaching Bellingham
(15, 8, 1, 'completed', '2025-11-10 11:00:00', 2, 30, 5), -- Courtois teaching van Dijk goalkeeping

-- Accepted sessions (upcoming)
(1, 5, 1, 'accepted', '2025-12-20 14:00:00', 2, 30, 1),   -- Messi teaching Haaland
(6, 14, 1, 'accepted', '2025-12-22 16:00:00', 1, 15, 1),  -- De Bruyne teaching Bellingham
(12, 5, 1, 'accepted', '2025-12-24 10:00:00', 2, 25, 2),  -- Lewandowski teaching Haaland

-- Pending sessions
(13, 9, 1, 'pending', '2025-12-26 09:00:00', 1, 20, 6),   -- Son teaching Kane Spanish
(16, 6, 1, 'pending', '2025-12-28 14:00:00', 2, 30, 4),   -- Kimmich teaching De Bruyne tactics
(10, 4, 1, 'pending', '2025-12-30 15:00:00', 1, 15, 1),   -- Modrić teaching Mbappé

-- More completed sessions for data variety
(7, 5, 1, 'completed', '2025-11-15 13:00:00', 1, 15, 2),  -- Salah teaching Haaland penalties
(8, 16, 1, 'completed', '2025-11-20 10:00:00', 2, 25, 4), -- van Dijk teaching Kimmich defending
(13, 2, 1, 'completed', '2025-11-25 11:00:00', 1, 20, 6); -- Son teaching Ronaldo Spanish

-- 7. Reviews for completed sessions
INSERT INTO `review` (`teacher_id`, `learner_id`, `session_no`, `rating`, `comment`, `created_at`) VALUES
(1, 4, 1, 5, 'Incredible dribbling masterclass! Messi is a true maestro.', '2025-10-15 18:00:00'),
(2, 4, 1, 4, 'Great free kick techniques, but could use more practice time.', '2025-10-20 19:00:00'),
(3, 6, 1, 5, 'Guardiola tactical genius. Changed how I see the game!', '2025-10-25 15:00:00'),
(10, 14, 1, 5, 'Modrić taught me so much about midfield control. Legend!', '2025-11-05 18:30:00'),
(15, 8, 1, 4, 'Good goalkeeping basics, want more advanced techniques next time.', '2025-11-10 14:00:00'),
(7, 5, 1, 5, 'Salah penalty technique is clinical. Very helpful session!', '2025-11-15 16:00:00'),
(8, 16, 1, 5, 'Van Dijk defensive positioning lesson was world-class.', '2025-11-20 13:00:00'),
(13, 2, 1, 4, 'Son is a good teacher, but I need more conversational practice.', '2025-11-25 14:00:00');

-- 8. Messages between users
INSERT INTO `message` (`sender_id`, `receiver_id`, `content`, `timestamp`, `session_teacher_id`, `session_no`) VALUES
(4, 1, 'Hi Lionel, can we schedule another dribbling session?', '2025-10-16 09:00:00', 1, 1),
(1, 4, 'Sure Kylian, how about next Wednesday?', '2025-10-16 09:05:00', 1, 1),
(5, 1, 'Looking forward to our session! Any preparation needed?', '2025-12-18 10:00:00', 1, NULL),
(6, 3, 'Thank you for the tactics session, learned so much!', '2025-10-25 16:00:00', 3, 1),
(14, 10, 'When can we have our next midfield training?', '2025-11-06 11:00:00', 10, 1),
(9, 13, 'Can we focus more on football vocabulary in Spanish?', '2025-12-20 14:00:00', 13, NULL),
(2, 13, 'Your teaching method is great, need more practice though', '2025-11-25 15:00:00', 13, 1);

-- 9. Badges
INSERT INTO `badge` (`badge_name`, `badge_description`) VALUES
('Master Teacher', 'Awarded for teaching 50+ hours'),
('Rising Star', 'Awarded to learners who complete 10+ sessions'),
('Language Mentor', 'For teaching language skills to 5+ students'),
('Tactical Genius', 'Exceptional teaching of tactical skills'),
('Community Builder', 'Active participation in 20+ sessions'),
('Skill Master', 'Mastery in 3+ different skills'),
('Early Adopter', 'Joined during platform launch period'),
('Perfect Rating', 'Maintained 5.0 average rating over 10+ sessions'),
('Global Citizen', 'Teaching students from 5+ different countries'),
('Consistency Award', 'Regular weekly sessions for 3 months');

-- 10. User Badges
INSERT INTO `user_badge` (`user_id`, `badge_id`, `awarded_date`, `awarded_by`) VALUES
(1, 1, '2025-11-01', 3),  -- Messi: Master Teacher
(1, 6, '2025-11-01', 3),  -- Messi: Skill Master
(1, 8, '2025-11-01', 3),  -- Messi: Perfect Rating
(2, 1, '2025-11-01', 3),  -- Ronaldo: Master Teacher
(2, 9, '2025-11-01', 3),  -- Ronaldo: Global Citizen
(3, 1, '2025-10-01', 1),  -- Guardiola: Master Teacher
(3, 4, '2025-10-01', 1),  -- Guardiola: Tactical Genius
(3, 8, '2025-10-01', 1),  -- Guardiola: Perfect Rating
(4, 2, '2025-11-15', 1),  -- Mbappé: Rising Star
(4, 5, '2025-11-15', 1),  -- Mbappé: Community Builder
(6, 2, '2025-11-01', 3),  -- De Bruyne: Rising Star
(10, 1, '2025-11-10', 2), -- Modrić: Master Teacher
(10, 6, '2025-11-10', 2), -- Modrić: Skill Master
(13, 3, '2025-11-25', 2), -- Son: Language Mentor
(14, 2, '2025-11-05', 10),-- Bellingham: Rising Star
(14, 7, '2025-09-01', 3); -- Bellingham: Early Adopter

-- 11. Reports (for testing admin functionality)
INSERT INTO `report` (`session_teacher_id`, `session_no`, `reporter_user_id`, `description`, `status`, `created_at`, `resolution_text`, `resolved_at`, `resolved_by_user_id`) VALUES
(11, 1, 4, 'Session started 30 minutes late without notice', 'closed', '2025-09-15 14:45:00', 'Teacher issued warning. Skillpoints refunded to learner.', '2025-09-16 10:00:00', 3),
(7, 1, 5, 'Technical issues during online session', 'open', '2025-11-16 14:30:00', NULL, NULL, NULL),
(11, 1, 8, 'Inappropriate language used during session', 'closed', '2025-09-20 16:00:00', 'Teacher suspended for 2 weeks. Skillpoints refunded.', '2025-09-21 09:00:00', 1);

-- Update any remaining NULL session numbers to ensure unique combinations
-- This ensures each teacher has unique session numbers
UPDATE `session` s1
JOIN (
    SELECT teacher_id, session_no, ROW_NUMBER() OVER (PARTITION BY teacher_id ORDER BY scheduled_time) as new_session_no
    FROM `session`
) s2 ON s1.teacher_id = s2.teacher_id AND s1.session_no = s2.session_no
SET s1.session_no = s2.new_session_no
WHERE s1.session_no != s2.new_session_no;

-- Update review table to match corrected session numbers
UPDATE `review` r
JOIN `session` s ON r.teacher_id = s.teacher_id AND r.session_no = s.session_no
SET r.session_no = s.session_no;

-- Update message table to match corrected session numbers
UPDATE `message` m
JOIN `session` s ON m.session_teacher_id = s.teacher_id AND m.session_no = s.session_no
SET m.session_no = s.session_no;

-- Update report table to match corrected session numbers
UPDATE `report` rep
JOIN `session` s ON rep.session_teacher_id = s.teacher_id AND rep.session_no = s.session_no
SET rep.session_no = s.session_no;