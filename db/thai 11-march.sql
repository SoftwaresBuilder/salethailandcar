-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2020 at 02:35 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thai`
--

-- --------------------------------------------------------

--
-- Table structure for table `thai_admin`
--

CREATE TABLE `thai_admin` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_admin`
--

INSERT INTO `thai_admin` (`id`, `fname`, `lname`, `email`, `password`, `status`, `trash`) VALUES
(1, 'Super', 'Admin', 'admin@thai.com', 'MTIzNDU=', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_banners`
--

CREATE TABLE `thai_banners` (
  `id` int(10) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `trash` int(10) NOT NULL DEFAULT 0,
  `status` int(100) NOT NULL DEFAULT 1,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thai_bidding`
--

CREATE TABLE `thai_bidding` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidder_id` int(10) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(10) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_bidding`
--

INSERT INTO `thai_bidding` (`id`, `user_id`, `bidder_id`, `product_id`, `amount`, `message`, `status`, `trash`, `created_date`) VALUES
(5, 6, 5, 10, 1245, 'jjjjj', 1, 0, '2020-03-10 15:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `thai_categories`
--

CREATE TABLE `thai_categories` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(50) DEFAULT NULL,
  `title_th` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_name` varchar(20) DEFAULT NULL,
  `banner_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_categories`
--

INSERT INTO `thai_categories` (`id`, `pid`, `title_en`, `title_th`, `description`, `status`, `trash`, `created_date`, `card_name`, `banner_name`) VALUES
(1, 0, 'Second Hand', 'มือสอง', 'Looking for second hand stuff', 1, 0, '2020-02-05 17:08:53', 'card_job', NULL),
(2, 0, 'Jobs', 'งาน', 'Find relevant jobs in town', 1, 0, '2020-02-05 17:08:53', 'card_job', 'banner_jobs'),
(3, 0, 'Pets', 'สัตว์เลี้ยง', 'Its one of best place to find cute pets here', 1, 0, '2020-02-05 17:29:58', 'card_job', NULL),
(4, 1, 'Sofa And Dining', 'โซฟาและห้องอาหาร', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 1, 0, '2020-02-08 15:42:33', '', NULL),
(5, 1, 'Other Household Items', 'ของใช้ในครัวเรือนอื่น ๆ', '', 1, 0, '2020-02-08 15:45:48', '', NULL),
(6, 1, 'Beds And Wardrobes', 'เตียงและตู้เสื้อผ้า', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione', 1, 0, '2020-02-08 15:48:33', '', NULL),
(7, 1, 'Home Decor and Garden', 'ของตกแต่งบ้านและสวน', 'Create the perfect front yard and backyard landscapes with our gardening tips. We\\\'ll tell you about beautiful annual, perennial, bulb, and rose flowers, as well as trees, shrubs, and groundcovers that put on a year-round gardening show.', 1, 0, '2020-02-10 10:10:32', NULL, NULL),
(8, 2, 'IT and Computer Jobs', 'งานไอทีและคอมพิวเตอร์', 'Find IT and Computer related jobs  in town', 1, 0, '2020-02-10 10:28:45', NULL, NULL),
(9, 2, 'Sales and Marketing', 'การขายและการตลาด', 'Find Sales and Marketing related jobs  in town', 1, 0, '2020-02-10 10:33:49', NULL, NULL),
(10, 2, 'Hotels and Tourism', 'โรงแรมและการท่องเที่ยว', 'Find best Hotel and Tourism services in town', 1, 0, '2020-02-10 10:41:52', NULL, NULL),
(11, 2, 'Accounting and Finance', 'บัญชีและการเงิน', 'Get Accounting and Finance', 1, 0, '2020-02-10 10:45:01', NULL, NULL),
(12, 2, 'Advertising and PR', 'การโฆษณาและประชาสัมพันธ์', 'Find Advertising and PR jobs here', 1, 0, '2020-02-10 10:46:16', NULL, NULL),
(13, 2, 'Human Resources', 'ทรัพยากรมนุษย์', 'Hire Human Resources here', 1, 0, '2020-02-10 10:46:48', NULL, NULL),
(14, 3, 'Cat', 'แมว', 'here you can find cute cats ', 1, 0, '2020-02-10 10:49:21', NULL, NULL),
(15, 3, 'Rabbit', 'กระต่าย', 'Searching for innocent animal rabbit', 1, 0, '2020-02-10 10:50:19', NULL, NULL),
(16, 0, 'Vehicle', 'พาหนะ', 'here are best vehicles and related stuff', 1, 0, '2020-02-10 10:58:58', 'card_car', 'banner_vehicle'),
(18, 16, 'Cars', 'รถ\r\n', 'Find latest Cars here', 1, 0, '2020-02-10 11:05:23', NULL, NULL),
(19, 16, 'Spare Parts', 'อะไหล่สำรอง', 'get old and new spare parts here', 1, 0, '2020-02-10 11:06:04', NULL, NULL),
(20, 16, 'Commercial Vehicles', 'รถยนต์เพื่อการพาณิชย์', 'Get Commercial Vehicles here', 1, 0, '2020-02-10 11:07:33', NULL, NULL),
(21, 16, 'Other Vehicles', 'ยานพาหนะอื่น ๆ', 'Find other vehicles here', 1, 0, '2020-02-10 11:08:47', NULL, NULL),
(22, 16, 'Scooter', 'สกูตเตอร์', 'Get Scooters here', 1, 0, '2020-02-10 11:09:16', NULL, NULL),
(23, 16, 'Bicycles', 'จักรยาน', 'Get your bicycles here', 1, 0, '2020-02-10 11:09:50', NULL, NULL),
(24, 0, 'Real Estate', 'อสังหาริมทรัพย์', 'Find real estate related sub categories here', 1, 0, '2020-02-10 11:11:02', 'card_real_state', 'banner_real_state'),
(25, 24, 'Land and Plots', 'ที่ดินและแปลง', 'Find Land and Plots here', 1, 0, '2020-02-10 11:13:08', NULL, NULL),
(26, 24, 'Apartments', 'พาร์ทเมนท์', 'Get your apartments here', 1, 0, '2020-02-10 11:14:07', NULL, NULL),
(27, 24, 'House', 'บ้าน', 'Search for house here', 1, 0, '2020-02-10 11:14:58', NULL, NULL),
(28, 24, 'Shops and Offices Commercial Space', 'ร้านค้าและสำนักงานพื้นที่เชิงพาณิชย์', 'Find your Shops and Offices Commercial Space here', 1, 0, '2020-02-10 11:17:04', NULL, NULL),
(29, 24, 'PG and Roommates', 'PG และเพื่อนร่วมห้อง', 'PG and Roommates', 1, 0, '2020-02-10 11:17:52', NULL, NULL),
(30, 24, 'Vacation Rentals and Guest Houses', 'บ้านพักตากอากาศและบ้านพักรับรอง', 'Looking for Vacation Rentals and Guest Houses', 1, 0, '2020-02-10 11:19:40', NULL, NULL),
(31, 0, 'Fashion', 'แฟชั่น', 'Get latest Fashion here', 1, 0, '2020-02-10 11:21:33', 'card_job', NULL),
(32, 31, 'Accessories', 'เครื่องประดับ', 'Get Quality Accessories here', 1, 0, '2020-02-10 11:47:36', NULL, NULL),
(33, 31, 'Clothes', 'เสื้อผ้า', 'Grab Nice Clothing here', 1, 0, '2020-02-10 11:48:38', NULL, NULL),
(34, 31, 'Footwear', 'รองเท้า', 'Get your comfortable  and cozy Footwear here', 1, 0, '2020-02-10 11:49:26', NULL, NULL),
(35, 0, 'Electronics Goods', 'สินค้าอิเล็กทรอนิกส์', 'Grab for you some Qualitative electronic goods', 1, 0, '2020-02-10 11:50:39', 'card_job', NULL),
(36, 35, 'Computers and Accessories', 'คอมพิวเตอร์และอุปกรณ์เสริม', 'Looking  for latest and old Computers and Accessories', 1, 0, '2020-02-10 11:53:06', NULL, NULL),
(37, 35, 'Kitchen and Other Appliances', 'ครัวและอุปกรณ์เครื่องใช้อื่น ๆ', 'Looking for Stylish  Kitchen and Other Appliances', 1, 0, '2020-02-10 11:54:22', NULL, NULL),
(38, 35, 'TV Video and Audio', 'ทีวีวิดีโอและเสียง', 'Searching for TV Video and Audio', 1, 0, '2020-02-10 11:55:34', NULL, NULL),
(39, 35, 'Cameras and Accessories', 'กล้องและอุปกรณ์เสริม', 'Need Latest Cameras and Accessories?', 1, 0, '2020-02-10 11:56:14', NULL, NULL),
(40, 35, 'Games and Entertainment', 'เกมและความบันเทิง', 'Badly looking for Games and Entertainment ', 1, 0, '2020-02-10 11:57:48', NULL, NULL),
(41, 35, 'Fridge AC and Washing Machine', '\r\nตู้เย็น AC และเครื่องซักผ้า', 'Searching for Fridge AC and Washing Machine??', 1, 0, '2020-02-10 12:01:36', NULL, NULL),
(42, 0, NULL, '??????\r\n', NULL, 1, 0, '2020-03-11 07:18:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_features`
--

CREATE TABLE `thai_category_features` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_features`
--

INSERT INTO `thai_category_features` (`id`, `category_id`, `title`, `title_th`) VALUES
(1, 18, 'Air conditionar', NULL),
(2, 18, 'Music System', NULL),
(3, 18, 'GPS', NULL),
(5, 18, 'Security System', NULL),
(6, 18, 'Parking Sensor', NULL),
(7, 18, 'Parking Camera', NULL),
(8, 18, 'Stepney', NULL),
(9, 18, 'Jack', NULL),
(10, 18, 'Auto Gear', NULL),
(11, 18, 'Fog Lamo', NULL),
(12, 18, 'ABS', NULL),
(13, 18, 'Air Bags', NULL),
(14, 22, 'Speedometer', NULL),
(15, 22, 'Fuel Guage', NULL),
(16, 22, 'Digital Fuel Guage', NULL),
(17, 22, 'Electric Start', NULL),
(18, 22, 'Tachometer', NULL),
(19, 22, 'Low Fuel Indicator', NULL),
(20, 22, 'Low Oil Indicator', NULL),
(21, 22, 'Low Battery Indicato', NULL),
(22, 22, 'Battery', NULL),
(23, 22, 'Pass Light', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_models`
--

CREATE TABLE `thai_category_models` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_models`
--

INSERT INTO `thai_category_models` (`id`, `category_id`, `title`, `title_th`) VALUES
(1, 18, 'SUV', NULL),
(2, 18, 'MPV', NULL),
(3, 18, 'Pick Up', NULL),
(4, 18, 'Seaden', NULL),
(5, 18, 'Hatchback', NULL),
(6, 18, 'Sport', NULL),
(7, 22, 'Big Scooter', NULL),
(8, 22, 'Chooper', NULL),
(9, 22, 'Moto Cross', NULL),
(10, 22, 'Naked Bike', NULL),
(11, 22, 'Sports', NULL),
(12, 22, 'Touring', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_submodels`
--

CREATE TABLE `thai_category_submodels` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_submodels`
--

INSERT INTO `thai_category_submodels` (`id`, `type_id`, `title`, `title_th`) VALUES
(1, 27, 'CL Models (4)', NULL),
(2, 27, '-2.2CL', NULL),
(3, 27, '-2.3CL', NULL),
(4, 27, '-3.0CL', NULL),
(5, 27, '-3.2CL', NULL),
(6, 27, 'ILX', NULL),
(7, 27, 'Integra', NULL),
(8, 27, 'Legend', NULL),
(9, 27, 'MDX', NULL),
(10, 27, 'NSX', NULL),
(11, 27, 'RDX', NULL),
(12, 27, 'RL Models (2)', NULL),
(13, 27, '-3.5RL', NULL),
(14, 27, '-RL', NULL),
(15, 27, 'RSX', NULL),
(16, 27, 'SLX', NULL),
(17, 27, 'TL Models (3)', NULL),
(18, 27, '-2.5TL', NULL),
(19, 27, '-3.2TL', NULL),
(20, 27, '-TL', NULL),
(21, 27, 'TSX', NULL),
(22, 27, 'Vigor', NULL),
(23, 27, 'ZDX', NULL),
(24, 27, 'Other Accura Models', NULL),
(25, 28, '164', NULL),
(26, 28, '8C Competizione', NULL),
(27, 28, 'GTV-6', NULL),
(28, 28, 'Milano', NULL),
(29, 28, 'Spider', NULL),
(30, 28, 'Other Alfa Romeo Mod', NULL),
(32, 29, 'Alliance', NULL),
(33, 29, 'Concord', NULL),
(34, 29, 'Eagle', NULL),
(35, 29, 'Encore', NULL),
(36, 29, 'Spirit', NULL),
(37, 29, 'Other AMC Models', NULL),
(38, 30, 'DB7', NULL),
(39, 30, 'DB9', NULL),
(40, 30, 'DBS', NULL),
(41, 30, 'Lagonda', NULL),
(42, 30, 'Rapide', NULL),
(43, 30, 'V12 Vantage', NULL),
(44, 30, 'V8 Vantage', NULL),
(45, 30, 'Vanquish', NULL),
(46, 30, 'Virage', NULL),
(47, 30, 'Other Aston Martin M', NULL),
(48, 31, '100', NULL),
(49, 31, '200', NULL),
(50, 31, '4000', NULL),
(51, 31, '5000', NULL),
(52, 31, '80', NULL),
(53, 31, '90', NULL),
(54, 31, 'A4', NULL),
(55, 31, 'A3', NULL),
(56, 31, 'A5', NULL),
(57, 31, 'A6', NULL),
(58, 31, 'A7', NULL),
(59, 31, 'A8', NULL),
(60, 31, 'allroad', NULL),
(61, 31, 'Cabriolet', NULL),
(62, 31, 'Coupe', NULL),
(63, 31, 'Q3', NULL),
(64, 31, 'Q5', NULL),
(65, 31, 'Q7', NULL),
(66, 31, 'Quattro', NULL),
(67, 31, 'R8', NULL),
(68, 31, 'RS 4', NULL),
(69, 31, 'RS 5', NULL),
(70, 31, 'RS 6', NULL),
(71, 31, 'DBS', NULL),
(72, 31, 'S4', NULL),
(73, 31, 'S5', NULL),
(74, 31, 'S6', NULL),
(75, 31, 'S7', NULL),
(76, 31, 'S8', NULL),
(77, 31, 'TT', NULL),
(78, 31, 'TT RS', NULL),
(79, 31, 'V8 Quattro', NULL),
(80, 31, 'TTS', NULL),
(81, 31, 'Other Audi Models', NULL),
(82, 32, 'Convertible', NULL),
(83, 32, 'Coupe', NULL),
(84, 32, 'Sedan', NULL),
(85, 32, 'Other Avanti Models', NULL),
(86, 33, 'Arnage', NULL),
(87, 33, 'Azure', NULL),
(88, 33, 'Brooklands', NULL),
(89, 33, 'Continental', NULL),
(90, 33, 'Corniche', NULL),
(91, 33, 'Eight', NULL),
(92, 33, 'Mulsanne', NULL),
(93, 33, 'Turbo R', NULL),
(94, 33, 'Other Bentley Models', NULL),
(95, 34, '1 Series (3)', NULL),
(96, 34, '- 128i', NULL),
(97, 34, '- 135i', NULL),
(98, 34, '- 135is', NULL),
(99, 34, '3 Series (29)', NULL),
(100, 34, '- 318i', NULL),
(101, 34, '- 318iC', NULL),
(102, 34, '- 318iS', NULL),
(103, 34, '- 318ti', NULL),
(104, 34, '- 320i', NULL),
(105, 34, '- 323ci', NULL),
(106, 34, '- 323i', NULL),
(107, 34, '- 323is', NULL),
(108, 34, '- 323iT', NULL),
(109, 34, '- 325Ci', NULL),
(110, 34, '- 325e', NULL),
(111, 34, '- 325es', NULL),
(112, 34, '- 325i', NULL),
(113, 34, '- 325is', NULL),
(114, 34, '- 325iX', NULL),
(115, 34, '- 325xi', NULL),
(116, 34, '- 328Ci', NULL),
(117, 34, '- 328Ci', NULL),
(118, 34, '- 328i', NULL),
(119, 34, '- 328iS', NULL),
(120, 34, '- 328xi', NULL),
(121, 34, '- 330Ci', NULL),
(122, 34, '- 330i', NULL),
(123, 34, '- 330xi', NULL),
(124, 34, '- 335d', NULL),
(125, 34, '- 335i', NULL),
(126, 34, '- 335is', NULL),
(127, 34, '- 335xi', NULL),
(128, 34, '- ActiveHybrid 3', NULL),
(129, 34, '- 325', NULL),
(130, 34, '5 Series (19)', NULL),
(131, 34, ' - 524td', NULL),
(132, 34, '- 525i', NULL),
(133, 34, '- 525xi', NULL),
(134, 34, '- 528e', NULL),
(135, 34, '- 528i', NULL),
(136, 34, '- 528iT', NULL),
(137, 34, '- 530i', NULL),
(138, 34, '- 530iT', NULL),
(139, 34, '- 530xi', NULL),
(140, 34, '- 533i', NULL),
(141, 34, '- 535i', NULL),
(142, 34, '- 535i Gran Turismo', NULL),
(143, 34, '- 535xi', NULL),
(144, 34, '- 540i', NULL),
(145, 34, '- 545i', NULL),
(146, 34, '- 550i', NULL),
(147, 34, '- 550i Gran Turismo', NULL),
(148, 34, '-ActiveHybrid 5', NULL),
(149, 34, '6 Series (8)', NULL),
(150, 34, '- 633CSi', NULL),
(151, 34, '- 635CSi', NULL),
(152, 34, '- 640i', NULL),
(153, 34, '- 640i Gran Coupe', NULL),
(154, 34, '- 645Ci', NULL),
(155, 34, '- 650i', NULL),
(156, 34, '- 650i Gran Coupe', NULL),
(157, 34, '- L6', NULL),
(158, 34, '7 Series (15)', NULL),
(159, 34, '- 733i', NULL),
(160, 34, '- 735i', NULL),
(161, 34, '- 735iL', NULL),
(162, 34, '- 740i', NULL),
(163, 34, '- 740iL', NULL),
(164, 34, '- 740Li', NULL),
(165, 34, '- 745i', NULL),
(166, 34, '- 745Li', NULL),
(167, 34, '- 750i', NULL),
(168, 34, '- 750iL', NULL),
(169, 34, '- 750Li', NULL),
(170, 34, '- 760i', NULL),
(171, 34, '- 760Li', NULL),
(172, 34, '- ActiveHybrid 7', NULL),
(173, 34, '- Alpina B7', NULL),
(174, 34, '8 Series 4', NULL),
(175, 34, '- 840Ci', NULL),
(176, 34, '- 850Ci', NULL),
(177, 34, '- 850CSi', NULL),
(178, 34, '- 850i', NULL),
(179, 34, 'L Series (1)', NULL),
(180, 34, '- L7', NULL),
(181, 34, '- M Series (8)', NULL),
(182, 34, '- 1 Series M', NULL),
(183, 34, '- M Coupe', NULL),
(184, 34, '- M Roadster', NULL),
(185, 34, '- M3', NULL),
(186, 34, '- M5', NULL),
(187, 34, '- M6', NULL),
(188, 34, '- X5 M', NULL),
(189, 34, '- X6 M', NULL),
(190, 34, 'X Series (5)', NULL),
(191, 34, '- ActiveHybrid X6', NULL),
(192, 34, '- X1', NULL),
(193, 34, '- X3', NULL),
(194, 34, '- X5', NULL),
(195, 34, '- X6', NULL),
(196, 34, 'Z Series (3)', NULL),
(197, 34, '- Z3', NULL),
(198, 34, '- Z4', NULL),
(199, 34, '- Z8', NULL),
(200, 34, 'Other BMW Models', NULL),
(201, 35, 'Century', NULL),
(202, 35, 'Electra ', NULL),
(203, 35, 'Enclave', NULL),
(204, 35, 'Encore', NULL),
(205, 35, 'LaCrosse', NULL),
(206, 35, 'Le Sabre', NULL),
(207, 35, 'Lucerne', NULL),
(208, 35, 'Park Avenue', NULL),
(209, 35, 'Rainier', NULL),
(210, 35, 'Reatta', NULL),
(211, 35, 'Regal', NULL),
(212, 35, 'Rendezvous', NULL),
(213, 35, 'Riviera', NULL),
(214, 35, 'Roadmaster', NULL),
(215, 35, 'Skyhawk', NULL),
(216, 35, 'Skylark', NULL),
(217, 35, 'Somerset', NULL),
(218, 35, 'Terraza', NULL),
(219, 35, 'Verano', NULL),
(220, 35, 'Other Buick Models', NULL),
(221, 36, 'Allante', NULL),
(222, 36, 'ATS ', NULL),
(223, 36, 'Brougham', NULL),
(224, 36, 'Catera', NULL),
(225, 36, 'Cimarron', NULL),
(226, 36, 'CTS', NULL),
(227, 36, 'De Ville', NULL),
(228, 36, 'DTS', NULL),
(229, 36, 'Eldorado', NULL),
(230, 36, 'Escalade', NULL),
(231, 36, 'Escalade ESV', NULL),
(232, 36, 'Escalade EXT', NULL),
(233, 36, 'Fleetwood', NULL),
(234, 36, 'Seville', NULL),
(235, 36, 'SRX', NULL),
(236, 36, 'STS', NULL),
(237, 36, 'XLR', NULL),
(238, 36, 'XTS', NULL),
(239, 36, 'Other Cadillac Model', NULL),
(240, 37, 'Astro', NULL),
(241, 37, 'Avalanche ', NULL),
(242, 37, 'Aveo', NULL),
(243, 37, 'Aveo5', NULL),
(244, 37, 'Beretta', NULL),
(245, 37, 'Blazer', NULL),
(246, 37, 'Camaro', NULL),
(247, 37, 'Caprice', NULL),
(248, 37, 'Captiva Sport', NULL),
(249, 37, 'Cavalier', NULL),
(250, 37, 'Celebrity', NULL),
(251, 37, 'Chevette', NULL),
(252, 37, 'Citation', NULL),
(253, 37, 'Cobalt', NULL),
(254, 37, 'Colorado', NULL),
(255, 37, 'Corsica', NULL),
(256, 37, 'Corvette', NULL),
(257, 37, 'Cruze', NULL),
(258, 37, 'El Camino', NULL),
(259, 37, 'Equinox', NULL),
(260, 37, 'Express Van', NULL),
(261, 37, 'G Van', NULL),
(262, 37, 'HHR', NULL),
(263, 37, 'Impala', NULL),
(264, 37, 'Kodiak C4500', NULL),
(265, 37, 'Lumina', NULL),
(266, 37, 'Lumina APV', NULL),
(267, 37, 'LUV', NULL),
(268, 37, 'Malibu', NULL),
(269, 37, 'Metro', NULL),
(270, 37, 'Monte Carlo', NULL),
(271, 37, 'Nova', NULL),
(272, 37, 'Prizm', NULL),
(273, 37, 'S10 Blazer', NULL),
(274, 37, 'S10 Pickup', NULL),
(275, 37, 'Silverado and other ', NULL),
(276, 37, 'Silverado and other ', NULL),
(277, 37, 'Silverado and other ', NULL),
(278, 37, 'Sonic', NULL),
(279, 37, 'Spark', NULL),
(280, 37, 'Spectrum', NULL),
(281, 37, 'Sprint', NULL),
(282, 37, 'SSR', NULL),
(283, 37, 'Suburban', NULL),
(284, 37, 'Tahoe', NULL),
(285, 37, 'Tracker', NULL),
(286, 37, 'TrailBlazer', NULL),
(287, 37, 'TrailBlazer EXT', NULL),
(288, 37, 'Traverse', NULL),
(289, 37, 'Uplander', NULL),
(290, 37, 'Venture', NULL),
(291, 37, 'Volt', NULL),
(292, 37, 'Other Chevrolet Mode', NULL),
(293, 38, '200', NULL),
(294, 38, '300', NULL),
(295, 38, '300M', NULL),
(296, 38, 'Aspen', NULL),
(297, 38, 'Caravan', NULL),
(298, 38, 'Cirrus', NULL),
(299, 38, 'Concorde', NULL),
(300, 38, 'Conquest', NULL),
(301, 38, 'Cordoba', NULL),
(302, 38, 'Crossfire', NULL),
(303, 38, 'E Class', NULL),
(304, 38, 'Fifth Avenue', NULL),
(305, 38, 'Grand Voyager', NULL),
(306, 38, 'Imperial', NULL),
(307, 38, 'Intrepid', NULL),
(308, 38, 'Laser', NULL),
(309, 38, 'LeBaron', NULL),
(310, 38, 'LHS', NULL),
(311, 38, 'Neon', NULL),
(312, 38, 'New Yorker', NULL),
(313, 38, 'Newport', NULL),
(314, 38, 'Pacifica', NULL),
(315, 38, 'Prowler', NULL),
(316, 38, 'PT Cruiser', NULL),
(317, 38, 'Sebring', NULL),
(318, 38, 'TC by Maserati', NULL),
(319, 38, 'Town & Country', NULL),
(320, 38, 'Voyager', NULL),
(321, 38, 'Other Chrysler Model', NULL),
(322, 39, 'Lanos', NULL),
(323, 39, 'Leganza', NULL),
(324, 39, 'Nubira', NULL),
(325, 39, 'Other Daewoo Models', NULL),
(326, 40, 'Charade', NULL),
(327, 40, 'Rocky', NULL),
(328, 40, 'Other Daihatsu Model', NULL),
(329, 41, '200XS', NULL),
(330, 41, '210', NULL),
(331, 41, '280ZX', NULL),
(332, 41, '300ZX', NULL),
(333, 41, '310', NULL),
(334, 41, '510', NULL),
(335, 41, '720', NULL),
(336, 41, '810', NULL),
(337, 41, 'Maxima', NULL),
(338, 41, 'Pickup', NULL),
(339, 41, 'Pulsar', NULL),
(340, 41, 'Sentra', NULL),
(341, 41, 'Stanza', NULL),
(342, 41, 'Other Datsun Models', NULL),
(343, 42, 'DMC-12', NULL),
(344, 43, '400', NULL),
(345, 43, '600', NULL),
(346, 43, 'Aries', NULL),
(347, 43, 'Avenger', NULL),
(348, 43, 'Caliber', NULL),
(349, 43, 'Caravan', NULL),
(350, 43, 'Challenger', NULL),
(351, 43, 'Charger', NULL),
(352, 43, 'Colt', NULL),
(353, 43, 'Conquest', NULL),
(354, 43, 'D/W Truck', NULL),
(355, 43, 'Dakota', NULL),
(356, 43, 'Dart', NULL),
(357, 43, 'Daytona', NULL),
(358, 43, 'Diplomat', NULL),
(359, 43, 'Durango', NULL),
(360, 43, 'Dynasty', NULL),
(361, 43, 'Grand Caravan', NULL),
(362, 43, 'Intrepid', NULL),
(363, 43, 'Journey', NULL),
(364, 43, 'Lancer', NULL),
(365, 43, 'Magnum', NULL),
(366, 43, 'Mirada', NULL),
(367, 43, 'Monaco', NULL),
(368, 43, 'Neon', NULL),
(369, 43, 'Nitro', NULL),
(370, 43, 'Omni', NULL),
(371, 43, 'Raider', NULL),
(372, 43, 'Ram 1500 Truck', NULL),
(373, 43, 'Ram 2500 Truck', NULL),
(374, 43, 'Ram 3500 Truck', NULL),
(375, 43, 'Ram 4500 Truck', NULL),
(376, 43, 'Ram 50 Truck', NULL),
(377, 43, 'RAM C/V', NULL),
(378, 43, 'Ram SRT-10', NULL),
(379, 43, 'Ram Van', NULL),
(380, 43, 'Ram Wagon', NULL),
(381, 43, 'Ramcharger', NULL),
(382, 43, 'Rampage', NULL),
(383, 43, 'Shadow', NULL),
(384, 43, 'Spirit', NULL),
(385, 43, 'Sprinter', NULL),
(386, 43, 'SRT-4', NULL),
(387, 43, 'St. Regis', NULL),
(388, 43, 'Stealth', NULL),
(389, 43, 'Stratus', NULL),
(390, 43, 'Viper', NULL),
(391, 43, 'Other Dodge Models', NULL),
(392, 44, 'Medallion', NULL),
(393, 44, 'Premier', NULL),
(394, 44, 'Summit', NULL),
(395, 44, 'Talon', NULL),
(396, 44, 'Vision', NULL),
(397, 44, 'Other Eagle Models', NULL),
(398, 45, '308 GTB Quattrovalvo', NULL),
(399, 45, '308 GTBI', NULL),
(400, 45, '308 GTS Quattrovalvo', NULL),
(401, 45, '308 GTSI', NULL),
(402, 45, '328 GTB', NULL),
(403, 45, '328 GTS', NULL),
(404, 45, '348 GTB', NULL),
(405, 45, '348 GTS', NULL),
(406, 45, '348 Spider', NULL),
(407, 45, '348 TB', NULL),
(408, 45, '348 TS', NULL),
(409, 45, '360', NULL),
(410, 45, '456 GT', NULL),
(411, 45, '456M GT', NULL),
(412, 45, '458 Italia', NULL),
(413, 45, '512 BBi', NULL),
(414, 45, '512M', NULL),
(415, 45, '512TR', NULL),
(416, 45, '550 Maranello', NULL),
(417, 45, '575M Maranello', NULL),
(418, 45, '599 GTB Fiorano', NULL),
(419, 45, '599 GTO', NULL),
(420, 45, '612 Scaglietti', NULL),
(421, 45, 'California', NULL),
(422, 45, 'Enzo', NULL),
(423, 45, 'F355', NULL),
(424, 45, 'F40', NULL),
(425, 45, 'F430', NULL),
(426, 45, 'F50', NULL),
(427, 45, 'FF', NULL),
(428, 45, 'Mondial', NULL),
(429, 45, 'Testarossa', NULL),
(430, 45, 'Other Ferrari Models', NULL),
(431, 46, '2000 Spider', NULL),
(432, 46, '500', NULL),
(433, 46, 'Bertone X1/9', NULL),
(434, 46, 'Brava', NULL),
(435, 46, 'Pininfarina Spider', NULL),
(436, 46, 'Strada', NULL),
(437, 46, 'X1/9', NULL),
(438, 46, 'Other Fiat Models', NULL),
(439, 47, 'Karma', NULL),
(440, 48, 'Aerostar', NULL),
(441, 48, 'Aspire', NULL),
(442, 48, 'Bronco', NULL),
(443, 48, 'Bronco II', NULL),
(444, 48, 'C-MAX', NULL),
(445, 48, 'Club Wagon', NULL),
(446, 48, 'Contour', NULL),
(447, 48, 'Courier', NULL),
(448, 48, 'Crown Victoria', NULL),
(449, 48, 'E-150 and Econoline ', NULL),
(450, 48, 'E-250 and Econoline ', NULL),
(451, 48, 'E-350 and Econoline ', NULL),
(452, 48, 'Edge', NULL),
(453, 48, 'Escape', NULL),
(454, 48, 'Escort', NULL),
(455, 48, 'Excursion', NULL),
(456, 48, 'EXP', NULL),
(457, 48, 'Expedition', NULL),
(458, 48, 'Expedition EL', NULL),
(459, 48, 'Explorer', NULL),
(460, 48, 'Explorer Sport Trac', NULL),
(461, 48, 'F100', NULL),
(462, 48, 'F150', NULL),
(463, 48, 'F250', NULL),
(464, 48, 'F350', NULL),
(465, 48, 'F450', NULL),
(466, 48, 'Fairmont', NULL),
(467, 48, 'Festiva', NULL),
(468, 48, 'Fiesta', NULL),
(469, 48, 'Five Hundred', NULL),
(470, 48, 'Flex', NULL),
(471, 48, 'Focus', NULL),
(472, 48, 'Freestar', NULL),
(473, 48, 'Freestyle', NULL),
(474, 48, 'Fusion', NULL),
(475, 48, 'Granada', NULL),
(476, 48, 'Other Ford Models', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_types`
--

CREATE TABLE `thai_category_types` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) DEFAULT NULL,
  `title_th` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_types`
--

INSERT INTO `thai_category_types` (`id`, `category_id`, `title`, `title_th`) VALUES
(1, 4, 'New', NULL),
(2, 4, 'Old', NULL),
(3, 5, 'New', NULL),
(4, 5, 'Old', NULL),
(5, 6, 'New', NULL),
(6, 6, 'Old', NULL),
(7, 7, 'New', NULL),
(8, 7, 'Old', NULL),
(9, 8, 'Full-Time', NULL),
(10, 8, 'Part-Time', NULL),
(11, 8, 'Temporary', NULL),
(12, 9, 'Full-Time', NULL),
(13, 9, 'Part-Time', NULL),
(14, 9, 'Temporary', NULL),
(15, 10, 'Full-Time', NULL),
(16, 10, 'Part-Time', NULL),
(17, 10, 'Temporary', NULL),
(18, 11, 'Full-Time', NULL),
(19, 11, 'Part-Time', NULL),
(20, 11, 'Temporary', NULL),
(21, 12, 'Full-Time', NULL),
(22, 12, 'Part-Time', NULL),
(23, 12, 'Temporary', NULL),
(24, 13, 'Full-Time', NULL),
(25, 13, 'Part-Time', NULL),
(26, 13, 'Temporary', NULL),
(27, 18, 'Acura', NULL),
(28, 18, 'Alfa Romeo', NULL),
(29, 18, 'AMC', NULL),
(30, 18, 'Aston Martin', NULL),
(31, 18, 'Audi', NULL),
(32, 18, 'Avanti', NULL),
(33, 18, 'Bentley', NULL),
(34, 18, 'BMW', NULL),
(35, 18, 'Buick', NULL),
(36, 18, 'Cadillac', NULL),
(37, 18, 'Chevrolet', NULL),
(38, 18, 'Chrysler', NULL),
(39, 18, 'Daewoo', NULL),
(40, 18, 'Daihatsu', NULL),
(41, 18, 'Datsun', NULL),
(42, 18, 'DeLorean', NULL),
(43, 18, 'Dodge', NULL),
(44, 18, 'Eagle', NULL),
(45, 18, 'Ferrari', NULL),
(46, 18, 'FIAT', NULL),
(47, 18, 'Fisker', NULL),
(48, 18, 'Ford', NULL),
(49, 18, 'Freightliner', NULL),
(50, 18, 'Geo', NULL),
(51, 18, 'GMC,', NULL),
(52, 18, 'Honda,', NULL),
(53, 18, 'HUMMER', NULL),
(54, 18, 'Hyundai', NULL),
(55, 18, 'Infiniti', NULL),
(56, 18, 'Isuzu', NULL),
(57, 18, 'Jaguar', NULL),
(58, 18, 'Jeep', NULL),
(59, 18, 'Kia', NULL),
(60, 18, 'Lamborghini', NULL),
(61, 18, 'Lancia', NULL),
(62, 18, 'Land Rover', NULL),
(63, 18, 'Lexus', NULL),
(64, 18, 'Lincoln', NULL),
(65, 18, 'Lotus', NULL),
(66, 18, 'Maserati', NULL),
(67, 18, 'Maybach', NULL),
(68, 18, 'Mazda', NULL),
(69, 18, 'McLaren', NULL),
(70, 18, 'Mercedes-Benz', NULL),
(71, 18, 'Mercury', NULL),
(72, 18, 'Merkur', NULL),
(73, 18, 'MINI', NULL),
(74, 18, 'Mitsubishi', NULL),
(75, 18, 'Nissan', NULL),
(76, 18, 'Oldsmobile', NULL),
(77, 18, 'Peugeot', NULL),
(78, 18, 'Maserati', NULL),
(79, 18, 'Plymouth', NULL),
(80, 18, 'Pontiac', NULL),
(81, 18, 'Porsche', NULL),
(82, 18, 'RAM', NULL),
(83, 18, 'Renault', NULL),
(84, 18, 'Rolls-Royce', NULL),
(85, 18, 'Saab', NULL),
(86, 18, 'Saturn', NULL),
(87, 18, 'Scion', NULL),
(88, 18, 'smart', NULL),
(89, 18, 'SRT', NULL),
(90, 18, 'Sterling', NULL),
(91, 18, 'Subaru', NULL),
(92, 18, 'Suzuki', NULL),
(93, 18, 'Tesla', NULL),
(94, 18, 'Toyota', NULL),
(95, 18, 'Volkswagen', NULL),
(96, 18, 'Volvo', NULL),
(97, 18, 'Yugo', NULL),
(98, 18, 'Triumph', NULL),
(99, 19, 'Car Parts', NULL),
(100, 19, 'Other Parts', NULL),
(101, 19, 'Spare Parts', NULL),
(102, 20, 'Commercial Vehicles', NULL),
(103, 21, 'Other Vehicles', NULL),
(104, 22, 'Honda', NULL),
(105, 22, 'Bajaj', NULL),
(106, 22, 'TVS', NULL),
(107, 22, 'Suzuki', NULL),
(108, 22, 'Kinetic', NULL),
(109, 22, 'Mahindra', NULL),
(110, 23, 'Hercules', NULL),
(111, 23, 'BSA', NULL),
(112, 23, 'Atlas', NULL),
(113, 23, 'Avon', NULL),
(114, 23, 'Firefox', NULL),
(115, 23, 'Trek', NULL),
(116, 25, 'Rent', NULL),
(117, 25, 'Sale', NULL),
(118, 26, 'Rent', NULL),
(119, 26, 'Sale', NULL),
(120, 27, 'Rent', NULL),
(121, 27, 'Sale', NULL),
(122, 28, 'Lease', NULL),
(123, 28, 'Sale', NULL),
(124, 29, 'Sharing', NULL),
(125, 29, 'Rent', NULL),
(126, 30, 'Rent', NULL),
(127, 32, 'Women', NULL),
(128, 32, 'Men', NULL),
(129, 33, 'Women', NULL),
(130, 33, 'Men', NULL),
(131, 34, 'Women', NULL),
(132, 34, 'Men', NULL),
(133, 36, 'Laptops', NULL),
(134, 36, 'Computers', NULL),
(135, 36, 'Internet', NULL),
(136, 36, 'Printers', NULL),
(137, 36, 'Monitors', NULL),
(138, 36, 'Hard Disk', NULL),
(139, 36, 'Other Accessories', NULL),
(140, 37, 'Other Accessories', NULL),
(141, 38, 'Video-Audio', NULL),
(142, 38, 'TV', NULL),
(143, 39, 'Cameras', NULL),
(144, 39, 'Lenses', NULL),
(145, 39, 'Other Accessories', NULL),
(146, 40, 'Games and Entertainm', NULL),
(147, 41, 'Fridges', NULL),
(148, 41, 'Washing Machines', NULL),
(149, 41, 'AC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_chat`
--

CREATE TABLE `thai_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `touser_id` int(11) NOT NULL DEFAULT 0,
  `msg` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_chat`
--

INSERT INTO `thai_chat` (`id`, `chat_id`, `product_id`, `user_id`, `touser_id`, `msg`, `status`, `trash`, `created_date`) VALUES
(1, 1234, 1, 5, 6, 'Sed ut perspiciatis unde omnis iste natus.', 1, 0, '2020-01-27 23:25:53'),
(2, 12345, 4, 6, 5, 'Ut enim ad minima veniam, quis nostrum exercitationem.', 1, 0, '2020-01-28 22:14:18'),
(3, 12345, 4, 6, 5, 'This is my testing message', 1, 0, '2020-02-15 23:12:07'),
(4, 1234, 1, 6, 5, 'ld fjasldjk flskdjflkjs\'df', 1, 0, '2020-02-15 23:15:30'),
(5, 12345, 4, 6, 5, 'sdk flskdflsdfj', 1, 0, '2020-02-16 16:51:53'),
(6, 12345, 4, 6, 5, 'sdjfl sjl fsdfwoefj lskdfj', 1, 0, '2020-02-16 16:54:48'),
(7, 12345, 4, 5, 6, 'slkdj flsjd fkls', 1, 0, '2020-02-16 16:55:26'),
(8, 12345, 4, 5, 6, 'djf owiflsk jdfow fkls oiw', 1, 0, '2020-02-16 17:02:43'),
(9, 12345, 4, 6, 5, 'jf owfsoiwejs djfoiwjefjsfojiw oe ', 1, 0, '2020-02-16 17:05:25'),
(10, 12345, 4, 6, 5, 'mg jgj hg ', 1, 0, '2020-02-18 10:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `thai_cms`
--

CREATE TABLE `thai_cms` (
  `type` varchar(50) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_cms`
--

INSERT INTO `thai_cms` (`type`, `content`) VALUES
('aboutus', '<h1>About Us</h1>\r\n<p>This is our About Us page</p>'),
('privacy_policy', '<h1>Privacy Policy</h1>\r\n<p>This is our privacy policy page</p>'),
('terms_and_conditions', '<h1>Terms and Conditions</h1>\r\n<p>This is our terms and conditions page</p>'),
('top_offers', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `thai_emails`
--

CREATE TABLE `thai_emails` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `adminname` text NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `adminemail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_emails`
--

INSERT INTO `thai_emails` (`id`, `type`, `adminname`, `subject`, `body`, `adminemail`) VALUES
(1, 'signup', 'Admin', 'Create Account', '<p>Dear {{Name}}</p>\r\n<p>Thanks for creating Account.</p>\r\n<p>Your Email: {{Email}}</p>\r\n<p>Password: {{Password}}</p>\r\n<p>Click on following link to actvate your account ! :</p>\r\n<p>{{ConfirmationLink}}</p>\r\n<p>&nbsp;</p>', 'info@domain.com'),
(2, 'forgot password', 'Admin', 'Forgot Password', '<p>Dear {{Name}}</p>\r\n<p>Your login detail is</p>\r\n<p>Your Email: {{Email}}</p>\r\n<p>Password: {{Password}}</p>\r\n<p>&nbsp;</p>', 'info@domain.com'),
(3, 'change password', 'Admin', 'Change Password', '<p>Dear {{Name}}</p>\r\n<p>Your password have been changed successfully</p>\r\n<p>Your Email: {{Email}}</p>\r\n<p>Password: {{Password}}</p>\r\n<p>&nbsp;</p>', 'info@domain.com'),
(4, 'add posted', 'Admin', 'Ad Posted Successfully', '<p>Dear {{Name}}</p>\r\n<p>Your Ad is posted successfully.</p>\r\n<p>Your Ad id is \r\n: {{id}}</p>', 'info@domain.com'),
(5, 'post bid', 'Admin', 'Post Bid', '<p>Dear {{Name}}</p>\r\n<p>Your have post a bid on product successfully.</p>\r\n<p>Your Bid product is : {{bid_product}}</p>\r\n<p>Your Bid Amount is : {{bid_amount}}</p>', 'info@domain.com');

-- --------------------------------------------------------

--
-- Table structure for table `thai_faq`
--

CREATE TABLE `thai_faq` (
  `id` int(25) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `trash` int(2) NOT NULL DEFAULT 0,
  `status` int(2) NOT NULL DEFAULT 1,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_faq`
--

INSERT INTO `thai_faq` (`id`, `title`, `description`, `trash`, `status`, `creation_date`) VALUES
(1, 'Simply dummy text of the printing', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2020-01-10 09:59:51'),
(2, 'What is faq ?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2020-01-10 10:02:56'),
(3, 'simply dummy text of the printing', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2020-01-10 11:37:48'),
(4, 'Dummy text of the printing', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2020-01-10 12:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `thai_news`
--

CREATE TABLE `thai_news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `img` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_news`
--

INSERT INTO `thai_news` (`id`, `title`, `description`, `img`, `status`, `trash`, `created_date`) VALUES
(1, 'Holiday Shopping Is Here, and Mostly on Our Mobile Devices', 'When we think of Black Friday, we often picture people lining up outside stores at the crack of dawn, trampling each other in pursuit of a discounted television. For this holiday-shopping season, anchored by both Black Friday and Cyber Monday, more shoppers than ever will be staying at home and turning to their phones. ', 'blog1.png', 1, 0, '2020-02-10 00:08:06'),
(2, 'LOREM IPSUM DOLOR SIT AMET', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', 'blog2.png', 1, 0, '2020-02-10 00:32:28'),
(3, 'No plugs needed: How wireless charging could set electric cars free  ', 'ELECTRIC cars have several advantages over gas guzzlers, but having to plug them in every day isn’t one of them. The good news is that you may not need to – all electric cars could soon come with wireless chargers.“I won’t buy a car I have to plug in again,” says engineer Olaf Simon, who organised a trial of wireless charging in Berlin, Germany. ', 'blog3.png', 1, 0, '2020-02-10 00:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `thai_orders`
--

CREATE TABLE `thai_orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_orders`
--

INSERT INTO `thai_orders` (`id`, `product_id`, `price`, `qty`, `status`, `trash`, `created_date`) VALUES
(1, 1, 800, 1, 0, 0, '2020-02-13 22:50:48'),
(2, 5, 500, 1, 0, 0, '2020-02-13 22:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `thai_products`
--

CREATE TABLE `thai_products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_th` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '0 = Pending, 1 = Active, 2 = Sold, 3 = Expired',
  `trash` int(2) DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL DEFAULT 0,
  `location` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ad_type` int(11) NOT NULL DEFAULT 0 COMMENT '0=Private, 1=Business',
  `submodel` varchar(20) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `year_registration` year(4) DEFAULT NULL,
  `driven` int(11) NOT NULL DEFAULT 0,
  `fuel_type` varchar(50) DEFAULT NULL,
  `gearbox` varchar(50) DEFAULT NULL,
  `features` varchar(100) DEFAULT NULL,
  `featured` int(11) NOT NULL DEFAULT 0,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `sort_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_products`
--

INSERT INTO `thai_products` (`id`, `category_id`, `subcategory_id`, `user_id`, `title`, `description_en`, `description_th`, `status`, `trash`, `created_date`, `price`, `location`, `type`, `ad_type`, `submodel`, `model`, `brand`, `year_registration`, `driven`, `fuel_type`, `gearbox`, `features`, `featured`, `latitude`, `longitude`, `sort_date`, `views`) VALUES
(1, 16, 18, 5, 'New Tesla5 for sale', 'Test Drive First.New Tesla for sale is available', NULL, 1, 0, '2020-02-05 17:53:35', 800, 'Berlin, Germany', 'abc', 0, NULL, 'TS-5T', 'Mercedes', 2020, 11, 'Gasoline', 'vbn', 'No', 1, '51.58250734077006', '-1.4598505851562549', '2020-03-09 17:53:54', 5),
(2, 2, 8, 6, 'Full Stack Developer', 'We are looking to hire urgently developer.The candidate must have Web Application Design and implementation. Work closely with Mobile App developers. Design and implement front-end and back-end of web dashboard for mobile', NULL, 1, 0, '2020-02-05 17:55:02', 750, 'Office#7, anchorage, Alaska', 'Urgent ', 0, NULL, '', 'Issac\\\'s Code', 2016, 0, '', '', '', 1, '', '', '2020-03-09 17:53:54', 0),
(3, 1, 7, 6, ' Multi Color Solar Light Pots for outdoor Garden', 'These plants pots are in multi color with solar light embedded.Best pots for your Outdoor garden', NULL, 1, 0, '2020-02-10 07:24:22', 350, '25 notting hill, Anchorage, Alaska', '', 0, NULL, '', '', 0000, 0, '', '', '', 1, '', '', '2020-03-09 17:53:54', 0),
(4, 24, 25, 8, 'Puppy for sale', 'Its Half breed german shephard puppy for sale', NULL, 3, 0, '2020-02-10 13:45:07', 150, 'rawalpindi', 'rent', 0, NULL, 'Half-Breed small size ', 'Half Breed German Shephard', 2000, 0, '', '', '', 1, '	33.738045', '	73.084488', '2020-03-09 17:53:54', 1),
(5, 24, 25, 5, 'Fully Automatic Washing Machinw', '- 10 Year Motor Warranty, - Fully Automatic Washing Machine, - Anti Bacterial Wash, - One way wash', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-02-10 13:57:43', 500, 'Berlin, Germany', '', 0, NULL, ' HWM 85-826', 'Haier', 0000, 0, '', '', 'NO', 1, '', '', '2020-03-09 17:53:54', 1),
(6, 24, 25, 0, 'Khan Hut', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL, 2, 0, '2020-02-16 17:16:46', 40000, 'London, UK', 'rent', 0, NULL, '', '', 2013, 0, '', '', 'Lot of benefits', 0, '51.58250734077006', '-0.09754589765625488', '2020-03-09 17:53:54', 1),
(7, 24, 26, 6, 'Old Buddies', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', NULL, 2, 0, '2020-02-16 17:37:41', 3000, 'North Wessex', 'buy', 0, NULL, '', '', 0000, 0, '', '', '', 0, '51.483411449684205', '-1.4598505851562549', '2020-03-09 17:53:54', 1),
(8, 2, 11, 6, 'testing for langauage', 'hello i am fine how are you\r\nhow are you\r\n\r\n', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-03-09 13:20:27', 36, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Full-Time', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-09 18:20:27', 0),
(9, 2, 13, 6, 'jobs needes', 'jobs are required', 'ทำงานต้องการ', 1, 0, '2020-03-10 07:11:59', 20000, 'Streatham, London, UK', 'Full-Time', 0, '', '', '', 0000, 0, '', NULL, '', 0, '51.5073509', '-0.1277583', '2020-03-10 12:11:59', 0),
(10, 24, 27, 6, 'House', 'house for rent', 'บ้านสำหรับค่าเช่า', 1, 0, '2020-03-10 08:05:15', 4334, 'Tate Modern, Bankside, London, UK', 'Rent', 0, '', '', '', 0000, 0, '', NULL, '', 0, '51.50759530000001', '-0.09935640000000001', '2020-03-10 13:05:15', 5),
(11, 16, 18, 6, 'Car for sale', 'urgent car sale in low price', 'เร่งด่วนรถขายในราคาต่ำ', 1, 0, '2020-03-10 08:15:50', 5678, 'John Lewis & Partners, Oxford Street, London, UK', 'Honda,', 0, '', 'MPV', 'civic', 2017, 25000, '', NULL, '1-2-3', 0, '51.5154109', '-0.145197', '2020-03-10 13:15:50', 0),
(12, 31, 32, 6, 'dssd', 'hello', 'สวัสดี', 1, 0, '2020-03-11 06:28:50', 88, 'Heathrow Airport (LHR), Longford, UK', 'Women', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.4700223', '-0.4542955', '2020-03-11 11:28:50', 0),
(13, 35, 38, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:35:41', 4455, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.2868939', '-0.752615', '2020-03-11 15:35:41', 0),
(14, 35, 38, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:38:14', 4455, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 15:38:14', 0),
(15, 35, 38, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:40:51', 4455, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 15:40:51', 0),
(16, 35, 38, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:42:59', 4455, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 15:42:59', 0),
(17, 35, 38, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:49:12', 4455, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 15:49:12', 0),
(18, 35, 41, 6, 'led for sale', 'led for sale', 'นำออกขาย', 1, 0, '2020-03-11 10:52:13', 4455, 'Farnborough, UK', 'AC', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 15:52:13', 0),
(19, 35, 38, 6, 'testing ad', 'testing', 'การทดสอบ', 1, 0, '2020-03-11 11:47:34', 555, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.2868939', '-0.752615', '2020-03-11 16:47:34', 0),
(20, 35, 38, 6, 'testing ad', 'testing', 'การทดสอบ', 1, 0, '2020-03-11 11:49:03', 555, 'Farnborough, UK', 'TV', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-11 16:49:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_product_favorites`
--

CREATE TABLE `thai_product_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_product_favorites`
--

INSERT INTO `thai_product_favorites` (`id`, `user_id`, `product_id`) VALUES
(5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `thai_product_images`
--

CREATE TABLE `thai_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `img` varchar(50) NOT NULL,
  `main` int(2) NOT NULL DEFAULT 0 COMMENT '1=main image',
  `trash` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_product_images`
--

INSERT INTO `thai_product_images` (`id`, `product_id`, `img`, `main`, `trash`) VALUES
(1, 1, '202002071723512487.png', 1, 0),
(4, 1, '202002071741093981.png', 0, 1),
(5, 1, '202002071746299248.png', 0, 1),
(6, 1, '202002071749091795.png', 0, 1),
(7, 1, '202002101323588361.jpg', 0, 0),
(9, 1, '202002101342456749.jpg', 0, 0),
(10, 3, '202002101417235422.jpg', 1, 0),
(11, 2, '202002101436434498.jpg', 1, 0),
(12, 4, '202002101445293568.jpg', 1, 0),
(13, 4, '202002101445293439.jpg', 0, 0),
(14, 5, '202002101458191571.jpg', 1, 0),
(15, 5, '202002101458199157.jpg', 0, 0),
(16, 5, '202002101458198303.jpg', 0, 0),
(17, 6, '202002161816466520.jpg', 1, 0),
(18, 6, '202002161816462586.jpg', 0, 0),
(19, 6, '202002161816465771.jpg', 0, 0),
(20, 7, '202002161837414552.jpg', 1, 0),
(21, 7, '202002161837418629.jpg', 0, 0),
(22, 9, '202003100811599256.jpg', 1, 0),
(23, 9, '202003100811593020.png', 0, 0),
(24, 9, '202003100811594916.png', 0, 0),
(25, 10, '202003100905155415.jpg', 1, 0),
(26, 10, '202003100905158672.jpg', 0, 0),
(27, 11, '202003100915502172.jpg', 1, 0),
(28, 13, '202003111135415215.jpg', 1, 0),
(29, 14, '202003111138148938.jpg', 1, 0),
(30, 19, '202003111247344102.jpg', 1, 0),
(31, 20, '202003111249031546.png', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_settings`
--

CREATE TABLE `thai_settings` (
  `id` int(11) NOT NULL,
  `option_name` varchar(100) NOT NULL,
  `value_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_settings`
--

INSERT INTO `thai_settings` (`id`, `option_name`, `value_name`) VALUES
(1, 'site title', 'SALE THAILAND'),
(2, 'show records', '30'),
(16, 'site address', 'H 598 St 4-b'),
(17, 'discount', '200');

-- --------------------------------------------------------

--
-- Table structure for table `thai_subscribe`
--

CREATE TABLE `thai_subscribe` (
  `id` int(100) NOT NULL,
  `email` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `thai_users`
--

CREATE TABLE `thai_users` (
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id` int(100) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `zip` int(40) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `post_ads` int(11) NOT NULL DEFAULT 0,
  `bump_up` int(11) NOT NULL DEFAULT 0,
  `package_id` int(11) NOT NULL DEFAULT 0,
  `package_date` datetime DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0=user, 1=partner',
  `login` int(11) NOT NULL DEFAULT 0 COMMENT '0=logout, 1=login',
  `login_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_users`
--

INSERT INTO `thai_users` (`name`, `phone`, `email`, `id`, `password`, `img`, `status`, `zip`, `state`, `city`, `address`, `post_ads`, `bump_up`, `package_id`, `package_date`, `trash`, `created_date`, `type`, `login`, `login_time`) VALUES
('Ben Dunk', '+98712364-55', 'test@test.com', 5, 'MTIzNDU=', NULL, 1, 123456, 'north', 'Bjdiensl', 'thailand', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0, 0, '2020-03-10 12:15:10'),
('vender 1', '+123456789', 'test1@test1.com', 6, 'MTIzNDU=', '202003101321348762.png', 1, 12345678, 'Rljwei', 'Piwjespkkkk', 'Idlkweji wie jsd wfgi gdj fjxvsnjd', 9, 6, 1, NULL, 0, '2020-01-10 06:52:30', 1, 1, '2020-03-11 11:24:53'),
('sammy', '1098761', 'test2@test2.com', 8, 'MTIzNDU=', NULL, 1, 12345, 'Jfiekl', 'Lweijdi', 'Saoi asdifj  cxm nv,mxjvd nvdjsdl', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0, 0, '2020-03-05 11:59:45'),
('test4', NULL, 'test4@test4.com', 17, 'MTIzNDU=', NULL, 1, 0, 'fsdff', 'fsdfdf', 'fddfdf', 0, 0, 0, NULL, 0, '2020-02-28 10:03:56', 0, 0, '2020-03-05 11:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `thai_vendor_packages`
--

CREATE TABLE `thai_vendor_packages` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `post_ads` int(11) NOT NULL DEFAULT 0,
  `bump_up` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_vendor_packages`
--

INSERT INTO `thai_vendor_packages` (`id`, `title`, `price`, `post_ads`, `bump_up`, `status`, `trash`, `created_date`) VALUES
(1, 'Free', 0, 3, 0, 1, 0, '2020-02-16 17:49:30'),
(2, 'Silver', 10, 10, 3, 1, 0, '2020-02-16 17:49:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `thai_admin`
--
ALTER TABLE `thai_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_banners`
--
ALTER TABLE `thai_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_bidding`
--
ALTER TABLE `thai_bidding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_categories`
--
ALTER TABLE `thai_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_category_features`
--
ALTER TABLE `thai_category_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_category_models`
--
ALTER TABLE `thai_category_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_category_submodels`
--
ALTER TABLE `thai_category_submodels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_category_types`
--
ALTER TABLE `thai_category_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_chat`
--
ALTER TABLE `thai_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_cms`
--
ALTER TABLE `thai_cms`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `thai_emails`
--
ALTER TABLE `thai_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_faq`
--
ALTER TABLE `thai_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_news`
--
ALTER TABLE `thai_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_orders`
--
ALTER TABLE `thai_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_products`
--
ALTER TABLE `thai_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_product_favorites`
--
ALTER TABLE `thai_product_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`);

--
-- Indexes for table `thai_product_images`
--
ALTER TABLE `thai_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_settings`
--
ALTER TABLE `thai_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_subscribe`
--
ALTER TABLE `thai_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_users`
--
ALTER TABLE `thai_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_vendor_packages`
--
ALTER TABLE `thai_vendor_packages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `thai_admin`
--
ALTER TABLE `thai_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `thai_banners`
--
ALTER TABLE `thai_banners`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thai_bidding`
--
ALTER TABLE `thai_bidding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thai_categories`
--
ALTER TABLE `thai_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `thai_category_features`
--
ALTER TABLE `thai_category_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `thai_category_models`
--
ALTER TABLE `thai_category_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `thai_category_submodels`
--
ALTER TABLE `thai_category_submodels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT for table `thai_category_types`
--
ALTER TABLE `thai_category_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `thai_chat`
--
ALTER TABLE `thai_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `thai_emails`
--
ALTER TABLE `thai_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thai_faq`
--
ALTER TABLE `thai_faq`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `thai_news`
--
ALTER TABLE `thai_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thai_orders`
--
ALTER TABLE `thai_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `thai_products`
--
ALTER TABLE `thai_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `thai_product_favorites`
--
ALTER TABLE `thai_product_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thai_product_images`
--
ALTER TABLE `thai_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `thai_settings`
--
ALTER TABLE `thai_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `thai_subscribe`
--
ALTER TABLE `thai_subscribe`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thai_users`
--
ALTER TABLE `thai_users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `thai_vendor_packages`
--
ALTER TABLE `thai_vendor_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
