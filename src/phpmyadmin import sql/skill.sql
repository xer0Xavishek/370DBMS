-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 05:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skillswap`
--

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `difficulty_level` varchar(50) DEFAULT NULL,
  `difficulty_notes` varchar(255) DEFAULT NULL,
  `est_learning_time` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `title`, `category`, `difficulty_level`, `difficulty_notes`, `est_learning_time`, `is_verified`) VALUES
(1, 'Advanced PHP Programming', 'Coding', 'Expert', NULL, 40, 1),
(2, 'Watercolor Painting', 'Art', 'Beginner', NULL, 10, 1),
(3, 'Sourdough Baking', 'Lifestyle', 'Intermediate', NULL, 12, 1),
(4, 'Guitar 101', 'Music', 'Beginner', NULL, 20, 1),
(5, 'French', 'Language', 'Intermediate', NULL, 30, 0),
(6, 'Yoga & Meditation', 'Health', 'Beginner', NULL, 15, 1),
(7, 'Machine Learning Basics', 'Coding', 'Advanced', NULL, 60, 1),
(8, 'Public Speaking', 'Personal Development', 'Intermediate', NULL, 10, 1),
(9, 'Digital Marketing', 'Business', 'Beginner', NULL, 25, 1),
(10, 'Origami Masterclass', 'Art', 'Expert', NULL, 5, 1),
(11, 'JavaScript for Beginners', 'Coding', 'Beginner', NULL, 20, 1),
(12, 'Portrait Photography', 'Art', 'Intermediate', NULL, 15, 1),
(13, 'Italian Cooking', 'Lifestyle', 'Intermediate', NULL, 8, 1),
(14, 'Piano Basics', 'Music', 'Beginner', NULL, 25, 1),
(15, 'Spanish Language', 'Language', 'Intermediate', NULL, 35, 1),
(16, 'Crossfit Training', 'Fitness', 'Advanced', NULL, 20, 1),
(17, 'Data Science with R', 'Coding', 'Expert', NULL, 55, 1),
(18, 'Creative Writing', 'Art', 'Intermediate', NULL, 12, 1),
(19, 'SEO Strategies', 'Business', 'Advanced', NULL, 18, 1),
(20, 'Pottery Making', 'Art', 'Beginner', NULL, 14, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
