-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 11:38 AM
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
(41, 35, 'Fridge AC and Washing Machine', '\r\nตู้เย็น AC และเครื่องซักผ้า', 'Searching for Fridge AC and Washing Machine??', 1, 0, '2020-02-10 12:01:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_features`
--

CREATE TABLE `thai_category_features` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(25) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_features`
--

INSERT INTO `thai_category_features` (`id`, `category_id`, `title_en`, `title_th`) VALUES
(1, 18, 'Air conditioner', 'เครื่องปรับอากาศ'),
(2, 18, 'Music System', 'ระบบเพลง'),
(3, 18, 'GPS', 'จีพีเอส'),
(5, 18, 'Security Systems', 'ระบบรักษาความปลอดภัย'),
(6, 18, 'Parking Sensor', 'เซ็นเซอร์ที่จอดรถ'),
(7, 18, 'Parking Camera\\\'s', 'ลานจอดรถของกล้องเป็น'),
(8, 18, 'Stepney', 'สเตปนี'),
(9, 18, 'Jack', 'ช่องเสียบ'),
(10, 18, 'Auto Gear', 'เกียร์ออโต้'),
(11, 18, 'Fog Lamp', 'ไฟตัดหมอก'),
(12, 18, 'ABS', 'เอบีเอส'),
(13, 18, 'Air Bags', 'ถุงลม'),
(14, 22, 'Speedometer', 'เครื่องวัดความเร็ว'),
(15, 22, 'Fuel Guage', 'มาตรวัดน้ำมันเชื้อเพลิง'),
(16, 22, 'Digital Fuel Gauge', 'มาตรวัดน้ำมันดิจิตอล'),
(17, 22, 'Electric Start', 'สตาร์ทไฟฟ้า'),
(18, 22, 'Tachometer', 'เครื่องวัดวามเร็ว'),
(19, 22, 'Low Fuel Indicator', 'ตัวบ่งชี้เชื้อเพลิงต่ำ'),
(20, 22, 'Low Oil Indicator', 'ตัวบ่งชี้น้ำมันต่ำ'),
(21, 22, 'Low Battery Indicator', 'ไฟแสดงสถานะแบตเตอรี่อ่อน'),
(22, 22, 'Battery', 'แบตเตอรี่'),
(23, 22, 'Pass Light', 'ผ่านแสง'),
(24, 18, 'Sespension', 'Sespension');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_models`
--

CREATE TABLE `thai_category_models` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_models`
--

INSERT INTO `thai_category_models` (`id`, `category_id`, `title_en`, `title_th`) VALUES
(1, 18, 'SUV', 'เอสยูวี'),
(2, 18, 'MPV', 'MPV'),
(3, 18, 'Pick Up', 'ไปรับ'),
(4, 18, 'Seaden', 'Seaden'),
(5, 18, 'Hatchback', 'ฟักกลับมา'),
(6, 18, 'Sport', 'กีฬา'),
(7, 22, 'Big Scooter', 'สกู๊ตเตอร์ขนาดใหญ่'),
(8, 22, 'Chooper', 'มีด'),
(9, 22, 'Moto Cross', 'โมโตครอส'),
(10, 22, 'Naked Bike', 'จักรยานเปล่า'),
(11, 22, 'Sports', 'กีฬา'),
(12, 22, 'Touring', 'การท่องเที่ยว');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_submodels`
--

CREATE TABLE `thai_category_submodels` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(25) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_submodels`
--

INSERT INTO `thai_category_submodels` (`id`, `type_id`, `title_en`, `title_th`) VALUES
(1, 27, 'CL Models (4)', 'รุ่น CL (4)'),
(2, 27, '-2.2CL', '-2.2CL'),
(3, 27, '-2.3CL', '-2.3CL'),
(4, 27, '-3.0CL', '-3.0CL'),
(5, 27, '-3.2CL', '-3.2CL'),
(6, 27, 'ILX', 'ILX'),
(7, 27, 'Integra', 'Integra'),
(8, 27, 'Legend', 'ตำนาน'),
(9, 27, 'MDX', 'MDX'),
(10, 27, 'NSX', 'NSX'),
(11, 27, 'RDX', 'RDX'),
(12, 27, 'RL Models (2)', 'รุ่น RL (2)'),
(13, 27, '-3.5RL', '-3.5RL'),
(14, 27, '-RL', '-RL'),
(15, 27, 'RSX', 'RSX'),
(16, 27, 'SLX', 'SLX'),
(17, 27, 'TL Models (3)', 'รุ่น TL (3)'),
(18, 27, '-2.5TL', '-2.5TL'),
(19, 27, '-3.2TL', '-3.2TL'),
(20, 27, '-TL', '-TL'),
(21, 27, 'TSX', 'TSX'),
(22, 27, 'Vigor', 'พลัง'),
(23, 27, 'ZDX', 'ZDX'),
(24, 27, 'Other Accura Models', 'โมเดล Accura อื่น ๆ'),
(25, 28, '164', 'หนึ่ง​ร้อย​หก​สิบ​สี่'),
(26, 28, '8C Competizione', '8C Competizione'),
(27, 28, 'GTV-6', 'GTV-6'),
(28, 28, 'Milano', 'Milano'),
(29, 28, 'Spider', 'แมงมุม'),
(30, 28, 'Other Alfa Romeo Model', 'รุ่นอื่น ๆ ของ Alfa Romeo'),
(32, 29, 'Alliance', 'พันธมิตร'),
(33, 29, 'Concord', 'ความสงบเรียบร้อย'),
(34, 29, 'Eagle', 'นกอินทรีย์'),
(35, 29, 'Encore', 'อีกครั้ง'),
(36, 29, 'Spirit', 'วิญญาณ'),
(37, 29, 'Other AMC Models', 'AMC รุ่นอื่น ๆ'),
(38, 30, 'DB7', 'DB7'),
(39, 30, 'DB9', 'DB9'),
(40, 30, 'DBS', 'ดีบีเอส'),
(41, 30, 'Lagonda', 'Lagonda'),
(42, 30, 'Rapide', 'Rapide'),
(43, 30, 'V12 Vantage', 'V12 Vantage'),
(44, 30, 'V8 Vantage', 'V8 Vantage'),
(45, 30, 'Vanquish', 'กำราบ'),
(46, 30, 'Virage', 'Virage'),
(47, 30, 'Other Aston Martin M', 'อื่น ๆ Aston Martin M'),
(48, 31, '100', 'หนึ่ง​ร้อย'),
(49, 31, '200', 'สอง​ร้อย'),
(50, 31, '4000', 'สี่​พัน'),
(51, 31, '5000', 'ห้า​พัน'),
(52, 31, '80', 'แปด​สิบ'),
(53, 31, '90', 'เก้า​สิบ'),
(54, 31, 'A4', 'A4'),
(55, 31, 'A3', 'A3'),
(56, 31, 'A5', 'A5'),
(57, 31, 'A6', 'A6'),
(58, 31, 'A7', 'A7'),
(59, 31, 'A8', 'A8'),
(60, 31, 'allroad', 'ถนนทุกสาย'),
(61, 31, 'Cabriolet', 'Cabriolet'),
(62, 31, 'Coupe', 'รถกูบ'),
(63, 31, 'Q3', 'ไตรมาสที่ 3'),
(64, 31, 'Q5', 'Q5'),
(65, 31, 'Q7', 'Q7'),
(66, 31, 'Quattro', 'Quattro'),
(67, 31, 'R8', 'R8'),
(68, 31, 'RS4', 'RS4'),
(69, 31, 'RS5', 'RS5'),
(70, 31, 'RS6', 'RS6'),
(71, 31, 'DBS', 'ดีบีเอส'),
(72, 31, 'S4', 'S4'),
(73, 31, 'S5', 'S5'),
(74, 31, 'S6', 'S6'),
(75, 31, 'S7', 'S7'),
(76, 31, 'S8', 'S8'),
(77, 31, 'TT', 'TT'),
(78, 31, 'TT RS', 'TT RS'),
(79, 31, 'V8 Quattro', 'V8 Quattro'),
(80, 31, 'TTS', 'TTS'),
(81, 31, 'Other Audi Models', 'ออดี้รุ่นอื่น ๆ'),
(82, 32, 'Convertible', 'แปลงสภาพ'),
(83, 32, 'Coupe', 'รถกูบ'),
(84, 32, 'Sedan', 'เสลี่ยง'),
(85, 32, 'Other Avanti Models', 'โมเดล Avanti อื่น ๆ'),
(86, 33, 'Arnage', 'Arnage'),
(87, 33, 'Azure', 'สีฟ้า'),
(88, 33, 'Brooklands', 'Brooklands'),
(89, 33, 'Continental', 'คอนติเนน'),
(90, 33, 'Corniche', 'Corniche'),
(91, 33, 'Eight', 'แปด'),
(92, 33, 'Mulsanne', 'Mulsanne'),
(93, 33, 'Turbo R', 'เทอร์โบอาร์'),
(94, 33, 'Other Bentley Models', 'โมเดลเบนท์ลีย์อื่น ๆ'),
(95, 34, '1 Series (3)', '1 ซีรี่ส์ (3)'),
(96, 34, '- 128i', '- 128i'),
(97, 34, '- 135i', '- 135i'),
(98, 34, '- 135is', '- 135is'),
(99, 34, '3 Series (29)', '3 ซีรี่ส์ (29)'),
(100, 34, '- 318i', '- 318i'),
(101, 34, '- 318iC', '- 318iC'),
(102, 34, '- 318iS', '- 318iS'),
(103, 34, '- 318ti', '- 318ti'),
(104, 34, '- 320i', '- 320i'),
(105, 34, '- 323ci', '- 323ci'),
(106, 34, '- 323i', '- 323i'),
(107, 34, '- 323is', '- 323is'),
(108, 34, '- 323iT', '- 323iT'),
(109, 34, '- 325Ci', '- 325Ci'),
(110, 34, '- 325e', '- 325e'),
(111, 34, '- 325es', '- 325es'),
(112, 34, '- 325i', '- 325i'),
(113, 34, '- 325is', '- 325is'),
(114, 34, '- 325iX', '- 325iX'),
(115, 34, '- 325xi', '- 325xi'),
(116, 34, '- 328Ci', '- 328Ci'),
(117, 34, '- 328Ci', '- 328Ci'),
(118, 34, '- 328i', '- 328i'),
(119, 34, '- 328iS', '- 328iS'),
(120, 34, '- 328xi', '- 328xi'),
(121, 34, '- 330Ci', '- 330Ci'),
(122, 34, '- 330i', '- 330i'),
(123, 34, '- 330xi', '- 330xi'),
(124, 34, '- 335d', '- 335d'),
(125, 34, '- 335i', '- 335i'),
(126, 34, '- 335is', '- 335is'),
(127, 34, '- 335xi', '- 335xi'),
(128, 34, '- ActiveHybrid 3', '- ActiveHybrid 3'),
(129, 34, '- 325', '- 325'),
(130, 34, '5 Series (19)', '5 ซีรี่ส์ (19)'),
(131, 34, ' - 524td', ' - 524td'),
(132, 34, '- 525i', '- 525i'),
(133, 34, '- 525xi', '- 525xi'),
(134, 34, '- 528e', '- 528e'),
(135, 34, '- 528i', '- 528i'),
(136, 34, '- 528iT', '- 528iT'),
(137, 34, '- 530i', '- 530i'),
(138, 34, '- 530iT', '- 530iT'),
(139, 34, '- 530xi', '- 530xi'),
(140, 34, '- 533i', '- 533i'),
(141, 34, '- 535i', '- 535i'),
(142, 34, '- 535i Gran Turismo', '- 535i Gran Turismo'),
(143, 34, '- 535xi', '- 535xi'),
(144, 34, '- 540i', '- 540i'),
(145, 34, '- 545i', '- 545i'),
(146, 34, '- 550i', '- 550i'),
(147, 34, '- 550i Gran Turismo', '- 550i Gran Turismo'),
(148, 34, '-ActiveHybrid 5', '-ActiveHybrid 5'),
(149, 34, '6 Series (8)', '6 ซีรี่ส์ (8)'),
(150, 34, '- 633CSi', '- 633CSi'),
(151, 34, '- 635CSi', '- 635CSi'),
(152, 34, '- 640i', '- 640i'),
(153, 34, '- 640i Gran Coupe', '- 640i Gran Coupe'),
(154, 34, '- 645Ci', '- 645Ci'),
(155, 34, '- 650i', '- 650i'),
(156, 34, '- 650i Gran Coupe', '- 650i Gran Coupe'),
(157, 34, '- L6', '- L6'),
(158, 34, '7 Series (15)', '7 ซีรี่ส์ (15)'),
(159, 34, '- 733i', '- 733i'),
(160, 34, '- 735i', '- 735i'),
(161, 34, '- 735iL', '- 735iL'),
(162, 34, '- 740i', '- 740i'),
(163, 34, '- 740iL', '- 740iL'),
(164, 34, '- 740Li', '- 740Li'),
(165, 34, '- 745i', '- 745i'),
(166, 34, '- 745Li', '- 745Li'),
(167, 34, '- 750i', '- 750i'),
(168, 34, '- 750iL', '- 750iL'),
(169, 34, '- 750Li', '- 750Li'),
(170, 34, '- 760i', '- 760i'),
(171, 34, '- 760Li', '- 760Li'),
(172, 34, '- ActiveHybrid 7', '- ActiveHybrid 7'),
(173, 34, '- Alpina B7', '- Alpina B7'),
(174, 34, '8 Series 4', '8 Series 4'),
(175, 34, '- 840Ci', '- 840Ci'),
(176, 34, '- 850Ci', '- 850Ci'),
(177, 34, '- 850CSi', '- 850CSi'),
(178, 34, '- 850i', '- 850i'),
(179, 34, 'L Series (1)', 'ซีรีส์ L (1)'),
(180, 34, '- L7', '- L7'),
(181, 34, '- M Series (8)', '- ซีรี่ส์ M (8)'),
(182, 34, '- 1 Series M', '- 1 ซีรี่ส์ M'),
(183, 34, '- M Coupe', '- M Coupe'),
(184, 34, '- M Roadster', '- M Roadster'),
(185, 34, '- M3', '- M3'),
(186, 34, '- M5', '- M5'),
(187, 34, '- M6', '- M6'),
(188, 34, '- X5 M', '- X5 M'),
(189, 34, '- X6 M', '- X6 M'),
(190, 34, 'X Series (5)', 'X Series (5)'),
(191, 34, '- ActiveHybrid X6', '- ActiveHybrid X6'),
(192, 34, '- X1', '- X1'),
(193, 34, '- X3', '- X3'),
(194, 34, '- X5', '- X5'),
(195, 34, '- X6', '- X6'),
(196, 34, 'Z Series (3)', 'ซีรีย์ Z (3)'),
(197, 34, '- Z3', '- Z3'),
(198, 34, '- Z4', '- Z4'),
(199, 34, '- Z8', '- Z8'),
(200, 34, 'Other BMW Models', 'โมเดล BMW อื่น ๆ'),
(201, 35, 'Century', 'ศตวรรษ'),
(202, 35, 'Electra ', 'Electra '),
(203, 35, 'Enclave', 'วงล้อม'),
(204, 35, 'Encore', 'เอาอีก'),
(205, 35, 'LaCrosse', 'ลาครอส'),
(206, 35, 'Le Sabre', 'เลอเซเบอร์'),
(207, 35, 'Lucerne', 'ลูเซิร์น'),
(208, 35, 'Park Avenue', 'ปาร์คอเวนิว'),
(209, 35, 'Rainier', 'เรเนียร์'),
(210, 35, 'Reatta', 'Reatta'),
(211, 35, 'Regal', 'ของกษัตริย์'),
(212, 35, 'Rendezvous', 'การนัดพบ'),
(213, 35, 'Riviera', 'ริเวียร่า'),
(214, 35, 'Roadmaster', 'ถนนสายหลัก'),
(215, 35, 'Skyhawk', 'Skyhawk'),
(216, 35, 'Skylark', 'คึก'),
(217, 35, 'Somerset', 'ซัมเมอร์เซ็ท'),
(218, 35, 'Terraza', 'Terraza'),
(219, 35, 'Verano', 'Verano'),
(220, 35, 'Other Buick Models', 'โมเดลของ Buick อื่น ๆ'),
(221, 36, 'Allante', 'Allante'),
(222, 36, 'ATS ', 'ATS '),
(223, 36, 'Brougham', 'ม้า'),
(224, 36, 'Catera', 'Catera'),
(225, 36, 'Cimarron', 'Cimarron'),
(226, 36, 'CTS', 'CTS'),
(227, 36, 'De Ville', 'เดอวิลล์'),
(228, 36, 'DTS', 'DTS'),
(229, 36, 'Eldorado', 'Eldorado'),
(230, 36, 'Escalade', 'Escalade'),
(231, 36, 'Escalade ESV', 'Escalade ESV'),
(232, 36, 'Escalade EXT', 'Escalade EXT'),
(233, 36, 'Fleetwood', 'ฟลีต'),
(234, 36, 'Seville', 'เซวิลล์'),
(235, 36, 'SRX', 'SRX'),
(236, 36, 'STS', 'เอสที'),
(237, 36, 'XLR', 'XLR'),
(238, 36, 'XTS', 'XTS'),
(239, 36, 'Other Cadillac Model', 'รุ่นคาดิลแลคอื่น ๆ'),
(240, 37, 'Astro', 'Astro'),
(241, 37, 'Avalanche ', 'หิมะถล่ม'),
(242, 37, 'Aveo', 'อาวีโอ'),
(243, 37, 'Aveo5', 'Aveo5'),
(244, 37, 'Beretta', 'เบเร็ตต้า'),
(245, 37, 'Blazer', 'เสื้อสูทแฟชั่น'),
(246, 37, 'Camaro', 'Camaro'),
(247, 37, 'Caprice', 'ความไม่แน่นอน'),
(248, 37, 'Captiva Sport', 'แคปติวาสปอร์ต'),
(249, 37, 'Cavalier', 'ขุนนาง'),
(250, 37, 'Celebrity', 'ชื่อเสียง'),
(251, 37, 'Chevette', 'Chevette'),
(252, 37, 'Citation', 'การอ้างอิง'),
(253, 37, 'Cobalt', 'โคบอลต์'),
(254, 37, 'Colorado', 'โคโลราโด'),
(255, 37, 'Corsica', 'คอร์ซิกา'),
(256, 37, 'Corvette', 'เรือลาดตระเวน'),
(257, 37, 'Cruze', 'Cruze'),
(258, 37, 'El Camino', 'El Camino'),
(259, 37, 'Equinox', 'เวลาที่กลางวันเท่ากับกลางคืน'),
(260, 37, 'Express Van', 'รถตู้ด่วน'),
(261, 37, 'G Van', 'จีแวน'),
(262, 37, 'HHR', 'HHR'),
(263, 37, 'Impala', 'ละมั่งอาฟริกา'),
(264, 37, 'Kodiak C4500', 'Kodiak C4500'),
(265, 37, 'Lumina', 'Lumina'),
(266, 37, 'Lumina APV', 'Lumina APV'),
(267, 37, 'LUV', 'LUV'),
(268, 37, 'Malibu', 'มาลิบู'),
(269, 37, 'Metro', 'รถไฟฟ้าใต้ดิน'),
(270, 37, 'Monte Carlo', 'Monte Carlo'),
(271, 37, 'Nova', 'โนวา'),
(272, 37, 'Prizm', 'พริซึ่ม'),
(273, 37, 'S10 Blazer', 'เบลเซอร์ S10'),
(274, 37, 'S10 Pickup', 'รถกระบะ S10'),
(275, 37, 'Silverado and other ', 'Silverado และอื่น ๆ'),
(278, 37, 'Sonic', 'เกี่ยวกับเสียง'),
(279, 37, 'Spark', 'จุดประกาย'),
(280, 37, 'Spectrum', 'คลื่นความถี่'),
(281, 37, 'Sprint', 'วิ่ง'),
(282, 37, 'SSR', 'SSR'),
(283, 37, 'Suburban', 'ชานเมือง'),
(284, 37, 'Tahoe', 'Tahoe'),
(285, 37, 'Tracker', 'ติดตาม'),
(286, 37, 'TrailBlazer', 'TrailBlazer'),
(287, 37, 'TrailBlazer EXT', 'TrailBlazer EXT'),
(288, 37, 'Traverse', 'ทราเวิร์'),
(289, 37, 'Uplander', 'Uplander'),
(290, 37, 'Venture', 'เสี่ยง'),
(291, 37, 'Volt', 'โวลต์'),
(292, 37, 'Other Chevrolet Model', 'เชฟโรเลตโมเดลอื่น ๆ'),
(293, 38, '200', 'สอง​ร้อย'),
(294, 38, '300', 'สาม​ร้อย'),
(295, 38, '300M', '300M'),
(296, 38, 'Aspen', 'ต้นไม้แอซป์'),
(297, 38, 'Caravan', 'คาราวาน'),
(298, 38, 'Cirrus', 'Cirrus'),
(299, 38, 'Concorde', 'คองคอร์ด'),
(300, 38, 'Conquest', 'ชนะ'),
(301, 38, 'Cordoba', 'คอร์โดบา'),
(302, 38, 'Crossfire', 'ลูกหลง'),
(303, 38, 'E Class', 'คลาส E'),
(304, 38, 'Fifth Avenue', 'ฟิฟท์อเวนิว'),
(305, 38, 'Grand Voyager', 'Grand Voyager'),
(306, 38, 'Imperial', 'ของจักรพรรดิ'),
(307, 38, 'Intrepid', 'กล้าหาญ'),
(308, 38, 'Laser', 'เลเซอร์'),
(309, 38, 'LeBaron', 'LeBaron'),
(310, 38, 'LHS', 'LHS'),
(311, 38, 'Neon', 'ธาตุนีอ็อน'),
(312, 38, 'New Yorker', 'ชาวนิวยอร์ก'),
(313, 38, 'Newport', 'นิวพอร์ต'),
(314, 38, 'Pacifica', 'แปซิฟิกา'),
(315, 38, 'Prowler', 'ผู้เที่ยวเดินด้อม ๆ มองๆ'),
(316, 38, 'PT Cruiser', 'PT ครุยเซอร์'),
(317, 38, 'Sebring', 'ซีบริง'),
(318, 38, 'TC by Maserati', 'TC โดย Maserati'),
(319, 38, 'Town & Country', 'Town & Country'),
(320, 38, 'Voyager', 'ผู้เดินทาง'),
(321, 38, 'Other Chrysler Model', 'โมเดลไครสเลอร์อื่น ๆ'),
(322, 39, 'Lanos', 'Lanos'),
(323, 39, 'Leganza', 'Leganza'),
(324, 39, 'Nubira', 'Nubira'),
(325, 39, 'Other Daewoo Models', 'โมเดล Daewoo อื่น ๆ'),
(326, 40, 'Charade', 'คำปริศนาที่มีเงื่อนไขไว้ให้ทุกพยานค์'),
(327, 40, 'Rocky', 'เต็มไปด้วยหิน'),
(328, 40, 'Other Daihatsu Model', 'โมเดลไดฮัทสุอื่น ๆ'),
(329, 41, '200XS', '200XS'),
(330, 41, '210', 'สอง​ร้อย​สิบ'),
(331, 41, '280ZX', '280ZX'),
(332, 41, '300ZX', '300ZX'),
(333, 41, '310', 'สาม​ร้อย​สิบ'),
(334, 41, '510', 'ห้า​ร้อย​สิบ'),
(335, 41, '720', 'เจ็ด​ร้อย​ยี่​สิบ'),
(336, 41, '810', 'แปด​ร้อย​สิบ'),
(337, 41, 'Maxima', 'Maxima'),
(338, 41, 'Pickup', 'ไปรับ'),
(339, 41, 'Pulsar', 'พูลสาร์'),
(340, 41, 'Sentra', 'Sentra'),
(341, 41, 'Stanza', 'ฉันท์'),
(342, 41, 'Other Datsun Models', 'โมเดล Datsun อื่น ๆ'),
(343, 42, 'DMC-12', 'DMC-12'),
(344, 43, '400', 'สี่​ร้อย'),
(345, 43, '600', 'หก​ร้อย'),
(346, 43, 'Aries', 'ราศีเมษ'),
(347, 43, 'Avenger', 'ผู้ล้างแค้น'),
(348, 43, 'Caliber', 'ความสามารถ'),
(349, 43, 'Caravan', 'คาราวาน'),
(350, 43, 'Challenger', 'ผู้ท้าชิง'),
(351, 43, 'Charger', 'ชาร์จ'),
(352, 43, 'Colt', 'เด็กผู้ชายที่อ่อนหัด'),
(353, 43, 'Conquest', 'ชนะ'),
(354, 43, 'D/W Truck', 'รถบรรทุก D / W'),
(355, 43, 'Dakota', 'ดาโคตา'),
(356, 43, 'Dart', 'โผ'),
(357, 43, 'Daytona', 'เดย์โทนา'),
(358, 43, 'Diplomat', 'ทูต'),
(359, 43, 'Durango', 'ดูรังโก'),
(360, 43, 'Dynasty', 'ราชวงศ์'),
(361, 43, 'Grand Caravan', 'แกรนด์คาราวาน'),
(362, 43, 'Intrepid', 'กล้าหาญ'),
(363, 43, 'Journey', 'การเดินทาง'),
(364, 43, 'Lancer', 'ทหารม้าถือทวน'),
(365, 43, 'Magnum', 'ขวดขนาดใหญ่'),
(366, 43, 'Mirada', 'มิราดา'),
(367, 43, 'Monaco', 'โมนาโก'),
(368, 43, 'Neon', 'ธาตุนีอ็อน'),
(369, 43, 'Nitro', 'Nitro'),
(370, 43, 'Omni', 'Omni'),
(371, 43, 'Raider', 'ผู้ตรวจค้น'),
(372, 43, 'Ram 1500 Truck', 'รถบรรทุกราม 1,500'),
(373, 43, 'Ram 2500 Truck', 'รถบรรทุกราม 2500'),
(374, 43, 'Ram 3500 Truck', 'รถบรรทุกราม 3500'),
(375, 43, 'Ram 4500 Truck', 'รถบรรทุกราม 4500'),
(376, 43, 'Ram 50 Truck', 'รถบรรทุกราม 50'),
(377, 43, 'RAM C/V', 'RAM C/V'),
(378, 43, 'Ram SRT-10', 'ราม SRT-10'),
(379, 43, 'Ram Van', 'รามแวน'),
(380, 43, 'Ram Wagon', 'รามเกวียน'),
(381, 43, 'Ramcharger', 'Ramcharger'),
(382, 43, 'Rampage', 'อาละวาด'),
(383, 43, 'Shadow', 'เงา'),
(384, 43, 'Spirit', 'วิญญาณ'),
(385, 43, 'Sprinter', 'ผู้วิ่งแข่ง'),
(386, 43, 'SRT-4', 'SRT-4'),
(387, 43, 'St. Regis', 'เซนต์รีจิส'),
(388, 43, 'Stealth', 'ชิงทรัพย์'),
(389, 43, 'Stratus', 'ชั้นเมฆ'),
(390, 43, 'Viper', 'งูพิษ'),
(391, 43, 'Other Dodge Models', 'โมเดล Dodge อื่น ๆ'),
(392, 44, 'Medallion', 'เหรียญกระษาปณ์'),
(393, 44, 'Premier', 'นายกรัฐมนตรี'),
(394, 44, 'Summit', 'ประชุมสุดยอด'),
(395, 44, 'Talon', 'อุ้งเท้า'),
(396, 44, 'Vision', 'วิสัยทัศน์'),
(397, 44, 'Other Eagle Models', 'โมเดลนกอินทรีอื่น ๆ'),
(398, 45, '308 GTB Quattrovalvo', '308 GTB Quattrovalvo'),
(399, 45, '308 GTBI', '308 GTBI'),
(400, 45, '308 GTS Quattrovalvo', '308 GTS Quattrovalvo'),
(401, 45, '308 GTSI', '308 GTSI'),
(402, 45, '328 GTB', '328 GTB'),
(403, 45, '328 GTS', '328 GTS'),
(404, 45, '348 GTB', '348 GTB'),
(405, 45, '348 GTS', '348 GTS'),
(406, 45, '348 Spider', '348 แมงมุม'),
(407, 45, '348 TB', '348 TB'),
(408, 45, '348 TS', '348 TS'),
(409, 45, '360', 'สาม​ร้อย​หก​สิบ'),
(410, 45, '456 GT', '456 GT'),
(411, 45, '456M GT', '456M GT'),
(412, 45, '458 Italia', '458 Italia'),
(413, 45, '512 BBi', '512 BBi'),
(414, 45, '512M', '512M'),
(415, 45, '512TR', '512TR'),
(416, 45, '550 Maranello', '550 Maranello'),
(417, 45, '575M Maranello', '575M Maranello'),
(418, 45, '599 GTB Fiorano', '599 GTB Fiorano'),
(419, 45, '599 GTO', '599 GTO'),
(420, 45, '612 Scaglietti', '612 Scaglietti'),
(421, 45, 'California', 'แคลิฟอร์เนีย'),
(422, 45, 'Enzo', 'Enzo'),
(423, 45, 'F355', 'F355'),
(424, 45, 'F40', 'F40'),
(425, 45, 'F430', 'F430'),
(426, 45, 'F50', 'F50'),
(427, 45, 'FF', 'FF'),
(428, 45, 'Mondial', 'Mondial'),
(429, 45, 'Testarossa', 'Testarossa'),
(430, 45, 'Other Ferrari Models', 'รุ่นเฟอร์รารี่อื่น ๆ'),
(431, 46, '2000 Spider', 'แมงมุม 2000'),
(432, 46, '500', 'ห้า​ร้อย'),
(433, 46, 'Bertone X1/9', 'Bertone X1/9'),
(434, 46, 'Brava', 'Brava'),
(435, 46, 'Pininfarina Spider', 'Pininfarina Spider'),
(436, 46, 'Strada', 'Strada'),
(437, 46, 'X1/9', 'X1/9'),
(438, 46, 'Other Fiat Models', 'รุ่นเฟียตอื่น ๆ'),
(439, 47, 'Karma', 'กรรม'),
(440, 48, 'Aerostar', 'Aerostar'),
(441, 48, 'Aspire', 'ปรารถนา'),
(442, 48, 'Bronco', 'ม้าป่า'),
(443, 48, 'Bronco II', 'Bronco II'),
(444, 48, 'C-MAX', 'C-MAX'),
(445, 48, 'Club Wagon', 'Club Wagon'),
(446, 48, 'Contour', 'เส้นแสดงรูปร่าง'),
(447, 48, 'Courier', 'Courier'),
(448, 48, 'Crown Victoria', 'คราวน์วิกตอเรีย'),
(449, 48, 'E-150 and Econoline ', 'E-150 และ Econoline'),
(450, 48, 'E-250 and Econoline ', 'E-250 และ Econoline'),
(451, 48, 'E-350 and Econoline ', 'E-350 และ Econoline'),
(452, 48, 'Edge', 'ขอบ'),
(453, 48, 'Escape', 'หนี'),
(454, 48, 'Escort', 'คุ้มกัน'),
(455, 48, 'Excursion', 'การเที่ยว'),
(456, 48, 'EXP', 'EXP'),
(457, 48, 'Expedition', 'การเดินทาง'),
(458, 48, 'Expedition EL', 'เอลเดินทาง'),
(459, 48, 'Explorer', 'สำรวจ'),
(460, 48, 'Explorer Sport Trac', 'Explorer Sport Trac'),
(461, 48, 'F100', 'F100'),
(462, 48, 'F150', 'F150'),
(463, 48, 'F250', 'F250'),
(464, 48, 'F350', 'F350'),
(465, 48, 'F450', 'F450'),
(466, 48, 'Fairmont', 'โรงแรมแฟร์มอนท์'),
(467, 48, 'Festiva', 'Festiva'),
(468, 48, 'Fiesta', 'เฟียสต้า'),
(469, 48, 'Five Hundred', 'ห้าร้อย'),
(470, 48, 'Flex', 'ดิ้น'),
(471, 48, 'Focus', 'โฟกัส'),
(472, 48, 'Freestar', 'Freestar'),
(473, 48, 'Freestyle', 'ฟรีสไตล์'),
(474, 48, 'Fusion', 'การผสม'),
(475, 48, 'Granada', 'กรานาดา'),
(476, 48, 'Other Ford Models', 'รุ่นอื่น ๆ ของ Ford'),
(477, 48, 'GT', 'GT'),
(478, 48, 'LTD', 'LTD'),
(479, 48, 'Mustang', 'ม้าป่า'),
(480, 48, 'Probe', 'การสอบสวน'),
(481, 48, 'Ranger', 'ตำรวจท้องถิ่น'),
(482, 48, 'Taurus', 'ราศีพฤษภ'),
(483, 48, 'Taurus X', 'ราศีพฤษภ X'),
(484, 48, 'Tempo', 'จังหวะ'),
(485, 48, 'Thunderbird', 'ธันเดอร์เบิร์ด'),
(486, 48, 'Transit Connect', 'Transit Connect'),
(487, 48, 'Windstar', 'Windstar'),
(488, 48, 'ZX2 Escort', 'ZX2 Escort'),
(489, 49, 'Sprinter', 'ผู้วิ่งแข่ง'),
(490, 50, 'Metro', 'รถไฟฟ้าใต้ดิน'),
(491, 50, 'Prizm', 'พริซึ่ม'),
(492, 50, 'Spectrum', 'คลื่นความถี่'),
(493, 50, 'Storm', 'พายุ'),
(494, 50, 'Tracker', 'ติดตาม'),
(495, 50, 'Other Geo Models', 'โมเดลทางภูมิศาสตร์อื่น ๆ'),
(496, 51, 'Acadia', 'Acadia'),
(497, 51, 'Caballero', 'บาล'),
(498, 51, 'Canyon', 'หุบเขาลึก'),
(499, 51, 'Envoy', 'ราชทูต'),
(500, 51, 'Envoy XL', 'ทูต XL'),
(501, 51, 'Envoy XUV', 'ทูต XUV'),
(502, 51, 'Jimmy', 'ชะแลงขนาดสั้น'),
(503, 51, 'Rally Wagon', 'แรลลี่เกวียน'),
(504, 51, 'S15 Jimmy', 'S15 จิมมี่'),
(505, 51, 'S15 Pickup', 'S15 รถกระบะ'),
(506, 51, 'Safari', 'การแข่งรถวิบาก'),
(507, 51, 'Savana', 'Savana'),
(508, 51, 'Sierra C/K1500', 'เซียร่า C / K1500'),
(509, 51, 'Sierra C/K2500', 'เซียร่า C / K2500'),
(510, 51, 'Sierra C/K3500', 'เซียร่า C / K3500'),
(511, 51, 'Sonoma', 'โซโนมา'),
(512, 51, 'Suburban', 'ชานเมือง'),
(513, 51, 'Syclone', 'Syclone'),
(514, 51, 'Terrain', 'ภูมิประเทศ'),
(515, 51, 'TopKick C4500', 'TopKick C4500'),
(516, 51, 'Typhoon', 'พายุไต้ฝุ่น'),
(517, 51, 'Vandura', 'Vandura'),
(518, 51, 'Yukon', 'ยูคอน'),
(519, 51, 'Yukon XL', 'ยูคอน XL'),
(520, 51, 'Other GMC Models', 'โมเดล GMC อื่น ๆ'),
(521, 52, 'Accord', 'สอดคล้อง'),
(522, 52, 'Civic', 'ของเทศบาล'),
(523, 52, 'CR-V', 'CR-V'),
(524, 52, 'CR-Z', 'CR-Z'),
(525, 52, 'CRX', 'CRX'),
(526, 52, 'Crosstour and Accord', 'Crosstour และ Accord'),
(527, 52, '- Accord Crosstour', '- Accord Crosstour'),
(528, 52, '- Crosstour', 'Crosstour'),
(529, 52, 'Del Sol', 'เดลโซล'),
(530, 52, 'Element', 'ธาตุ'),
(531, 52, 'Fit', 'Fit'),
(532, 52, 'Insight', 'ข้อมูลเชิงลึก'),
(533, 52, 'Odyssey', 'โอดิสซี'),
(534, 52, 'Passport', NULL),
(535, 52, 'Pilot', 'นักบิน'),
(536, 52, 'Prelude', 'โหมโรง'),
(537, 52, 'Ridgeline', 'Ridgeline'),
(538, 52, 'S2000', 'S2000'),
(539, 52, 'Other Honda Models', 'โมเดลฮอนด้าอื่น ๆ'),
(540, 53, 'H1', 'H1'),
(541, 53, 'H2', 'H2'),
(542, 53, 'H3', 'H3'),
(543, 53, 'H3T', 'H3T'),
(544, 53, 'Other Hummer Models', 'โมเดล Hummer อื่น ๆ'),
(545, 54, 'Accent', 'สำเนียง'),
(546, 54, 'Azera', 'Azera'),
(547, 54, 'Elantra', 'Elantra'),
(548, 54, 'Elantra Coupe', 'Elantra Coupe'),
(549, 54, 'Elantra Touring', 'Elantra Touring'),
(550, 54, 'Entourage', 'สิ่งแวดล้อม'),
(551, 54, 'Equus', 'ม้า'),
(552, 54, 'Excel', 'สันทัด'),
(553, 54, 'Genesis', 'แหล่งกำเนิด'),
(554, 54, 'Genesis Coupe', 'Genesis Coupe'),
(555, 54, 'Santa Fe', 'ซานตาเฟ่'),
(556, 54, 'Scoupe', 'Scoupe'),
(557, 54, 'Sonata', 'บทเพลงเข้าเปียโน'),
(558, 54, 'Tiburon', 'Tiburon'),
(559, 54, 'Tucson', 'ทูซอน'),
(560, 54, 'Veloster', 'Veloster'),
(561, 54, 'Veracruz', 'เวรากรูซ'),
(562, 54, 'XG300', 'XG300'),
(563, 54, 'XG350', 'XG350'),
(564, 54, 'Other Hyundai Models', 'รุ่นอื่น ๆ ของ Hyundai'),
(565, 55, 'EX Models (2)', 'รุ่น EX (2)'),
(566, 55, '- EX35', '- EX35'),
(567, 55, '- EX37', '- EX37'),
(568, 55, 'FX Models (4)', 'รุ่น FX (4)'),
(569, 55, '- FX35', '- FX35'),
(570, 55, '- FX37', '- FX37'),
(571, 55, '- FX45', '- FX45'),
(572, 55, '- FX50', '- FX50'),
(573, 55, 'G Models (4)', 'รุ่น G (4)'),
(574, 55, '- G20', '- G20'),
(575, 55, '- G25', '- G25'),
(576, 55, '- G35', '- G35'),
(577, 55, '- G37', '- G37'),
(578, 55, 'I Models (2)', 'ฉันโมเดล (2)'),
(579, 55, '- I30', '- I30'),
(580, 55, '- I35', '- I35'),
(581, 55, 'J Models (1)', '-J รุ่น (1) I30'),
(582, 55, '- J30', '- J30'),
(583, 55, 'JX Models (1)', 'โมเดล JX (1)'),
(584, 55, '- JX35', '- JX35'),
(585, 55, 'M Models (6)', 'รุ่น M (6)'),
(586, 55, '- M30', '- M30'),
(587, 55, '- M35', '- M35'),
(588, 55, '- M35h', '- M35h'),
(589, 55, '- M37', '- M37'),
(590, 55, '- M45', '- M45'),
(591, 55, '- M56', '- M56'),
(592, 55, 'Q Models (1)', 'รุ่น Q (1)'),
(593, 55, '- Q45', '- Q45'),
(594, 55, 'QX Models (2)', 'QX Models (2)'),
(595, 55, '- QX4', '- QX4'),
(596, 55, '- QX56', '- QX56'),
(597, 55, 'Other Infiniti Model', 'โมเดลอินฟินิตี้อื่น ๆ'),
(598, 56, 'Amigo', 'Amigo'),
(599, 56, 'Ascender', 'ครอง'),
(600, 56, 'Axiom', 'ความจริง'),
(601, 56, 'Hombre', 'hombre'),
(602, 56, 'i-280', 'i-280'),
(603, 56, 'i-290', 'i-290'),
(604, 56, 'i-350', 'i-350'),
(605, 56, 'i-370', 'i-370'),
(606, 56, 'I-Mark', 'I-Mark'),
(607, 56, 'Impulse', 'แรงกระตุ้น'),
(608, 56, 'Oasis', 'โอเอซิส'),
(609, 56, 'Pickup', 'ไปรับ'),
(610, 56, 'Rodeo', 'Rodeo'),
(611, 56, 'Stylus', 'เหล็กจาร'),
(612, 56, 'Trooper', 'ทหารม้า'),
(613, 56, 'Trooper II', 'Trooper II'),
(614, 56, 'VehiCROSS', 'VehiCROSS'),
(615, 56, 'Other Isuzu Models', 'โมเดล Isuzu อื่น ๆ'),
(616, 57, 'S-Type', 'S-Type'),
(617, 57, 'X-Type', 'X-Type'),
(618, 57, 'XF', 'XF'),
(619, 57, 'XJ Series (10)', 'ซีรี่ส์ XJ (10)'),
(620, 57, '- XJ12', '- XJ12'),
(621, 57, '- XJ6', '- XJ6'),
(622, 57, '- XJR', '- XJR'),
(623, 57, '- XJR-S', '- XJR-S'),
(624, 57, '- XJS', '- XJS'),
(625, 57, '- XJ Vanden Plas', '- XJ Vanden Plas'),
(626, 57, '- XJ', '- XJ'),
(627, 57, '- XJ8', '- XJ8'),
(628, 57, '- XJ8 L', '- XJ8 L'),
(629, 57, '- XJ Sport', '- XJ Sport'),
(630, 57, 'XK Series (3)', '- XJ SportXK ซีรี่ย์ (3)'),
(631, 57, '- XK8', '- XK8'),
(632, 57, '- XK', '- XK'),
(633, 57, '- XKR', '- XKR'),
(634, 57, 'Other Jaguar Models', 'รุ่นจากัวร์อื่น ๆ'),
(635, 58, 'Cherokee', 'เชโรกี'),
(636, 58, 'CJ', 'CJ'),
(637, 58, 'Comanche', 'เผ่า'),
(638, 58, 'Commander', 'ผู้บังคับบัญชา'),
(639, 58, 'Compass', 'เข็มทิศ'),
(640, 58, 'Grand Cherokee', 'Grand Cherokee'),
(641, 58, 'Grand Wagoneer', 'Grand Wagoneer'),
(642, 58, 'Liberty', 'เสรีภาพ'),
(643, 58, 'Patriot', 'คนรักชาติ'),
(644, 58, 'Pickup', 'ไปรับ'),
(645, 58, 'Scrambler', 'Scrambler'),
(646, 58, 'Wagoneer', 'Wagoneer'),
(647, 58, 'Wrangler', 'Wrangler'),
(648, 58, 'Other Jeep Models', 'โมเดลรถจี๊ปอื่น ๆ'),
(649, 59, 'Amanti', 'Amanti'),
(650, 59, 'Borrego', 'บอร์เรโก'),
(651, 59, 'Forte', 'มือขวา'),
(652, 59, 'Forte Koup', 'Forte Koup'),
(653, 59, 'Optima', 'Optima'),
(654, 59, 'Rio', 'ริโอ'),
(655, 59, 'Rio5', 'Rio5'),
(656, 59, 'Rondo', 'ฉันท์ฝรั่งแบบหนึ่ง'),
(657, 59, 'Sedona', 'เซดอนา'),
(658, 59, 'Sephia', 'Sephia'),
(659, 59, 'Sorento', 'Sorento'),
(660, 59, 'Soul', 'จิตวิญญาณ'),
(661, 59, 'Spectra', 'Spectra'),
(662, 59, 'Spectra5', 'Spectra5'),
(663, 59, 'Sportage', 'Sportage'),
(664, 59, 'Other Kia Models', 'โมเดล Kia อื่น ๆ'),
(665, 60, 'Aventador', 'Aventador'),
(666, 60, 'Countach', 'Countach'),
(667, 60, 'Diablo', 'Diablo'),
(668, 60, 'Gallardo', 'Gallardo'),
(669, 60, 'Jalpa', 'Jalpa'),
(670, 60, 'LM002', 'LM002'),
(671, 60, 'Murcielago', 'Murcielago'),
(672, 60, 'Other Lamborghini Models', 'รุ่น Lamborghini อื่น ๆ'),
(673, 61, 'Beta', 'เบต้า'),
(674, 61, 'Zagato', 'Zagato'),
(675, 61, 'Other Lancia Models', 'โมเดล Lancia อื่น ๆ'),
(676, 62, 'Defender', 'ผู้ปกป้อง'),
(677, 62, 'Discovery', 'การค้นพบ'),
(678, 62, 'Freelander', 'Freelander'),
(679, 62, 'LR2', 'LR2'),
(680, 62, 'LR3', 'LR3'),
(681, 62, 'LR4', 'LR4'),
(682, 62, 'Range Rover', 'เรนจ์โรเวอร์'),
(683, 62, 'Range Rover Evoque', 'เรนจ์โรเวอร์ Evoque'),
(684, 62, 'Range Rover Sport', 'Range Rover Sport'),
(685, 62, 'Other Land Rover Models', 'โมเดลแลนด์โรเวอร์อื่น ๆ'),
(686, 63, 'CT Models (1)', 'รุ่น CT (1)'),
(687, 63, '- CT 200h', '- CT 200 ชม'),
(688, 63, 'ES Models (5)', 'รุ่น ES (5)'),
(689, 63, '- ES 250', '- ES 250'),
(690, 63, '- ES 300', '- ES 300'),
(691, 63, '- ES 300h', '- ES 300h'),
(692, 63, '- ES 330', '- ES 330'),
(693, 63, '- ES 350', '- ES 350'),
(694, 63, 'GS Models (6)', 'รุ่น GS (6)'),
(695, 63, '- GS 300', '- GS 300'),
(696, 63, '- GS 350', '- GS 350'),
(697, 63, '- GS 400', '- GS 400'),
(698, 63, '- GS 430', '- GS 430'),
(699, 63, '- GS 450h', '- GS 450h'),
(700, 63, '- GS 460', '- GS 460'),
(701, 63, 'GX Models (2)', 'รุ่น GX (2)'),
(702, 63, '- GX 460', '- GX 460'),
(703, 63, '- GX 470', '- GX 470'),
(704, 63, 'HS Models (1)', 'รุ่น HS (1)'),
(705, 63, '- HS 250h', '- HS 250 ชม'),
(706, 63, 'IS Models (6)', 'เป็นโมเดล (6)'),
(707, 63, '- IS 250', '- คือ 250'),
(708, 63, '- IS 250C', '- คือ 250C'),
(709, 63, '- IS 300', '- คือ 300'),
(710, 63, '- IS 350', '- คือ 350'),
(711, 63, '- IS 350C', '- คือ 350C'),
(712, 63, '- IS F', '- IS F'),
(713, 63, 'LFA', 'LFA'),
(714, 63, 'LS Models (4)', 'รุ่น LS (4)'),
(715, 63, '- LS 400', '- LS 400'),
(716, 63, '- LS 430', '- LS 430'),
(717, 63, '- LS 460', '- LS 460'),
(718, 63, '- LS 600h', '- LS 600h'),
(719, 63, 'LX Models (3)', 'รุ่น LX (3)'),
(720, 63, '- LX 450', '- LX 450'),
(721, 63, '- LX 470', '- LX 470'),
(722, 63, '- LX 570', '- LX 570'),
(723, 63, 'RX Models (5)', 'รุ่น RX (5)'),
(724, 63, '- RX 300', '- RX 300'),
(725, 63, '- RX 330', '- RX 330'),
(726, 63, '- RX 350', '- RX 350'),
(727, 63, '- RX 400h', '- RX 400h'),
(728, 63, '- RX 450h', '- RX 450h'),
(729, 63, 'SC Models (3)', 'รุ่น SC (3)'),
(730, 63, '- SC 300', '- SC 300'),
(731, 63, '- SC 400', '- SC 400'),
(732, 63, '- SC 430', '- SC 430'),
(733, 63, 'Other Lexus Models', 'โมเดล Lexus อื่น ๆ'),
(734, 64, 'Aviator', 'นักบิน'),
(735, 64, 'Blackwood', 'ไม้สีดำ'),
(736, 64, 'Continental', 'คอนติเนน'),
(737, 64, 'LS', 'LS'),
(738, 64, 'Mark LT', 'มาร์ค LT'),
(739, 64, 'Mark VI', 'ทำเครื่องหมายที่ VI'),
(740, 64, 'Mark VII', 'เครื่องหมาย VII'),
(741, 64, 'Mark VIII', 'ทำเครื่องหมาย VIII'),
(742, 64, 'MKS', 'MKS'),
(743, 64, 'MKT', 'MKT'),
(744, 64, 'MKX', 'MKX'),
(745, 64, 'MKZ', 'MKZ'),
(746, 64, 'Navigator', 'นักเดินเรือ'),
(747, 64, 'Navigator L', 'เนวิเกเตอร์ L'),
(748, 64, 'Town Car', 'ทาวน์โฮม'),
(749, 64, 'Zephyr', 'ลมตะวันตก'),
(750, 64, 'Other Lincoln Models', 'โมเดล Lincoln อื่น ๆ'),
(751, 65, 'Elan', 'ความชำนาญ'),
(752, 65, 'Elise', 'เอลิเซ่'),
(753, 65, 'Esprit', 'ปฏิภาณ'),
(754, 65, 'Evora', 'Evora'),
(755, 65, 'Exige', 'Exige'),
(756, 65, 'Other Lotus Models', 'รุ่น Lotus อื่น ๆ'),
(757, 66, '430', 'สี่​ร้อย​สาม​สิบ'),
(758, 66, 'Biturbo', 'Biturbo'),
(759, 66, 'Coupe', 'รถกูบ'),
(760, 66, 'Gran Sport', 'แกรนสปอร์ต'),
(761, 66, 'Gran Turismo', 'Gran Turismo'),
(762, 66, 'Quattroporte', 'Quattroporte'),
(763, 66, 'Spyder', 'Spyder'),
(764, 66, 'Other Maserati Model', 'โมเดลมาเซราตีอื่น ๆ'),
(765, 67, '57', 'ห้า​สิบ​เจ็ด'),
(766, 67, '62', 'หก​สิบ​สอง'),
(767, 67, 'Other Maybach Models', 'โมเดลมายบัคอื่น ๆ'),
(768, 68, '323', 'สาม​ร้อย​ยี่​สิบ​สาม'),
(769, 68, '626', 'หก​ร้อย​ยี่​สิบ​หก'),
(770, 68, '929', 'เก้า​ร้อย​ยี่​สิบ​เก้า'),
(771, 68, 'B-Series Pickup', 'รถกระบะซีรีย์ B'),
(772, 68, 'CX-5', 'CX-5'),
(773, 68, 'CX-7', 'CX-7'),
(774, 68, 'CX-9', 'CX-9'),
(775, 68, 'GLC', 'GLC'),
(776, 68, 'MAZDA2', 'MAZDA2'),
(777, 68, 'MAZDA3', 'MAZDA3'),
(778, 68, 'MAZDA5', 'MAZDA5'),
(779, 68, 'MAZDA6', 'MAZDA6'),
(780, 68, 'MAZDASPEED3', 'MAZDASPEED3'),
(781, 68, 'MAZDASPEED3', 'MAZDASPEED3'),
(782, 68, 'MAZDASPEED6', 'MAZDASPEED6'),
(783, 68, 'Miata MX5', 'Miata MX5'),
(784, 68, 'Millenia', 'Millenia'),
(785, 68, 'MPV', 'MPV'),
(786, 68, 'MX3', 'MX3'),
(787, 68, 'MX6', 'MX6'),
(788, 68, 'Navajo', 'นาวาโฮ'),
(789, 68, 'Protege', 'บุตรบุญธรรม'),
(790, 68, 'Protect5', 'Protect5'),
(791, 68, 'RX-7', 'RX-7'),
(792, 68, 'RX-8', 'RX-8'),
(793, 68, 'Tribute', 'ส่วย'),
(794, 68, 'Other Mazda Models', 'มาสด้ารุ่นอื่น ๆ'),
(795, 69, '190 Class (2)', '190 คลาส (2)'),
(796, 70, '- 190D', '- 190D'),
(797, 70, '- 190E', '- 190E'),
(798, 70, '240 Class (1)', '240 คลาส (1)'),
(799, 70, '- 240D', '- 240D'),
(800, 70, '300 Class/E Class(6)', '300 คลาส / คลาส E (6)'),
(801, 70, '- 300CD', '- 300CD'),
(802, 70, '- 300CE', '- 300CE'),
(803, 70, '- 300D', '- 300D'),
(804, 70, '- 300E', '- 300E'),
(805, 70, '- 300TD', '- 300TD'),
(806, 70, '- 300TE', '- 300TE'),
(807, 70, 'C Class (13)', 'คลาส C (13)'),
(808, 70, '- C220', '- C220'),
(809, 70, '- C230', '- C230'),
(810, 70, '- C240', '- C240'),
(811, 70, '- C250', '- C250'),
(812, 70, '- C280', '- C280'),
(813, 70, '- C300', '- C300'),
(814, 70, '- C320', '- C320'),
(815, 70, '- C32 AMG', '- C32 AMG'),
(816, 70, '- C350', '- C350'),
(817, 70, '- C36 AMG', '- C36 AMG'),
(818, 70, '- C43 AMG', '- C43 AMG'),
(819, 70, '- C55 AMG', '- C55 AMG'),
(820, 70, '- C63 AMG', '- C63 AMG'),
(821, 70, 'CL Class (6)', 'คลาส CL (6)'),
(822, 70, '- CL500', '- CL500'),
(823, 70, '- CL550', '- CL550'),
(824, 70, '- CL55 AMG', '- CL55 AMG'),
(825, 70, '- CL600', '- CL600'),
(826, 70, '- CL63 AMG', '- CL63 AMG'),
(827, 70, '- CL65 AMG', '- CL65 AMG'),
(828, 70, 'CLK Class (7)', 'คลาส CLK (7)'),
(829, 70, '- CLK320', '- CLK320'),
(830, 70, '- CLK350', '- CLK350'),
(831, 70, '- CLK430', '- CLK430'),
(832, 70, '- CLK500', '- CLK500'),
(833, 70, '- CLK550', '- CLK550'),
(834, 70, '- CLK55 AMG', '- CLK55 AMG'),
(835, 70, '- CLK63 AMG', '- CLK63 AMG'),
(836, 70, 'CLS Class (4)', 'คลาส CLS (4)'),
(837, 70, '- CLS500', '- CLS500'),
(838, 70, '- CLS550', '- CLS550'),
(839, 70, '- CLS55 AMG', '- CLS55 AMG'),
(840, 70, '- CLS63 AMG', '- CLS63 AMG'),
(841, 70, 'E Class (18)', 'คลาส E (18)'),
(842, 70, '- 260E', '- 260E'),
(843, 70, '- 280CE', '- 280CE'),
(844, 70, '- 280E', '- 280E'),
(845, 70, '- 400E', '- 400E'),
(846, 70, '- 500E', '- 500E'),
(847, 70, '- E300', '- E300'),
(848, 70, '- E320', '- E320'),
(849, 70, '- E320 Bluetec', '- E320 Bluetec'),
(850, 70, '- E320 CDI', '- E320 CDI'),
(851, 70, '- E350', '- E350'),
(852, 70, '- E350 Bluetec', '- E350 Bluetec'),
(853, 70, '- E400 Hybrid', '- E400 Hybrid'),
(854, 70, '- E420', '- E420'),
(855, 70, '- E430', '- E430'),
(856, 70, '- E500', '- E500'),
(857, 70, '- E550', '- E550'),
(858, 70, '- E55 AMG', '- E55 AMG'),
(859, 70, '- E63 AMG', '- E63 AMG'),
(860, 70, 'G Class (4)', 'คลาส G (4)'),
(861, 70, '- G500', '- G500'),
(862, 70, '- G550', '- G550'),
(863, 70, '- G55 AMG', '- G55 AMG'),
(864, 70, '- G63 AMG', '- G63 AMG'),
(865, 70, 'GL Class (5)', 'คลาส GL (5)'),
(866, 70, '- GL320 Bluetec', '- GL320 Bluetec'),
(867, 70, '- GL320 CDI', '- GL320 CDI'),
(868, 70, '- GL350 Bluetec', '- GL350 Bluetec'),
(869, 70, '- GL450', '- GL450'),
(870, 70, '- GL550', '- GL550'),
(871, 70, 'GLK Class (1)', 'คลาส GLK (1)'),
(872, 70, '- GLK350', '- GLK350'),
(873, 70, 'M Class (11)', 'คลาส M (11)'),
(874, 70, '- ML320', '- ML320'),
(875, 70, '- ML320 Bluetec', '- ML320 Bluetec'),
(876, 70, '- ML320 CDI', '- ML320 CDI'),
(877, 70, '- ML350', '- ML350'),
(878, 70, '- ML350 Bluetec', '- ML350 Bluetec'),
(879, 70, '- ML430', '- ML430'),
(880, 70, '- ML450 Hybrid', '- ML450 Hybrid'),
(881, 70, '- ML500', '- ML500'),
(882, 70, '- ML550', '- ML550'),
(883, 70, '- ML55 AMG', '- ML55 AMG'),
(884, 70, '- ML63 AMG', '- ML63 AMG'),
(885, 70, 'R Class (6)', 'คลาส R (6)'),
(886, 70, '- R320 Bluetec', '- R320 Bluetec'),
(887, 70, '- R320 CDI', '- R320 CDI'),
(888, 70, '- R350', '- R350'),
(889, 70, '- R350 Bluetec', '- R350 Bluetec'),
(890, 70, '- R500', '- R500'),
(891, 70, '- R63 AMG', '- R63 AMG'),
(892, 70, 'S Class (30)', 'คลาส S (30)'),
(893, 70, '- 300SD', '- 300SD'),
(894, 70, '- 300SDL', '- 300SDL'),
(895, 70, '- 300SE', '- 300SE'),
(896, 70, '- 300SEL', '- 300SEL'),
(897, 70, '- 350SD', '- 350SD'),
(898, 70, '- 350SDL', '- 350SDL'),
(899, 70, '- 380SE', '- 380SE'),
(900, 70, '- 380SEC', '- 380SEC'),
(901, 70, '- 380SEL', '- 380SEL'),
(902, 70, '- 400SE', '- 400SE'),
(903, 70, '- 400SEL', '- 400SEL'),
(904, 70, '- 420SEL', '- 420SEL'),
(905, 70, '- 500SEC', '- 500SEC'),
(906, 70, '- 500SEL', '- 500SEL'),
(907, 70, '- 560SEC', '- 560SEC'),
(908, 70, '- 560SEL', '- 560SEL'),
(909, 70, '- 600SEC', '- 600SEC'),
(910, 70, '- 600SEL', '- 600SEL'),
(911, 70, '- S320', '- S320'),
(912, 70, '- S350', '- S350'),
(913, 70, '- S350 Bluetec', '- S350 Bluetec'),
(914, 70, '- S400 Hybrid', '- S400 Hybrid'),
(915, 70, '- S420', '- S420'),
(916, 70, '- S430', '- S430'),
(917, 70, '- S500', '- S500'),
(918, 70, '- S550', '- S550'),
(919, 70, '- S55 AMG', '- S55 AMG'),
(920, 70, '- S600', '- S600'),
(921, 70, '- S63 AMG', '- S63 AMG'),
(922, 70, '- S65 AMG', '- S65 AMG'),
(923, 70, 'SL Class (13)', 'คลาส SL (13)'),
(924, 70, '- 300SL', '- 300SL'),
(925, 70, '- 380SL', '- 380SL'),
(926, 70, '- 380SLC', '- 380SLC'),
(927, 70, '- 500SL', '- 500SL'),
(928, 70, '- 560SL', '- 560SL'),
(929, 70, '- 600SL', '- 600SL'),
(930, 70, '- SL320', '- SL320'),
(931, 70, '- SL500', '- SL500'),
(932, 70, '- SL550', '- SL550'),
(933, 70, '- SL55 AMG', '- SL55 AMG'),
(934, 70, '- SL600', '- SL600'),
(935, 70, '- SL63 AMG', '- SL63 AMG'),
(936, 70, '- SL65 AMG', '- SL65 AMG'),
(937, 70, 'SLK Class (8)', 'คลาส SLK (8)'),
(938, 70, '- SLK230', '- SLK230'),
(939, 70, '- SLK250', '- SLK250'),
(940, 70, '- SLK280', '- SLK280'),
(941, 70, '- SLK300', '- SLK300'),
(942, 70, '- SLK320', '- SLK320'),
(943, 70, '- SLK32 AMG', '- SLK32 AMG'),
(944, 70, '- SLK350', '- SLK350'),
(945, 70, '- SLK55 AMG', '- SLK55 AMG'),
(946, 70, 'SLR Class (1)', 'คลาส SLR (1)'),
(947, 70, '- SLR', '- SLR'),
(948, 70, 'SLS Class (1)', 'คลาส SLS (1)'),
(949, 70, '- SLS AMG', '- SLS AMG'),
(950, 70, 'Sprinter Class (1)', 'ระดับผู้วิ่งแข่ง (1)'),
(951, 70, '- Sprinter', '- ผู้วิ่งแข่ง'),
(952, 70, 'Other Mercedes-Benz ', 'เมอร์เซเดส - เบนซ์อื่น ๆ'),
(953, 71, 'Capri', 'กางเกงรัดรูปผู้หญิง'),
(954, 71, 'Cougar', 'เสือภูเขา'),
(955, 71, 'Grand Marquis', 'แกรนด์มาร์ควิส'),
(956, 71, 'Lynx', 'แมวป่าชนิดหนึ่ง'),
(957, 71, 'Marauder', 'โจรปล้นสะดม'),
(958, 71, 'Mariner', 'นาวิน'),
(959, 71, 'Marquis', 'ขุนนางมาร์ควิซ'),
(960, 71, 'Milan', 'มิลาน'),
(961, 71, 'Montego', 'Montego'),
(962, 71, 'Monterey', 'มอนเทอร์'),
(963, 71, 'Mountaineer', 'นักไต่เขา'),
(964, 71, 'Mystique', 'ขลัง'),
(965, 71, 'Sable', 'สีน้ำตาลเข้ม'),
(966, 71, 'Topaz', 'บุษราคัม'),
(967, 71, 'Tracer', 'ผู้ตามรอย'),
(968, 71, 'Villager', 'ชาวบ้าน'),
(969, 71, 'Zephyr', 'ลมตะวันตก'),
(970, 71, 'Other Mercury Models', 'โมเดลปรอทอื่น ๆ'),
(971, 72, 'Scorpio', 'ราศีพิจิก'),
(972, 72, 'XR4Ti', 'XR4Ti'),
(973, 72, 'Other Merkur Models', 'โมเดล Merkur อื่น ๆ'),
(974, 73, 'Cooper Clubman Model', 'รุ่น Cooper Clubman'),
(975, 73, '- Cooper Clubman', '- Cooper Clubman'),
(976, 73, '- Cooper S Clubman', '- Cooper S Clubman'),
(977, 73, 'Cooper Countryman Models', 'โมเดล Cooper Countryman'),
(978, 73, '- Cooper Countryman', '- Countryman คูเปอร์'),
(979, 73, '- Cooper S Countryman', '- Cooper S Countryman'),
(980, 73, 'Cooper Coupe Models(2)', 'Cooper Coupe รุ่น (2)'),
(981, 73, '- Cooper Coupe', '- คูเปอร์คูเป้'),
(982, 73, '- Cooper S Coupe', '- Cooper S Coupe'),
(983, 73, 'Cooper Models(2)', 'คูเปอร์โมเดล (2)'),
(984, 73, '- Cooper', '- คูเปอร์'),
(985, 73, '- Cooper S', '- Cooper S'),
(986, 73, 'Cooper Roadster Models', 'รุ่น Cooper Roadster'),
(987, 73, '- Cooper Roadster', '- Cooper Roadster'),
(988, 73, '- Cooper S Roadster', '- Cooper S Roadster'),
(989, 74, '3000GT', '3000GT'),
(990, 74, 'Cordia', 'Cordia'),
(991, 74, 'Diamante', 'Diamante'),
(992, 74, 'Eclipse', 'คราส'),
(993, 74, 'Endeavor', 'พยายาม'),
(994, 74, 'Expo', 'งานแสดงสินค้า'),
(995, 74, 'Galant', 'เจนจบ'),
(996, 74, 'i', 'ผม'),
(997, 74, 'Lancer', 'ทหารม้าถือทวน'),
(998, 74, 'Lancer Evolution', 'แลนเซอร์วิวัฒนาการ'),
(999, 74, 'Mighty Max', 'Mighty Max'),
(1000, 74, 'Mirage', 'ภาพลวงตา'),
(1001, 74, 'Montero', 'Montero'),
(1002, 74, 'Montero Sport', 'มอนเตโรสปอร์ต'),
(1003, 74, 'Outlander', 'ต่างชาติ'),
(1004, 74, 'Outlander Sport', 'กีฬาคนต่างชาติ'),
(1005, 74, 'Precis', 'ย่อความ'),
(1006, 74, 'Raider', 'ผู้ตรวจค้น'),
(1007, 74, 'Sigma', 'ซิกม่า'),
(1008, 74, 'Starion', 'Starion'),
(1009, 74, 'Tredia', 'Tredia'),
(1010, 74, 'Van', 'รถตู้'),
(1011, 74, 'Other Mitsubishi Models', 'โมเดลมิตซูบิชิอื่น ๆ'),
(1012, 75, '200SX', '200SX'),
(1013, 75, '240SX', '240SX'),
(1014, 75, '300ZX', '300ZX'),
(1015, 75, '350Z', '350Z'),
(1016, 75, '370Z', '370Z'),
(1017, 75, 'Altima', 'Altima'),
(1018, 75, 'Armada', 'กองทัพเรือใหญ่'),
(1019, 75, 'Axxess', 'Axxess'),
(1020, 75, 'Cube', 'ลูกบาศก์'),
(1021, 75, 'Frontier', 'ชายแดน'),
(1022, 75, 'GT-R', 'GT-R'),
(1023, 75, 'Juke', 'การวิ่งหลอก'),
(1024, 75, 'Leaf', 'ใบไม้'),
(1025, 75, 'Maxima', 'Maxima'),
(1026, 75, 'Murano', 'มูราโน่'),
(1027, 75, 'Murano CrossCabriolet', 'Murano CrossCabriolet'),
(1028, 75, 'NV', 'NV'),
(1029, 75, 'NX', 'NX'),
(1030, 75, 'Pathfinder', 'ผู้เบิกทาง'),
(1031, 75, 'Pickup', 'ไปรับ'),
(1032, 75, 'Pulsar', 'พูลสาร์'),
(1033, 75, 'Quest', 'การแสวงหา'),
(1034, 75, 'Rogue', 'โกง'),
(1035, 75, 'Sentra', 'Sentra'),
(1036, 75, 'Stanza', 'ฉันท์'),
(1037, 75, 'Titan', 'ยักษ์'),
(1038, 75, 'Van', 'รถตู้'),
(1039, 75, 'Versa', 'ในทางกลับกัน'),
(1040, 75, 'Xterra', 'Xterra'),
(1041, 75, 'Other Nissan Models', 'รุ่นอื่น ๆ ของ Nissan'),
(1042, 76, '88', 'แปด​สิบ​แปด'),
(1043, 76, 'Achieva', 'Achieva'),
(1044, 76, 'Alero', 'Alero'),
(1045, 76, 'Aurora', 'ออโรร่า'),
(1046, 76, 'Bravada', 'Bravada'),
(1047, 76, 'Custom Cruiser', 'เรือลาดตระเวนที่กำหนดเอง'),
(1048, 76, 'Cutlass', 'มีดสั้น'),
(1049, 76, 'Cutlass Calais', 'กาเลส์'),
(1050, 76, 'Cutlass Ciera', 'Cutlass Ciera'),
(1051, 76, 'Cutlass Supreme', 'Cutlass Supreme'),
(1052, 76, 'Firenza', 'Firenza'),
(1053, 76, 'Intrigue', 'วางอุบาย'),
(1054, 76, 'Ninety-Eight', 'เก้าสิบแปด'),
(1055, 76, 'Omega', 'อวสาน'),
(1056, 76, 'Regency', 'รีเจนซี่'),
(1057, 76, 'Silhouette', 'ภาพเงา'),
(1058, 76, 'Toronado', 'Toronado'),
(1059, 76, 'Other Oldsmobile Models', 'โมเดล Oldsmobile อื่น ๆ'),
(1060, 77, '405', 'สี่​ร้อย​ห้า'),
(1061, 77, '504', 'ห้า​ร้อย​สี่'),
(1062, 77, '505', 'ห้า​ร้อย​ห้า'),
(1063, 77, '604', 'หก​ร้อย​สี่'),
(1064, 77, 'Other Peugeot Models', 'โมเดลเปอโยต์อื่น ๆ'),
(1065, 79, 'Acclaim', 'เสียงไชโยโห่ร้อง'),
(1066, 79, 'Arrow', 'ลูกศร'),
(1067, 79, 'Breeze', 'ลมโชย'),
(1068, 79, 'Caravelle', 'Caravelle'),
(1069, 79, 'Champ', 'เคี้ยวดังจั๊บๆ'),
(1070, 79, 'Colt', 'เด็กผู้ชายที่อ่อนหัด'),
(1071, 79, 'Conquest', 'ชนะ'),
(1072, 79, 'Gran Fury', 'Gran Fury'),
(1073, 79, 'Grand Voyager', 'Grand Voyager'),
(1074, 79, 'Horizon', 'ขอบฟ้า'),
(1075, 79, 'Laser', 'เลเซอร์'),
(1076, 79, 'Neon', 'ธาตุนีอ็อน'),
(1077, 79, 'Prowler', 'ผู้เที่ยวเดินด้อม ๆ มองๆ'),
(1078, 79, 'Reliant', 'คู่ใจ'),
(1079, 79, 'Sapporo', 'ซัปโปโร'),
(1080, 79, 'Scamp', 'คนขี้โกง'),
(1081, 79, 'Sundance', 'ซันแดนซ์'),
(1082, 79, 'Trailduster', 'Trailduster'),
(1083, 79, 'Voyager', 'ผู้เดินทาง'),
(1084, 79, 'Other Plymouth Models', 'โมเดลพลีมั ธ อื่น ๆ'),
(1085, 80, '1000', 'หนึ่ง​พัน'),
(1086, 80, '6000', 'หก​พัน'),
(1087, 80, 'Aztek', 'Aztek'),
(1088, 80, 'Bonneville', 'บอง'),
(1089, 80, 'Catalina', 'Catalina'),
(1090, 80, 'Fiero', 'Fiero'),
(1091, 80, 'Firebird', 'Firebird'),
(1092, 80, 'G3', 'G3'),
(1093, 80, 'G5', 'G5'),
(1094, 80, 'G6', 'G6'),
(1095, 80, 'G8', 'G8'),
(1096, 80, 'Grand Am', 'แกรนด์'),
(1097, 80, 'Grand Prix', 'กรังปรีซ์'),
(1098, 80, 'GTO', 'GTO'),
(1099, 80, 'J2000', 'J2000'),
(1100, 80, 'Le Mans', 'เลอม็อง'),
(1101, 80, 'Montana', 'มอนแทนา'),
(1102, 80, 'Parisienne', 'Parisienne'),
(1103, 80, 'Phoenix', 'ต้นอินทผลัม'),
(1104, 80, 'Safari', 'การแข่งรถวิบาก'),
(1105, 80, 'Solstice', 'อายัน'),
(1106, 80, 'Sunbird', 'Sunbird'),
(1107, 80, 'Sunfire', 'Sunfire'),
(1108, 80, 'Torrent', 'ฝนตกหนัก'),
(1109, 80, 'Trans Sport', 'ทรานส์สปอร์ต'),
(1110, 80, 'Vibe', 'บรรยากาศ'),
(1111, 80, 'Other Pontiac Models', 'โมเดลรถปอนเตี๊ยกอื่น ๆ'),
(1112, 81, '911', 'เก้า​ร้อย​สิบ​เอ็ด'),
(1113, 81, '924', 'เก้า​ร้อย​ยี่​สิบ​สี่'),
(1114, 81, '928', 'เก้า​ร้อย​ยี่​สิบ​แปด'),
(1115, 81, '944', 'เก้า​ร้อย​สี่​สิบ​สี่'),
(1116, 81, '968', 'เก้า​ร้อย​หก​สิบ​แปด'),
(1117, 81, 'Boxster', 'บ็อกซเตอร์'),
(1118, 81, 'Carrera GT', 'Carrera GT'),
(1119, 81, 'Cayenne', 'พริกป่น'),
(1120, 81, 'Cayman', 'เคย์แมน'),
(1121, 81, 'Panamera', 'พานาเมร่า'),
(1122, 81, 'Other Porsche Models', 'โมเดลรถปอร์เช่อื่น ๆ'),
(1123, 82, '1500', 'หนึ่ง​พัน​ห้า​ร้อย'),
(1124, 82, '2500', 'สอง​พัน​ห้า​ร้อย'),
(1125, 82, '3500', 'สาม​พัน​ห้า​ร้อย'),
(1126, 82, '4500', 'สี่​พัน​ห้า​ร้อย'),
(1127, 83, '18i', '18i'),
(1128, 83, 'Fuego', 'Fuego'),
(1129, 83, 'Le Car', 'เลอคาร์'),
(1130, 83, 'R18', 'R18'),
(1131, 83, 'Sportwagon', 'Sportwagon'),
(1132, 83, 'Other Renault Models', 'โมเดลเรโนลต์อื่น ๆ'),
(1133, 84, 'Camargue', 'Camargue'),
(1134, 84, 'Corniche', 'Corniche'),
(1135, 84, 'Ghost', 'ผี'),
(1136, 84, 'Park Ward', 'ปาร์ควอร์ด'),
(1137, 84, 'Phantom', 'ผี'),
(1138, 84, 'Silver Dawn', 'เงินรุ่งอรุณ'),
(1139, 84, 'Silver Seraph', 'เซราฟเงิน'),
(1140, 84, 'Silver Spirit', 'วิญญาณเงิน'),
(1141, 84, 'Silver Spur', 'ซิลเวอร์เดือย'),
(1142, 84, 'Other Rolls-Royce Models', 'โมเดลโรลส์ - รอยซ์อื่น ๆ'),
(1143, 97, 'GV', 'GV'),
(1144, 97, 'GVC', 'GVC'),
(1145, 97, 'GVL', 'GVL'),
(1146, 97, 'GVS', 'GVS'),
(1147, 97, 'GVX', 'GVX'),
(1148, 97, 'Other Yugo Models', 'โมเดล Yugo อื่น ๆ'),
(1149, 96, '240', 'สอง​ร้อย​สี่​สิบ'),
(1150, 96, '260', 'สอง​ร้อย​หก​สิบ'),
(1151, 96, '740', 'เจ็ด​ร้อย​สี่​สิบ'),
(1152, 96, '760', 'เจ็ด​ร้อย​หก​สิบ'),
(1153, 96, '780', 'เจ็ด​ร้อย​แปด​สิบ'),
(1154, 96, '850', 'แปด​ร้อย​ห้า​สิบ'),
(1155, 96, '940', 'เก้า​ร้อย​สี่​สิบ'),
(1156, 96, '960', 'เก้า​ร้อย​หก​สิบ'),
(1157, 96, 'C30', 'C30'),
(1158, 96, 'C70', 'C70'),
(1159, 96, 'S40', 'S40'),
(1160, 96, 'S60', 'S60'),
(1161, 96, 'S70', 'S70'),
(1162, 96, 'S80', 'S80'),
(1163, 96, 'S90', 'S90'),
(1164, 96, 'V40', 'V40'),
(1165, 96, 'V50', 'V50'),
(1166, 96, 'V70', 'V70'),
(1167, 96, 'V90', 'V90'),
(1168, 96, 'XC60', 'XC60'),
(1169, 96, 'XC70', 'XC70'),
(1170, 96, 'Other Volvo Models', 'โมเดลวอลโว่อื่น ๆ'),
(1171, 96, 'XC90', 'XC90'),
(1172, 95, 'Beetle', 'ด้วง'),
(1173, 95, 'Cabrio', 'Cabrio'),
(1174, 95, 'Cabriolet', 'Cabriolet'),
(1175, 95, 'CC', 'CC'),
(1176, 95, 'Corrado', 'คอร์ราโด'),
(1177, 95, 'Dasher', 'แดชเชอร์'),
(1178, 95, 'Eos', 'Eos'),
(1179, 95, 'Eurovan', 'Eurovan'),
(1180, 95, 'Fox', 'จิ้งจอก'),
(1181, 95, 'GLI', 'GLI'),
(1182, 95, 'Golf R', 'กอล์ฟอาร์'),
(1183, 95, 'GTI', 'GTI'),
(1184, 95, 'Golf and Rabbit Models(2)', 'แบบจำลองกอล์ฟและกระต่าย (2)'),
(1185, 95, '- Golf', '- สนามกอล์ฟ'),
(1186, 95, '- Rabbit', '- กระต่าย'),
(1187, 95, 'Jetta', 'Jetta'),
(1188, 95, 'Passat', 'Passat'),
(1189, 95, 'Phaeton', 'รถม้าเปิดประทุน'),
(1190, 95, 'Pickup', 'ไปรับ'),
(1191, 95, 'Quantum', 'ควอนตัม'),
(1192, 95, 'R32', 'R32'),
(1193, 95, 'Routan', 'Routan'),
(1194, 95, 'Scirocco', 'ร็อคโค่'),
(1195, 95, 'Tiguan', 'Tiguan'),
(1196, 95, 'Touareg', 'Touareg'),
(1197, 95, 'Vanagon', 'Vanagon'),
(1198, 95, 'Other Volkswagen Models', 'โมเดลโฟล์คสวาเกนอื่น ๆ'),
(1199, 98, 'TR7', 'TR7'),
(1200, 98, 'TR8', 'TR8'),
(1201, 98, 'Other Triumph Models', 'รุ่นไทรอัมพ์อื่น ๆ'),
(1202, 93, 'Roadster', 'รถยนต์เปิดประทน'),
(1203, 94, '4Runner', '4Runner'),
(1204, 94, 'Avalon', 'รีสอร์ต'),
(1205, 94, 'Camry', 'คัมรี่'),
(1206, 94, 'Celica', 'เซลิก้า'),
(1207, 94, 'Corolla', 'กลีบดอกไม้'),
(1208, 94, 'Corona', 'มาลา'),
(1209, 94, 'Cressida', 'เครสสิด้า'),
(1210, 94, 'Echo', 'เสียงสะท้อน'),
(1211, 94, 'FJ Cruiser', 'FJ Cruiser'),
(1212, 94, 'Highlander', 'Highlander'),
(1213, 94, 'Land Cruiser', 'ครุยเซอร์แลนด์'),
(1214, 94, 'Matrix', 'มดลูก'),
(1215, 94, 'MR2', 'MR2'),
(1216, 94, 'MR2 Spyder', 'MR2 Spyder'),
(1217, 94, 'Paseo', 'Paseo'),
(1218, 94, 'Pickup', 'ไปรับ'),
(1219, 94, 'Previa', 'Previa'),
(1220, 94, 'Prius', 'พรีอุส'),
(1221, 94, 'Prius C', 'Prius ได'),
(1222, 94, 'Prius V', 'Prius V'),
(1223, 94, 'RAV4', 'RAV4'),
(1224, 94, 'Sequoia', 'ต้นสีคโวยะ'),
(1225, 94, 'Sienna', 'สีน้ำตาล'),
(1226, 94, 'Solara', 'Solara'),
(1227, 94, 'Starlet', 'ดาราหน้าใหม่'),
(1228, 94, 'Supra', 'Supra'),
(1229, 94, 'T100', 'T100'),
(1230, 94, 'Tacoma', 'ทาโคมา'),
(1231, 94, 'Tercel', 'Tercel'),
(1232, 94, 'Tundra', 'ทุ่งทุนดรา'),
(1233, 94, 'Van', 'รถตู้'),
(1234, 94, 'Venza', 'Venza'),
(1235, 94, 'Yaris', 'Yaris'),
(1236, 94, 'Other Toyota Models', 'โมเดลโตโยต้าอื่น ๆ'),
(1237, 85, '9-2X', '9-2X'),
(1238, 85, '9-3', '9-3'),
(1239, 85, '9-4X', '9-4X'),
(1240, 85, '9-5', '9-5'),
(1241, 85, '9-7X', '9-7X'),
(1242, 85, '900', 'เก้า​ร้อย'),
(1243, 85, '9000', 'เก้า​พัน'),
(1244, 85, 'Other Saab Models', 'โมเดลของ Saab อื่น ๆ'),
(1245, 86, 'Astra', 'แอสตร้า'),
(1246, 86, 'Aura', 'กลิ่นอาย'),
(1247, 86, 'ION', 'ไอออน'),
(1248, 86, 'L Series (3)', 'ซีรี่ส์ L (3)'),
(1249, 86, '- L100', '- L100'),
(1250, 86, '- L200', '- L200'),
(1251, 86, '- L300', '- L300'),
(1252, 86, 'LS', 'LS'),
(1253, 86, 'LW Series(4)', 'LW ซีรี่ส์ (4)'),
(1254, 86, '- LW1', '- LW1'),
(1255, 86, '- LW2', '- LW2'),
(1256, 86, '- LW200', '- LW200'),
(1257, 86, '- LW300', '- LW300'),
(1258, 86, 'Outlook', 'ภาพ'),
(1259, 86, 'Relay', 'ถ่ายทอด'),
(1260, 86, 'SC Series(2)', 'ซีรี่ส์ SC (2)'),
(1261, 86, '- SC1', '- SC1'),
(1262, 86, '- SC2', '- SC2'),
(1263, 86, 'Sky', 'ท้องฟ้า'),
(1264, 86, 'SL Series(3)', 'SL ซีรี่ส์ (3)'),
(1265, 86, '- SL', '- SL'),
(1266, 86, '- SL1', '- SL1'),
(1267, 86, '- SL2', '- SL2'),
(1268, 86, 'SW Series(2)', 'ซีรีย์ SW (2)'),
(1269, 86, '- SW1', '- SW1'),
(1270, 86, '- SW2', '- SW2'),
(1271, 86, 'Vue', 'Vue'),
(1272, 86, 'Other Saturn Models', 'รุ่นอื่น ๆ ของดาวเสาร์'),
(1273, 87, 'FR-S', 'FR-S'),
(1274, 87, 'iQ', 'iQ'),
(1275, 87, 'tC', 'tC'),
(1276, 87, 'xA', 'xA'),
(1277, 87, 'xB', 'xB'),
(1278, 87, 'xD', 'xD'),
(1279, 88, 'fortwo', 'สำหรับสอง'),
(1280, 88, 'Other smart Models', 'รุ่นสมาร์ทอื่น ๆ'),
(1281, 89, 'Viper', 'งูพิษ'),
(1282, 90, '825', 'แปด​ร้อย​ยี่​สิบ​ห้า'),
(1283, 90, '827', 'แปด​ร้อย​ยี่​สิบ​เจ็ด'),
(1284, 90, 'Other Sterling Models', 'สเตอร์ลิงรุ่นอื่น ๆ'),
(1285, 91, 'Baja', 'Baja'),
(1286, 91, 'Brat', 'เด็กเหลือขอ'),
(1287, 91, 'BRZ', 'BRZ'),
(1288, 91, 'Forester', 'ชาวป่า'),
(1289, 91, 'Impreza', 'Impreza'),
(1290, 91, 'Impreza WRX', 'Impreza WRX'),
(1291, 91, 'Justy', 'Justy'),
(1292, 91, 'L Series', 'ซีรี่ส์ L'),
(1293, 91, 'Legacy', 'มรดก'),
(1294, 91, 'Loyale', 'Loyale'),
(1295, 91, 'Outback', 'ชนบทห่างไกล'),
(1296, 91, 'SVX', 'SVX'),
(1297, 91, 'Tribeca', 'Tribeca'),
(1298, 91, 'XT', 'XT'),
(1299, 91, 'XV Crosstrek', 'XV Crosstrek'),
(1300, 91, 'Other Subaru Models', 'โมเดล Subaru อื่น ๆ'),
(1301, 92, 'Aerio', 'Aerio'),
(1302, 92, 'Equator', 'เส้นศูนย์สูตร'),
(1303, 92, 'Esteem', 'นับถือ'),
(1304, 92, 'Forenza', 'Forenza'),
(1305, 92, 'Grand Vitara', 'Grand Vitara'),
(1306, 92, 'Kizashi', 'Kizashi'),
(1307, 92, 'Reno', 'รีโน'),
(1308, 92, 'Samurai', 'ซามูไร'),
(1309, 92, 'Sidekick', 'เพื่อนสนิท'),
(1310, 92, 'Swift', 'รวดเร็ว'),
(1311, 92, 'SX4', 'SX4'),
(1312, 92, 'Verona', 'เวโรนา'),
(1313, 92, 'Vitara', 'Vitara'),
(1314, 92, 'X-90', 'X-90'),
(1315, 92, 'XL7', 'XL7'),
(1316, 92, 'Other Suzuki Models', 'โมเดล Suzuki อื่น ๆ');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_types`
--

CREATE TABLE `thai_category_types` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(50) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_types`
--

INSERT INTO `thai_category_types` (`id`, `category_id`, `title_en`, `title_th`) VALUES
(1, 4, 'New', 'ใหม่'),
(2, 4, 'Old', 'เก่า'),
(3, 5, 'New', 'ใหม่'),
(4, 5, 'Old', 'เก่า'),
(5, 6, 'New', 'ใหม่'),
(6, 6, 'Old', 'เก่า'),
(7, 7, 'New', 'ใหม่'),
(8, 7, 'Old', 'เก่า'),
(9, 8, 'Full-Time', 'เต็มเวลา'),
(10, 8, 'Part-Time', 'ไม่เต็มเวลา'),
(11, 8, 'Temporary', 'ชั่วคราว'),
(12, 9, 'Full-Time', 'เต็มเวลา'),
(13, 9, 'Part-Time', 'ไม่เต็มเวลา'),
(14, 9, 'Temporary', 'ชั่วคราว'),
(15, 10, 'Full-Time', 'เต็มเวลา'),
(16, 10, 'Part-Time', 'ไม่เต็มเวลา'),
(17, 10, 'Temporary', 'ชั่วคราว'),
(18, 11, 'Full-Time', 'เต็มเวลา'),
(19, 11, 'Part-Time', 'ไม่เต็มเวลา'),
(20, 11, 'Temporary', 'ชั่วคราว'),
(21, 12, 'Full-Time', 'เต็มเวลา'),
(22, 12, 'Part-Time', 'ไม่เต็มเวลา'),
(23, 12, 'Temporary', 'ชั่วคราว'),
(24, 13, 'Full-Time', 'เต็มเวลา'),
(25, 13, 'Part-Time', 'ไม่เต็มเวลา'),
(26, 13, 'Temporary', 'ชั่วคราว'),
(27, 18, 'Acura', 'Acura'),
(28, 18, 'Alfa Romeo', 'อัลฟ่าโรมิโอ'),
(29, 18, 'AMC', 'บบส.'),
(30, 18, 'Aston Martin', 'แอสตันมาร์ติน'),
(31, 18, 'Audi', 'ออดี้'),
(32, 18, 'Avanti', 'Avanti'),
(33, 18, 'Bentley', 'เบนท์ลีย์'),
(34, 18, 'BMW', 'BMW'),
(35, 18, 'Buick', 'บูอิค'),
(36, 18, 'Cadillac', 'ดิลแลค'),
(37, 18, 'Chevrolet', 'เชฟโรเลต'),
(38, 18, 'Chrysler', 'ไครสเลอร์'),
(39, 18, 'Daewoo', 'Daewoo'),
(40, 18, 'Daihatsu', 'ไดฮัทสุ'),
(41, 18, 'Datsun', 'Datsun'),
(42, 18, 'DeLorean', 'DeLorean'),
(43, 18, 'Dodge', 'หลบ'),
(44, 18, 'Eagle', 'นกอินทรีย์'),
(45, 18, 'Ferrari', 'เฟอร์รารี'),
(46, 18, 'FIAT', 'FIAT'),
(47, 18, 'Fisker', 'Fisker'),
(48, 18, 'Ford', 'ลุย'),
(49, 18, 'Freightliner', 'ไลเนอร์'),
(50, 18, 'Geo', 'ภูมิศาสตร์'),
(51, 18, 'GMC', 'GMC'),
(52, 18, 'Honda', 'ฮอนด้า'),
(53, 18, 'HUMMER', 'HUMMER'),
(54, 18, 'Hyundai', 'ฮุนได'),
(55, 18, 'Infiniti', 'อินฟินิตี้'),
(56, 18, 'Isuzu', 'อีซูซุ'),
(57, 18, 'Jaguar', 'เสือแผ้ว'),
(58, 18, 'Jeep', 'รถจี๊ป'),
(59, 18, 'Kia', 'Kia'),
(60, 18, 'Lamborghini', 'Lamborghini'),
(61, 18, 'Lancia', 'Lancia'),
(62, 18, 'Land Rover', 'แลนด์โรเวอร์'),
(63, 18, 'Lexus', 'เล็กซัส'),
(64, 18, 'Lincoln', 'ลิงคอล์น'),
(65, 18, 'Lotus', 'บัว'),
(66, 18, 'Maserati', 'เซราติ'),
(67, 18, 'Maybach', 'มายบัค'),
(68, 18, 'Mazda', 'มาสด้า'),
(69, 18, 'McLaren', 'แม็คลาเรน'),
(70, 18, 'Mercedes-Benz', 'Mercedes-Benz'),
(71, 18, 'Mercury', 'ปรอท'),
(72, 18, 'Merkur', 'Merkur'),
(73, 18, 'MINI', 'MINI'),
(74, 18, 'Mitsubishi', 'มิตซูบิชิ'),
(75, 18, 'Nissan', 'นิสสัน'),
(76, 18, 'Oldsmobile', 'Oldsmobile'),
(77, 18, 'Peugeot', 'เปอโยต์'),
(78, 18, 'Maserati', 'เซราติ'),
(79, 18, 'Plymouth', 'พลีมั ธ'),
(80, 18, 'Pontiac', 'Pontiac'),
(81, 18, 'Porsche', 'ปอร์เช่'),
(82, 18, 'RAM', 'แกะ'),
(83, 18, 'Renault', 'เรโนลต์'),
(84, 18, 'Rolls-Royce', 'Rolls-Royce'),
(85, 18, 'Saab', 'Saab'),
(86, 18, 'Saturn', 'ดาวเสาร์'),
(87, 18, 'Scion', 'หน่อ'),
(88, 18, 'smart', 'ฉลาด'),
(89, 18, 'SRT', 'SRT'),
(90, 18, 'Sterling', 'เงินสเตอร์ลิง'),
(91, 18, 'Subaru', 'ซูบารุ'),
(92, 18, 'Suzuki', 'อีกแห่งหนึ่งโดย'),
(93, 18, 'Tesla', 'เทสลา'),
(94, 18, 'Toyota', 'โตโยต้า'),
(95, 18, 'Volkswagen', 'โฟล์คสวาเก้น'),
(96, 18, 'Volvo', 'วอลโว่'),
(97, 18, 'Yugo', 'ยูโก้'),
(98, 18, 'Triumph', 'ชัย'),
(99, 19, 'Car Parts', 'ชิ้นส่วนรถยนต์'),
(100, 19, 'Other Parts', 'ส่วนอื่น ๆ'),
(101, 19, 'Spare Parts', 'อะไหล่สำรอง'),
(102, 20, 'Commercial Vehicles', 'รถยนต์เพื่อการพาณิชย์'),
(103, 21, 'Other Vehicles', 'ยานพาหนะอื่น ๆ'),
(104, 22, 'Honda', 'ฮอนด้า'),
(105, 22, 'Bajaj', 'Bajaj'),
(106, 22, 'TVS', 'TVS'),
(107, 22, 'Suzuki', 'อีกแห่งหนึ่งโดย'),
(108, 22, 'Kinetic', 'เกี่ยวกับการเคลื่อนไหว'),
(109, 22, 'Mahindra', 'Mahindra'),
(110, 23, 'Hercules', 'Hercules'),
(111, 23, 'BSA', 'บีเอสเอ'),
(112, 23, 'Atlas', 'สมุดแผนที่'),
(113, 23, 'Avon', 'เอวอน'),
(114, 23, 'Firefox', 'Firefox'),
(115, 23, 'Trek', 'ช่วงระยะการเดินทาง'),
(116, 25, 'Rent', 'ให้เช่า'),
(117, 25, 'Sale', 'การขาย'),
(118, 26, 'Rent', 'ให้เช่า'),
(119, 26, 'Sale', 'การขาย'),
(120, 27, 'Rent', 'ให้เช่า'),
(121, 27, 'Sale', 'การขาย'),
(122, 28, 'Lease', 'เช่า'),
(123, 28, 'Sale', 'การขาย'),
(124, 29, 'Sharing', 'ที่ใช้ร่วมกัน'),
(125, 29, 'Rent', 'ให้เช่า'),
(126, 30, 'Rent', 'ให้เช่า'),
(127, 32, 'Women', 'ผู้หญิง'),
(128, 32, 'Men', 'ผู้ชาย'),
(129, 33, 'Women', 'ผู้หญิง'),
(130, 33, 'Men', 'ผู้ชาย'),
(131, 34, 'Women', 'ผู้หญิง'),
(132, 34, 'Men', 'ผู้ชาย'),
(133, 36, 'Laptops', 'แล็ปท็อป'),
(134, 36, 'Computers', 'คอมพิวเตอร์'),
(135, 36, 'Internet', 'อินเทอร์เน็ต'),
(136, 36, 'Printers', 'เครื่องพิมพ์'),
(137, 36, 'Monitors', 'จอภาพ'),
(138, 36, 'Hard Disk', 'ฮาร์ดดิสก์'),
(139, 36, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ'),
(140, 37, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ'),
(141, 38, 'Video-Audio', 'วิดีโอและเสียง'),
(142, 38, 'TV', 'โทรทัศน์'),
(143, 39, 'Cameras', 'กล้อง'),
(144, 39, 'Lenses', 'เลนส์'),
(145, 39, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ'),
(146, 40, 'Games and Entertainment', 'เกมและความบันเทิง'),
(147, 41, 'Fridges', 'ตู้เย็น'),
(148, 41, 'Washing Machines', 'เครื่องซักผ้า'),
(149, 41, 'AC', 'ไฟฟ้ากระแสสลับ');

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
(10, 12345, 4, 6, 5, 'mg jgj hg ', 1, 0, '2020-02-18 10:37:50'),
(11, 35, 0, 5, 0, 'hello', 1, 0, '2020-03-13 10:38:31');

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
  `title_en` varchar(255) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
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

INSERT INTO `thai_products` (`id`, `category_id`, `subcategory_id`, `user_id`, `title_en`, `title_th`, `description_en`, `description_th`, `status`, `trash`, `created_date`, `price`, `location`, `type`, `ad_type`, `submodel`, `model`, `brand`, `year_registration`, `driven`, `fuel_type`, `gearbox`, `features`, `featured`, `latitude`, `longitude`, `sort_date`, `views`) VALUES
(1, 16, 18, 5, 'New Tesla5 for sale', NULL, 'Test Drive First.New Tesla for sale is available', NULL, 1, 0, '2020-02-05 17:53:35', 800, 'Berlin, Germany', 'abc', 0, NULL, 'TS-5T', 'Mercedes', 2020, 11, 'Gasoline', 'vbn', 'No', 1, '51.58250734077006', '-1.4598505851562549', '2020-03-09 17:53:54', 5),
(2, 2, 8, 6, 'Full Stack Developer', NULL, 'We are looking to hire urgently developer.The candidate must have Web Application Design and implementation. Work closely with Mobile App developers. Design and implement front-end and back-end of web dashboard for mobile', NULL, 1, 0, '2020-02-05 17:55:02', 750, 'Office#7, anchorage, Alaska', 'Urgent ', 0, NULL, '', 'Issac\\\'s Code', 2016, 0, '', '', '', 1, '', '', '2020-03-09 17:53:54', 0),
(3, 1, 7, 6, ' Multi Color Solar Light Pots for outdoor Garden', NULL, 'These plants pots are in multi color with solar light embedded.Best pots for your Outdoor garden', NULL, 1, 0, '2020-02-10 07:24:22', 350, '25 notting hill, Anchorage, Alaska', '', 0, NULL, '', '', 0000, 0, '', '', '', 1, '', '', '2020-03-09 17:53:54', 3),
(4, 24, 25, 8, 'Puppy for sale', NULL, 'Its Half breed german shephard puppy for sale', NULL, 3, 0, '2020-02-10 13:45:07', 150, 'rawalpindi', 'rent', 0, NULL, 'Half-Breed small size ', 'Half Breed German Shephard', 2000, 0, '', '', '', 1, '	33.738045', '	73.084488', '2020-03-09 17:53:54', 3),
(5, 24, 25, 5, 'Fully Automatic Washing Machinw', NULL, '- 10 Year Motor Warranty, - Fully Automatic Washing Machine, - Anti Bacterial Wash, - One way wash', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-02-10 13:57:43', 500, 'Berlin, Germany', '', 0, NULL, ' HWM 85-826', 'Haier', 0000, 0, '', '', 'NO', 1, '', '', '2020-03-09 17:53:54', 15),
(6, 24, 25, 6, 'Khan Hut', 'Khan กระท่อม', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'Ut enim โฆษณา minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip องแฟนเก่า ea commodo consequat. Duis aute irure dolor ใน reprehenderit ใน voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2, 0, '2020-02-16 17:16:46', 40000, 'London, UK', 'rent', 0, NULL, '', '', 2013, 0, '', '', 'Lot of benefits', 0, '51.58250734077006', '-0.09754589765625488', '2020-03-09 17:53:54', 1),
(7, 24, 26, 6, 'Old Buddies', 'เพื่อนเก่า', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', 'Sed ut perspiciatis unde omnis iste natus เกิดข้อผิดพลาดนั่ง voluptatem accusantium doloremque laudantium,totam rem aperiam,eaque ipsa quae เกี่ illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', 2, 0, '2020-02-16 17:37:41', 3000, 'North Wessex', 'buy', 0, NULL, '', '', 0000, 0, '', '', '', 0, '51.483411449684205', '-1.4598505851562549', '2020-03-09 17:53:54', 1),
(8, 2, 11, 6, 'testing for langauage', NULL, 'hello i am fine how are you\r\nhow are you\r\n\r\n', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-03-09 13:20:27', 36, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Full-Time', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, '51.5073509', '-0.1277583', '2020-03-09 18:20:27', 0),
(9, 2, 13, 6, 'jobs needes', NULL, 'jobs are required', 'ทำงานต้องการ', 1, 0, '2020-03-10 07:11:59', 20000, 'Streatham, London, UK', 'Full-Time', 0, '', '', '', 0000, 0, '', NULL, '', 0, '51.5073509', '-0.1277583', '2020-03-10 12:11:59', 0),
(10, 24, 27, 6, 'House', NULL, 'house for rent', 'บ้านสำหรับค่าเช่า', 1, 0, '2020-03-10 08:05:15', 4334, 'Tate Modern, Bankside, London, UK', 'Rent', 0, '', '', '', 0000, 0, '', NULL, '', 0, '51.50759530000001', '-0.09935640000000001', '2020-03-10 13:05:15', 5),
(11, 16, 18, 6, 'Car for sale', NULL, 'urgent car sale in low price', 'เร่งด่วนรถขายในราคาต่ำ', 1, 0, '2020-03-10 08:15:50', 5678, 'John Lewis & Partners, Oxford Street, London, UK', 'Honda,', 0, '', 'MPV', 'civic', 2017, 25000, '', NULL, '1-2-3', 0, '51.5154109', '-0.145197', '2020-03-10 13:15:50', 0),
(27, 24, 27, 6, 'ggg', NULL, 'ree', 'ree', 1, 0, '2020-03-12 06:34:56', 53, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Rent', 0, '', '', '', 0000, 0, '', NULL, '', 0, '51.5073509', '-0.1277583', '2020-03-12 11:34:56', 0),
(29, 16, 18, 6, 'checking', '', 'send', 'ส่ง', 1, 0, '2020-03-12 13:59:18', 5545, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Audi', 0, '', 'Pick Up', '', NULL, 0, NULL, NULL, NULL, 0, '51.1536621', '-0.1820629', '2020-03-12 18:59:18', 0);

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
  `alt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `main` int(2) NOT NULL DEFAULT 0 COMMENT '1=main image',
  `trash` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_product_images`
--

INSERT INTO `thai_product_images` (`id`, `product_id`, `img`, `alt`, `description`, `main`, `trash`) VALUES
(1, 1, '202002071723512487.png', 'tasla', 'tasla car', 1, 0),
(4, 1, '202002071741093981.png', NULL, NULL, 0, 1),
(5, 1, '202002071746299248.png', NULL, NULL, 0, 1),
(6, 1, '202002071749091795.png', NULL, NULL, 0, 1),
(7, 1, '202002101323588361.jpg', 'tasla1', 'tasla car 123', 0, 0),
(9, 1, '202002101342456749.jpg', '', '', 0, 0),
(10, 3, '202002101417235422.jpg', NULL, NULL, 1, 0),
(11, 2, '202002101436434498.jpg', '', '', 0, 0),
(12, 4, '202002101445293568.jpg', NULL, NULL, 1, 0),
(13, 4, '202002101445293439.jpg', NULL, NULL, 0, 0),
(14, 5, '202002101458191571.jpg', NULL, NULL, 1, 0),
(15, 5, '202002101458199157.jpg', NULL, NULL, 0, 0),
(16, 5, '202002101458198303.jpg', NULL, NULL, 0, 0),
(17, 6, '202002161816466520.jpg', NULL, NULL, 1, 0),
(18, 6, '202002161816462586.jpg', NULL, NULL, 0, 0),
(19, 6, '202002161816465771.jpg', NULL, NULL, 0, 0),
(20, 7, '202002161837414552.jpg', NULL, NULL, 1, 0),
(21, 7, '202002161837418629.jpg', NULL, NULL, 0, 0),
(22, 9, '202003100811599256.jpg', NULL, NULL, 1, 0),
(23, 9, '202003100811593020.png', NULL, NULL, 0, 0),
(24, 9, '202003100811594916.png', NULL, NULL, 0, 0),
(25, 10, '202003100905155415.jpg', NULL, NULL, 1, 0),
(26, 10, '202003100905158672.jpg', NULL, NULL, 0, 0),
(27, 11, '202003100915502172.jpg', NULL, NULL, 1, 0),
(36, 28, '202003120822532740.jpg', NULL, NULL, 1, 0),
(37, 29, '202003121459181422.jpg', NULL, NULL, 1, 0);

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
('Ben Dunk', '+98712364-55', 'test@test.com', 5, 'MTIzNDU=', NULL, 1, 123456, 'north', 'Bjdiensl', 'thailand', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0, 1, '2020-03-13 06:37:52'),
('vender 1', '+123456789', 'test1@test1.com', 6, 'MTIzNDU=', '202003101321348762.png', 1, 12345678, 'Rljwei', 'Piwjespkkkk', 'Idlkweji wie jsd wfgi gdj fjxvsnjd', 10, 6, 1, NULL, 0, '2020-01-10 06:52:30', 1, 1, '2020-03-13 10:59:01'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `thai_category_models`
--
ALTER TABLE `thai_category_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `thai_category_submodels`
--
ALTER TABLE `thai_category_submodels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1317;

--
-- AUTO_INCREMENT for table `thai_category_types`
--
ALTER TABLE `thai_category_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `thai_chat`
--
ALTER TABLE `thai_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `thai_product_favorites`
--
ALTER TABLE `thai_product_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thai_product_images`
--
ALTER TABLE `thai_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
