-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 05:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usersdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `a21126510026`
--

CREATE TABLE `a21126510026` (
  `cname` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a21126510026`
--

INSERT INTO `a21126510026` (`cname`, `status`) VALUES
('Machine Learning', 0),
('Cryptography & Neural Security', 0),
('Object Oriented Software Engineering', 0),
('Neural Networks and Deep Learning', 0),
('Web Technologies', 0),
('Introduction to Renewable Energy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `a21126510029`
--

CREATE TABLE `a21126510029` (
  `cname` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threeone`
--

CREATE TABLE `threeone` (
  `cname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threeone`
--

INSERT INTO `threeone` (`cname`, `fname`) VALUES
('Essentials of Python', 'Mr.B.Mahesh'),
('Competitive Programming', 'Mrs.N.Marline Joys'),
('Database Management System', 'Ms.P.Spandana Valli'),
('Compiler Design', 'Mrs.G.Gowri Pushpa'),
('Design and Analysis of Algorithms', 'Mrs.N.Preethi'),
('Artificial Intelligence', 'Dr.V.Ushabala');

-- --------------------------------------------------------

--
-- Table structure for table `threetwo`
--

CREATE TABLE `threetwo` (
  `cname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threetwo`
--

INSERT INTO `threetwo` (`cname`, `fname`) VALUES
('Machine Learning', 'Dr.V.Sangeetha'),
('Cryptography & Neural Security', 'Ms.P.Spandana Valli'),
('Object Oriented Software Engineering', 'Mr.P.Krishnanjaneyulu'),
('Neural Networks and Deep Learning', 'Mrs.D.Anusha'),
('Web Technologies', 'Mr.Bose Babu'),
('Introduction to Renewable Energy', 'Mr.K.Trinadh');

-- --------------------------------------------------------

--
-- Table structure for table `udetail`
--

CREATE TABLE `udetail` (
  `AcYear` varchar(30) NOT NULL,
  `course` varchar(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `roll` varchar(30) NOT NULL,
  `phn` varchar(20) NOT NULL,
  `section` varchar(2) NOT NULL,
  `sem` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `udetail`
--

INSERT INTO `udetail` (`AcYear`, `course`, `name`, `mail`, `year`, `dept`, `roll`, `phn`, `section`, `sem`, `uname`) VALUES
('2022-2023', 'B.Tech', 'xyz', 'xyz.21.cse@anits.edu.in', 3, 'COMPUTER SCIENCE & ENGINEERING', 'A21126510058', '6987532145', 'A', 2, 'A21126510058');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('admin', 'anits'),
('student', 'anits'),
('A21126510058', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
