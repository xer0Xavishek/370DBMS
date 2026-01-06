-- =============================================
-- Script: create_tables.sql
-- Description: Script to create the database and seed data
-- Author: CSE370 Fall-25 sec-02 Group 3
-- Date: 2025
-- Version: 1.0
-- =============================================



-- ================= REALISTIC SKILL-SHARING DATA WITH FOOTBALLER NAMES =================

-- 1. Insert Users (Regular people with football player names)
INSERT INTO `user` (`first_name`, `last_name`, `email`, `password`, `role`, `preferred_language`, `city`, `country`, `skillpoints`, `warning_count`, `is_suspended`) VALUES
-- Admins
('Lionel', 'Messi', 'messi.admin@skillswap.com', 'password123', 'admin', 'Spanish', 'Barcelona', 'Spain', 500, 0, FALSE),
('Cristiano', 'Ronaldo', 'ronaldo.admin@skillswap.com', 'password123', 'admin', 'Portuguese', 'Lisbon', 'Portugal', 450, 0, FALSE),
('Alex', 'Ferguson', 'ferguson.admin@skillswap.com', 'password123', 'admin', 'English', 'Manchester', 'UK', 600, 0, FALSE),

-- Regular Users (with diverse professions)
('Kylian', 'Mbappé', 'kylian.m@email.com', 'password123', 'user', 'French', 'Paris', 'France', 150, 0, FALSE),
('Erling', 'Haaland', 'erling.h@email.com', 'password123', 'user', 'Norwegian', 'Oslo', 'Norway', 120, 0, FALSE),
('Kevin', 'De Bruyne', 'kevin.db@email.com', 'password123', 'user', 'Dutch', 'Brussels', 'Belgium', 200, 0, FALSE),
('Mohamed', 'Salah', 'mohamed.s@email.com', 'password123', 'user', 'Arabic', 'Cairo', 'Egypt', 180, 1, FALSE),
('Virgil', 'van Dijk', 'virgil.vd@email.com', 'password123', 'user', 'Dutch', 'Amsterdam', 'Netherlands', 95, 0, FALSE),
('Harry', 'Kane', 'harry.k@email.com', 'password123', 'user', 'English', 'London', 'UK', 110, 0, FALSE),
('Luka', 'Modrić', 'luka.m@email.com', 'password123', 'user', 'Croatian', 'Zagreb', 'Croatia', 220, 0, FALSE),
('Neymar', 'Jr', 'neymar.j@email.com', 'password123', 'user', 'Portuguese', 'São Paulo', 'Brazil', 85, 2, TRUE), -- Suspended for no-shows
('Robert', 'Lewandowski', 'robert.l@email.com', 'password123', 'user', 'Polish', 'Warsaw', 'Poland', 135, 0, FALSE),
('Son', 'Heung-min', 'son.hm@email.com', 'password123', 'user', 'Korean', 'Seoul', 'South Korea', 160, 0, FALSE),
('Jude', 'Bellingham', 'jude.b@email.com', 'password123', 'user', 'English', 'Birmingham', 'UK', 75, 0, FALSE),
('Thibaut', 'Courtois', 'thibaut.c@email.com', 'password123', 'user', 'French', 'Brussels', 'Belgium', 90, 0, FALSE),
('Joshua', 'Kimmich', 'joshua.k@email.com', 'password123', 'user', 'German', 'Berlin', 'Germany', 110, 0, FALSE),
('Alexia', 'Putellas', 'alexia.p@email.com', 'password123', 'user', 'Catalan', 'Barcelona', 'Spain', 180, 0, FALSE),
('Sam', 'Kerr', 'sam.k@email.com', 'password123', 'user', 'English', 'Perth', 'Australia', 140, 0, FALSE);

-- Initialize Teacher & Learner profiles for all users
INSERT INTO `teacher` (`teacher_id`) SELECT `user_id` FROM `user`;
INSERT INTO `learner` (`learner_id`) SELECT `user_id` FROM `user`;

