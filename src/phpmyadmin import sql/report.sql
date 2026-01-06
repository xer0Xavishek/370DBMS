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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `session_teacher_id` (`session_teacher_id`,`session_no`),
  ADD KEY `reporter_user_id` (`reporter_user_id`),
  ADD KEY `resolved_by_user_id` (`resolved_by_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`session_teacher_id`,`session_no`) REFERENCES `session` (`teacher_id`, `session_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`reporter_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`resolved_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
