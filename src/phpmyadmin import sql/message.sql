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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `session_teacher_id` (`session_teacher_id`,`session_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`session_teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