-- Update teacher stats based on realistic skill-sharing activity
UPDATE `teacher` SET 
    `total_hours_taught` = CASE `teacher_id`
        WHEN 1 THEN 50  -- Lionel (Photography enthusiast)
        WHEN 2 THEN 45  -- Cristiano (Cooking expert)
        WHEN 3 THEN 100 -- Alex (Retired professor)
        WHEN 4 THEN 25  -- Kylian (Graphic designer)
        WHEN 5 THEN 20  -- Erling (Yoga instructor)
        WHEN 6 THEN 40  -- Kevin (Web developer)
        WHEN 7 THEN 35  -- Mohamed (Language tutor)
        WHEN 8 THEN 15  -- Virgil (Gardening expert)
        WHEN 9 THEN 30  -- Harry (DIY home repair)
        WHEN 10 THEN 60 -- Luka (Music teacher)
        WHEN 11 THEN 10 -- Neymar (Dance instructor - suspended)
        WHEN 12 THEN 25 -- Robert (Financial planning)
        WHEN 13 THEN 28 -- Son (Korean cooking)
        WHEN 14 THEN 8  -- Jude (Video editing student)
        WHEN 15 THEN 18 -- Thibaut (Baking)
        WHEN 16 THEN 22 -- Joshua (German tutor)
        WHEN 17 THEN 45 -- Alexia (Spanish tutor)
        WHEN 18 THEN 35 -- Sam (Fitness training)
    END,
    `average_rating` = CASE `teacher_id`
        WHEN 1 THEN 4.9  -- Excellent teacher
        WHEN 2 THEN 4.8  -- Very good
        WHEN 3 THEN 5.0  -- Perfect rating
        WHEN 4 THEN 4.7  -- Good
        WHEN 5 THEN 4.5  -- Above average
        WHEN 6 THEN 4.8  -- Very good
        WHEN 7 THEN 4.6  -- Good
        WHEN 8 THEN 4.3  -- Average
        WHEN 9 THEN 4.4  -- Average
        WHEN 10 THEN 4.9 -- Excellent
        WHEN 11 THEN 3.5 -- Poor (suspended)
        WHEN 12 THEN 4.7 -- Good
        WHEN 13 THEN 4.6 -- Good
        WHEN 14 THEN 4.2 -- Fair
        WHEN 15 THEN 4.4 -- Average
        WHEN 16 THEN 4.5 -- Above average
        WHEN 17 THEN 4.8 -- Very good
        WHEN 18 THEN 4.9 -- Excellent
    END;

-- Update learner stats based on learning activity
UPDATE `learner` SET 
    `total_hours_learned` = CASE `learner_id`
        WHEN 1 THEN 15  -- Lionel learning cooking
        WHEN 2 THEN 10  -- Cristiano learning photography
        WHEN 3 THEN 5   -- Alex learning tech skills
        WHEN 4 THEN 40  -- Kylian learning coding
        WHEN 5 THEN 35  -- Erling learning nutrition
        WHEN 6 THEN 20  -- Kevin learning guitar
        WHEN 7 THEN 25  -- Mohamed learning public speaking
        WHEN 8 THEN 45  -- Virgil learning languages
        WHEN 9 THEN 30  -- Harry learning gardening
        WHEN 10 THEN 10 -- Luka learning meditation
        WHEN 11 THEN 50 -- Neymar learning various (inactive)
        WHEN 12 THEN 20 -- Robert learning home repair
        WHEN 13 THEN 35 -- Son learning photography
        WHEN 14 THEN 60 -- Jude learning multiple skills
        WHEN 15 THEN 25 -- Thibaut learning graphic design
        WHEN 16 THEN 18 -- Joshua learning fitness
        WHEN 17 THEN 30 -- Alexia learning French
        WHEN 18 THEN 25 -- Sam learning nutrition
    END,
    `learner_level` = CASE 
        WHEN `total_hours_learned` >= 50 THEN 'Expert Learner'
        WHEN `total_hours_learned` >= 25 THEN 'Advanced Learner'
        WHEN `total_hours_learned` >= 10 THEN 'Intermediate Learner'
        ELSE 'Beginner Learner'
    END;

-- 2. Insert Accessibility Needs
INSERT INTO `user_accessibility_need` (`user_id`, `need`) VALUES
(4, 'Closed captions for video sessions'),
(7, 'High contrast text mode'),
(10, 'Audio descriptions for visual content'),
(13, 'Dyslexia-friendly formatting'),
(16, 'Keyboard navigation support'),
(18, 'Sign language interpreter available');

