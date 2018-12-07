-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2018 at 05:14 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms_p1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getaddress` ()  SELECT rto_address from offices where district='$city'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `aadhar` char(12) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`aadhar`, `street`, `city`, `state`) VALUES
('345681234', 'Gayatri nagar', 'Buxar', 'Bihar');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `username`, `password`) VALUES
('ankit', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `aadhar` char(12) NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  `phone_no` char(10) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`first_name`, `middle_name`, `last_name`, `aadhar`, `gender`, `dob`, `phone_no`, `mail_id`, `age`) VALUES
('Ankit', '', 'kashyap', '345681234', 'M', '1998-05-02', '', 'ankitkashyap7@gmail.com', 20);

--
-- Triggers `citizen`
--
DELIMITER $$
CREATE TRIGGER `update_age` BEFORE INSERT ON `citizen` FOR EACH ROW SET new.age = TIMESTAMPDIFF(YEAR, new.dob, CURDATE())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `aadhar` char(12) NOT NULL,
  `cdate` date NOT NULL,
  `cdesc` text NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dl`
--

CREATE TABLE `dl` (
  `aadhar` char(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cov` varchar(20) NOT NULL,
  `edate` date NOT NULL,
  `eid` varchar(10) NOT NULL,
  `dl_id` int(11) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `dl_status` int(11) NOT NULL,
  `dl_issue_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inspector`
--

CREATE TABLE `inspector` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `privilege` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inspector`
--

INSERT INTO `inspector` (`id`, `username`, `password`, `privilege`) VALUES
(1, 'henry', 'henry', 'llr');

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `id` int(11) NOT NULL,
  `aadhar` char(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `license_no` varchar(20) NOT NULL,
  `cov` varchar(20) NOT NULL,
  `license_issue_date` date NOT NULL,
  `license_expiry_date` date NOT NULL,
  `mail_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `llr`
--

CREATE TABLE `llr` (
  `aadhar` char(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cov` varchar(20) NOT NULL,
  `edate` date NOT NULL,
  `eid` varchar(10) NOT NULL,
  `llr_id` int(11) NOT NULL,
  `epwd` char(10) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `llr_status` int(11) NOT NULL,
  `llr_issue_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `llr`
--

INSERT INTO `llr` (`aadhar`, `name`, `cov`, `edate`, `eid`, `llr_id`, `epwd`, `passwd`, `mail_id`, `llr_status`, `llr_issue_date`) VALUES
('345681234', 'Ankit  kashyap', 'LMV', '2018-12-12', 'e1', 1, 'gx4jtcSlpP', 'qwerty', 'ankitkashyap7@gmail.com', 1, '2018-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `district` varchar(30) NOT NULL,
  `rto_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reg`
--

CREATE TABLE `reg` (
  `aadhar` char(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cov` varchar(30) NOT NULL,
  `model` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `rdate` date NOT NULL,
  `r_id` int(11) NOT NULL,
  `passwd` varchar(30) NOT NULL,
  `mail_id` varchar(50) NOT NULL,
  `reg_status` int(11) NOT NULL,
  `reg_issue_date` date NOT NULL,
  `vno` varchar(20) NOT NULL,
  `reg_expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`aadhar`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`aadhar`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `fkcomplaint` (`aadhar`);

--
-- Indexes for table `dl`
--
ALTER TABLE `dl`
  ADD PRIMARY KEY (`dl_id`),
  ADD KEY `fkdl` (`aadhar`);

--
-- Indexes for table `inspector`
--
ALTER TABLE `inspector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`,`aadhar`),
  ADD KEY `fkli` (`aadhar`);

--
-- Indexes for table `llr`
--
ALTER TABLE `llr`
  ADD PRIMARY KEY (`llr_id`),
  ADD KEY `fkllr` (`aadhar`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`district`);

--
-- Indexes for table `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `fkreg` (`aadhar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dl`
--
ALTER TABLE `dl`
  MODIFY `dl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inspector`
--
ALTER TABLE `inspector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `llr`
--
ALTER TABLE `llr`
  MODIFY `llr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reg`
--
ALTER TABLE `reg`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fkadress` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fkcomplaint` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`);

--
-- Constraints for table `dl`
--
ALTER TABLE `dl`
  ADD CONSTRAINT `fkdl` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `fkli` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `llr`
--
ALTER TABLE `llr`
  ADD CONSTRAINT `fkllr` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reg`
--
ALTER TABLE `reg`
  ADD CONSTRAINT `fkreg` FOREIGN KEY (`aadhar`) REFERENCES `citizen` (`aadhar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
