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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
