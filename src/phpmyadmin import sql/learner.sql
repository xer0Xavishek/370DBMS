-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 04:59 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `learner`
--
ALTER TABLE `learner`
  ADD PRIMARY KEY (`learner_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
