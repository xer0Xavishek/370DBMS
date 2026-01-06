-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 05:01 PM
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
-- Indexes for table `user_badge`
--
ALTER TABLE `user_badge`
  ADD PRIMARY KEY (`user_id`,`badge_id`),
  ADD KEY `badge_id` (`badge_id`),
  ADD KEY `awarded_by` (`awarded_by`);

--
-- Constraints for dumped tables
--

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
