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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
