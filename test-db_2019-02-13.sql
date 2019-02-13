-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 13, 2019 at 03:44 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

CREATE TABLE `names` (
  `pname` varchar(50) NOT NULL,
  `page` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `names`
--

INSERT INTO `names` (`pname`, `page`) VALUES
('harish', 20),
('sadhu', 35),
('kamal', 34);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `CODE` varchar(20) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `PRICE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`CODE`, `NAME`, `PRICE`) VALUES
('23', 'Smart TV', 25000),
('24', 'Car', 1223430),
('25', 'Cruise', 2341230),
('3', 'Refrigerator', 12000),
('32', 'Bik', 45000),
('M007', 'MacBook', 75000),
('P001', 'Java Core', 100),
('P002', 'C# Core', 90);

-- --------------------------------------------------------

--
-- Table structure for table `sub_topics`
--

CREATE TABLE `sub_topics` (
  `id` int(10) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_topics`
--

INSERT INTO `sub_topics` (`id`, `topic_id`, `name`, `link`) VALUES
(1, 1, 'Implement encapsulation', 'encapsulation'),
(2, 1, 'Implement polymorphism', 'polymorphism'),
(3, 1, 'modifiers and composition', 'modifiers'),
(9, 1, 'hashCode, equals, and toString', 'hashCode'),
(10, 1, 'singleton classes and immutable classes', 'immutable'),
(11, 1, 'static keyword', 'static'),
(12, 2, 'abstract classes and methods', 'abstract'),
(13, 2, 'final keyword', 'final'),
(14, 2, 'static inner and nested class', 'static_nested_class'),
(15, 2, 'enum', 'enum'),
(16, 2, 'Lambda expressions', 'lambda_expr'),
(17, 3, 'generic class', 'generics'),
(18, 3, 'ArrayList, TreeSet, TreeMap, and ArrayDeque ', 'arraylist'),
(19, 4, 'built-in interfaces', 'builtin_interfaces'),
(20, 4, 'primitive functional interfaces', 'primitives'),
(21, 12, 'Read and set the locale ', 'locale'),
(22, 12, 'Properties file', 'properties_file'),
(23, 12, 'resource bundle', 'resource_bundle'),
(24, 11, 'JDBC API', 'jdbc_api'),
(25, 11, 'DriverManager', 'divermanager'),
(26, 11, 'Execute and iterate', 'execute');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`) VALUES
(1, 'Class Design'),
(2, 'Advanced Design'),
(3, 'Generics and Collections'),
(4, 'Lambda Functional Interfaces'),
(5, 'Stream API'),
(6, 'Exceptions and Assertions'),
(7, 'I/O Fundamentals'),
(8, 'Date/Time API'),
(9, 'File I/O (NIO.2)'),
(10, 'Concurrency'),
(11, 'JDBC'),
(12, 'Localization');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `USER_NAME` varchar(30) NOT NULL,
  `GENDER` varchar(1) NOT NULL,
  `PASSWORD` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`USER_NAME`, `GENDER`, `PASSWORD`) VALUES
('jerry', 'M', 'jerry001'),
('tom', 'M', 'tom001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`CODE`);

--
-- Indexes for table `sub_topics`
--
ALTER TABLE `sub_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`USER_NAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sub_topics`
--
ALTER TABLE `sub_topics`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
