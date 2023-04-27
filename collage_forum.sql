-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 08:37 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collage_forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(8) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created`) VALUES
(1, 'Academics', 'Find answers to your academic questions, get tips on how to succeed in your courses, and discover academic resources available on campus.', '2020-06-19 11:53:06'),
(2, 'Admissions', 'Get answers to your admissions-related questions, from how to ace admissions tests to how to write a standout application essay and choose the right college.', '2020-06-19 11:53:43'),
(3, 'Campus life', 'Learn about campus resources, discover ways to get involved in extracurricular activities, and find out about campus events and happenings.', '2020-06-19 11:55:37'),
(4, 'Career development', 'Discover resources to help you plan your career, learn job search strategies, build your resume, and prepare for interviews.', '2020-06-19 12:57:08'),
(5, 'Financial aid', ' Get information on scholarships, grants, student loans, and other financial aid resources available to help you pay for college.', '2020-06-20 10:47:25'),
(6, 'Others', 'Have a question that doesn\'t fit into any of the other categories? Post it here! This category is for general queries and discussions about college life, from dorm room decorating tips to making friends on campus. Ask for advice, share your experiences, a', '2020-06-20 10:47:49'),
(7, 'Student organizations', 'Discover student organizations on campus, learn how to join them, and find out how to create and run your own organization.', '2020-06-20 10:48:16'),
(8, 'Faculty and Staff', 'Learn about the faculty and staff members at your college, get advice on how to communicate with them, and find resources to help you connect with mentors.', '2020-06-20 10:48:50'),
(9, 'Campus Services', 'Discover the services available on campus, such as the library, career center, counseling center, and health center, and get information on how to access and utilize these resources.', '2020-06-20 10:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `thread_id` int(8) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES
(1, 'hi hey', 1, 3, '2023-04-22 11:49:57'),
(2, 'I don&apos;t know why ', 2, 1, '2023-04-27 10:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `sno` int(8) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`sno`, `user_email`, `user_name`, `contact`, `dt`) VALUES
(1, 'raj123@gmail.com', 'raj123', '12345432111', '2023-04-27 11:30:49'),
(3, 'buddy2023@gmail.com', 'budddddyyyy', '696969696969', '2023-04-27 12:01:17');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_desc` text NOT NULL,
  `thread_cat_id` int(11) NOT NULL,
  `thread_user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(8) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_pass` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `user_email`, `user_name`, `user_pass`, `timestamp`) VALUES
(4, 'raj123@gmail.com', 'raj123', '$2y$10$TrBg0TTMmKV5REz7H9SFNurdFMdqtx6QbPlioV/h1L75v1lLSEC4e', '2023-04-27 11:30:12'),
(5, 'buddy2023@gmail.com', 'buddy', '$2y$10$TrBg0TTMmKV5REz7H9SFNurdFMdqtx6QbPlioV/h1L75v1lLSEC4e', '2023-04-27 12:00:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);
ALTER TABLE `threads` ADD FULLTEXT KEY `thread_title` (`thread_title`,`thread_desc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `sno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
