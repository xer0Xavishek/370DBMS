-- =============================================
-- Script: populate_data.sql
-- Description: Comprehensive seeding for SkillSwap (Bulk Version)
-- =============================================

USE skillswap;

SET FOREIGN_KEY_CHECKS = 0;

-- Clean up
TRUNCATE TABLE `report`;
TRUNCATE TABLE `user_badge`;
TRUNCATE TABLE `badge`;
TRUNCATE TABLE `message`;
TRUNCATE TABLE `review`;
TRUNCATE TABLE `session`;
TRUNCATE TABLE `learns`;
TRUNCATE TABLE `teaches`;
TRUNCATE TABLE `skill`;
TRUNCATE TABLE `learner`;
TRUNCATE TABLE `teacher`;
TRUNCATE TABLE `user_accessibility_need`;
TRUNCATE TABLE `user`;

-- =============================================
-- 1. EXTENSIVE USER LIST (50 Users)
-- =============================================
INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password`, `role`, `city`, `country`, `skillpoints`, `warning_count`, `is_suspended`) VALUES
(1, 'Super', 'Admin', 'admin@skillswap.com', 'admin123', 'admin', 'Dhaka', 'Bangladesh', 100, 0, 0),
(2, 'Alice', 'Wonder', 'alice@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 150, 0, 0),
(3, 'Bob', 'Builder', 'bob@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 30, 0, 0),
(4, 'Charlie', 'Chef', 'charlie@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 70, 0, 0),
(5, 'Diana', 'Doctor', 'diana@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 45, 1, 0),
(6, 'Evan', 'Evil', 'evan@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 0, 3, 1),
(7, 'Fiona', 'Flower', 'fiona@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 60, 0, 0),
(8, 'George', 'Guitar', 'george@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 10, 0, 0),
(9, 'Harry', 'Potter', 'harry@skillswap.com', '123456', 'user', 'London', 'UK', 200, 0, 0),
(10, 'Ian', 'Instructor', 'ian@skillswap.com', '123456', 'user', 'New York', 'USA', 55, 0, 0),
(11, 'Jack', 'Sparrow', 'jack@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 20, 0, 0),
(12, 'Kate', 'Winslet', 'kate@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 80, 0, 0),
(13, 'Liam', 'Neeson', 'liam@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 90, 0, 0),
(14, 'Mia', 'Khalifa', 'mia@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 40, 0, 0),
(15, 'Noah', 'Ark', 'noah@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 60, 0, 0),
(16, 'Olivia', 'Oil', 'olivia@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 30, 0, 0),
(17, 'Paul', 'Walker', 'paul@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 100, 0, 0),
(18, 'Quinn', 'Harley', 'quinn@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 10, 0, 0),
(19, 'Ryan', 'Reynolds', 'ryan@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 120, 0, 0),
(20, 'Sarah', 'Connor', 'sarah@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 50, 0, 0),
(21, 'Tom', 'Hanks', 'tom@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 75, 0, 0),
(22, 'Uma', 'Thurman', 'uma@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 85, 0, 0),
(23, 'Vin', 'Diesel', 'vin@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 45, 0, 0),
(24, 'Will', 'Smith', 'will@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 95, 0, 0),
(25, 'Xena', 'Warrior', 'xena@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 110, 0, 0),
(26, 'Yara', 'Greyjoy', 'yara@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 35, 0, 0),
(27, 'Zack', 'Snyder', 'zack@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 130, 0, 0),
(28, 'Adam', 'Sandler', 'adam@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 25, 0, 0),
(29, 'Bella', 'Swan', 'bella@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 55, 0, 0),
(30, 'Chris', 'Evans', 'chris@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 65, 0, 0),
(31, 'David', 'Beckham', 'david@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 140, 0, 0),
(32, 'Emma', 'Watson', 'emma@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 105, 0, 0),
(33, 'Frank', 'Sinatra', 'frank@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 15, 0, 0),
(34, 'Grace', 'Kelly', 'grace@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 95, 0, 0),
(35, 'Henry', 'Cavill', 'henry@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 85, 0, 0),
(36, 'Isla', 'Fisher', 'isla@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 45, 0, 0),
(37, 'John', 'Wick', 'john@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 125, 0, 0),
(38, 'Kevin', 'Hart', 'kevin@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 55, 0, 0),
(39, 'Leo', 'DiCaprio', 'leo@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 160, 0, 0),
(40, 'Mila', 'Kunis', 'mila@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 70, 0, 0),
(41, 'Nick', 'Jonas', 'nick@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 90, 0, 0),
(42, 'Oprah', 'Winfrey', 'oprah@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 200, 0, 0),
(43, 'Peter', 'Parker', 'peter@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 80, 0, 0),
(44, 'Queen', 'Latifah', 'queen@skillswap.com', '123456', 'user', 'Khulna', 'Bangladesh', 110, 0, 0),
(45, 'Robert', 'Downey', 'robert@skillswap.com', '123456', 'user', 'Barisal', 'Bangladesh', 180, 0, 0),
(46, 'Steve', 'Jobs', 'steve@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 250, 0, 0),
(47, 'Tony', 'Stark', 'tony@skillswap.com', '123456', 'user', 'Chittagong', 'Bangladesh', 300, 0, 0),
(48, 'Usher', 'Raymond', 'usher@skillswap.com', '123456', 'user', 'Sylhet', 'Bangladesh', 130, 0, 0),
(49, 'Victor', 'Hugo', 'victor@skillswap.com', '123456', 'user', 'Dhaka', 'Bangladesh', 60, 0, 0),
(50, 'Walter', 'White', 'walter@skillswap.com', '123456', 'user', 'Rajshahi', 'Bangladesh', 140, 0, 0);

ALTER TABLE `user` AUTO_INCREMENT = 51;

-- =============================================
-- 2. TEACHERS & LEARNERS
-- =============================================
-- Everyone is a learner
INSERT INTO `learner` (`learner_id`, `total_hours_learned`, `learner_level`) 
SELECT `user_id`, FLOOR(RAND() * 50), ELT(FLOOR(RAND() * 3) + 1, 'Beginner', 'Intermediate', 'Advanced') FROM `user`;

-- 70% are teachers
INSERT INTO `teacher` (`teacher_id`, `total_hours_taught`, `average_rating`)
SELECT `user_id`, FLOOR(RAND() * 100), ROUND(RAND() * 5, 2) FROM `user` WHERE `user_id` % 10 <= 6; -- Matches ~70%


-- =============================================
-- 3. SKILLS (20 Skills)
-- =============================================
INSERT INTO `skill` (`skill_id`, `title`, `category`, `difficulty_level`, `est_learning_time`, `is_verified`) VALUES
(1, 'Advanced PHP Programming', 'Coding', 'Expert', 40, 1),
(2, 'Watercolor Painting', 'Art', 'Beginner', 10, 1),
(3, 'Sourdough Baking', 'Lifestyle', 'Intermediate', 12, 1),
(4, 'Guitar 101', 'Music', 'Beginner', 20, 1),
(5, 'French Conversation', 'Language', 'Intermediate', 30, 0),
(6, 'Yoga & Meditation', 'Health', 'Beginner', 15, 1),
(7, 'Machine Learning Basics', 'Coding', 'Advanced', 60, 1),
(8, 'Public Speaking', 'Personal Development', 'Intermediate', 10, 1),
(9, 'Digital Marketing', 'Business', 'Beginner', 25, 1),
(10, 'Origami Masterclass', 'Art', 'Expert', 5, 1),
(11, 'JavaScript for Beginners', 'Coding', 'Beginner', 20, 1),
(12, 'Portrait Photography', 'Art', 'Intermediate', 15, 1),
(13, 'Italian Cooking', 'Lifestyle', 'Intermediate', 8, 1),
(14, 'Piano Basics', 'Music', 'Beginner', 25, 1),
(15, 'Spanish Language', 'Language', 'Intermediate', 35, 1),
(16, 'Crossfit Training', 'Fitness', 'Advanced', 20, 1),
(17, 'Data Science with R', 'Coding', 'Expert', 55, 1),
(18, 'Creative Writing', 'Art', 'Intermediate', 12, 1),
(19, 'SEO Strategies', 'Business', 'Advanced', 18, 1),
(20, 'Pottery Making', 'Art', 'Beginner', 14, 1);


-- =============================================
-- 4. TEACHES & LEARNS
-- =============================================
-- Assign random skills to teachers (Simplified Bulk)
INSERT IGNORE INTO `teaches` (`teacher_id`, `skill_id`, `proficiency_level`)
SELECT t.teacher_id, s.skill_id, 'Expert'
FROM `teacher` t
JOIN `skill` s ON (t.teacher_id + s.skill_id) % 7 = 0; -- Random distribution logic

-- Assign random interests
INSERT IGNORE INTO `learns` (`learner_id`, `skill_id`, `interest_level`)
SELECT l.learner_id, s.skill_id, 'High'
FROM `learner` l
JOIN `skill` s ON (l.learner_id * s.skill_id) % 13 = 0;

-- =============================================
-- 5. SESSIONS (100+ Sessions)
-- =============================================
-- Generating sessions based on join logic to create many pairs
INSERT IGNORE INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`)
SELECT 
    t.teacher_id, 
    l.learner_id, 
    (l.learner_id * 100) + s.skill_id as sess_no, -- Generate unique session no per pair
    ELT(FLOOR(RAND()*3)+1, 'pending', 'accepted', 'completed'),
    DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY),
    FLOOR(RAND()*3)+1,
    FLOOR(RAND()*30)+10,
    s.skill_id