-- 3. Insert Realistic Skills for Skill-Sharing Platform
INSERT INTO `skill` (`title`, `category`, `difficulty_level`, `difficulty_notes`, `est_learning_time`, `is_verified`) VALUES
-- Cooking Skills
('Authentic Italian Pasta Making', 'Cooking', 'Intermediate', 'Handmade pasta and sauces', 12, TRUE),
('Japanese Sushi Preparation', 'Cooking', 'Advanced', 'Fish selection and rolling techniques', 20, TRUE),
('French Pastry Basics', 'Cooking', 'Intermediate', 'Croissants, eclairs, and tarts', 18, TRUE),
('Korean BBQ at Home', 'Cooking', 'Beginner', 'Marinades and grilling techniques', 8, TRUE),
('Vegetarian Meal Planning', 'Cooking', 'Beginner', 'Balanced meat-free meals', 10, FALSE),

-- Tech Skills
('Web Development Fundamentals', 'Technology', 'Beginner', 'HTML, CSS, JavaScript basics', 40, TRUE),
('Python for Data Analysis', 'Technology', 'Intermediate', 'Pandas, NumPy, visualization', 30, TRUE),
('Mobile App Development', 'Technology', 'Advanced', 'React Native basics', 50, TRUE),
('Digital Photography Editing', 'Technology', 'Intermediate', 'Lightroom and Photoshop basics', 25, TRUE),
('Excel Advanced Functions', 'Technology', 'Intermediate', 'Pivot tables, macros, formulas', 15, TRUE),

-- Arts & Crafts
('Watercolor Painting Techniques', 'Arts', 'Beginner', 'Color mixing and brush techniques', 20, TRUE),
('Knitting and Crochet Basics', 'Arts', 'Beginner', 'Scarves, hats, and simple patterns', 15, FALSE),
('Pottery Wheel Throwing', 'Arts', 'Intermediate', 'Centering clay and basic forms', 25, TRUE),
('Guitar for Beginners', 'Music', 'Beginner', 'Basic chords and strumming patterns', 20, TRUE),
('Piano Fundamentals', 'Music', 'Beginner', 'Scales, chords, and simple songs', 25, TRUE),

-- Languages
('Spanish Conversation Basics', 'Language', 'Beginner', 'Everyday conversations and grammar', 30, TRUE),
('Business English', 'Language', 'Intermediate', 'Professional communication skills', 20, TRUE),
('French for Travelers', 'Language', 'Beginner', 'Essential phrases and pronunciation', 15, TRUE),
('Mandarin Chinese Basics', 'Language', 'Intermediate', 'Pinyin and basic characters', 40, TRUE),

-- Life Skills
('Personal Finance Management', 'Finance', 'Beginner', 'Budgeting and investment basics', 12, TRUE),
('Meditation and Mindfulness', 'Wellness', 'Beginner', 'Stress reduction techniques', 10, TRUE),
('Home Gardening Basics', 'Lifestyle', 'Beginner', 'Growing vegetables and herbs', 15, TRUE),
('Basic Car Maintenance', 'Practical', 'Intermediate', 'Oil changes, tire rotation', 8, FALSE),
('Public Speaking Skills', 'Communication', 'Intermediate', 'Presentation and confidence building', 12, TRUE),

-- Fitness
('Yoga for Beginners', 'Fitness', 'Beginner', 'Basic poses and breathing techniques', 12, TRUE),
('Strength Training Fundamentals', 'Fitness', 'Beginner', 'Proper form and safety', 15, TRUE),
('Meal Prep for Fitness', 'Nutrition', 'Intermediate', 'Planning and preparation', 10, TRUE);

-- 4. Teaches (Who teaches what - matching skills to realistic profiles)
INSERT INTO `teaches` (`teacher_id`, `skill_id`, `proficiency_level`) VALUES
-- Cooking teachers
(2, 1, 'Expert'),    -- Cristiano teaches Italian cooking
(13, 4, 'Expert'),   -- Son teaches Korean BBQ
(15, 3, 'Advanced'), -- Thibaut teaches French pastries
(18, 5, 'Expert'),   -- Sam teaches vegetarian cooking

-- Tech teachers
(6, 6, 'Expert'),    -- Kevin teaches web development
(6, 7, 'Advanced'),  -- Kevin teaches Python
(4, 9, 'Expert'),    -- Kylian teaches photo editing
(14, 8, 'Intermediate'), -- Jude teaches mobile app dev

