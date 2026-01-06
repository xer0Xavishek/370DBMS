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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `teacher_id` (`teacher_id`,`session_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