FROM `teaches` t
JOIN `learner` l ON l.learner_id != t.teacher_id -- Learner is not the teacher
JOIN `skill` s ON t.skill_id = s.skill_id
WHERE (t.teacher_id + l.learner_id) % 5 = 0 -- Filter to get random subset (~20% of possible pairs)
LIMIT 150;


-- =============================================
-- 6. REVIEWS & MESSAGES
-- =============================================
-- Review for every completed session
INSERT INTO `review` (`teacher_id`, `learner_id`, `session_no`, `rating`, `comment`, `created_at`)
SELECT 
    teacher_id, learner_id, session_no, 
    FLOOR(RAND()*2)+4, -- Mostly 4-5 stars
    'Automated Bulk Review: Great session!', 
    NOW()
FROM `session`
WHERE `status` = 'completed';

-- Messages for accepted sessions
INSERT INTO `message` (`sender_id`, `receiver_id`, `content`, `timestamp`, `session_teacher_id`, `session_learner_id`, `session_no`)
SELECT 
    learner_id, teacher_id, 
    'Hello, looking forward to the session!', 
    NOW(), 
    teacher_id, learner_id, session_no
FROM `session`
WHERE `status` IN ('accepted', 'completed');


-- =============================================
-- 7. REPORTS & BADGES
-- =============================================
INSERT INTO `report` (`session_teacher_id`, `session_no`, `reporter_user_id`, `description`, `status`, `created_at`)
SELECT teacher_id, session_no, learner_id, 'Bulk Generated Report: Issue with connection.', 'open', NOW()
FROM `session` 
LIMIT 5;

INSERT INTO `badge` VALUES (1, 'Super', 'Desc'), (2, 'Learner', 'Desc');
INSERT IGNORE INTO `user_badge` (`user_id`, `badge_id`, `awarded_date`, `awarded_by`)
SELECT user_id, 1, NOW(), 1 FROM `user` WHERE skillpoints > 100;

SET FOREIGN_KEY_CHECKS = 1;
