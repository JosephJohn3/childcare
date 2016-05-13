-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 13, 2016 at 02:57 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `childcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_guests`
--

CREATE TABLE IF NOT EXISTS `active_guests` (
  `ip` varchar(15) NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `active_users`
--

CREATE TABLE IF NOT EXISTS `active_users` (
  `username` varchar(30) NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_users`
--

INSERT INTO `active_users` (`username`, `timestamp`) VALUES
('parent', 1459389198);

-- --------------------------------------------------------

--
-- Table structure for table `banned_users`
--

CREATE TABLE IF NOT EXISTS `banned_users` (
  `username` varchar(30) NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banned_users`
--

INSERT INTO `banned_users` (`username`, `timestamp`) VALUES
('james', 12);

-- --------------------------------------------------------

--
-- Table structure for table `childdata`
--

CREATE TABLE IF NOT EXISTS `childdata` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `child_no` int(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dchild` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `childdata`
--

INSERT INTO `childdata` (`child_id`, `child_no`, `firstname`, `lastname`, `nickname`, `grade`, `gender`, `dchild`, `dob`) VALUES
(2, 235, 'Joseph', 'Mwendwa', 'cena', '2', 'on', 'esdgyerdhfdf', '2016-03-23'),
(4, 32, 'cool', 'buddy', 'really', '3', 'male', ' Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2015-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subject` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`phone`, `email`, `title`, `subject`) VALUES
('+254143245745756', 'gca@hom.co', 'gfffjsughtbyuhtuytjyfxghdtrh', 0),
('+25412321424', 'kingangi@co.da', 'c65ytttttttttttttttttttttttttttttttubbbbbbbbbbbbbb    uj u6 r u y j u ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `launch`
--

CREATE TABLE IF NOT EXISTS `launch` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `issue` text NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `launch`
--

INSERT INTO `launch` (`note_id`, `subject`, `issue`) VALUES
(1, 'ouch yeah', 'wololo yaye');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_no` int(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `employed` varchar(30) NOT NULL,
  `home` varchar(30) NOT NULL,
  `office` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`p_id`, `id_no`, `firstname`, `lastname`, `occupation`, `employed`, `home`, `office`, `email`, `gender`) VALUES
(1, 32424, 'Shaly', 'Smiling gal', 'rok', 'kolo', 'reda', '234234', 'joge@gmail.com', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `paid` float NOT NULL,
  `paidby` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `balance` float NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`bill_id`, `paid`, `paidby`, `date`, `balance`, `username`) VALUES
(1, 3242, 'gide', '0000-00-00 00:00:00', 200, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `home` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `userlevel` tinyint(1) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  `parent_directory` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstname`, `lastname`, `username`, `home`, `telephone`, `email`, `password`, `userid`, `userlevel`, `timestamp`, `parent_directory`) VALUES
('Joseph', 'Mwendwa', 'amazing', 'mwakenya', '+25447921423', 'shaly@must.ac.ke', '33c381af2d1e41fe40556f1663244b34', '2', 2, 1459376746, ''),
('dalim', 'dakar', 'kenya', 'mutito', '+25447921423', 'shaly@gmail.com', '6450d76cb620a9ef910cf93331b5c4f3', '2', 3, 1459376861, 'workerworker'),
('Joseph', 'Mwendwa', 'master1', '', '+1223456789', 'danny@gmail.com', 'bddd92a2e2d3383be9ead8760a03f401', '0', 2, 1459376481, 'shaly'),
('nancy', 'coole', 'parent', 'katoloni', '+1223456789', 'parent@gmail.com', 'd0e45878043844ffc41aac437e86b602', 'c842ba866e748b024360cf66c9a4c0bf', 3, 1459389198, 'workerworker'),
('Shaly', 'Smiling gal', 'shaly', '', '+124456789', 'shaly@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '80f0fdd60151402e0b09fc9511cd689b', 1, 1459376798, 'admin'),
('visitor', 'example', 'worker', '', '+254134367893', 'example@gmail.com', 'b61822e8357dcaff77eaaccf348d9134', '82d67c8e4172ba3fa3414436dc798abb', 2, 1459389183, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
