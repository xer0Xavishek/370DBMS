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
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `teacher_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `proficiency_level` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`teacher_id`, `skill_id`, `proficiency_level`) VALUES
(1, 6, 'Expert'),
(1, 13, 'Expert'),
(1, 20, 'Expert'),
(2, 5, 'Expert'),
(2, 12, 'Expert'),
(2, 19, 'Expert'),
(3, 4, 'Expert'),
(3, 11, 'Expert'),
(3, 18, 'Expert'),
(4, 3, 'Expert'),
(4, 10, 'Expert'),
(4, 17, 'Expert'),
(5, 2, 'Expert'),
(5, 9, 'Expert'),
(5, 16, 'Expert'),
(6, 1, 'Expert'),
(6, 8, 'Expert'),
(6, 15, 'Expert'),
(10, 4, 'Expert'),
(10, 11, 'Expert'),
(10, 18, 'Expert'),
(11, 3, 'Expert'),
(11, 10, 'Expert'),
(11, 17, 'Expert'),
(12, 2, 'Expert'),
(12, 9, 'Expert'),
(12, 16, 'Expert'),
(13, 1, 'Expert'),
(13, 8, 'Expert'),
(13, 15, 'Expert'),
(15, 6, 'Expert'),
(15, 13, 'Expert'),
(15, 20, 'Expert'),
(16, 5, 'Expert'),
(16, 12, 'Expert'),
(16, 19, 'Expert'),
(20, 1, 'Expert'),
(20, 8, 'Expert'),
(20, 15, 'Expert'),
(21, 7, 'Expert'),
(21, 14, 'Expert'),
(22, 6, 'Expert'),
(22, 13, 'Expert'),
(22, 20, 'Expert'),
(23, 5, 'Expert'),
(23, 12, 'Expert'),
(23, 19, 'Expert'),
(24, 4, 'Expert'),
(24, 11, 'Expert'),
(24, 18, 'Expert'),
(25, 3, 'Expert'),
(25, 10, 'Expert'),
(25, 17, 'Expert'),
(26, 2, 'Expert'),
(26, 9, 'Expert'),
(26, 16, 'Expert'),
(30, 5, 'Expert'),
(30, 12, 'Expert'),
(30, 19, 'Expert'),
(31, 4, 'Expert'),
(31, 11, 'Expert'),
(31, 18, 'Expert'),
(32, 3, 'Expert'),
(32, 10, 'Expert'),
(32, 17, 'Expert'),
(33, 2, 'Expert'),
(33, 9, 'Expert'),
(33, 16, 'Expert'),
(34, 1, 'Expert'),
(34, 8, 'Expert'),
(34, 15, 'Expert'),
(35, 7, 'Expert'),
(35, 14, 'Expert'),
(36, 6, 'Expert'),
(36, 13, 'Expert'),
(36, 20, 'Expert'),
(41, 1, 'Expert'),
(41, 8, 'Expert'),
(41, 15, 'Expert'),
(42, 7, 'Expert'),
(42, 14, 'Expert'),
(43, 6, 'Expert'),
(43, 13, 'Expert'),
(43, 20, 'Expert'),
(44, 5, 'Expert'),
(44, 12, 'Expert'),
(44, 19, 'Expert'),
(45, 4, 'Expert'),
(45, 11, 'Expert'),
(45, 18, 'Expert'),
(46, 3, 'Expert'),
(46, 10, 'Expert'),
(46, 17, 'Expert'),
(50, 6, 'Expert'),
(50, 13, 'Expert'),
(50, 20, 'Expert');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`teacher_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
