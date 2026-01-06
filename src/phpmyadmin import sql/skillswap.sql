-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 04:55 PM
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
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `badge_id` int(11) NOT NULL,
  `badge_name` varchar(100) DEFAULT NULL,
  `badge_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badge`
--

INSERT INTO `badge` (`badge_id`, `badge_name`, `badge_description`) VALUES
(1, '­Master Mentor', 'Taught over 50 hours with excellence.'),
(2, '­Fast Learner', 'Completed 10 sessions in a month.'),
(3, '5-Star General', 'Maintained a perfect 5.0 rating.'),
(4, '­Super Swapper', 'Balanced giving and taking equally.'),
(5, '­Local Hero', 'Most active swapper in their city.'),
(6, '­Trending Teacher', 'Teaches the most popular skill in town.');

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `learner` (
  `learner_id` int(11) NOT NULL,
  `total_hours_learned` int(11) DEFAULT 0,
  `learner_level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learner`
--

INSERT INTO `learner` (`learner_id`, `total_hours_learned`, `learner_level`) VALUES
(1, 2, 'Intermediate'),
(2, 36, 'Advanced'),
(3, 24, 'Beginner'),
(4, 48, 'Intermediate'),
(5, 28, 'Advanced'),
(6, 6, 'Beginner'),
(7, 24, 'Advanced'),
(8, 10, 'Intermediate'),
(9, 9, 'Beginner'),
(10, 18, 'Beginner'),
(11, 13, 'Intermediate'),
(12, 14, 'Intermediate'),
(13, 20, 'Beginner'),
(15, 44, 'Intermediate'),
(16, 44, 'Advanced'),
(17, 27, 'Beginner'),
(18, 14, 'Beginner'),
(19, 23, 'Beginner'),
(20, 35, 'Intermediate'),
(21, 40, 'Advanced'),
(22, 3, 'Intermediate'),
(23, 46, 'Intermediate'),
(24, 25, 'Intermediate'),
(25, 19, 'Beginner'),
(26, 36, 'Beginner'),
(27, 19, 'Intermediate'),
(28, 40, 'Advanced'),
(29, 18, 'Beginner'),
(30, 44, 'Advanced'),
(31, 9, 'Intermediate'),
(32, 11, 'Beginner'),
(33, 1, 'Intermediate'),
(34, 29, 'Advanced'),
(35, 26, 'Intermediate'),
(36, 4, 'Beginner'),
(37, 23, 'Advanced'),
(38, 12, 'Intermediate'),
(39, 4, 'Beginner'),
(41, 32, 'Advanced'),
(42, 4, 'Intermediate'),
(43, 25, 'Intermediate'),
(44, 33, 'Beginner'),
(45, 18, 'Beginner'),
(46, 19, 'Intermediate'),
(47, 3, 'Intermediate'),
(48, 35, 'Intermediate'),
(49, 34, 'Intermediate'),
(50, 23, 'Advanced');

-- --------------------------------------------------------

--
-- Table structure for table `learns`
--

CREATE TABLE `learns` (
  `learner_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `interest_level` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learns`
--

INSERT INTO `learns` (`learner_id`, `skill_id`, `interest_level`) VALUES
(1, 13, 'High'),
(2, 13, 'High'),
(3, 13, 'High'),
(4, 13, 'High'),
(5, 13, 'High'),
(6, 13, 'High'),
(7, 13, 'High'),
(8, 13, 'High'),
(9, 13, 'High'),
(10, 13, 'High'),
(11, 13, 'High'),
(12, 13, 'High'),
(13, 1, 'High'),
(13, 2, 'High'),
(13, 3, 'High'),
(13, 4, 'High'),
(13, 5, 'High'),
(13, 6, 'High'),
(13, 7, 'High'),
(13, 8, 'High'),
(13, 9, 'High'),
(13, 10, 'High'),
(13, 11, 'High'),
(13, 12, 'High'),
(13, 13, 'High'),
(13, 14, 'High'),
(13, 15, 'High'),
(13, 16, 'High'),
(13, 17, 'High'),
(13, 18, 'High'),
(13, 19, 'High'),
(13, 20, 'High'),
(15, 13, 'High'),
(16, 13, 'High'),
(17, 13, 'High'),
(18, 13, 'High'),
(19, 13, 'High'),
(20, 13, 'High'),
(21, 13, 'High'),
(22, 13, 'High'),
(23, 13, 'High'),
(24, 13, 'High'),
(25, 13, 'High'),
(26, 1, 'High'),
(26, 2, 'High'),
(26, 3, 'High'),
(26, 4, 'High'),
(26, 5, 'High'),
(26, 6, 'High'),
(26, 7, 'High'),
(26, 8, 'High'),
(26, 9, 'High'),
(26, 10, 'High'),
(26, 11, 'High'),
(26, 12, 'High'),
(26, 13, 'High'),
(26, 14, 'High'),
(26, 15, 'High'),
(26, 16, 'High'),
(26, 17, 'High'),
(26, 18, 'High'),
(26, 19, 'High'),
(26, 20, 'High'),
(27, 13, 'High'),
(28, 13, 'High'),
(29, 13, 'High'),
(30, 13, 'High'),
(31, 13, 'High'),
(32, 13, 'High'),
(33, 13, 'High'),
(34, 13, 'High'),
(35, 13, 'High'),
(36, 13, 'High'),
(37, 13, 'High'),
(38, 13, 'High'),
(39, 1, 'High'),
(39, 2, 'High'),
(39, 3, 'High'),
(39, 4, 'High'),
(39, 5, 'High'),
(39, 6, 'High'),
(39, 7, 'High'),
(39, 8, 'High'),
(39, 9, 'High'),
(39, 10, 'High'),
(39, 11, 'High'),
(39, 12, 'High'),
(39, 13, 'High'),
(39, 14, 'High'),
(39, 15, 'High'),
(39, 16, 'High'),
(39, 17, 'High'),
(39, 18, 'High'),
(39, 19, 'High'),
(39, 20, 'High'),
(41, 13, 'High'),
(42, 13, 'High'),
(43, 13, 'High'),
(44, 13, 'High'),
(45, 13, 'High'),
(46, 13, 'High'),
(47, 13, 'High'),
(48, 13, 'High'),
(49, 13, 'High'),
(50, 13, 'High');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `session_teacher_id` int(11) DEFAULT NULL,
  `session_learner_id` int(11) DEFAULT NULL,
  `session_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `sender_id`, `receiver_id`, `content`, `timestamp`, `session_teacher_id`, `session_learner_id`, `session_no`) VALUES
(1, 4, 1, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 1, 4, 406),
(2, 9, 1, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 1, 9, 906),
(4, 24, 1, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 1, 24, 2406),
(5, 3, 2, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 2, 3, 305),
(6, 18, 2, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 2, 18, 1805),
(7, 23, 2, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 2, 23, 2305),
(8, 28, 2, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 2, 28, 2805),
(9, 17, 3, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 3, 17, 1704),
(10, 22, 3, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 3, 22, 2204),
(11, 27, 3, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 3, 27, 2704),
(12, 1, 4, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 4, 1, 103),
(13, 6, 4, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 4, 6, 603),
(14, 16, 4, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 4, 16, 1603),
(15, 26, 4, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 4, 26, 2603),
(16, 10, 5, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 5, 10, 1002),
(17, 15, 5, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 5, 15, 1502),
(18, 30, 5, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 5, 30, 3002),
(19, 19, 6, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 6, 19, 1901),
(20, 24, 6, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 6, 24, 2401),
(21, 5, 10, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 10, 5, 504),
(22, 15, 10, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 10, 15, 1504),
(23, 20, 10, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 10, 20, 2004),
(24, 25, 10, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 10, 25, 2504),
(25, 30, 10, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 10, 30, 3004),
(26, 4, 11, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 11, 4, 403),
(27, 9, 11, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 11, 9, 903),
(29, 24, 11, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 11, 24, 2403),
(30, 29, 11, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 11, 29, 2903),
(31, 3, 12, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 12, 3, 302),
(32, 8, 12, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 12, 8, 802),
(33, 13, 12, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 12, 13, 1302),
(34, 23, 12, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 12, 23, 2302),
(35, 17, 13, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 13, 17, 1701),
(36, 27, 13, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 13, 27, 2701),
(37, 4, 16, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 16, 4, 405),
(38, 24, 16, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 16, 24, 2405),
(39, 29, 16, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 16, 29, 2905),
(40, 5, 20, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 20, 5, 501),
(41, 10, 20, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 20, 10, 1001),
(42, 15, 20, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 20, 15, 1501),
(43, 25, 20, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 20, 25, 2501),
(44, 30, 20, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 20, 30, 3001),
(45, 2, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 2, 205),
(46, 7, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 7, 705),
(47, 12, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 12, 1205),
(48, 17, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 17, 1705),
(49, 22, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 22, 2205),
(50, 27, 23, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 23, 27, 2705),
(51, 6, 24, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 24, 6, 604),
(52, 21, 24, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 24, 21, 2104),
(53, 26, 24, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 24, 26, 2604),
(54, 5, 25, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 25, 5, 503),
(55, 20, 25, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 25, 20, 2003),
(56, 30, 25, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 25, 30, 3003),
(57, 4, 26, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 26, 4, 402),
(58, 24, 26, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 26, 24, 2402),
(59, 5, 30, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 30, 5, 505),
(60, 15, 30, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 30, 15, 1505),
(61, 9, 31, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 31, 9, 904),
(63, 24, 31, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 31, 24, 2404),
(64, 3, 32, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 32, 3, 303),
(65, 13, 32, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 32, 13, 1303),
(66, 18, 32, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 32, 18, 1803),
(67, 28, 32, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 32, 28, 2803),
(68, 2, 33, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 33, 2, 202),
(69, 7, 33, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 33, 7, 702),
(70, 12, 33, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 33, 12, 1202),
(71, 22, 33, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 33, 22, 2202),
(72, 27, 33, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 33, 27, 2702),
(73, 1, 34, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 34, 1, 101),
(74, 6, 34, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 34, 6, 601),
(75, 11, 34, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 34, 11, 1101),
(76, 16, 34, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 34, 16, 1601),
(81, 4, 41, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 41, 4, 401),
(82, 9, 41, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 41, 9, 901),
(83, 19, 41, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 41, 19, 1901),
(84, 24, 41, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 41, 24, 2401),
(85, 29, 41, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 41, 29, 2901),
(86, 1, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 1, 105),
(87, 6, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 6, 605),
(88, 11, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 11, 1105),
(89, 16, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 16, 1605),
(90, 21, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 21, 2105),
(91, 26, 44, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 44, 26, 2605),
(92, 10, 45, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 45, 10, 1004),
(93, 20, 45, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 45, 20, 2004),
(94, 9, 46, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 46, 9, 903),
(96, 24, 46, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 46, 24, 2403),
(97, 29, 46, 'Hello, looking forward to the session!', '2025-12-24 05:54:34', 46, 29, 2903),
(128, 5, 32, ' New Request: I would like to learn **Data Science with R** on 2025-12-24T06:14', '2025-12-24 06:12:28', 32, 5, 2804),
(129, 5, 32, ' New Request: I would like to learn **Data Science with R** on 2025-12-24T06:14', '2025-12-24 06:12:52', 32, 5, 2805),
(130, 50, 36, ' New Request: I would like to learn **Italian Cooking** on 2026-01-10T15:31', '2026-01-06 00:31:13', 36, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `session_teacher_id` int(11) DEFAULT NULL,
  `session_no` int(11) DEFAULT NULL,
  `reporter_user_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('open','closed') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `resolution_text` text DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `resolved_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `session_teacher_id`, `session_no`, `reporter_user_id`, `description`, `status`, `created_at`, `resolution_text`, `resolved_at`, `resolved_by_user_id`) VALUES
(1, 4, 103, 1, 'Bulk Generated Report: Issue with connection.', 'open', '2025-12-24 05:54:34', NULL, NULL, NULL),
(2, 24, 104, 1, 'Bulk Generated Report: Issue with connection.', 'closed', '2025-12-24 05:54:34', 'Dismissed', '2025-12-24 20:35:18', 1),
(3, 34, 101, 1, 'Bulk Generated Report: Issue with connection.', 'open', '2025-12-24 05:54:34', NULL, NULL, NULL),
(4, 44, 105, 1, 'Bulk Generated Report: Issue with connection.', 'open', '2025-12-24 05:54:34', NULL, NULL, NULL),
(5, 3, 204, 2, 'Bulk Generated Report: Issue with connection.', 'open', '2025-12-24 05:54:34', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `learner_id` int(11) DEFAULT NULL,
  `session_no` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `teacher_id`, `learner_id`, `session_no`, `rating`, `comment`, `created_at`) VALUES
(1, 2, 28, 2805, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(2, 3, 17, 1704, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(3, 3, 22, 2204, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(4, 3, 27, 2704, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(5, 4, 1, 103, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(6, 4, 6, 603, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(7, 4, 26, 2603, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(8, 5, 15, 1502, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(9, 5, 30, 3002, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(10, 6, 24, 2401, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(11, 10, 20, 2004, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(12, 10, 25, 2504, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(13, 10, 30, 3004, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(14, 12, 3, 302, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(15, 13, 17, 1701, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(16, 16, 4, 405, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(17, 16, 24, 2405, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(18, 20, 15, 1501, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(19, 23, 2, 205, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(20, 23, 12, 1205, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(21, 23, 17, 1705, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(22, 24, 6, 604, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(23, 24, 21, 2104, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(24, 25, 5, 503, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(25, 25, 20, 2003, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(26, 25, 30, 3003, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(27, 26, 4, 402, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(28, 26, 24, 2402, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(30, 32, 13, 1303, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(31, 32, 18, 1803, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(32, 33, 7, 702, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(33, 33, 12, 1202, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(34, 33, 27, 2702, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(35, 34, 6, 601, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(39, 41, 4, 401, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(40, 41, 29, 2901, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(41, 44, 16, 1605, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(42, 44, 26, 2605, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(43, 45, 10, 1004, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(44, 45, 20, 2004, 4, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(45, 46, 24, 2403, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34'),
(46, 46, 29, 2903, 5, 'Automated Bulk Review: Great session!', '2025-12-24 05:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `teacher_id` int(11) NOT NULL,
  `learner_id` int(11) DEFAULT NULL,
  `session_no` int(11) NOT NULL,
  `status` enum('pending','accepted','completed') DEFAULT 'pending',
  `scheduled_time` datetime DEFAULT NULL,
  `duration_hours` int(11) DEFAULT NULL,
  `skillpoints_transferred` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`teacher_id`, `learner_id`, `session_no`, `status`, `scheduled_time`, `duration_hours`, `skillpoints_transferred`, `skill_id`) VALUES
(1, 4, 406, 'accepted', '2025-01-09 00:00:00', 3, 38, 6),
(1, 9, 906, 'accepted', '2025-03-24 00:00:00', 2, 11, 6),
(1, 19, 1906, 'pending', '2025-04-02 00:00:00', 1, 34, 6),
(1, 24, 2406, 'accepted', '2025-05-15 00:00:00', 3, 18, 6),
(1, 29, 2906, 'pending', '2025-06-17 00:00:00', 1, 31, 6),
(2, 3, 305, 'accepted', '2025-11-14 00:00:00', 2, 31, 5),
(2, 8, 805, 'pending', '2025-11-04 00:00:00', 2, 31, 5),
(2, 13, 1305, 'pending', '2025-11-16 00:00:00', 3, 18, 5),
(2, 18, 1805, 'accepted', '2025-08-15 00:00:00', 3, 29, 5),
(2, 23, 2305, 'accepted', '2025-03-21 00:00:00', 1, 17, 5),
(2, 28, 2805, 'completed', '2025-10-25 00:00:00', 1, 26, 5),
(3, 2, 204, 'pending', '2025-08-18 00:00:00', 2, 39, 4),
(3, 7, 704, 'pending', '2025-10-02 00:00:00', 1, 14, 4),
(3, 12, 1204, 'pending', '2025-11-05 00:00:00', 1, 10, 4),
(3, 17, 1704, 'completed', '2025-04-25 00:00:00', 3, 33, 4),
(3, 22, 2204, 'completed', '2025-04-18 00:00:00', 1, 31, 4),
(3, 27, 2704, 'completed', '2025-06-07 00:00:00', 3, 17, 4),
(4, 1, 103, 'completed', '2025-08-02 00:00:00', 2, 18, 3),
(4, 6, 603, 'completed', '2025-03-26 00:00:00', 1, 25, 3),
(4, 11, 1103, 'pending', '2025-01-28 00:00:00', 3, 16, 3),
(4, 16, 1603, 'accepted', '2025-04-19 00:00:00', 2, 19, 3),
(4, 21, 2103, 'pending', '2025-07-01 00:00:00', 1, 31, 3),
(4, 26, 2603, 'completed', '2025-11-08 00:00:00', 2, 17, 3),
(5, 10, 1002, 'accepted', '2025-03-18 00:00:00', 3, 37, 2),
(5, 15, 1502, 'completed', '2025-11-09 00:00:00', 3, 28, 2),
(5, 20, 2002, 'pending', '2025-07-23 00:00:00', 1, 13, 2),
(5, 25, 2502, 'pending', '2025-11-22 00:00:00', 1, 34, 2),
(5, 30, 3002, 'completed', '2025-07-17 00:00:00', 1, 17, 2),
(5, 2, 3003, 'pending', '2025-12-05 07:12:00', 5, NULL, 16),
(6, 4, 401, 'pending', '2025-11-13 00:00:00', 3, 38, 1),
(6, 9, 901, 'pending', '2025-11-15 00:00:00', 3, 15, 1),
(6, 19, 1901, 'accepted', '2025-10-01 00:00:00', 1, 21, 1),
(6, 24, 2401, 'completed', '2025-09-19 00:00:00', 2, 21, 1),
(6, 29, 2901, 'pending', '2025-12-18 00:00:00', 2, 23, 1),
(10, 5, 504, 'accepted', '2025-05-04 00:00:00', 3, 36, 4),
(10, 15, 1504, 'accepted', '2025-07-02 00:00:00', 3, 17, 4),
(10, 20, 2004, 'completed', '2025-04-05 00:00:00', 1, 11, 4),
(10, 25, 2504, 'completed', '2025-10-29 00:00:00', 2, 21, 4),
(10, 30, 3004, 'completed', '2025-10-05 00:00:00', 3, 27, 4),
(11, 4, 403, 'accepted', '2025-04-14 00:00:00', 1, 28, 3),
(11, 9, 903, 'accepted', '2025-08-18 00:00:00', 3, 38, 3),
(11, 19, 1903, 'pending', '2025-10-09 00:00:00', 1, 18, 3),
(11, 24, 2403, 'accepted', '2025-11-29 00:00:00', 3, 31, 3),
(11, 29, 2903, 'accepted', '2025-10-01 00:00:00', 1, 38, 3),
(12, 3, 302, 'completed', '2025-02-11 00:00:00', 2, 39, 2),
(12, 8, 802, 'accepted', '2025-02-26 00:00:00', 3, 22, 2),
(12, 13, 1302, 'accepted', '2025-02-04 00:00:00', 3, 34, 2),
(12, 18, 1802, 'pending', '2025-07-07 00:00:00', 3, 14, 2),
(12, 23, 2302, 'accepted', '2025-08-18 00:00:00', 3, 30, 2),
(12, 28, 2802, 'pending', '2025-08-21 00:00:00', 1, 10, 2),
(13, 2, 201, 'pending', '2025-01-16 00:00:00', 2, 34, 1),
(13, 7, 701, 'pending', '2025-09-16 00:00:00', 2, 10, 1),
(13, 12, 1201, 'pending', '2025-01-02 00:00:00', 1, 36, 1),
(13, 17, 1701, 'completed', '2025-01-03 00:00:00', 2, 16, 1),
(13, 22, 2201, 'pending', '2025-02-22 00:00:00', 2, 10, 1),
(13, 27, 2701, 'accepted', '2025-01-19 00:00:00', 1, 29, 1),
(16, 4, 405, 'completed', '2025-04-04 00:00:00', 3, 21, 5),
(16, 9, 905, 'pending', '2025-10-16 00:00:00', 3, 34, 5),
(16, 19, 1905, 'pending', '2025-05-19 00:00:00', 1, 33, 5),
(16, 24, 2405, 'completed', '2025-03-07 00:00:00', 2, 25, 5),
(16, 29, 2905, 'accepted', '2025-08-13 00:00:00', 3, 39, 5),
(20, 5, 501, 'accepted', '2025-12-25 00:00:00', 3, 12, 1),
(20, 10, 1001, 'accepted', '2025-10-02 00:00:00', 1, 36, 1),
(20, 15, 1501, 'completed', '2025-01-20 00:00:00', 3, 12, 1),
(20, 25, 2501, 'accepted', '2025-01-07 00:00:00', 3, 33, 1),
(20, 30, 3001, 'accepted', '2025-06-29 00:00:00', 3, 36, 1),
(23, 2, 205, 'completed', '2025-09-30 00:00:00', 2, 23, 5),
(23, 7, 705, 'accepted', '2025-11-01 00:00:00', 3, 28, 5),
(23, 12, 1205, 'completed', '2025-08-19 00:00:00', 3, 36, 5),
(23, 17, 1705, 'completed', '2025-01-11 00:00:00', 1, 25, 5),
(23, 22, 2205, 'accepted', '2025-10-01 00:00:00', 1, 37, 5),
(23, 27, 2705, 'accepted', '2025-12-20 00:00:00', 1, 13, 5),
(24, 1, 104, 'pending', '2025-10-30 00:00:00', 3, 19, 4),
(24, 6, 604, 'completed', '2025-11-12 00:00:00', 2, 31, 4),
(24, 11, 1104, 'pending', '2025-06-01 00:00:00', 1, 38, 4),
(24, 16, 1604, 'pending', '2025-05-12 00:00:00', 1, 38, 4),
(24, 21, 2104, 'completed', '2025-04-25 00:00:00', 3, 22, 4),
(24, 26, 2604, 'accepted', '2025-12-27 00:00:00', 1, 26, 4),
(25, 5, 503, 'completed', '2025-09-27 00:00:00', 1, 38, 3),
(25, 10, 1003, 'pending', '2025-06-11 00:00:00', 3, 26, 3),
(25, 15, 1503, 'pending', '2025-04-26 00:00:00', 1, 34, 3),
(25, 20, 2003, 'completed', '2025-08-28 00:00:00', 2, 22, 3),
(25, 30, 3003, 'completed', '2025-10-05 00:00:00', 1, 36, 3),
(26, 4, 402, 'completed', '2025-09-03 00:00:00', 3, 35, 2),
(26, 9, 902, 'pending', '2025-04-15 00:00:00', 1, 16, 2),
(26, 19, 1902, 'pending', '2025-07-01 00:00:00', 2, 24, 2),
(26, 24, 2402, 'completed', '2025-06-19 00:00:00', 1, 38, 2),
(26, 29, 2902, 'pending', '2025-11-13 00:00:00', 2, 10, 2),
(30, 5, 505, 'accepted', '2025-04-09 00:00:00', 3, 14, 5),
(30, 10, 1005, 'pending', '2025-05-07 00:00:00', 2, 39, 5),
(30, 15, 1505, 'accepted', '2025-09-26 00:00:00', 2, 29, 5),
(30, 20, 2005, 'pending', '2025-07-31 00:00:00', 3, 11, 5),
(30, 25, 2505, 'pending', '2025-04-01 00:00:00', 3, 28, 5),
(31, 4, 404, 'pending', '2025-11-06 00:00:00', 1, 38, 4),
(31, 9, 904, 'accepted', '2025-04-09 00:00:00', 1, 34, 4),
(31, 19, 1904, 'pending', '2025-09-05 00:00:00', 3, 28, 4),
(31, 24, 2404, 'accepted', '2025-02-18 00:00:00', 3, 29, 4),
(31, 29, 2904, 'pending', '2025-07-30 00:00:00', 1, 22, 4),
(32, 3, 303, 'accepted', '2025-07-03 00:00:00', 1, 32, 3),
(32, 8, 803, 'pending', '2025-10-23 00:00:00', 2, 24, 3),
(32, 13, 1303, 'completed', '2025-11-13 00:00:00', 1, 11, 3),
(32, 18, 1803, 'completed', '2025-04-10 00:00:00', 2, 33, 3),
(32, 23, 2303, 'pending', '2025-07-29 00:00:00', 3, 29, 3),
(32, 28, 2803, 'accepted', '2025-04-20 00:00:00', 1, 29, 3),
(32, 5, 2804, 'pending', '2025-12-24 06:14:00', 5, NULL, 17),
(32, 5, 2805, 'pending', '2025-12-24 06:14:00', 5, NULL, 17),
(33, 2, 202, 'accepted', '2025-04-26 00:00:00', 2, 26, 2),
(33, 7, 702, 'completed', '2025-09-30 00:00:00', 2, 13, 2),
(33, 12, 1202, 'completed', '2025-07-24 00:00:00', 1, 33, 2),
(33, 17, 1702, 'pending', '2025-02-03 00:00:00', 1, 33, 2),
(33, 22, 2202, 'accepted', '2025-03-05 00:00:00', 3, 12, 2),
(33, 27, 2702, 'completed', '2025-11-02 00:00:00', 3, 13, 2),
(34, 1, 101, 'accepted', '2025-02-21 00:00:00', 3, 16, 1),
(34, 6, 601, 'completed', '2025-04-10 00:00:00', 1, 36, 1),
(34, 11, 1101, 'accepted', '2025-05-04 00:00:00', 3, 30, 1),
(34, 16, 1601, 'accepted', '2025-08-25 00:00:00', 3, 24, 1),
(34, 21, 2101, 'pending', '2025-12-16 00:00:00', 3, 29, 1),
(34, 26, 2601, 'pending', '2025-07-21 00:00:00', 2, 36, 1),
(36, 50, 1, 'pending', '2026-01-10 15:31:00', 5, NULL, 13),
(41, 4, 401, 'completed', '2025-07-20 00:00:00', 3, 33, 1),
(41, 9, 901, 'accepted', '2025-10-04 00:00:00', 3, 30, 1),
(41, 19, 1901, 'accepted', '2025-09-15 00:00:00', 3, 36, 1),
(41, 24, 2401, 'accepted', '2025-10-26 00:00:00', 3, 12, 1),
(41, 29, 2901, 'completed', '2025-10-19 00:00:00', 2, 14, 1),
(44, 1, 105, 'accepted', '2025-09-12 00:00:00', 2, 19, 5),
(44, 6, 605, 'accepted', '2025-01-14 00:00:00', 1, 14, 5),
(44, 11, 1105, 'accepted', '2025-04-26 00:00:00', 3, 23, 5),
(44, 16, 1605, 'completed', '2025-02-02 00:00:00', 1, 39, 5),
(44, 21, 2105, 'accepted', '2025-04-05 00:00:00', 3, 12, 5),
(44, 26, 2605, 'completed', '2025-08-24 00:00:00', 2, 17, 5),
(45, 5, 504, 'pending', '2025-12-07 00:00:00', 1, 29, 4),
(45, 10, 1004, 'completed', '2025-08-14 00:00:00', 2, 31, 4),
(45, 15, 1504, 'pending', '2025-05-02 00:00:00', 2, 11, 4),
(45, 20, 2004, 'completed', '2025-07-04 00:00:00', 2, 16, 4),
(45, 25, 2504, 'pending', '2025-01-22 00:00:00', 2, 27, 4),
(46, 4, 403, 'pending', '2025-06-01 00:00:00', 1, 17, 3),
(46, 9, 903, 'accepted', '2025-02-06 00:00:00', 2, 24, 3),
(46, 19, 1903, 'pending', '2025-04-03 00:00:00', 1, 20, 3),
(46, 24, 2403, 'completed', '2025-09-12 00:00:00', 2, 29, 3),
(46, 29, 2903, 'completed', '2025-07-08 00:00:00', 2, 15, 3);

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

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `total_hours_taught` int(11) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `total_hours_taught`, `average_rating`) VALUES
(1, 70, 4.16),
(2, 3, 3.29),
(3, 19, 0.11),
(4, 50, 2.42),
(5, 40, 4.91),
(6, 45, 3.85),
(10, 15, 0.12),
(11, 26, 2.92),
(12, 11, 4.06),
(13, 72, 0.91),
(15, 16, 3.21),
(16, 71, 3.35),
(20, 37, 1.92),
(21, 49, 0.84),
(22, 35, 1.38),
(23, 30, 3.57),
(24, 50, 1.39),
(25, 86, 2.34),
(26, 75, 1.93),
(30, 89, 0.01),
(31, 33, 3.42),
(32, 69, 2.53),
(33, 47, 0.44),
(34, 0, 3.69),
(35, 69, 1.23),
(36, 66, 1.26),
(41, 93, 1.96),
(42, 18, 4.68),
(43, 11, 3.80),
(44, 45, 0.09),
(45, 71, 2.51),
(46, 78, 3.85),
(50, 64, 0.45);

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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `preferred_language` varchar(50) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `skillpoints` int(11) DEFAULT 0,
  `warning_count` int(11) DEFAULT 0,
  `is_suspended` tinyint(1) DEFAULT 0,
  `profile_picture` varchar(255) DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password`, `role`, `preferred_language`, `city`, `country`, `skillpoints`, `warning_count`, `is_suspended`, `profile_picture`) VALUES
(1, 'Admin', 'Admin', 'admin@skillswap.com', 'admin123', 'admin', NULL, 'Dhaka', 'Bangladesh', 100, 0, 0, 'default.png'),
(2, 'Alice', 'Wonder', 'alice@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 150, 0, 0, 'user_2_1766587013.png'),
(3, 'Bob', 'Builder', 'bob@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 30, 1, 0, 'default.png'),
(4, 'Charlie', 'Chef', 'charlie@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 70, 1, 0, 'default.png'),
(5, 'Diana', 'Doctor', 'diana@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 45, 1, 0, 'default.png'),
(6, 'Evan', 'Evil', 'evan@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 0, 3, 1, 'default.png'),
(7, 'Fiona', 'Flower', 'fiona@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 60, 0, 0, 'default.png'),
(8, 'George', 'Guitar', 'george@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 10, 0, 0, 'default.png'),
(9, 'Harry', 'Potter', 'harry@skillswap.com', '123456', 'user', NULL, 'London', 'UK', 200, 0, 0, 'default.png'),
(10, 'Ian', 'Instructor', 'ian@skillswap.com', '123456', 'user', NULL, 'New York', 'USA', 55, 0, 0, 'default.png'),
(11, 'Jack', 'Sparrow', 'jack@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 20, 0, 0, 'default.png'),
(12, 'Kate', 'Winslet', 'kate@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 80, 0, 0, 'default.png'),
(13, 'Liam', 'Neeson', 'liam@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 90, 0, 0, 'default.png'),
(15, 'Noah', 'Ark', 'noah@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 60, 0, 0, 'default.png'),
(16, 'Olivia', 'Oil', 'olivia@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 30, 0, 0, 'default.png'),
(17, 'Paul', 'Walker', 'paul@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 100, 0, 0, 'default.png'),
(18, 'Quinn', 'Harley', 'quinn@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 10, 0, 0, 'default.png'),
(19, 'Ryan', 'Reynolds', 'ryan@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 120, 0, 0, 'default.png'),
(20, 'Sarah', 'Connor', 'sarah@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 50, 0, 0, 'default.png'),
(21, 'Tom', 'Hanks', 'tom@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 75, 0, 0, 'default.png'),
(22, 'Uma', 'Thurman', 'uma@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 85, 0, 0, 'default.png'),
(23, 'Vin', 'Diesel', 'vin@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 45, 0, 0, 'default.png'),
(24, 'Will', 'Smith', 'will@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 95, 0, 0, 'default.png'),
(25, 'Xena', 'Warrior', 'xena@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 110, 0, 0, 'default.png'),
(26, 'Yara', 'Greyjoy', 'yara@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 35, 0, 0, 'default.png'),
(27, 'Zack', 'Snyder', 'zack@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 130, 0, 0, 'default.png'),
(28, 'Charlie', 'Sandler', 'adam@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 25, 0, 0, 'default.png'),
(29, 'Bella', 'Swan', 'bella@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 55, 0, 0, 'default.png'),
(30, 'Chris', 'Evans', 'chris@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 65, 0, 0, 'default.png'),
(31, 'David', 'Beckham', 'david@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 140, 0, 0, 'default.png'),
(32, 'Emma', 'Watson', 'emma@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 105, 0, 0, 'default.png'),
(33, 'Frank', 'Sinatra', 'frank@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 15, 0, 0, 'default.png'),
(34, 'Grace', 'Kelly', 'grace@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 95, 0, 0, 'default.png'),
(35, 'Henry', 'Cavill', 'henry@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 85, 0, 0, 'default.png'),
(36, 'Isla', 'Fisher', 'isla@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 45, 0, 0, 'default.png'),
(37, 'John', 'Wick', 'john@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 125, 0, 0, 'default.png'),
(38, 'Kevin', 'Hart', 'kevin@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 55, 0, 0, 'default.png'),
(39, 'Leo', 'DiCaprio', 'leo@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 160, 0, 0, 'default.png'),
(41, 'Nick', 'Jonas', 'nick@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 90, 0, 0, 'default.png'),
(42, 'Oprah', 'Winfrey', 'oprah@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 200, 0, 0, 'default.png'),
(43, 'Peter', 'Parker', 'peter@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 80, 0, 0, 'default.png'),
(44, 'Queen', 'Latifah', 'queen@skillswap.com', '123456', 'user', NULL, 'Khulna', 'Bangladesh', 110, 0, 0, 'default.png'),
(45, 'Robert', 'Downey', 'robert@skillswap.com', '123456', 'user', NULL, 'Barisal', 'Bangladesh', 180, 0, 0, 'default.png'),
(46, 'Steve', 'Jobs', 'steve@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 250, 0, 0, 'default.png'),
(47, 'Tony', 'Stark', 'tony@skillswap.com', '123456', 'user', NULL, 'Chittagong', 'Bangladesh', 300, 0, 0, 'default.png'),
(48, 'Usher', 'Raymond', 'usher@skillswap.com', '123456', 'user', NULL, 'Sylhet', 'Bangladesh', 130, 0, 0, 'default.png'),
(49, 'Victor', 'Hugo', 'victor@skillswap.com', '123456', 'user', NULL, 'Dhaka', 'Bangladesh', 60, 0, 0, 'default.png'),
(50, 'Walter', 'White', 'walter@skillswap.com', '123456', 'user', NULL, 'Rajshahi', 'Bangladesh', 140, 0, 0, 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_accessibility_need`
--

CREATE TABLE `user_accessibility_need` (
  `user_id` int(11) NOT NULL,
  `need` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_badge`
--

CREATE TABLE `user_badge` (
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `awarded_date` date DEFAULT NULL,
  `awarded_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_badge`
--

INSERT INTO `user_badge` (`user_id`, `badge_id`, `awarded_date`, `awarded_by`) VALUES
(2, 1, '2025-12-24', 1),
(2, 3, '2025-12-24', 1),
(3, 2, '2025-12-24', 1),
(4, 5, '2025-12-24', 1),
(9, 1, '2025-12-24', 1),
(19, 1, '2025-12-24', 1),
(25, 1, '2025-12-24', 1),
(27, 1, '2025-12-24', 1),
(31, 1, '2025-12-24', 1),
(32, 1, '2025-12-24', 1),
(37, 1, '2025-12-24', 1),
(39, 1, '2025-12-24', 1),
(42, 1, '2025-12-24', 1),
(44, 1, '2025-12-24', 1),
(45, 1, '2025-12-24', 1),
(46, 1, '2025-12-24', 1),
(47, 1, '2025-12-24', 1),
(48, 1, '2025-12-24', 1),
(50, 1, '2025-12-24', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`badge_id`);

--
-- Indexes for table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`learner_id`);

--
-- Indexes for table `learns`
--
ALTER TABLE `learns`
  ADD PRIMARY KEY (`learner_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `session_teacher_id` (`session_teacher_id`,`session_no`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `session_teacher_id` (`session_teacher_id`,`session_no`),
  ADD KEY `reporter_user_id` (`reporter_user_id`),
  ADD KEY `resolved_by_user_id` (`resolved_by_user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `teacher_id` (`teacher_id`,`session_no`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`teacher_id`,`session_no`),
  ADD KEY `learner_id` (`learner_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`teacher_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_accessibility_need`
--
ALTER TABLE `user_accessibility_need`
  ADD PRIMARY KEY (`user_id`,`need`);

--
-- Indexes for table `user_badge`
--
ALTER TABLE `user_badge`
  ADD PRIMARY KEY (`user_id`,`badge_id`),
  ADD KEY `badge_id` (`badge_id`),
  ADD KEY `awarded_by` (`awarded_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
  MODIFY `badge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `learns`
--
ALTER TABLE `learns`
  ADD CONSTRAINT `learns_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learner` (`learner_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `learns_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`session_teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE SET NULL;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`session_teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`reporter_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`resolved_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`learner_id`) REFERENCES `learner` (`learner_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `session_ibfk_3` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE SET NULL;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_accessibility_need`
--
ALTER TABLE `user_accessibility_need`
  ADD CONSTRAINT `user_accessibility_need_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_badge`
--
ALTER TABLE `user_badge`
  ADD CONSTRAINT `user_badge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_badge_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`badge_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_badge_ibfk_3` FOREIGN KEY (`awarded_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