-- Arts teachers
(1, 11, 'Expert'),   -- Lionel teaches photography
(10, 14, 'Expert'),  -- Luka teaches guitar
(17, 15, 'Advanced'),-- Alexia teaches piano
(8, 13, 'Intermediate'), -- Virgil teaches pottery

-- Language teachers
(7, 16, 'Native'),   -- Mohamed teaches Spanish
(17, 16, 'Native'),  -- Alexia teaches Spanish
(16, 19, 'Native'),  -- Joshua teaches German
(13, 20, 'Native'),  -- Son teaches Korean
(7, 17, 'Fluent'),   -- Mohamed teaches Business English

-- Life skills teachers
(12, 21, 'Expert'),  -- Robert teaches finance
(5, 22, 'Expert'),   -- Erling teaches meditation
(9, 23, 'Advanced'), -- Harry teaches gardening
(3, 25, 'Expert'),   -- Alex teaches public speaking

-- Fitness teachers
(5, 26, 'Expert'),   -- Erling teaches yoga
(18, 27, 'Expert'),  -- Sam teaches strength training
(18, 28, 'Expert');  -- Sam teaches meal prep

-- 5. Learns (What users want to learn - realistic skill-seeking)
INSERT INTO `learns` (`learner_id`, `skill_id`, `interest_level`) VALUES
-- People learning cooking
(1, 1, 'High'),      -- Lionel wants to learn Italian cooking
(6, 4, 'Medium'),    -- Kevin wants to learn Korean BBQ
(8, 3, 'High'),      -- Virgil wants to learn French pastries
(14, 1, 'High'),     -- Jude wants to learn pasta making

-- People learning tech skills
(4, 6, 'High'),      -- Kylian wants to learn web dev (to improve his design)
(5, 7, 'Medium'),    -- Erling wants to learn data analysis
(9, 9, 'High'),      -- Harry wants to learn photo editing
(15, 6, 'High'),     -- Thibaut wants to learn web development

-- People learning arts
(2, 11, 'High'),     -- Cristiano wants to learn photography
(3, 14, 'Medium'),   -- Alex wants to learn guitar
(7, 12, 'Low'),      -- Mohamed wants to learn knitting
(16, 15, 'High'),    -- Joshua wants to learn piano

-- People learning languages
(4, 16, 'High'),     -- Kylian wants to learn Spanish
(5, 19, 'Medium'),   -- Erling wants to learn Mandarin
(9, 17, 'High'),     -- Harry wants Business English
(11, 18, 'High'),    -- Neymar wants French for travel

-- People learning life skills
(10, 21, 'High'),    -- Luka wants personal finance
(13, 22, 'Medium'),  -- Son wants meditation
(14, 23, 'High'),    -- Jude wants gardening
(17, 25, 'High'),    -- Alexia wants public speaking

-- People learning fitness
(12, 26, 'High'),    -- Robert wants yoga
(16, 27, 'Medium'),  -- Joshua wants strength training
(1, 28, 'High');     -- Lionel wants meal prep

