-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 03:26 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `surveydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE IF NOT EXISTS `metrics` (
  `mid` varchar(50) NOT NULL,
  `metric` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `metric` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`mid`, `metric`) VALUES
('M-12', 'Activities'),
('M-18', 'Comment'),
('M-2', 'Events'),
('M-8', 'Expectation Rating 1'),
('M-0', 'Expectation Rating 2'),
('M-4', 'Expectation Rating 3'),
('M-14', 'Locations'),
('M-16', 'Preferences'),
('M-6', 'Unique');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE IF NOT EXISTS `participants` (
  `pid` varchar(50) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`pid`, `location`, `name`, `gender`, `status`, `type`) VALUES
('P-1477', 'Rwanda', 'Gilbert Niyongere', 'Male', 'Open', 'Admin'),
('P-220', 'Rwanda', 'shudii', 'Female', 'Open', 'participant');

-- --------------------------------------------------------

--
-- Table structure for table `qoptions`
--

CREATE TABLE IF NOT EXISTS `qoptions` (
  `qiop` varchar(50) NOT NULL DEFAULT '',
  `mid` varchar(50) NOT NULL DEFAULT '',
  `pid` varchar(50) NOT NULL DEFAULT '',
  `optionname` varchar(500) DEFAULT NULL,
  `ratings` int(11) DEFAULT NULL,
  `choice` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `optionquestion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`qiop`,`mid`,`pid`),
  KEY `fk_qio` (`mid`),
  KEY `fk_qio2` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qoptions`
--

INSERT INTO `qoptions` (`qiop`, `mid`, `pid`, `optionname`, `ratings`, `choice`, `status`, `optionquestion`) VALUES
('Q-0', 'M-16', 'P-220', 'Photographing activities\r\n', 0, 1, 'Closed', 'Your child likes: '),
('Q-0', 'M-2', 'P-220', 'Celebrating valentine day', 0, 1, 'Closed', 'Your  child likes events like:'),
('Q-10', 'M-14', 'P-220', 'Gardens', 0, 1, 'Closed', 'Your child likes to be  in places with:'),
('Q-10', 'M-16', 'P-220', 'Being photographed', 0, 1, 'Closed', 'Your child likes'),
('Q-10', 'M-18', 'P-220', 'What inferences were you most surprised by, and why?', 0, 1, 'Closed', 'What inferences were you most surprised by, and why?'),
('Q-12', 'M-0', 'P-220', 'I intended to share this information\n', 0, 0, 'Open', 'On a scale from 1 to 5, with 1 being completely disagree and 5 being completely agree, how much do the following statements apply to you'),
('Q-14', 'M-12', 'P-220', 'Playing with toys and having fun when you carry her \r\n', 0, 1, 'Closed', 'Your child activities include'),
('Q-16', 'M-14', 'P-220', 'Toys', 0, 0, 'Open', 'Your child likes to be in places having:'),
('Q-16', 'M-8', 'P-220', 'I am surprised this information was revealed\r\n', 0, 0, 'Open', 'On a scale from 1 to 5, with 1 being completely disagree and 5 being completely agree, how much do the following statements apply to you?'),
('Q-6', 'M-2', 'P-220', 'Seeing people singing', 0, 0, 'Open', 'Your Child likes Events like:'),
('Q-8', 'M-12', 'P-220', 'Toddling when she is together with you', 0, 0, 'Open', 'Your child activities include'),
('Q-8', 'M-4', 'P-220', 'I am comfortable that this informatino was revealed', 0, 0, 'Open', 'On a scale from 1 to 5, with 1 being completely disagree and 5 being completely agree, how much do the following statements apply to you?');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qoptions`
--
ALTER TABLE `qoptions`
  ADD CONSTRAINT `fk_qio` FOREIGN KEY (`mid`) REFERENCES `metrics` (`mid`),
  ADD CONSTRAINT `fk_qio2` FOREIGN KEY (`pid`) REFERENCES `participants` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
