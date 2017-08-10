-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 07, 2017 at 08:19 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Employee_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `Addresses`
--

CREATE TABLE `Addresses` (
  `Address_id` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Address_line1` varchar(225) NOT NULL,
  `Address_line2` varchar(225) NOT NULL,
  `City` varchar(225) NOT NULL,
  `State` varchar(225) NOT NULL,
  `Pincode` int(11) DEFAULT NULL,
  `Is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `Created_by` int(11) DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) DEFAULT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Education`
--

CREATE TABLE `Education` (
  `Education_id` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Degree_en` varchar(225) NOT NULL,
  `Degree_es` varchar(225) NOT NULL,
  `Degree_fr` varchar(225) NOT NULL,
  `Type_en` varchar(225) DEFAULT NULL COMMENT 'Full Time, Part Time Or Distance Learning',
  `Type_es` varchar(225) DEFAULT NULL,
  `Type_fr` varchar(225) DEFAULT NULL,
  `Specialization_en` varchar(225) DEFAULT NULL,
  `Specialization_es` varchar(225) DEFAULT NULL,
  `Specialization_fr` varchar(225) DEFAULT NULL,
  `University_en` varchar(225) DEFAULT NULL,
  `University_es` varchar(225) DEFAULT NULL,
  `University_fr` varchar(225) DEFAULT NULL,
  `Year_of_passing` year(4) DEFAULT NULL,
  `Marks` int(11) DEFAULT NULL,
  `Created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Email_addresses`
--

CREATE TABLE `Email_addresses` (
  `Email_id` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Email_address` varchar(225) NOT NULL,
  `Is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `Created_by` int(11) DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) DEFAULT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `Employee_id` int(11) NOT NULL,
  `First_name` varchar(225) DEFAULT NULL,
  `Last_name` varchar(225) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Social_security_number` varchar(100) DEFAULT NULL,
  `Introduction_en` text,
  `Introduction_es` text,
  `Introduction_fr` text,
  `Is_current_employee` tinyint(1) NOT NULL DEFAULT '1',
  `Deleted` tinyint(4) DEFAULT '0',
  `Created_by` int(11) DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Phone_numbers`
--

CREATE TABLE `Phone_numbers` (
  `Phone_id` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Number` varchar(225) NOT NULL,
  `Type` varchar(225) DEFAULT NULL COMMENT 'Home, Cell Or Alternative',
  `Is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `Created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Work_experiences`
--

CREATE TABLE `Work_experiences` (
  `Experience_id` int(11) NOT NULL,
  `Employee_id` int(11) NOT NULL,
  `Employer_name_en` varchar(225) NOT NULL,
  `Employer_name_es` varchar(225) NOT NULL,
  `Employer_name_fr` varchar(225) NOT NULL,
  `Designation_en` varchar(225) DEFAULT NULL,
  `Designation_es` varchar(225) DEFAULT NULL,
  `Designation_fr` varchar(225) DEFAULT NULL,
  `Job_profile_en` text,
  `Job_profile_es` text,
  `Job_profile_fr` text,
  `Reason_to_leave_en` varchar(500) DEFAULT NULL,
  `Reason_to_leave_es` varchar(500) DEFAULT NULL,
  `Reason_to_leave_fr` varchar(500) DEFAULT NULL,
  `Date_of_joining` date DEFAULT NULL,
  `Relieving_date` date DEFAULT NULL,
  `Created_by` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD PRIMARY KEY (`Address_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `Education`
--
ALTER TABLE `Education`
  ADD PRIMARY KEY (`Education_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `Email_addresses`
--
ALTER TABLE `Email_addresses`
  ADD PRIMARY KEY (`Email_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`Employee_id`),
  ADD UNIQUE KEY `Social_security_number` (`Social_security_number`);

--
-- Indexes for table `Phone_numbers`
--
ALTER TABLE `Phone_numbers`
  ADD PRIMARY KEY (`Phone_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `Work_experiences`
--
ALTER TABLE `Work_experiences`
  ADD PRIMARY KEY (`Experience_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Addresses`
--
ALTER TABLE `Addresses`
  MODIFY `Address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Education`
--
ALTER TABLE `Education`
  MODIFY `Education_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Email_addresses`
--
ALTER TABLE `Email_addresses`
  MODIFY `Email_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `Employee_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Phone_numbers`
--
ALTER TABLE `Phone_numbers`
  MODIFY `Phone_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Work_experiences`
--
ALTER TABLE `Work_experiences`
  MODIFY `Experience_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Addresses`
--
ALTER TABLE `Addresses`
  ADD CONSTRAINT `Addresses_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `Employees` (`Employee_id`);

--
-- Constraints for table `Education`
--
ALTER TABLE `Education`
  ADD CONSTRAINT `Education_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `Employees` (`Employee_id`);

--
-- Constraints for table `Email_addresses`
--
ALTER TABLE `Email_addresses`
  ADD CONSTRAINT `Email_addresses_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `Employees` (`Employee_id`);

--
-- Constraints for table `Phone_numbers`
--
ALTER TABLE `Phone_numbers`
  ADD CONSTRAINT `Phone_numbers_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `Employees` (`Employee_id`);

--
-- Constraints for table `Work_experiences`
--
ALTER TABLE `Work_experiences`
  ADD CONSTRAINT `Work_experiences_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `Employees` (`Employee_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
