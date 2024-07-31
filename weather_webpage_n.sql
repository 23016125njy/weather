-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 01:14 PM
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
-- Database: `weather_webpage_n`
--

-- --------------------------------------------------------

--
-- Table structure for table `areametadata`
--

CREATE TABLE `areametadata` (
  `area_name` varchar(50) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areametadata`
--

INSERT INTO `areametadata` (`area_name`, `latitude`, `longitude`) VALUES
('Ang Mo Kio', 1.3750000, 103.8390000),
('Bedok', 1.3210000, 103.9240000),
('Bishan', 1.3507720, 103.8390000),
('Boon Lay', 1.3040000, 103.7010000),
('Bukit Batok', 1.3530000, 103.7540000),
('Bukit Merah', 1.2770000, 103.8190000),
('Bukit Panjang', 1.3620000, 103.7719500),
('Bukit Timah', 1.3250000, 103.7910000),
('Central Water Catchment', 1.3800000, 103.8050000),
('Changi', 1.3570000, 103.9870000),
('Choa Chu Kang', 1.3770000, 103.7450000),
('City', 1.2920000, 103.8440000),
('Clementi', 1.3150000, 103.7600000),
('Geylang', 1.3180000, 103.8840000),
('Hougang', 1.3612180, 103.8860000),
('Jalan Bahar', 1.3470000, 103.6700000),
('Jurong East', 1.3260000, 103.7370000),
('Jurong Island', 1.2660000, 103.6990000),
('Jurong West', 1.3403900, 103.7050000),
('Kallang', 1.3120000, 103.8620000),
('Lim Chu Kang', 1.4230000, 103.7173320),
('Mandai', 1.4190000, 103.8120000),
('Marine Parade', 1.2970000, 103.8910000),
('Novena', 1.3270000, 103.8260000),
('Pasir Ris', 1.3700000, 103.9480000),
('Paya Lebar', 1.3580000, 103.9140000),
('Pioneer', 1.3150000, 103.6750000),
('Pulau Tekong', 1.4030000, 104.0530000),
('Pulau Ubin', 1.4040000, 103.9600000),
('Punggol', 1.4010000, 103.9040000),
('Queenstown', 1.2910000, 103.7857600),
('Seletar', 1.4040000, 103.8690000),
('Sembawang', 1.4450000, 103.8184950),
('Sengkang', 1.3840000, 103.8914430),
('Sentosa', 1.2430000, 103.8320000),
('Serangoon', 1.3570000, 103.8650000),
('Southern Islands', 1.2080000, 103.8420000),
('Sungei Kadut', 1.4130000, 103.7560000),
('Tampines', 1.3450000, 103.9440000),
('Tanglin', 1.3080000, 103.8130000),
('Tengah', 1.3740000, 103.7150000),
('Toa Payoh', 1.3343040, 103.8563270),
('Tuas', 1.2949470, 103.6350000),
('Western Islands', 1.2059260, 103.7460000),
('Western Water Catchment', 1.4050000, 103.6890000),
('Woodlands', 1.4320000, 103.7865280),
('Yishun', 1.4180000, 103.8390000);

-- --------------------------------------------------------

--
-- Table structure for table `favs`
--

CREATE TABLE `favs` (
  `favId` int(100) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favs`
--

INSERT INTO `favs` (`favId`, `area_name`, `user_id`) VALUES
(1, 'Sentosa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'user1', 'user1@email.com', 'user1');

-- --------------------------------------------------------

--
-- Table structure for table `weatherforecast`
--

CREATE TABLE `weatherforecast` (
  `id` int(11) NOT NULL,
  `area_name` varchar(50) DEFAULT NULL,
  `forecast` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `valid_start` datetime DEFAULT NULL,
  `valid_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weatherforecast`
--

INSERT INTO `weatherforecast` (`id`, `area_name`, `forecast`, `timestamp`, `valid_start`, `valid_end`) VALUES
(48, 'Ang Mo Kio', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(49, 'Bedok', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(50, 'Bishan', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(51, 'Boon Lay', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(52, 'Bukit Batok', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(53, 'Bukit Merah', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(54, 'Bukit Panjang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(55, 'Bukit Timah', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(56, 'Central Water Catchment', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(57, 'Changi', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(58, 'Choa Chu Kang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(59, 'City', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(60, 'Clementi', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(61, 'Geylang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(62, 'Hougang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(63, 'Jalan Bahar', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(64, 'Jurong East', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(65, 'Jurong Island', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(66, 'Jurong West', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(67, 'Kallang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(68, 'Lim Chu Kang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(69, 'Mandai', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(70, 'Marine Parade', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(71, 'Novena', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(72, 'Pasir Ris', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(73, 'Paya Lebar', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(74, 'Pioneer', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(75, 'Pulau Tekong', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(76, 'Pulau Ubin', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(77, 'Punggol', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(78, 'Queenstown', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(79, 'Seletar', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(80, 'Sembawang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(81, 'Sengkang', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(82, 'Sentosa', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(83, 'Serangoon', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(84, 'Southern Islands', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(85, 'Sungei Kadut', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(86, 'Tampines', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(87, 'Tanglin', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(88, 'Tengah', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(89, 'Toa Payoh', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(90, 'Tuas', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(91, 'Western Islands', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(92, 'Western Water Catchment', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(93, 'Woodlands', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(94, 'Yishun', 'Fair (Day)', '2024-07-15 17:00:00', '2024-07-15 17:00:00', '2024-07-15 19:00:00'),
(95, 'Ang Mo Kio', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(96, 'Bedok', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(97, 'Bishan', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(98, 'Boon Lay', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(99, 'Bukit Batok', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(100, 'Bukit Merah', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(101, 'Bukit Panjang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(102, 'Bukit Timah', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(103, 'Central Water Catchment', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(104, 'Changi', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(105, 'Choa Chu Kang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(106, 'City', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(107, 'Clementi', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(108, 'Geylang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(109, 'Hougang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(110, 'Jalan Bahar', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(111, 'Jurong East', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(112, 'Jurong Island', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(113, 'Jurong West', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(114, 'Kallang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(115, 'Lim Chu Kang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(116, 'Mandai', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(117, 'Marine Parade', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(118, 'Novena', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(119, 'Pasir Ris', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(120, 'Paya Lebar', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(121, 'Pioneer', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(122, 'Pulau Tekong', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(123, 'Pulau Ubin', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(124, 'Punggol', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(125, 'Queenstown', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(126, 'Seletar', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(127, 'Sembawang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(128, 'Sengkang', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(129, 'Sentosa', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(130, 'Serangoon', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(131, 'Southern Islands', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(132, 'Sungei Kadut', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(133, 'Tampines', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(134, 'Tanglin', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(135, 'Tengah', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(136, 'Toa Payoh', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(137, 'Tuas', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(138, 'Western Islands', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(139, 'Western Water Catchment', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(140, 'Woodlands', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL),
(141, 'Yishun', 'Partly Cloudy (Day)', '2024-07-16 14:11:00', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areametadata`
--
ALTER TABLE `areametadata`
  ADD PRIMARY KEY (`area_name`);

--
-- Indexes for table `favs`
--
ALTER TABLE `favs`
  ADD PRIMARY KEY (`favId`),
  ADD KEY `userids` (`user_id`),
  ADD KEY `areaname` (`area_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `weatherforecast`
--
ALTER TABLE `weatherforecast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_name` (`area_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favs`
--
ALTER TABLE `favs`
  MODIFY `favId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weatherforecast`
--
ALTER TABLE `weatherforecast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favs`
--
ALTER TABLE `favs`
  ADD CONSTRAINT `areaname` FOREIGN KEY (`area_name`) REFERENCES `areametadata` (`area_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weatherforecast`
--
ALTER TABLE `weatherforecast`
  ADD CONSTRAINT `weatherforecast_ibfk_1` FOREIGN KEY (`area_name`) REFERENCES `areametadata` (`area_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
