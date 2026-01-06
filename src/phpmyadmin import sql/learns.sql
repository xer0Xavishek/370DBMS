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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `learns`
--
ALTER TABLE `learns`
  ADD PRIMARY KEY (`learner_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `learns`
--
ALTER TABLE `learns`
  ADD CONSTRAINT `learns_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learner` (`learner_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `learns_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