-- 6. Sessions (Realistic skill-sharing sessions)
INSERT INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`) VALUES
-- Completed sessions
(2, 1, 1, 'completed', '2025-10-15 18:00:00', 2, 30, 1),   -- Cristiano taught Lionel Italian cooking
(6, 4, 1, 'completed', '2025-10-20 19:00:00', 3, 45, 6),   -- Kevin taught Kylian web dev
(1, 2, 1, 'completed', '2025-10-25 16:00:00', 2, 30, 11),  -- Lionel taught Cristiano photography
(13, 6, 1, 'completed', '2025-11-05 17:00:00', 2, 25, 4),  -- Son taught Kevin Korean BBQ
(5, 12, 1, 'completed', '2025-11-10 09:00:00', 1, 15, 26), -- Erling taught Robert yoga

-- Accepted sessions (upcoming)
(17, 9, 1, 'accepted', '2025-12-20 18:00:00', 2, 30, 16),  -- Alexia teaching Harry Spanish
(18, 1, 1, 'accepted', '2025-12-22 17:00:00', 1, 15, 28),  -- Sam teaching Lionel meal prep
(10, 3, 1, 'accepted', '2025-12-24 15:00:00', 2, 25, 14),  -- Luka teaching Alex guitar

-- Pending sessions
(7, 4, 1, 'pending', '2025-12-26 19:00:00', 1, 20, 16),    -- Mohamed teaching Kylian Spanish
(12, 10, 1, 'pending', '2025-12-28 16:00:00', 2, 30, 21),  -- Robert teaching Luka finance
(16, 5, 1, 'pending', '2025-12-30 14:00:00', 1, 15, 19),   -- Joshua teaching Erling German

-- More completed sessions for variety
(3, 17, 1, 'completed', '2025-11-15 10:00:00', 2, 30, 25), -- Alex teaching Alexia public speaking
(8, 9, 1, 'completed', '2025-11-20 18:00:00', 3, 45, 13),  -- Virgil teaching Harry pottery
(15, 8, 1, 'completed', '2025-11-25 16:00:00', 2, 25, 3),  -- Thibaut teaching Virgil French pastries
(4, 9, 1, 'completed', '2025-11-28 14:00:00', 2, 30, 9),   -- Kylian teaching Harry photo editing
(9, 8, 1, 'completed', '2025-12-01 11:00:00', 1, 15, 23);  -- Harry teaching Virgil gardening

-- 7. Reviews for completed sessions
INSERT INTO `review` (`teacher_id`, `learner_id`, `session_no`, `rating`, `comment`, `created_at`) VALUES
(2, 1, 1, 5, 'Cristiano is an amazing Italian cooking teacher! Learned authentic techniques.', '2025-10-15 21:00:00'),
(6, 4, 1, 4, 'Great intro to web development. Kevin explained complex concepts clearly.', '2025-10-20 22:00:00'),
(1, 2, 1, 5, 'Lionel photography workshop was outstanding! His teaching style is very patient.', '2025-10-25 19:00:00'),
(13, 6, 1, 5, 'Son made Korean BBQ so accessible. Delicious results!', '2025-11-05 20:00:00'),
(5, 12, 1, 4, 'Good yoga fundamentals. Erling was very attentive to form and safety.', '2025-11-10 11:00:00'),
(3, 17, 1, 5, 'Alex transformed my public speaking confidence. Highly recommend!', '2025-11-15 13:00:00'),
(8, 9, 1, 5, 'Virgil pottery class was therapeutic and fun. Great instructor!', '2025-11-20 21:00:00'),
(15, 8, 1, 4, 'Good pastry basics. Thibaut is knowledgeable but session ran a bit long.', '2025-11-25 19:00:00'),
(4, 9, 1, 5, 'Kylian photo editing skills are top-notch! Learned Lightroom quickly.', '2025-11-28 17:00:00'),
(9, 8, 1, 5, 'Harry gardening tips transformed my balcony garden. Very practical advice!', '2025-12-01 13:00:00');

-- 8. Messages between users (realistic platform conversations)
INSERT INTO `message` (`sender_id`, `receiver_id`, `content`, `timestamp`, `session_teacher_id`, `session_no`) VALUES
(1, 2, 'Hi Cristiano, thanks for the cooking session! Can I ask about the pasta dough consistency?', '2025-10-16 09:00:00', 2, 1),
(2, 1, 'Hi Lionel! Yes, it should be firm but not dry. Add water teaspoon by teaspoon if too crumbly.', '2025-10-16 09:15:00', 2, 1),
(4, 6, 'Kevin, I practiced the HTML/CSS from our session. Can you review my code?', '2025-10-21 10:00:00', 6, 1),
(6, 4, 'Sure Kylian, send me the GitHub link. Happy to review!', '2025-10-21 10:05:00', 6, 1),
(9, 17, 'Looking forward to our Spanish session next week! Should I prepare anything?', '2025-12-15 14:00:00', 17, NULL),
(17, 9, 'Hi Harry! Just bring a notebook. We start with basic greetings and pronunciation.', '2025-12-15 14:10:00', 17, NULL),
(12, 5, 'The yoga session really helped my back pain. Do you have recommended daily stretches?', '2025-11-11 08:00:00', 5, 1),
(5, 12, 'Glad to hear Robert! I can send you a 10-minute morning routine PDF.', '2025-11-11 08:15:00', 5, 1);

-- 9. Badges (achievements for skill-sharing platform)
INSERT INTO `badge` (`badge_name`, `badge_description`) VALUES
('Master Teacher', 'Awarded for teaching 50+ hours on the platform'),
('Active Learner', 'Completed 10+ learning sessions'),
('Language Ambassador', 'Successfully taught language skills to 5+ students'),
('Skill Diversity', 'Teaching proficiency in 3+ different skill categories'),
('Community Pillar', 'Active participation in 20+ total sessions'),
('Early Contributor', 'Joined and contributed during platform beta testing'),
('Perfect Rating', 'Maintained 5.0 average rating over 10+ teaching sessions'),
('Global Connector', 'Taught students from 5+ different countries'),
('Consistency Award', 'Maintained weekly sessions for 3+ months continuously'),
('Skill Verifier', 'Contributed to skill verification and quality control');

-- 10. User Badges (achievements earned)
INSERT INTO `user_badge` (`user_id`, `badge_id`, `awarded_date`, `awarded_by`) VALUES
(1, 1, '2025-11-01', 3),  -- Lionel: Master Teacher
(1, 4, '2025-11-01', 3),  -- Lionel: Skill Diversity
(1, 7, '2025-11-01', 3),  -- Lionel: Perfect Rating
(2, 1, '2025-11-01', 3),  -- Cristiano: Master Teacher
(2, 8, '2025-11-01', 3),  -- Cristiano: Global Connector
(3, 1, '2025-10-01', 1),  -- Alex: Master Teacher
(3, 7, '2025-10-01', 1),  -- Alex: Perfect Rating
(3, 10, '2025-10-01', 1), -- Alex: Skill Verifier
(4, 2, '2025-11-15', 1),  -- Kylian: Active Learner
(4, 5, '2025-11-15', 1),  -- Kylian: Community Pillar
(6, 1, '2025-11-01', 3),  -- Kevin: Master Teacher
(6, 4, '2025-11-01', 3),  -- Kevin: Skill Diversity
(10, 1, '2025-11-10', 2), -- Luka: Master Teacher
(10, 9, '2025-11-10', 2), -- Luka: Consistency Award
(13, 3, '2025-11-25', 2), -- Son: Language Ambassador
(14, 2, '2025-11-05', 10),-- Jude: Active Learner
(14, 6, '2025-09-01', 3), -- Jude: Early Contributor
(17, 3, '2025-12-01', 1), -- Alexia: Language Ambassador
(18, 1, '2025-12-01', 2); -- Sam: Master Teacher

-- 11. Reports (platform moderation cases)
INSERT INTO `report` (`session_teacher_id`, `session_no`, `reporter_user_id`, `description`, `status`, `created_at`, `resolution_text`, `resolved_at`, `resolved_by_user_id`) VALUES
(11, 1, 4, 'Teacher repeatedly cancelled sessions last minute without explanation', 'closed', '2025-09-15 14:45:00', 'Teacher issued formal warning. Skillpoints refunded to affected learners.', '2025-09-16 10:00:00', 3),
(11, 1, 8, 'Inappropriate content shared during session', 'closed', '2025-09-20 16:00:00', 'Teacher suspended for violating community guidelines. Account under review.', '2025-09-21 09:00:00', 1),
(7, 1, 5, 'Session quality did not match advertised skill level', 'open', '2025-11-16 14:30:00', NULL, NULL, NULL);

-- Ensure session numbers are unique per teacher
UPDATE `session` s1
JOIN (
    SELECT teacher_id, session_no, ROW_NUMBER() OVER (PARTITION BY teacher_id ORDER BY scheduled_time) as new_session_no
    FROM `session`
) s2 ON s1.teacher_id = s2.teacher_id AND s1.session_no = s2.session_no
SET s1.session_no = s2.new_session_no
WHERE s1.session_no != s2.new_session_no;

-- Update foreign key references to match corrected session numbers
UPDATE `review` r
JOIN `session` s ON r.teacher_id = s.teacher_id AND r.session_no = s.session_no
SET r.session_no = s.session_no;

UPDATE `message` m
JOIN `session` s ON m.session_teacher_id = s.teacher_id AND m.session_no = s.session_no
SET m.session_no = s.session_no;

UPDATE `report` rep
JOIN `session` s ON rep.session_teacher_id = s.teacher_id AND rep.session_no = s.session_no
SET rep.session_no = s.session_no;