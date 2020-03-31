-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2020 at 04:52 PM
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
(5, 6, 5, 10, 1245, 'jjjjj', 1, 0, '2020-03-10 15:57:14'),
(6, 6, 1, 3, 445, '', 1, 0, '2020-03-18 10:56:36'),
(7, 6, 1, 3, 445, '', 1, 0, '2020-03-18 10:57:03');

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
(43, 0, 'Services', 'บริการ', 'Service', 1, 0, '2020-03-17 09:01:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_features`
--

CREATE TABLE `thai_category_features` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(25) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_features`
--

INSERT INTO `thai_category_features` (`id`, `category_id`, `title_en`, `title_th`, `trash`) VALUES
(1, 18, 'Air conditioner', 'เครื่องปรับอากาศ', 0),
(2, 18, 'Music System', 'ระบบเพลง', 0),
(3, 18, 'GPS', 'จีพีเอส', 0),
(5, 18, 'Security Systems', 'ระบบรักษาความปลอดภัย', 0),
(6, 18, 'Parking Sensor', 'เซ็นเซอร์ที่จอดรถ', 0),
(7, 18, 'Parking Camera\\\'s', 'ลานจอดรถของกล้องเป็น', 0),
(8, 18, 'Stepney', 'สเตปนี', 0),
(9, 18, 'Jack', 'ช่องเสียบ', 0),
(10, 18, 'Auto Gear', 'เกียร์ออโต้', 0),
(11, 18, 'Fog Lamp', 'ไฟตัดหมอก', 0),
(13, 18, 'Air Bags', 'ถุงลม', 0),
(14, 22, 'Speedometer', 'เครื่องวัดความเร็ว', 0),
(15, 22, 'Fuel Guage', 'มาตรวัดน้ำมันเชื้อเพลิง', 0),
(16, 22, 'Digital Fuel Gauge', 'มาตรวัดน้ำมันดิจิตอล', 0),
(17, 22, 'Electric Start', 'สตาร์ทไฟฟ้า', 0),
(18, 22, 'Tachometer', 'เครื่องวัดวามเร็ว', 0),
(19, 22, 'Low Fuel Indicator', 'ตัวบ่งชี้เชื้อเพลิงต่ำ', 0),
(20, 22, 'Low Oil Indicator', 'ตัวบ่งชี้น้ำมันต่ำ', 0),
(21, 22, 'Low Battery Indicator', 'ไฟแสดงสถานะแบตเตอรี่อ่อน', 0),
(22, 22, 'Battery', 'แบตเตอรี่', 0),
(23, 22, 'Pass Light', 'ผ่านแสง', 0),
(24, 18, 'Sespensioonn ', 'Sespension', 0),
(25, 18, 'Airrr Bags bags', 'ถุงลม', 0),
(26, 18, 'ABS', 'ABS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_models`
--

CREATE TABLE `thai_category_models` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_models`
--

INSERT INTO `thai_category_models` (`id`, `category_id`, `title_en`, `title_th`, `trash`) VALUES
(1, 18, 'SUV', 'เอสยูวี', 0),
(2, 18, 'MPV', 'MPV', 0),
(3, 18, 'Pick Up', 'ไปรับ', 0),
(4, 18, 'Seaden', 'Seaden', 0),
(5, 18, 'Hatchback', 'ฟักกลับมา', 0),
(7, 22, 'Big Scooter', 'สกู๊ตเตอร์ขนาดใหญ่', 0),
(8, 22, 'Chooper', 'มีด', 0),
(9, 22, 'Moto Cross', 'โมโตครอส', 0),
(10, 22, 'Naked Bike', 'จักรยานเปล่า', 0),
(11, 22, 'Sports', 'กีฬา', 0),
(12, 22, 'Touring', 'การท่องเที่ยว', 0),
(13, 18, 'sports', 'sports', 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_submodels`
--

CREATE TABLE `thai_category_submodels` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(25) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_submodels`
--

INSERT INTO `thai_category_submodels` (`id`, `type_id`, `title_en`, `title_th`, `trash`) VALUES
(1, 27, 'CL Models (4)', 'รุ่น CL (4)', 0),
(2, 27, '-2.2CL', '-2.2CL', 0),
(3, 27, '-2.3CL', '-2.3CL', 0),
(4, 27, '-3.0CL', '-3.0CL', 0),
(5, 27, '-3.2CL', '-3.2CL', 0),
(6, 27, 'ILX', 'ILX', 0),
(7, 27, 'Integra', 'Integra', 0),
(8, 27, 'Legend', 'ตำนาน', 0),
(9, 27, 'MDX', 'MDX', 0),
(10, 27, 'NSX', 'NSX', 0),
(11, 27, 'RDX', 'RDX', 0),
(12, 27, 'RL Models (2)', 'รุ่น RL (2)', 0),
(13, 27, '-3.5RL', '-3.5RL', 0),
(14, 27, '-RL', '-RL', 0),
(15, 27, 'RSX', 'RSX', 0),
(16, 27, 'SLX', 'SLX', 0),
(17, 27, 'TL Models (3)', 'รุ่น TL (3)', 0),
(18, 27, '-2.5TL', '-2.5TL', 0),
(19, 27, '-3.2TL', '-3.2TL', 0),
(20, 27, '-TL', '-TL', 0),
(21, 27, 'TSX', 'TSX', 0),
(22, 27, 'Vigor', 'พลัง', 0),
(23, 27, 'ZDX', 'ZDX', 0),
(24, 27, 'Other Accura Models', 'โมเดล Accura อื่น ๆ', 0),
(25, 28, '164', 'หนึ่ง​ร้อย​หก​สิบ​สี่', 0),
(26, 28, '8C Competizione', '8C Competizione', 0),
(27, 28, 'GTV-6', 'GTV-6', 0),
(28, 28, 'Milano', 'Milano', 0),
(29, 28, 'Spider', 'แมงมุม', 0),
(30, 28, 'Other Alfa Romeo Model', 'รุ่นอื่น ๆ ของ Alfa Romeo', 0),
(32, 29, 'Alliance', 'พันธมิตร', 0),
(33, 29, 'Concord', 'ความสงบเรียบร้อย', 0),
(34, 29, 'Eagle', 'นกอินทรีย์', 0),
(35, 29, 'Encore', 'อีกครั้ง', 0),
(36, 29, 'Spirit', 'วิญญาณ', 0),
(37, 29, 'Other AMC Models', 'AMC รุ่นอื่น ๆ', 0),
(38, 30, 'DB7', 'DB7', 0),
(39, 30, 'DB9', 'DB9', 0),
(40, 30, 'DBS', 'ดีบีเอส', 0),
(41, 30, 'Lagonda', 'Lagonda', 0),
(42, 30, 'Rapide', 'Rapide', 0),
(43, 30, 'V12 Vantage', 'V12 Vantage', 0),
(44, 30, 'V8 Vantage', 'V8 Vantage', 0),
(45, 30, 'Vanquish', 'กำราบ', 0),
(46, 30, 'Virage', 'Virage', 0),
(47, 30, 'Other Aston Martin M', 'อื่น ๆ Aston Martin M', 0),
(48, 31, '100', 'หนึ่ง​ร้อย', 0),
(49, 31, '200', 'สอง​ร้อย', 0),
(50, 31, '4000', 'สี่​พัน', 0),
(51, 31, '5000', 'ห้า​พัน', 0),
(52, 31, '80', 'แปด​สิบ', 0),
(53, 31, '90', 'เก้า​สิบ', 0),
(54, 31, 'A4', 'A4', 0),
(55, 31, 'A3', 'A3', 0),
(56, 31, 'A5', 'A5', 0),
(57, 31, 'A6', 'A6', 0),
(58, 31, 'A7', 'A7', 0),
(59, 31, 'A8', 'A8', 0),
(60, 31, 'allroad', 'ถนนทุกสาย', 0),
(61, 31, 'Cabriolet', 'Cabriolet', 0),
(62, 31, 'Coupe', 'รถกูบ', 0),
(63, 31, 'Q3', 'ไตรมาสที่ 3', 0),
(64, 31, 'Q5', 'Q5', 0),
(65, 31, 'Q7', 'Q7', 0),
(66, 31, 'Quattro', 'Quattro', 0),
(67, 31, 'R8', 'R8', 0),
(68, 31, 'RS4', 'RS4', 0),
(69, 31, 'RS5', 'RS5', 0),
(70, 31, 'RS6', 'RS6', 0),
(71, 31, 'DBS', 'ดีบีเอส', 0),
(72, 31, 'S4', 'S4', 0),
(73, 31, 'S5', 'S5', 0),
(74, 31, 'S6', 'S6', 0),
(75, 31, 'S7', 'S7', 0),
(76, 31, 'S8', 'S8', 0),
(77, 31, 'TT', 'TT', 0),
(78, 31, 'TT RS', 'TT RS', 0),
(79, 31, 'V8 Quattro', 'V8 Quattro', 0),
(80, 31, 'TTS', 'TTS', 0),
(81, 31, 'Other Audi Models', 'ออดี้รุ่นอื่น ๆ', 0),
(82, 32, 'Convertible', 'แปลงสภาพ', 0),
(83, 32, 'Coupe', 'รถกูบ', 0),
(84, 32, 'Sedan', 'เสลี่ยง', 0),
(85, 32, 'Other Avanti Models', 'โมเดล Avanti อื่น ๆ', 0),
(86, 33, 'Arnage', 'Arnage', 0),
(87, 33, 'Azure', 'สีฟ้า', 0),
(88, 33, 'Brooklands', 'Brooklands', 0),
(89, 33, 'Continental', 'คอนติเนน', 0),
(90, 33, 'Corniche', 'Corniche', 0),
(91, 33, 'Eight', 'แปด', 0),
(92, 33, 'Mulsanne', 'Mulsanne', 0),
(93, 33, 'Turbo R', 'เทอร์โบอาร์', 0),
(94, 33, 'Other Bentley Models', 'โมเดลเบนท์ลีย์อื่น ๆ', 0),
(95, 34, '1 Series (3)', '1 ซีรี่ส์ (3)', 0),
(96, 34, '- 128i', '- 128i', 0),
(97, 34, '- 135i', '- 135i', 0),
(98, 34, '- 135is', '- 135is', 0),
(99, 34, '3 Series (29)', '3 ซีรี่ส์ (29)', 0),
(100, 34, '- 318i', '- 318i', 0),
(101, 34, '- 318iC', '- 318iC', 0),
(102, 34, '- 318iS', '- 318iS', 0),
(103, 34, '- 318ti', '- 318ti', 0),
(104, 34, '- 320i', '- 320i', 0),
(105, 34, '- 323ci', '- 323ci', 0),
(106, 34, '- 323i', '- 323i', 0),
(107, 34, '- 323is', '- 323is', 0),
(108, 34, '- 323iT', '- 323iT', 0),
(109, 34, '- 325Ci', '- 325Ci', 0),
(110, 34, '- 325e', '- 325e', 0),
(111, 34, '- 325es', '- 325es', 0),
(112, 34, '- 325i', '- 325i', 0),
(113, 34, '- 325is', '- 325is', 0),
(114, 34, '- 325iX', '- 325iX', 0),
(115, 34, '- 325xi', '- 325xi', 0),
(116, 34, '- 328Ci', '- 328Ci', 0),
(117, 34, '- 328Ci', '- 328Ci', 0),
(118, 34, '- 328i', '- 328i', 0),
(119, 34, '- 328iS', '- 328iS', 0),
(120, 34, '- 328xi', '- 328xi', 0),
(121, 34, '- 330Ci', '- 330Ci', 0),
(122, 34, '- 330i', '- 330i', 0),
(123, 34, '- 330xi', '- 330xi', 0),
(124, 34, '- 335d', '- 335d', 0),
(125, 34, '- 335i', '- 335i', 0),
(126, 34, '- 335is', '- 335is', 0),
(127, 34, '- 335xi', '- 335xi', 0),
(128, 34, '- ActiveHybrid 3', '- ActiveHybrid 3', 0),
(129, 34, '- 325', '- 325', 0),
(130, 34, '5 Series (19)', '5 ซีรี่ส์ (19)', 0),
(131, 34, ' - 524td', ' - 524td', 0),
(132, 34, '- 525i', '- 525i', 0),
(133, 34, '- 525xi', '- 525xi', 0),
(134, 34, '- 528e', '- 528e', 0),
(135, 34, '- 528i', '- 528i', 0),
(136, 34, '- 528iT', '- 528iT', 0),
(137, 34, '- 530i', '- 530i', 0),
(138, 34, '- 530iT', '- 530iT', 0),
(139, 34, '- 530xi', '- 530xi', 0),
(140, 34, '- 533i', '- 533i', 0),
(141, 34, '- 535i', '- 535i', 0),
(142, 34, '- 535i Gran Turismo', '- 535i Gran Turismo', 0),
(143, 34, '- 535xi', '- 535xi', 0),
(144, 34, '- 540i', '- 540i', 0),
(145, 34, '- 545i', '- 545i', 0),
(146, 34, '- 550i', '- 550i', 0),
(147, 34, '- 550i Gran Turismo', '- 550i Gran Turismo', 0),
(148, 34, '-ActiveHybrid 5', '-ActiveHybrid 5', 0),
(149, 34, '6 Series (8)', '6 ซีรี่ส์ (8)', 0),
(150, 34, '- 633CSi', '- 633CSi', 0),
(151, 34, '- 635CSi', '- 635CSi', 0),
(152, 34, '- 640i', '- 640i', 0),
(153, 34, '- 640i Gran Coupe', '- 640i Gran Coupe', 0),
(154, 34, '- 645Ci', '- 645Ci', 0),
(155, 34, '- 650i', '- 650i', 0),
(156, 34, '- 650i Gran Coupe', '- 650i Gran Coupe', 0),
(157, 34, '- L6', '- L6', 0),
(158, 34, '7 Series (15)', '7 ซีรี่ส์ (15)', 0),
(159, 34, '- 733i', '- 733i', 0),
(160, 34, '- 735i', '- 735i', 0),
(161, 34, '- 735iL', '- 735iL', 0),
(162, 34, '- 740i', '- 740i', 0),
(163, 34, '- 740iL', '- 740iL', 0),
(164, 34, '- 740Li', '- 740Li', 0),
(165, 34, '- 745i', '- 745i', 0),
(166, 34, '- 745Li', '- 745Li', 0),
(167, 34, '- 750i', '- 750i', 0),
(168, 34, '- 750iL', '- 750iL', 0),
(169, 34, '- 750Li', '- 750Li', 0),
(170, 34, '- 760i', '- 760i', 0),
(171, 34, '- 760Li', '- 760Li', 0),
(172, 34, '- ActiveHybrid 7', '- ActiveHybrid 7', 0),
(173, 34, '- Alpina B7', '- Alpina B7', 0),
(174, 34, '8 Series 4', '8 Series 4', 0),
(175, 34, '- 840Ci', '- 840Ci', 0),
(176, 34, '- 850Ci', '- 850Ci', 0),
(177, 34, '- 850CSi', '- 850CSi', 0),
(178, 34, '- 850i', '- 850i', 0),
(179, 34, 'L Series (1)', 'ซีรีส์ L (1)', 0),
(180, 34, '- L7', '- L7', 0),
(181, 34, '- M Series (8)', '- ซีรี่ส์ M (8)', 0),
(182, 34, '- 1 Series M', '- 1 ซีรี่ส์ M', 0),
(183, 34, '- M Coupe', '- M Coupe', 0),
(184, 34, '- M Roadster', '- M Roadster', 0),
(185, 34, '- M3', '- M3', 0),
(186, 34, '- M5', '- M5', 0),
(187, 34, '- M6', '- M6', 0),
(188, 34, '- X5 M', '- X5 M', 0),
(189, 34, '- X6 M', '- X6 M', 0),
(190, 34, 'X Series (5)', 'X Series (5)', 0),
(191, 34, '- ActiveHybrid X6', '- ActiveHybrid X6', 0),
(192, 34, '- X1', '- X1', 0),
(193, 34, '- X3', '- X3', 0),
(194, 34, '- X5', '- X5', 0),
(195, 34, '- X6', '- X6', 0),
(196, 34, 'Z Series (3)', 'ซีรีย์ Z (3)', 0),
(197, 34, '- Z3', '- Z3', 0),
(198, 34, '- Z4', '- Z4', 0),
(199, 34, '- Z8', '- Z8', 0),
(200, 34, 'Other BMW Models', 'โมเดล BMW อื่น ๆ', 0),
(201, 35, 'Century', 'ศตวรรษ', 0),
(202, 35, 'Electra ', 'Electra ', 0),
(203, 35, 'Enclave', 'วงล้อม', 0),
(204, 35, 'Encore', 'เอาอีก', 0),
(205, 35, 'LaCrosse', 'ลาครอส', 0),
(206, 35, 'Le Sabre', 'เลอเซเบอร์', 0),
(207, 35, 'Lucerne', 'ลูเซิร์น', 0),
(208, 35, 'Park Avenue', 'ปาร์คอเวนิว', 0),
(209, 35, 'Rainier', 'เรเนียร์', 0),
(210, 35, 'Reatta', 'Reatta', 0),
(211, 35, 'Regal', 'ของกษัตริย์', 0),
(212, 35, 'Rendezvous', 'การนัดพบ', 0),
(213, 35, 'Riviera', 'ริเวียร่า', 0),
(214, 35, 'Roadmaster', 'ถนนสายหลัก', 0),
(215, 35, 'Skyhawk', 'Skyhawk', 0),
(216, 35, 'Skylark', 'คึก', 0),
(217, 35, 'Somerset', 'ซัมเมอร์เซ็ท', 0),
(218, 35, 'Terraza', 'Terraza', 0),
(219, 35, 'Verano', 'Verano', 0),
(220, 35, 'Other Buick Models', 'โมเดลของ Buick อื่น ๆ', 0),
(221, 36, 'Allante', 'Allante', 0),
(222, 36, 'ATS ', 'ATS ', 0),
(223, 36, 'Brougham', 'ม้า', 0),
(224, 36, 'Catera', 'Catera', 0),
(225, 36, 'Cimarron', 'Cimarron', 0),
(226, 36, 'CTS', 'CTS', 0),
(227, 36, 'De Ville', 'เดอวิลล์', 0),
(228, 36, 'DTS', 'DTS', 0),
(229, 36, 'Eldorado', 'Eldorado', 0),
(230, 36, 'Escalade', 'Escalade', 0),
(231, 36, 'Escalade ESV', 'Escalade ESV', 0),
(232, 36, 'Escalade EXT', 'Escalade EXT', 0),
(233, 36, 'Fleetwood', 'ฟลีต', 0),
(234, 36, 'Seville', 'เซวิลล์', 0),
(235, 36, 'SRX', 'SRX', 0),
(236, 36, 'STS', 'เอสที', 0),
(237, 36, 'XLR', 'XLR', 0),
(238, 36, 'XTS', 'XTS', 0),
(239, 36, 'Other Cadillac Model', 'รุ่นคาดิลแลคอื่น ๆ', 0),
(240, 37, 'Astro', 'Astro', 0),
(241, 37, 'Avalanche ', 'หิมะถล่ม', 0),
(242, 37, 'Aveo', 'อาวีโอ', 0),
(243, 37, 'Aveo5', 'Aveo5', 0),
(244, 37, 'Beretta', 'เบเร็ตต้า', 0),
(245, 37, 'Blazer', 'เสื้อสูทแฟชั่น', 0),
(246, 37, 'Camaro', 'Camaro', 0),
(247, 37, 'Caprice', 'ความไม่แน่นอน', 0),
(248, 37, 'Captiva Sport', 'แคปติวาสปอร์ต', 0),
(249, 37, 'Cavalier', 'ขุนนาง', 0),
(250, 37, 'Celebrity', 'ชื่อเสียง', 0),
(251, 37, 'Chevette', 'Chevette', 0),
(252, 37, 'Citation', 'การอ้างอิง', 0),
(253, 37, 'Cobalt', 'โคบอลต์', 0),
(254, 37, 'Colorado', 'โคโลราโด', 0),
(255, 37, 'Corsica', 'คอร์ซิกา', 0),
(256, 37, 'Corvette', 'เรือลาดตระเวน', 0),
(257, 37, 'Cruze', 'Cruze', 0),
(258, 37, 'El Camino', 'El Camino', 0),
(259, 37, 'Equinox', 'เวลาที่กลางวันเท่ากับกลางคืน', 0),
(260, 37, 'Express Van', 'รถตู้ด่วน', 0),
(261, 37, 'G Van', 'จีแวน', 0),
(262, 37, 'HHR', 'HHR', 0),
(263, 37, 'Impala', 'ละมั่งอาฟริกา', 0),
(264, 37, 'Kodiak C4500', 'Kodiak C4500', 0),
(265, 37, 'Lumina', 'Lumina', 0),
(266, 37, 'Lumina APV', 'Lumina APV', 0),
(267, 37, 'LUV', 'LUV', 0),
(268, 37, 'Malibu', 'มาลิบู', 0),
(269, 37, 'Metro', 'รถไฟฟ้าใต้ดิน', 0),
(270, 37, 'Monte Carlo', 'Monte Carlo', 0),
(271, 37, 'Nova', 'โนวา', 0),
(272, 37, 'Prizm', 'พริซึ่ม', 0),
(273, 37, 'S10 Blazer', 'เบลเซอร์ S10', 0),
(274, 37, 'S10 Pickup', 'รถกระบะ S10', 0),
(275, 37, 'Silverado and other ', 'Silverado และอื่น ๆ', 0),
(278, 37, 'Sonic', 'เกี่ยวกับเสียง', 0),
(279, 37, 'Spark', 'จุดประกาย', 0),
(280, 37, 'Spectrum', 'คลื่นความถี่', 0),
(281, 37, 'Sprint', 'วิ่ง', 0),
(282, 37, 'SSR', 'SSR', 0),
(283, 37, 'Suburban', 'ชานเมือง', 0),
(284, 37, 'Tahoe', 'Tahoe', 0),
(285, 37, 'Tracker', 'ติดตาม', 0),
(286, 37, 'TrailBlazer', 'TrailBlazer', 0),
(287, 37, 'TrailBlazer EXT', 'TrailBlazer EXT', 0),
(288, 37, 'Traverse', 'ทราเวิร์', 0),
(289, 37, 'Uplander', 'Uplander', 0),
(290, 37, 'Venture', 'เสี่ยง', 0),
(291, 37, 'Volt', 'โวลต์', 0),
(292, 37, 'Other Chevrolet Model', 'เชฟโรเลตโมเดลอื่น ๆ', 0),
(293, 38, '200', 'สอง​ร้อย', 0),
(294, 38, '300', 'สาม​ร้อย', 0),
(295, 38, '300M', '300M', 0),
(296, 38, 'Aspen', 'ต้นไม้แอซป์', 0),
(297, 38, 'Caravan', 'คาราวาน', 0),
(298, 38, 'Cirrus', 'Cirrus', 0),
(299, 38, 'Concorde', 'คองคอร์ด', 0),
(300, 38, 'Conquest', 'ชนะ', 0),
(301, 38, 'Cordoba', 'คอร์โดบา', 0),
(302, 38, 'Crossfire', 'ลูกหลง', 0),
(303, 38, 'E Class', 'คลาส E', 0),
(304, 38, 'Fifth Avenue', 'ฟิฟท์อเวนิว', 0),
(305, 38, 'Grand Voyager', 'Grand Voyager', 0),
(306, 38, 'Imperial', 'ของจักรพรรดิ', 0),
(307, 38, 'Intrepid', 'กล้าหาญ', 0),
(308, 38, 'Laser', 'เลเซอร์', 0),
(309, 38, 'LeBaron', 'LeBaron', 0),
(310, 38, 'LHS', 'LHS', 0),
(311, 38, 'Neon', 'ธาตุนีอ็อน', 0),
(312, 38, 'New Yorker', 'ชาวนิวยอร์ก', 0),
(313, 38, 'Newport', 'นิวพอร์ต', 0),
(314, 38, 'Pacifica', 'แปซิฟิกา', 0),
(315, 38, 'Prowler', 'ผู้เที่ยวเดินด้อม ๆ มองๆ', 0),
(316, 38, 'PT Cruiser', 'PT ครุยเซอร์', 0),
(317, 38, 'Sebring', 'ซีบริง', 0),
(318, 38, 'TC by Maserati', 'TC โดย Maserati', 0),
(319, 38, 'Town & Country', 'Town & Country', 0),
(320, 38, 'Voyager', 'ผู้เดินทาง', 0),
(321, 38, 'Other Chrysler Model', 'โมเดลไครสเลอร์อื่น ๆ', 0),
(322, 39, 'Lanos', 'Lanos', 0),
(323, 39, 'Leganza', 'Leganza', 0),
(324, 39, 'Nubira', 'Nubira', 0),
(325, 39, 'Other Daewoo Models', 'โมเดล Daewoo อื่น ๆ', 0),
(326, 40, 'Charade', 'คำปริศนาที่มีเงื่อนไขไว้ให้ทุกพยานค์', 0),
(327, 40, 'Rocky', 'เต็มไปด้วยหิน', 0),
(328, 40, 'Other Daihatsu Model', 'โมเดลไดฮัทสุอื่น ๆ', 0),
(329, 41, '200XS', '200XS', 0),
(330, 41, '210', 'สอง​ร้อย​สิบ', 0),
(331, 41, '280ZX', '280ZX', 0),
(332, 41, '300ZX', '300ZX', 0),
(333, 41, '310', 'สาม​ร้อย​สิบ', 0),
(334, 41, '510', 'ห้า​ร้อย​สิบ', 0),
(335, 41, '720', 'เจ็ด​ร้อย​ยี่​สิบ', 0),
(336, 41, '810', 'แปด​ร้อย​สิบ', 0),
(337, 41, 'Maxima', 'Maxima', 0),
(338, 41, 'Pickup', 'ไปรับ', 0),
(339, 41, 'Pulsar', 'พูลสาร์', 0),
(340, 41, 'Sentra', 'Sentra', 0),
(341, 41, 'Stanza', 'ฉันท์', 0),
(342, 41, 'Other Datsun Models', 'โมเดล Datsun อื่น ๆ', 0),
(343, 42, 'DMC-12', 'DMC-12', 0),
(344, 43, '400', 'สี่​ร้อย', 0),
(345, 43, '600', 'หก​ร้อย', 0),
(346, 43, 'Aries', 'ราศีเมษ', 0),
(347, 43, 'Avenger', 'ผู้ล้างแค้น', 0),
(348, 43, 'Caliber', 'ความสามารถ', 0),
(349, 43, 'Caravan', 'คาราวาน', 0),
(350, 43, 'Challenger', 'ผู้ท้าชิง', 0),
(351, 43, 'Charger', 'ชาร์จ', 0),
(352, 43, 'Colt', 'เด็กผู้ชายที่อ่อนหัด', 0),
(353, 43, 'Conquest', 'ชนะ', 0),
(354, 43, 'D/W Truck', 'รถบรรทุก D / W', 0),
(355, 43, 'Dakota', 'ดาโคตา', 0),
(356, 43, 'Dart', 'โผ', 0),
(357, 43, 'Daytona', 'เดย์โทนา', 0),
(358, 43, 'Diplomat', 'ทูต', 0),
(359, 43, 'Durango', 'ดูรังโก', 0),
(360, 43, 'Dynasty', 'ราชวงศ์', 0),
(361, 43, 'Grand Caravan', 'แกรนด์คาราวาน', 0),
(362, 43, 'Intrepid', 'กล้าหาญ', 0),
(363, 43, 'Journey', 'การเดินทาง', 0),
(364, 43, 'Lancer', 'ทหารม้าถือทวน', 0),
(365, 43, 'Magnum', 'ขวดขนาดใหญ่', 0),
(366, 43, 'Mirada', 'มิราดา', 0),
(367, 43, 'Monaco', 'โมนาโก', 0),
(368, 43, 'Neon', 'ธาตุนีอ็อน', 0),
(369, 43, 'Nitro', 'Nitro', 0),
(370, 43, 'Omni', 'Omni', 0),
(371, 43, 'Raider', 'ผู้ตรวจค้น', 0),
(372, 43, 'Ram 1500 Truck', 'รถบรรทุกราม 1,500', 0),
(373, 43, 'Ram 2500 Truck', 'รถบรรทุกราม 2500', 0),
(374, 43, 'Ram 3500 Truck', 'รถบรรทุกราม 3500', 0),
(375, 43, 'Ram 4500 Truck', 'รถบรรทุกราม 4500', 0),
(376, 43, 'Ram 50 Truck', 'รถบรรทุกราม 50', 0),
(377, 43, 'RAM C/V', 'RAM C/V', 0),
(378, 43, 'Ram SRT-10', 'ราม SRT-10', 0),
(379, 43, 'Ram Van', 'รามแวน', 0),
(380, 43, 'Ram Wagon', 'รามเกวียน', 0),
(381, 43, 'Ramcharger', 'Ramcharger', 0),
(382, 43, 'Rampage', 'อาละวาด', 0),
(383, 43, 'Shadow', 'เงา', 0),
(384, 43, 'Spirit', 'วิญญาณ', 0),
(385, 43, 'Sprinter', 'ผู้วิ่งแข่ง', 0),
(386, 43, 'SRT-4', 'SRT-4', 0),
(387, 43, 'St. Regis', 'เซนต์รีจิส', 0),
(388, 43, 'Stealth', 'ชิงทรัพย์', 0),
(389, 43, 'Stratus', 'ชั้นเมฆ', 0),
(390, 43, 'Viper', 'งูพิษ', 0),
(391, 43, 'Other Dodge Models', 'โมเดล Dodge อื่น ๆ', 0),
(392, 44, 'Medallion', 'เหรียญกระษาปณ์', 0),
(393, 44, 'Premier', 'นายกรัฐมนตรี', 0),
(394, 44, 'Summit', 'ประชุมสุดยอด', 0),
(395, 44, 'Talon', 'อุ้งเท้า', 0),
(396, 44, 'Vision', 'วิสัยทัศน์', 0),
(397, 44, 'Other Eagle Models', 'โมเดลนกอินทรีอื่น ๆ', 0),
(398, 45, '308 GTB Quattrovalvo', '308 GTB Quattrovalvo', 0),
(399, 45, '308 GTBI', '308 GTBI', 0),
(400, 45, '308 GTS Quattrovalvo', '308 GTS Quattrovalvo', 0),
(401, 45, '308 GTSI', '308 GTSI', 0),
(402, 45, '328 GTB', '328 GTB', 0),
(403, 45, '328 GTS', '328 GTS', 0),
(404, 45, '348 GTB', '348 GTB', 0),
(405, 45, '348 GTS', '348 GTS', 0),
(406, 45, '348 Spider', '348 แมงมุม', 0),
(407, 45, '348 TB', '348 TB', 0),
(408, 45, '348 TS', '348 TS', 0),
(409, 45, '360', 'สาม​ร้อย​หก​สิบ', 0),
(410, 45, '456 GT', '456 GT', 0),
(411, 45, '456M GT', '456M GT', 0),
(412, 45, '458 Italia', '458 Italia', 0),
(413, 45, '512 BBi', '512 BBi', 0),
(414, 45, '512M', '512M', 0),
(415, 45, '512TR', '512TR', 0),
(416, 45, '550 Maranello', '550 Maranello', 0),
(417, 45, '575M Maranello', '575M Maranello', 0),
(418, 45, '599 GTB Fiorano', '599 GTB Fiorano', 0),
(419, 45, '599 GTO', '599 GTO', 0),
(420, 45, '612 Scaglietti', '612 Scaglietti', 0),
(421, 45, 'California', 'แคลิฟอร์เนีย', 0),
(422, 45, 'Enzo', 'Enzo', 0),
(423, 45, 'F355', 'F355', 0),
(424, 45, 'F40', 'F40', 0),
(425, 45, 'F430', 'F430', 0),
(426, 45, 'F50', 'F50', 0),
(427, 45, 'FF', 'FF', 0),
(428, 45, 'Mondial', 'Mondial', 0),
(429, 45, 'Testarossa', 'Testarossa', 0),
(430, 45, 'Other Ferrari Models', 'รุ่นเฟอร์รารี่อื่น ๆ', 0),
(431, 46, '2000 Spider', 'แมงมุม 2000', 0),
(432, 46, '500', 'ห้า​ร้อย', 0),
(433, 46, 'Bertone X1/9', 'Bertone X1/9', 0),
(434, 46, 'Brava', 'Brava', 0),
(435, 46, 'Pininfarina Spider', 'Pininfarina Spider', 0),
(436, 46, 'Strada', 'Strada', 0),
(437, 46, 'X1/9', 'X1/9', 0),
(438, 46, 'Other Fiat Models', 'รุ่นเฟียตอื่น ๆ', 0),
(439, 47, 'Karma', 'กรรม', 0),
(440, 48, 'Aerostar', 'Aerostar', 0),
(441, 48, 'Aspire', 'ปรารถนา', 0),
(442, 48, 'Bronco', 'ม้าป่า', 0),
(443, 48, 'Bronco II', 'Bronco II', 0),
(444, 48, 'C-MAX', 'C-MAX', 0),
(445, 48, 'Club Wagon', 'Club Wagon', 0),
(446, 48, 'Contour', 'เส้นแสดงรูปร่าง', 0),
(447, 48, 'Courier', 'Courier', 0),
(448, 48, 'Crown Victoria', 'คราวน์วิกตอเรีย', 0),
(449, 48, 'E-150 and Econoline ', 'E-150 และ Econoline', 0),
(450, 48, 'E-250 and Econoline ', 'E-250 และ Econoline', 0),
(451, 48, 'E-350 and Econoline ', 'E-350 และ Econoline', 0),
(452, 48, 'Edge', 'ขอบ', 0),
(453, 48, 'Escape', 'หนี', 0),
(454, 48, 'Escort', 'คุ้มกัน', 0),
(455, 48, 'Excursion', 'การเที่ยว', 0),
(456, 48, 'EXP', 'EXP', 0),
(457, 48, 'Expedition', 'การเดินทาง', 0),
(458, 48, 'Expedition EL', 'เอลเดินทาง', 0),
(459, 48, 'Explorer', 'สำรวจ', 0),
(460, 48, 'Explorer Sport Trac', 'Explorer Sport Trac', 0),
(461, 48, 'F100', 'F100', 0),
(462, 48, 'F150', 'F150', 0),
(463, 48, 'F250', 'F250', 0),
(464, 48, 'F350', 'F350', 0),
(465, 48, 'F450', 'F450', 0),
(466, 48, 'Fairmont', 'โรงแรมแฟร์มอนท์', 0),
(467, 48, 'Festiva', 'Festiva', 0),
(468, 48, 'Fiesta', 'เฟียสต้า', 0),
(469, 48, 'Five Hundred', 'ห้าร้อย', 0),
(470, 48, 'Flex', 'ดิ้น', 0),
(471, 48, 'Focus', 'โฟกัส', 0),
(472, 48, 'Freestar', 'Freestar', 0),
(473, 48, 'Freestyle', 'ฟรีสไตล์', 0),
(474, 48, 'Fusion', 'การผสม', 0),
(475, 48, 'Granada', 'กรานาดา', 0),
(476, 48, 'Other Ford Models', 'รุ่นอื่น ๆ ของ Ford', 0),
(477, 48, 'GT', 'GT', 0),
(478, 48, 'LTD', 'LTD', 0),
(479, 48, 'Mustang', 'ม้าป่า', 0),
(480, 48, 'Probe', 'การสอบสวน', 0),
(481, 48, 'Ranger', 'ตำรวจท้องถิ่น', 0),
(482, 48, 'Taurus', 'ราศีพฤษภ', 0),
(483, 48, 'Taurus X', 'ราศีพฤษภ X', 0),
(484, 48, 'Tempo', 'จังหวะ', 0),
(485, 48, 'Thunderbird', 'ธันเดอร์เบิร์ด', 0),
(486, 48, 'Transit Connect', 'Transit Connect', 0),
(487, 48, 'Windstar', 'Windstar', 0),
(488, 48, 'ZX2 Escort', 'ZX2 Escort', 0),
(489, 49, 'Sprinter', 'ผู้วิ่งแข่ง', 0),
(490, 50, 'Metro', 'รถไฟฟ้าใต้ดิน', 0),
(491, 50, 'Prizm', 'พริซึ่ม', 0),
(492, 50, 'Spectrum', 'คลื่นความถี่', 0),
(493, 50, 'Storm', 'พายุ', 0),
(494, 50, 'Tracker', 'ติดตาม', 0),
(495, 50, 'Other Geo Models', 'โมเดลทางภูมิศาสตร์อื่น ๆ', 0),
(496, 51, 'Acadia', 'Acadia', 0),
(497, 51, 'Caballero', 'บาล', 0),
(498, 51, 'Canyon', 'หุบเขาลึก', 0),
(499, 51, 'Envoy', 'ราชทูต', 0),
(500, 51, 'Envoy XL', 'ทูต XL', 0),
(501, 51, 'Envoy XUV', 'ทูต XUV', 0),
(502, 51, 'Jimmy', 'ชะแลงขนาดสั้น', 0),
(503, 51, 'Rally Wagon', 'แรลลี่เกวียน', 0),
(504, 51, 'S15 Jimmy', 'S15 จิมมี่', 0),
(505, 51, 'S15 Pickup', 'S15 รถกระบะ', 0),
(506, 51, 'Safari', 'การแข่งรถวิบาก', 0),
(507, 51, 'Savana', 'Savana', 0),
(508, 51, 'Sierra C/K1500', 'เซียร่า C / K1500', 0),
(509, 51, 'Sierra C/K2500', 'เซียร่า C / K2500', 0),
(510, 51, 'Sierra C/K3500', 'เซียร่า C / K3500', 0),
(511, 51, 'Sonoma', 'โซโนมา', 0),
(512, 51, 'Suburban', 'ชานเมือง', 0),
(513, 51, 'Syclone', 'Syclone', 0),
(514, 51, 'Terrain', 'ภูมิประเทศ', 0),
(515, 51, 'TopKick C4500', 'TopKick C4500', 0),
(516, 51, 'Typhoon', 'พายุไต้ฝุ่น', 0),
(517, 51, 'Vandura', 'Vandura', 0),
(518, 51, 'Yukon', 'ยูคอน', 0),
(519, 51, 'Yukon XL', 'ยูคอน XL', 0),
(520, 51, 'Other GMC Models', 'โมเดล GMC อื่น ๆ', 0),
(521, 52, 'Accord', 'สอดคล้อง', 0),
(522, 52, 'Civic', 'ของเทศบาล', 0),
(523, 52, 'CR-V', 'CR-V', 0),
(524, 52, 'CR-Z', 'CR-Z', 0),
(525, 52, 'CRX', 'CRX', 0),
(526, 52, 'Crosstour and Accord', 'Crosstour และ Accord', 0),
(527, 52, '- Accord Crosstour', '- Accord Crosstour', 0),
(528, 52, '- Crosstour', 'Crosstour', 0),
(529, 52, 'Del Sol', 'เดลโซล', 0),
(530, 52, 'Element', 'ธาตุ', 0),
(531, 52, 'Fit', 'Fit', 0),
(532, 52, 'Insight', 'ข้อมูลเชิงลึก', 0),
(533, 52, 'Odyssey', 'โอดิสซี', 0),
(534, 52, 'Passport', NULL, 0),
(535, 52, 'Pilot', 'นักบิน', 0),
(536, 52, 'Prelude', 'โหมโรง', 0),
(537, 52, 'Ridgeline', 'Ridgeline', 0),
(538, 52, 'S2000', 'S2000', 0),
(539, 52, 'Other Honda Models', 'โมเดลฮอนด้าอื่น ๆ', 0),
(540, 53, 'H1', 'H1', 0),
(541, 53, 'H2', 'H2', 0),
(542, 53, 'H3', 'H3', 0),
(543, 53, 'H3T', 'H3T', 0),
(544, 53, 'Other Hummer Models', 'โมเดล Hummer อื่น ๆ', 0),
(545, 54, 'Accent', 'สำเนียง', 0),
(546, 54, 'Azera', 'Azera', 0),
(547, 54, 'Elantra', 'Elantra', 0),
(548, 54, 'Elantra Coupe', 'Elantra Coupe', 0),
(549, 54, 'Elantra Touring', 'Elantra Touring', 0),
(550, 54, 'Entourage', 'สิ่งแวดล้อม', 0),
(551, 54, 'Equus', 'ม้า', 0),
(552, 54, 'Excel', 'สันทัด', 0),
(553, 54, 'Genesis', 'แหล่งกำเนิด', 0),
(554, 54, 'Genesis Coupe', 'Genesis Coupe', 0),
(555, 54, 'Santa Fe', 'ซานตาเฟ่', 0),
(556, 54, 'Scoupe', 'Scoupe', 0),
(557, 54, 'Sonata', 'บทเพลงเข้าเปียโน', 0),
(558, 54, 'Tiburon', 'Tiburon', 0),
(559, 54, 'Tucson', 'ทูซอน', 0),
(560, 54, 'Veloster', 'Veloster', 0),
(561, 54, 'Veracruz', 'เวรากรูซ', 0),
(562, 54, 'XG300', 'XG300', 0),
(563, 54, 'XG350', 'XG350', 0),
(564, 54, 'Other Hyundai Models', 'รุ่นอื่น ๆ ของ Hyundai', 0),
(565, 55, 'EX Models (2)', 'รุ่น EX (2)', 0),
(566, 55, '- EX35', '- EX35', 0),
(567, 55, '- EX37', '- EX37', 0),
(568, 55, 'FX Models (4)', 'รุ่น FX (4)', 0),
(569, 55, '- FX35', '- FX35', 0),
(570, 55, '- FX37', '- FX37', 0),
(571, 55, '- FX45', '- FX45', 0),
(572, 55, '- FX50', '- FX50', 0),
(573, 55, 'G Models (4)', 'รุ่น G (4)', 0),
(574, 55, '- G20', '- G20', 0),
(575, 55, '- G25', '- G25', 0),
(576, 55, '- G35', '- G35', 0),
(577, 55, '- G37', '- G37', 0),
(578, 55, 'I Models (2)', 'ฉันโมเดล (2)', 0),
(579, 55, '- I30', '- I30', 0),
(580, 55, '- I35', '- I35', 0),
(581, 55, 'J Models (1)', '-J รุ่น (1) I30', 0),
(582, 55, '- J30', '- J30', 0),
(583, 55, 'JX Models (1)', 'โมเดล JX (1)', 0),
(584, 55, '- JX35', '- JX35', 0),
(585, 55, 'M Models (6)', 'รุ่น M (6)', 0),
(586, 55, '- M30', '- M30', 0),
(587, 55, '- M35', '- M35', 0),
(588, 55, '- M35h', '- M35h', 0),
(589, 55, '- M37', '- M37', 0),
(590, 55, '- M45', '- M45', 0),
(591, 55, '- M56', '- M56', 0),
(592, 55, 'Q Models (1)', 'รุ่น Q (1)', 0),
(593, 55, '- Q45', '- Q45', 0),
(594, 55, 'QX Models (2)', 'QX Models (2)', 0),
(595, 55, '- QX4', '- QX4', 0),
(596, 55, '- QX56', '- QX56', 0),
(597, 55, 'Other Infiniti Model', 'โมเดลอินฟินิตี้อื่น ๆ', 0),
(598, 56, 'Amigo', 'Amigo', 0),
(599, 56, 'Ascender', 'ครอง', 0),
(600, 56, 'Axiom', 'ความจริง', 0),
(601, 56, 'Hombre', 'hombre', 0),
(602, 56, 'i-280', 'i-280', 0),
(603, 56, 'i-290', 'i-290', 0),
(604, 56, 'i-350', 'i-350', 0),
(605, 56, 'i-370', 'i-370', 0),
(606, 56, 'I-Mark', 'I-Mark', 0),
(607, 56, 'Impulse', 'แรงกระตุ้น', 0),
(608, 56, 'Oasis', 'โอเอซิส', 0),
(609, 56, 'Pickup', 'ไปรับ', 0),
(610, 56, 'Rodeo', 'Rodeo', 0),
(611, 56, 'Stylus', 'เหล็กจาร', 0),
(612, 56, 'Trooper', 'ทหารม้า', 0),
(613, 56, 'Trooper II', 'Trooper II', 0),
(614, 56, 'VehiCROSS', 'VehiCROSS', 0),
(615, 56, 'Other Isuzu Models', 'โมเดล Isuzu อื่น ๆ', 0),
(616, 57, 'S-Type', 'S-Type', 0),
(617, 57, 'X-Type', 'X-Type', 0),
(618, 57, 'XF', 'XF', 0),
(619, 57, 'XJ Series (10)', 'ซีรี่ส์ XJ (10)', 0),
(620, 57, '- XJ12', '- XJ12', 0),
(621, 57, '- XJ6', '- XJ6', 0),
(622, 57, '- XJR', '- XJR', 0),
(623, 57, '- XJR-S', '- XJR-S', 0),
(624, 57, '- XJS', '- XJS', 0),
(625, 57, '- XJ Vanden Plas', '- XJ Vanden Plas', 0),
(626, 57, '- XJ', '- XJ', 0),
(627, 57, '- XJ8', '- XJ8', 0),
(628, 57, '- XJ8 L', '- XJ8 L', 0),
(629, 57, '- XJ Sport', '- XJ Sport', 0),
(630, 57, 'XK Series (3)', '- XJ SportXK ซีรี่ย์ (3)', 0),
(631, 57, '- XK8', '- XK8', 0),
(632, 57, '- XK', '- XK', 0),
(633, 57, '- XKR', '- XKR', 0),
(634, 57, 'Other Jaguar Models', 'รุ่นจากัวร์อื่น ๆ', 0),
(635, 58, 'Cherokee', 'เชโรกี', 0),
(636, 58, 'CJ', 'CJ', 0),
(637, 58, 'Comanche', 'เผ่า', 0),
(638, 58, 'Commander', 'ผู้บังคับบัญชา', 0),
(639, 58, 'Compass', 'เข็มทิศ', 0),
(640, 58, 'Grand Cherokee', 'Grand Cherokee', 0),
(641, 58, 'Grand Wagoneer', 'Grand Wagoneer', 0),
(642, 58, 'Liberty', 'เสรีภาพ', 0),
(643, 58, 'Patriot', 'คนรักชาติ', 0),
(644, 58, 'Pickup', 'ไปรับ', 0),
(645, 58, 'Scrambler', 'Scrambler', 0),
(646, 58, 'Wagoneer', 'Wagoneer', 0),
(647, 58, 'Wrangler', 'Wrangler', 0),
(648, 58, 'Other Jeep Models', 'โมเดลรถจี๊ปอื่น ๆ', 0),
(649, 59, 'Amanti', 'Amanti', 0),
(650, 59, 'Borrego', 'บอร์เรโก', 0),
(651, 59, 'Forte', 'มือขวา', 0),
(652, 59, 'Forte Koup', 'Forte Koup', 0),
(653, 59, 'Optima', 'Optima', 0),
(654, 59, 'Rio', 'ริโอ', 0),
(655, 59, 'Rio5', 'Rio5', 0),
(656, 59, 'Rondo', 'ฉันท์ฝรั่งแบบหนึ่ง', 0),
(657, 59, 'Sedona', 'เซดอนา', 0),
(658, 59, 'Sephia', 'Sephia', 0),
(659, 59, 'Sorento', 'Sorento', 0),
(660, 59, 'Soul', 'จิตวิญญาณ', 0),
(661, 59, 'Spectra', 'Spectra', 0),
(662, 59, 'Spectra5', 'Spectra5', 0),
(663, 59, 'Sportage', 'Sportage', 0),
(664, 59, 'Other Kia Models', 'โมเดล Kia อื่น ๆ', 0),
(665, 60, 'Aventador', 'Aventador', 0),
(666, 60, 'Countach', 'Countach', 0),
(667, 60, 'Diablo', 'Diablo', 0),
(668, 60, 'Gallardo', 'Gallardo', 0),
(669, 60, 'Jalpa', 'Jalpa', 0),
(670, 60, 'LM002', 'LM002', 0),
(671, 60, 'Murcielago', 'Murcielago', 0),
(672, 60, 'Other Lamborghini Models', 'รุ่น Lamborghini อื่น ๆ', 0),
(673, 61, 'Beta', 'เบต้า', 0),
(674, 61, 'Zagato', 'Zagato', 0),
(675, 61, 'Other Lancia Models', 'โมเดล Lancia อื่น ๆ', 0),
(676, 62, 'Defender', 'ผู้ปกป้อง', 0),
(677, 62, 'Discovery', 'การค้นพบ', 0),
(678, 62, 'Freelander', 'Freelander', 0),
(679, 62, 'LR2', 'LR2', 0),
(680, 62, 'LR3', 'LR3', 0),
(681, 62, 'LR4', 'LR4', 0),
(682, 62, 'Range Rover', 'เรนจ์โรเวอร์', 0),
(683, 62, 'Range Rover Evoque', 'เรนจ์โรเวอร์ Evoque', 0),
(684, 62, 'Range Rover Sport', 'Range Rover Sport', 0),
(685, 62, 'Other Land Rover Models', 'โมเดลแลนด์โรเวอร์อื่น ๆ', 0),
(686, 63, 'CT Models (1)', 'รุ่น CT (1)', 0),
(687, 63, '- CT 200h', '- CT 200 ชม', 0),
(688, 63, 'ES Models (5)', 'รุ่น ES (5)', 0),
(689, 63, '- ES 250', '- ES 250', 0),
(690, 63, '- ES 300', '- ES 300', 0),
(691, 63, '- ES 300h', '- ES 300h', 0),
(692, 63, '- ES 330', '- ES 330', 0),
(693, 63, '- ES 350', '- ES 350', 0),
(694, 63, 'GS Models (6)', 'รุ่น GS (6)', 0),
(695, 63, '- GS 300', '- GS 300', 0),
(696, 63, '- GS 350', '- GS 350', 0),
(697, 63, '- GS 400', '- GS 400', 0),
(698, 63, '- GS 430', '- GS 430', 0),
(699, 63, '- GS 450h', '- GS 450h', 0),
(700, 63, '- GS 460', '- GS 460', 0),
(701, 63, 'GX Models (2)', 'รุ่น GX (2)', 0),
(702, 63, '- GX 460', '- GX 460', 0),
(703, 63, '- GX 470', '- GX 470', 0),
(704, 63, 'HS Models (1)', 'รุ่น HS (1)', 0),
(705, 63, '- HS 250h', '- HS 250 ชม', 0),
(706, 63, 'IS Models (6)', 'เป็นโมเดล (6)', 0),
(707, 63, '- IS 250', '- คือ 250', 0),
(708, 63, '- IS 250C', '- คือ 250C', 0),
(709, 63, '- IS 300', '- คือ 300', 0),
(710, 63, '- IS 350', '- คือ 350', 0),
(711, 63, '- IS 350C', '- คือ 350C', 0),
(712, 63, '- IS F', '- IS F', 0),
(713, 63, 'LFA', 'LFA', 0),
(714, 63, 'LS Models (4)', 'รุ่น LS (4)', 0),
(715, 63, '- LS 400', '- LS 400', 0),
(716, 63, '- LS 430', '- LS 430', 0),
(717, 63, '- LS 460', '- LS 460', 0),
(718, 63, '- LS 600h', '- LS 600h', 0),
(719, 63, 'LX Models (3)', 'รุ่น LX (3)', 0),
(720, 63, '- LX 450', '- LX 450', 0),
(721, 63, '- LX 470', '- LX 470', 0),
(722, 63, '- LX 570', '- LX 570', 0),
(723, 63, 'RX Models (5)', 'รุ่น RX (5)', 0),
(724, 63, '- RX 300', '- RX 300', 0),
(725, 63, '- RX 330', '- RX 330', 0),
(726, 63, '- RX 350', '- RX 350', 0),
(727, 63, '- RX 400h', '- RX 400h', 0),
(728, 63, '- RX 450h', '- RX 450h', 0),
(729, 63, 'SC Models (3)', 'รุ่น SC (3)', 0),
(730, 63, '- SC 300', '- SC 300', 0),
(731, 63, '- SC 400', '- SC 400', 0),
(732, 63, '- SC 430', '- SC 430', 0),
(733, 63, 'Other Lexus Models', 'โมเดล Lexus อื่น ๆ', 0),
(734, 64, 'Aviator', 'นักบิน', 0),
(735, 64, 'Blackwood', 'ไม้สีดำ', 0),
(736, 64, 'Continental', 'คอนติเนน', 0),
(737, 64, 'LS', 'LS', 0),
(738, 64, 'Mark LT', 'มาร์ค LT', 0),
(739, 64, 'Mark VI', 'ทำเครื่องหมายที่ VI', 0),
(740, 64, 'Mark VII', 'เครื่องหมาย VII', 0),
(741, 64, 'Mark VIII', 'ทำเครื่องหมาย VIII', 0),
(742, 64, 'MKS', 'MKS', 0),
(743, 64, 'MKT', 'MKT', 0),
(744, 64, 'MKX', 'MKX', 0),
(745, 64, 'MKZ', 'MKZ', 0),
(746, 64, 'Navigator', 'นักเดินเรือ', 0),
(747, 64, 'Navigator L', 'เนวิเกเตอร์ L', 0),
(748, 64, 'Town Car', 'ทาวน์โฮม', 0),
(749, 64, 'Zephyr', 'ลมตะวันตก', 0),
(750, 64, 'Other Lincoln Models', 'โมเดล Lincoln อื่น ๆ', 0),
(751, 65, 'Elan', 'ความชำนาญ', 0),
(752, 65, 'Elise', 'เอลิเซ่', 0),
(753, 65, 'Esprit', 'ปฏิภาณ', 0),
(754, 65, 'Evora', 'Evora', 0),
(755, 65, 'Exige', 'Exige', 0),
(756, 65, 'Other Lotus Models', 'รุ่น Lotus อื่น ๆ', 0),
(757, 66, '430', 'สี่​ร้อย​สาม​สิบ', 0),
(758, 66, 'Biturbo', 'Biturbo', 0),
(759, 66, 'Coupe', 'รถกูบ', 0),
(760, 66, 'Gran Sport', 'แกรนสปอร์ต', 0),
(761, 66, 'Gran Turismo', 'Gran Turismo', 0),
(762, 66, 'Quattroporte', 'Quattroporte', 0),
(763, 66, 'Spyder', 'Spyder', 0),
(764, 66, 'Other Maserati Model', 'โมเดลมาเซราตีอื่น ๆ', 0),
(765, 67, '57', 'ห้า​สิบ​เจ็ด', 0),
(766, 67, '62', 'หก​สิบ​สอง', 0),
(767, 67, 'Other Maybach Models', 'โมเดลมายบัคอื่น ๆ', 0),
(768, 68, '323', 'สาม​ร้อย​ยี่​สิบ​สาม', 0),
(769, 68, '626', 'หก​ร้อย​ยี่​สิบ​หก', 0),
(770, 68, '929', 'เก้า​ร้อย​ยี่​สิบ​เก้า', 0),
(771, 68, 'B-Series Pickup', 'รถกระบะซีรีย์ B', 0),
(772, 68, 'CX-5', 'CX-5', 0),
(773, 68, 'CX-7', 'CX-7', 0),
(774, 68, 'CX-9', 'CX-9', 0),
(775, 68, 'GLC', 'GLC', 0),
(776, 68, 'MAZDA2', 'MAZDA2', 0),
(777, 68, 'MAZDA3', 'MAZDA3', 0),
(778, 68, 'MAZDA5', 'MAZDA5', 0),
(779, 68, 'MAZDA6', 'MAZDA6', 0),
(780, 68, 'MAZDASPEED3', 'MAZDASPEED3', 0),
(781, 68, 'MAZDASPEED3', 'MAZDASPEED3', 0),
(782, 68, 'MAZDASPEED6', 'MAZDASPEED6', 0),
(783, 68, 'Miata MX5', 'Miata MX5', 0),
(784, 68, 'Millenia', 'Millenia', 0),
(785, 68, 'MPV', 'MPV', 0),
(786, 68, 'MX3', 'MX3', 0),
(787, 68, 'MX6', 'MX6', 0),
(788, 68, 'Navajo', 'นาวาโฮ', 0),
(789, 68, 'Protege', 'บุตรบุญธรรม', 0),
(790, 68, 'Protect5', 'Protect5', 0),
(791, 68, 'RX-7', 'RX-7', 0),
(792, 68, 'RX-8', 'RX-8', 0),
(793, 68, 'Tribute', 'ส่วย', 0),
(794, 68, 'Other Mazda Models', 'มาสด้ารุ่นอื่น ๆ', 0),
(795, 69, '190 Class (2)', '190 คลาส (2)', 0),
(796, 70, '- 190D', '- 190D', 0),
(797, 70, '- 190E', '- 190E', 0),
(798, 70, '240 Class (1)', '240 คลาส (1)', 0),
(799, 70, '- 240D', '- 240D', 0),
(800, 70, '300 Class/E Class(6)', '300 คลาส / คลาส E (6)', 0),
(801, 70, '- 300CD', '- 300CD', 0),
(802, 70, '- 300CE', '- 300CE', 0),
(803, 70, '- 300D', '- 300D', 0),
(804, 70, '- 300E', '- 300E', 0),
(805, 70, '- 300TD', '- 300TD', 0),
(806, 70, '- 300TE', '- 300TE', 0),
(807, 70, 'C Class (13)', 'คลาส C (13)', 0),
(808, 70, '- C220', '- C220', 0),
(809, 70, '- C230', '- C230', 0),
(810, 70, '- C240', '- C240', 0),
(811, 70, '- C250', '- C250', 0),
(812, 70, '- C280', '- C280', 0),
(813, 70, '- C300', '- C300', 0),
(814, 70, '- C320', '- C320', 0),
(815, 70, '- C32 AMG', '- C32 AMG', 0),
(816, 70, '- C350', '- C350', 0),
(817, 70, '- C36 AMG', '- C36 AMG', 0),
(818, 70, '- C43 AMG', '- C43 AMG', 0),
(819, 70, '- C55 AMG', '- C55 AMG', 0),
(820, 70, '- C63 AMG', '- C63 AMG', 0),
(821, 70, 'CL Class (6)', 'คลาส CL (6)', 0),
(822, 70, '- CL500', '- CL500', 0),
(823, 70, '- CL550', '- CL550', 0),
(824, 70, '- CL55 AMG', '- CL55 AMG', 0),
(825, 70, '- CL600', '- CL600', 0),
(826, 70, '- CL63 AMG', '- CL63 AMG', 0),
(827, 70, '- CL65 AMG', '- CL65 AMG', 0),
(828, 70, 'CLK Class (7)', 'คลาส CLK (7)', 0),
(829, 70, '- CLK320', '- CLK320', 0),
(830, 70, '- CLK350', '- CLK350', 0),
(831, 70, '- CLK430', '- CLK430', 0),
(832, 70, '- CLK500', '- CLK500', 0),
(833, 70, '- CLK550', '- CLK550', 0),
(834, 70, '- CLK55 AMG', '- CLK55 AMG', 0),
(835, 70, '- CLK63 AMG', '- CLK63 AMG', 0),
(836, 70, 'CLS Class (4)', 'คลาส CLS (4)', 0),
(837, 70, '- CLS500', '- CLS500', 0),
(838, 70, '- CLS550', '- CLS550', 0),
(839, 70, '- CLS55 AMG', '- CLS55 AMG', 0),
(840, 70, '- CLS63 AMG', '- CLS63 AMG', 0),
(841, 70, 'E Class (18)', 'คลาส E (18)', 0),
(842, 70, '- 260E', '- 260E', 0),
(843, 70, '- 280CE', '- 280CE', 0),
(844, 70, '- 280E', '- 280E', 0),
(845, 70, '- 400E', '- 400E', 0),
(846, 70, '- 500E', '- 500E', 0),
(847, 70, '- E300', '- E300', 0),
(848, 70, '- E320', '- E320', 0),
(849, 70, '- E320 Bluetec', '- E320 Bluetec', 0),
(850, 70, '- E320 CDI', '- E320 CDI', 0),
(851, 70, '- E350', '- E350', 0),
(852, 70, '- E350 Bluetec', '- E350 Bluetec', 0),
(853, 70, '- E400 Hybrid', '- E400 Hybrid', 0),
(854, 70, '- E420', '- E420', 0),
(855, 70, '- E430', '- E430', 0),
(856, 70, '- E500', '- E500', 0),
(857, 70, '- E550', '- E550', 0),
(858, 70, '- E55 AMG', '- E55 AMG', 0),
(859, 70, '- E63 AMG', '- E63 AMG', 0),
(860, 70, 'G Class (4)', 'คลาส G (4)', 0),
(861, 70, '- G500', '- G500', 0),
(862, 70, '- G550', '- G550', 0),
(863, 70, '- G55 AMG', '- G55 AMG', 0),
(864, 70, '- G63 AMG', '- G63 AMG', 0),
(865, 70, 'GL Class (5)', 'คลาส GL (5)', 0),
(866, 70, '- GL320 Bluetec', '- GL320 Bluetec', 0),
(867, 70, '- GL320 CDI', '- GL320 CDI', 0),
(868, 70, '- GL350 Bluetec', '- GL350 Bluetec', 0),
(869, 70, '- GL450', '- GL450', 0),
(870, 70, '- GL550', '- GL550', 0),
(871, 70, 'GLK Class (1)', 'คลาส GLK (1)', 0),
(872, 70, '- GLK350', '- GLK350', 0),
(873, 70, 'M Class (11)', 'คลาส M (11)', 0),
(874, 70, '- ML320', '- ML320', 0),
(875, 70, '- ML320 Bluetec', '- ML320 Bluetec', 0),
(876, 70, '- ML320 CDI', '- ML320 CDI', 0),
(877, 70, '- ML350', '- ML350', 0),
(878, 70, '- ML350 Bluetec', '- ML350 Bluetec', 0),
(879, 70, '- ML430', '- ML430', 0),
(880, 70, '- ML450 Hybrid', '- ML450 Hybrid', 0),
(881, 70, '- ML500', '- ML500', 0),
(882, 70, '- ML550', '- ML550', 0),
(883, 70, '- ML55 AMG', '- ML55 AMG', 0),
(884, 70, '- ML63 AMG', '- ML63 AMG', 0),
(885, 70, 'R Class (6)', 'คลาส R (6)', 0),
(886, 70, '- R320 Bluetec', '- R320 Bluetec', 0),
(887, 70, '- R320 CDI', '- R320 CDI', 0),
(888, 70, '- R350', '- R350', 0),
(889, 70, '- R350 Bluetec', '- R350 Bluetec', 0),
(890, 70, '- R500', '- R500', 0),
(891, 70, '- R63 AMG', '- R63 AMG', 0),
(892, 70, 'S Class (30)', 'คลาส S (30)', 0),
(893, 70, '- 300SD', '- 300SD', 0),
(894, 70, '- 300SDL', '- 300SDL', 0),
(895, 70, '- 300SE', '- 300SE', 0),
(896, 70, '- 300SEL', '- 300SEL', 0),
(897, 70, '- 350SD', '- 350SD', 0),
(898, 70, '- 350SDL', '- 350SDL', 0),
(899, 70, '- 380SE', '- 380SE', 0),
(900, 70, '- 380SEC', '- 380SEC', 0),
(901, 70, '- 380SEL', '- 380SEL', 0),
(902, 70, '- 400SE', '- 400SE', 0),
(903, 70, '- 400SEL', '- 400SEL', 0),
(904, 70, '- 420SEL', '- 420SEL', 0),
(905, 70, '- 500SEC', '- 500SEC', 0),
(906, 70, '- 500SEL', '- 500SEL', 0),
(907, 70, '- 560SEC', '- 560SEC', 0),
(908, 70, '- 560SEL', '- 560SEL', 0),
(909, 70, '- 600SEC', '- 600SEC', 0),
(910, 70, '- 600SEL', '- 600SEL', 0),
(911, 70, '- S320', '- S320', 0),
(912, 70, '- S350', '- S350', 0),
(913, 70, '- S350 Bluetec', '- S350 Bluetec', 0),
(914, 70, '- S400 Hybrid', '- S400 Hybrid', 0),
(915, 70, '- S420', '- S420', 0),
(916, 70, '- S430', '- S430', 0),
(917, 70, '- S500', '- S500', 0),
(918, 70, '- S550', '- S550', 0),
(919, 70, '- S55 AMG', '- S55 AMG', 0),
(920, 70, '- S600', '- S600', 0),
(921, 70, '- S63 AMG', '- S63 AMG', 0),
(922, 70, '- S65 AMG', '- S65 AMG', 0),
(923, 70, 'SL Class (13)', 'คลาส SL (13)', 0),
(924, 70, '- 300SL', '- 300SL', 0),
(925, 70, '- 380SL', '- 380SL', 0),
(926, 70, '- 380SLC', '- 380SLC', 0),
(927, 70, '- 500SL', '- 500SL', 0),
(928, 70, '- 560SL', '- 560SL', 0),
(929, 70, '- 600SL', '- 600SL', 0),
(930, 70, '- SL320', '- SL320', 0),
(931, 70, '- SL500', '- SL500', 0),
(932, 70, '- SL550', '- SL550', 0),
(933, 70, '- SL55 AMG', '- SL55 AMG', 0),
(934, 70, '- SL600', '- SL600', 0),
(935, 70, '- SL63 AMG', '- SL63 AMG', 0),
(936, 70, '- SL65 AMG', '- SL65 AMG', 0),
(937, 70, 'SLK Class (8)', 'คลาส SLK (8)', 0),
(938, 70, '- SLK230', '- SLK230', 0),
(939, 70, '- SLK250', '- SLK250', 0),
(940, 70, '- SLK280', '- SLK280', 0),
(941, 70, '- SLK300', '- SLK300', 0),
(942, 70, '- SLK320', '- SLK320', 0),
(943, 70, '- SLK32 AMG', '- SLK32 AMG', 0),
(944, 70, '- SLK350', '- SLK350', 0),
(945, 70, '- SLK55 AMG', '- SLK55 AMG', 0),
(946, 70, 'SLR Class (1)', 'คลาส SLR (1)', 0),
(947, 70, '- SLR', '- SLR', 0),
(948, 70, 'SLS Class (1)', 'คลาส SLS (1)', 0),
(949, 70, '- SLS AMG', '- SLS AMG', 0),
(950, 70, 'Sprinter Class (1)', 'ระดับผู้วิ่งแข่ง (1)', 0),
(951, 70, '- Sprinter', '- ผู้วิ่งแข่ง', 0),
(952, 70, 'Other Mercedes-Benz ', 'เมอร์เซเดส - เบนซ์อื่น ๆ', 0),
(953, 71, 'Capri', 'กางเกงรัดรูปผู้หญิง', 0),
(954, 71, 'Cougar', 'เสือภูเขา', 0),
(955, 71, 'Grand Marquis', 'แกรนด์มาร์ควิส', 0),
(956, 71, 'Lynx', 'แมวป่าชนิดหนึ่ง', 0),
(957, 71, 'Marauder', 'โจรปล้นสะดม', 0),
(958, 71, 'Mariner', 'นาวิน', 0),
(959, 71, 'Marquis', 'ขุนนางมาร์ควิซ', 0),
(960, 71, 'Milan', 'มิลาน', 0),
(961, 71, 'Montego', 'Montego', 0),
(962, 71, 'Monterey', 'มอนเทอร์', 0),
(963, 71, 'Mountaineer', 'นักไต่เขา', 0),
(964, 71, 'Mystique', 'ขลัง', 0),
(965, 71, 'Sable', 'สีน้ำตาลเข้ม', 0),
(966, 71, 'Topaz', 'บุษราคัม', 0),
(967, 71, 'Tracer', 'ผู้ตามรอย', 0),
(968, 71, 'Villager', 'ชาวบ้าน', 0),
(969, 71, 'Zephyr', 'ลมตะวันตก', 0),
(970, 71, 'Other Mercury Models', 'โมเดลปรอทอื่น ๆ', 0),
(971, 72, 'Scorpio', 'ราศีพิจิก', 0),
(972, 72, 'XR4Ti', 'XR4Ti', 0),
(973, 72, 'Other Merkur Models', 'โมเดล Merkur อื่น ๆ', 0),
(974, 73, 'Cooper Clubman Model', 'รุ่น Cooper Clubman', 0),
(975, 73, '- Cooper Clubman', '- Cooper Clubman', 0),
(976, 73, '- Cooper S Clubman', '- Cooper S Clubman', 0),
(977, 73, 'Cooper Countryman Models', 'โมเดล Cooper Countryman', 0),
(978, 73, '- Cooper Countryman', '- Countryman คูเปอร์', 0),
(979, 73, '- Cooper S Countryman', '- Cooper S Countryman', 0),
(980, 73, 'Cooper Coupe Models(2)', 'Cooper Coupe รุ่น (2)', 0),
(981, 73, '- Cooper Coupe', '- คูเปอร์คูเป้', 0),
(982, 73, '- Cooper S Coupe', '- Cooper S Coupe', 0),
(983, 73, 'Cooper Models(2)', 'คูเปอร์โมเดล (2)', 0),
(984, 73, '- Cooper', '- คูเปอร์', 0),
(985, 73, '- Cooper S', '- Cooper S', 0),
(986, 73, 'Cooper Roadster Models', 'รุ่น Cooper Roadster', 0),
(987, 73, '- Cooper Roadster', '- Cooper Roadster', 0),
(988, 73, '- Cooper S Roadster', '- Cooper S Roadster', 0),
(989, 74, '3000GT', '3000GT', 0),
(990, 74, 'Cordia', 'Cordia', 0),
(991, 74, 'Diamante', 'Diamante', 0),
(992, 74, 'Eclipse', 'คราส', 0),
(993, 74, 'Endeavor', 'พยายาม', 0),
(994, 74, 'Expo', 'งานแสดงสินค้า', 0),
(995, 74, 'Galant', 'เจนจบ', 0),
(996, 74, 'i', 'ผม', 0),
(997, 74, 'Lancer', 'ทหารม้าถือทวน', 0),
(998, 74, 'Lancer Evolution', 'แลนเซอร์วิวัฒนาการ', 0),
(999, 74, 'Mighty Max', 'Mighty Max', 0),
(1000, 74, 'Mirage', 'ภาพลวงตา', 0),
(1001, 74, 'Montero', 'Montero', 0),
(1002, 74, 'Montero Sport', 'มอนเตโรสปอร์ต', 0),
(1003, 74, 'Outlander', 'ต่างชาติ', 0),
(1004, 74, 'Outlander Sport', 'กีฬาคนต่างชาติ', 0),
(1005, 74, 'Precis', 'ย่อความ', 0),
(1006, 74, 'Raider', 'ผู้ตรวจค้น', 0),
(1007, 74, 'Sigma', 'ซิกม่า', 0),
(1008, 74, 'Starion', 'Starion', 0),
(1009, 74, 'Tredia', 'Tredia', 0),
(1010, 74, 'Van', 'รถตู้', 0),
(1011, 74, 'Other Mitsubishi Models', 'โมเดลมิตซูบิชิอื่น ๆ', 0),
(1012, 75, '200SX', '200SX', 0),
(1013, 75, '240SX', '240SX', 0),
(1014, 75, '300ZX', '300ZX', 0),
(1015, 75, '350Z', '350Z', 0),
(1016, 75, '370Z', '370Z', 0),
(1017, 75, 'Altima', 'Altima', 0),
(1018, 75, 'Armada', 'กองทัพเรือใหญ่', 0),
(1019, 75, 'Axxess', 'Axxess', 0),
(1020, 75, 'Cube', 'ลูกบาศก์', 0),
(1021, 75, 'Frontier', 'ชายแดน', 0),
(1022, 75, 'GT-R', 'GT-R', 0),
(1023, 75, 'Juke', 'การวิ่งหลอก', 0),
(1024, 75, 'Leaf', 'ใบไม้', 0),
(1025, 75, 'Maxima', 'Maxima', 0),
(1026, 75, 'Murano', 'มูราโน่', 0),
(1027, 75, 'Murano CrossCabriolet', 'Murano CrossCabriolet', 0),
(1028, 75, 'NV', 'NV', 0),
(1029, 75, 'NX', 'NX', 0),
(1030, 75, 'Pathfinder', 'ผู้เบิกทาง', 0),
(1031, 75, 'Pickup', 'ไปรับ', 0),
(1032, 75, 'Pulsar', 'พูลสาร์', 0),
(1033, 75, 'Quest', 'การแสวงหา', 0),
(1034, 75, 'Rogue', 'โกง', 0),
(1035, 75, 'Sentra', 'Sentra', 0),
(1036, 75, 'Stanza', 'ฉันท์', 0),
(1037, 75, 'Titan', 'ยักษ์', 0),
(1038, 75, 'Van', 'รถตู้', 0),
(1039, 75, 'Versa', 'ในทางกลับกัน', 0),
(1040, 75, 'Xterra', 'Xterra', 0),
(1041, 75, 'Other Nissan Models', 'รุ่นอื่น ๆ ของ Nissan', 0),
(1042, 76, '88', 'แปด​สิบ​แปด', 0),
(1043, 76, 'Achieva', 'Achieva', 0),
(1044, 76, 'Alero', 'Alero', 0),
(1045, 76, 'Aurora', 'ออโรร่า', 0),
(1046, 76, 'Bravada', 'Bravada', 0),
(1047, 76, 'Custom Cruiser', 'เรือลาดตระเวนที่กำหนดเอง', 0),
(1048, 76, 'Cutlass', 'มีดสั้น', 0),
(1049, 76, 'Cutlass Calais', 'กาเลส์', 0),
(1050, 76, 'Cutlass Ciera', 'Cutlass Ciera', 0),
(1051, 76, 'Cutlass Supreme', 'Cutlass Supreme', 0),
(1052, 76, 'Firenza', 'Firenza', 0),
(1053, 76, 'Intrigue', 'วางอุบาย', 0),
(1054, 76, 'Ninety-Eight', 'เก้าสิบแปด', 0),
(1055, 76, 'Omega', 'อวสาน', 0),
(1056, 76, 'Regency', 'รีเจนซี่', 0),
(1057, 76, 'Silhouette', 'ภาพเงา', 0),
(1058, 76, 'Toronado', 'Toronado', 0),
(1059, 76, 'Other Oldsmobile Models', 'โมเดล Oldsmobile อื่น ๆ', 0),
(1060, 77, '405', 'สี่​ร้อย​ห้า', 0),
(1061, 77, '504', 'ห้า​ร้อย​สี่', 0),
(1062, 77, '505', 'ห้า​ร้อย​ห้า', 0),
(1063, 77, '604', 'หก​ร้อย​สี่', 0),
(1064, 77, 'Other Peugeot Models', 'โมเดลเปอโยต์อื่น ๆ', 0),
(1065, 79, 'Acclaim', 'เสียงไชโยโห่ร้อง', 0),
(1066, 79, 'Arrow', 'ลูกศร', 0),
(1067, 79, 'Breeze', 'ลมโชย', 0),
(1068, 79, 'Caravelle', 'Caravelle', 0),
(1069, 79, 'Champ', 'เคี้ยวดังจั๊บๆ', 0),
(1070, 79, 'Colt', 'เด็กผู้ชายที่อ่อนหัด', 0),
(1071, 79, 'Conquest', 'ชนะ', 0),
(1072, 79, 'Gran Fury', 'Gran Fury', 0),
(1073, 79, 'Grand Voyager', 'Grand Voyager', 0),
(1074, 79, 'Horizon', 'ขอบฟ้า', 0),
(1075, 79, 'Laser', 'เลเซอร์', 0),
(1076, 79, 'Neon', 'ธาตุนีอ็อน', 0),
(1077, 79, 'Prowler', 'ผู้เที่ยวเดินด้อม ๆ มองๆ', 0),
(1078, 79, 'Reliant', 'คู่ใจ', 0),
(1079, 79, 'Sapporo', 'ซัปโปโร', 0),
(1080, 79, 'Scamp', 'คนขี้โกง', 0),
(1081, 79, 'Sundance', 'ซันแดนซ์', 0),
(1082, 79, 'Trailduster', 'Trailduster', 0),
(1083, 79, 'Voyager', 'ผู้เดินทาง', 0),
(1084, 79, 'Other Plymouth Models', 'โมเดลพลีมั ธ อื่น ๆ', 0),
(1085, 80, '1000', 'หนึ่ง​พัน', 0),
(1086, 80, '6000', 'หก​พัน', 0),
(1087, 80, 'Aztek', 'Aztek', 0),
(1088, 80, 'Bonneville', 'บอง', 0),
(1089, 80, 'Catalina', 'Catalina', 0),
(1090, 80, 'Fiero', 'Fiero', 0),
(1091, 80, 'Firebird', 'Firebird', 0),
(1092, 80, 'G3', 'G3', 0),
(1093, 80, 'G5', 'G5', 0),
(1094, 80, 'G6', 'G6', 0),
(1095, 80, 'G8', 'G8', 0),
(1096, 80, 'Grand Am', 'แกรนด์', 0),
(1097, 80, 'Grand Prix', 'กรังปรีซ์', 0),
(1098, 80, 'GTO', 'GTO', 0),
(1099, 80, 'J2000', 'J2000', 0),
(1100, 80, 'Le Mans', 'เลอม็อง', 0),
(1101, 80, 'Montana', 'มอนแทนา', 0),
(1102, 80, 'Parisienne', 'Parisienne', 0),
(1103, 80, 'Phoenix', 'ต้นอินทผลัม', 0),
(1104, 80, 'Safari', 'การแข่งรถวิบาก', 0),
(1105, 80, 'Solstice', 'อายัน', 0),
(1106, 80, 'Sunbird', 'Sunbird', 0),
(1107, 80, 'Sunfire', 'Sunfire', 0),
(1108, 80, 'Torrent', 'ฝนตกหนัก', 0),
(1109, 80, 'Trans Sport', 'ทรานส์สปอร์ต', 0),
(1110, 80, 'Vibe', 'บรรยากาศ', 0),
(1111, 80, 'Other Pontiac Models', 'โมเดลรถปอนเตี๊ยกอื่น ๆ', 0),
(1112, 81, '911', 'เก้า​ร้อย​สิบ​เอ็ด', 0),
(1113, 81, '924', 'เก้า​ร้อย​ยี่​สิบ​สี่', 0),
(1114, 81, '928', 'เก้า​ร้อย​ยี่​สิบ​แปด', 0),
(1115, 81, '944', 'เก้า​ร้อย​สี่​สิบ​สี่', 0),
(1116, 81, '968', 'เก้า​ร้อย​หก​สิบ​แปด', 0),
(1117, 81, 'Boxster', 'บ็อกซเตอร์', 0),
(1118, 81, 'Carrera GT', 'Carrera GT', 0),
(1119, 81, 'Cayenne', 'พริกป่น', 0),
(1120, 81, 'Cayman', 'เคย์แมน', 0),
(1121, 81, 'Panamera', 'พานาเมร่า', 0),
(1122, 81, 'Other Porsche Models', 'โมเดลรถปอร์เช่อื่น ๆ', 0),
(1123, 82, '1500', 'หนึ่ง​พัน​ห้า​ร้อย', 0),
(1124, 82, '2500', 'สอง​พัน​ห้า​ร้อย', 0),
(1125, 82, '3500', 'สาม​พัน​ห้า​ร้อย', 0),
(1126, 82, '4500', 'สี่​พัน​ห้า​ร้อย', 0),
(1127, 83, '18i', '18i', 0),
(1128, 83, 'Fuego', 'Fuego', 0),
(1129, 83, 'Le Car', 'เลอคาร์', 0),
(1130, 83, 'R18', 'R18', 0),
(1131, 83, 'Sportwagon', 'Sportwagon', 0),
(1132, 83, 'Other Renault Models', 'โมเดลเรโนลต์อื่น ๆ', 0),
(1133, 84, 'Camargue', 'Camargue', 0),
(1134, 84, 'Corniche', 'Corniche', 0),
(1135, 84, 'Ghost', 'ผี', 0),
(1136, 84, 'Park Ward', 'ปาร์ควอร์ด', 0),
(1137, 84, 'Phantom', 'ผี', 0),
(1138, 84, 'Silver Dawn', 'เงินรุ่งอรุณ', 0),
(1139, 84, 'Silver Seraph', 'เซราฟเงิน', 0),
(1140, 84, 'Silver Spirit', 'วิญญาณเงิน', 0),
(1141, 84, 'Silver Spur', 'ซิลเวอร์เดือย', 0),
(1142, 84, 'Other Rolls-Royce Models', 'โมเดลโรลส์ - รอยซ์อื่น ๆ', 0),
(1143, 97, 'GV', 'GV', 0),
(1144, 97, 'GVC', 'GVC', 0),
(1145, 97, 'GVL', 'GVL', 0),
(1146, 97, 'GVS', 'GVS', 0),
(1147, 97, 'GVX', 'GVX', 0),
(1148, 97, 'Other Yugo Models', 'โมเดล Yugo อื่น ๆ', 0),
(1149, 96, '240', 'สอง​ร้อย​สี่​สิบ', 0),
(1150, 96, '260', 'สอง​ร้อย​หก​สิบ', 0),
(1151, 96, '740', 'เจ็ด​ร้อย​สี่​สิบ', 0),
(1152, 96, '760', 'เจ็ด​ร้อย​หก​สิบ', 0),
(1153, 96, '780', 'เจ็ด​ร้อย​แปด​สิบ', 0),
(1154, 96, '850', 'แปด​ร้อย​ห้า​สิบ', 0),
(1155, 96, '940', 'เก้า​ร้อย​สี่​สิบ', 0),
(1156, 96, '960', 'เก้า​ร้อย​หก​สิบ', 0),
(1157, 96, 'C30', 'C30', 0),
(1158, 96, 'C70', 'C70', 0),
(1159, 96, 'S40', 'S40', 0),
(1160, 96, 'S60', 'S60', 0),
(1161, 96, 'S70', 'S70', 0),
(1162, 96, 'S80', 'S80', 0),
(1163, 96, 'S90', 'S90', 0),
(1164, 96, 'V40', 'V40', 0),
(1165, 96, 'V50', 'V50', 0),
(1166, 96, 'V70', 'V70', 0),
(1167, 96, 'V90', 'V90', 0),
(1168, 96, 'XC60', 'XC60', 0),
(1169, 96, 'XC70', 'XC70', 0),
(1170, 96, 'Other Volvo Models', 'โมเดลวอลโว่อื่น ๆ', 0),
(1171, 96, 'XC90', 'XC90', 0),
(1172, 95, 'Beetle', 'ด้วง', 0),
(1173, 95, 'Cabrio', 'Cabrio', 0),
(1174, 95, 'Cabriolet', 'Cabriolet', 0),
(1175, 95, 'CC', 'CC', 0),
(1176, 95, 'Corrado', 'คอร์ราโด', 0),
(1177, 95, 'Dasher', 'แดชเชอร์', 0),
(1178, 95, 'Eos', 'Eos', 0),
(1179, 95, 'Eurovan', 'Eurovan', 0),
(1180, 95, 'Fox', 'จิ้งจอก', 0),
(1181, 95, 'GLI', 'GLI', 0),
(1182, 95, 'Golf R', 'กอล์ฟอาร์', 0),
(1183, 95, 'GTI', 'GTI', 0),
(1184, 95, 'Golf and Rabbit Models(2)', 'แบบจำลองกอล์ฟและกระต่าย (2)', 0),
(1185, 95, '- Golf', '- สนามกอล์ฟ', 0),
(1186, 95, '- Rabbit', '- กระต่าย', 0),
(1187, 95, 'Jetta', 'Jetta', 0),
(1188, 95, 'Passat', 'Passat', 0),
(1189, 95, 'Phaeton', 'รถม้าเปิดประทุน', 0),
(1190, 95, 'Pickup', 'ไปรับ', 0),
(1191, 95, 'Quantum', 'ควอนตัม', 0),
(1192, 95, 'R32', 'R32', 0),
(1193, 95, 'Routan', 'Routan', 0),
(1194, 95, 'Scirocco', 'ร็อคโค่', 0),
(1195, 95, 'Tiguan', 'Tiguan', 0),
(1196, 95, 'Touareg', 'Touareg', 0),
(1197, 95, 'Vanagon', 'Vanagon', 0),
(1198, 95, 'Other Volkswagen Models', 'โมเดลโฟล์คสวาเกนอื่น ๆ', 0),
(1199, 98, 'TR7', 'TR7', 0),
(1200, 98, 'TR8', 'TR8', 0),
(1201, 98, 'Other Triumph Models', 'รุ่นไทรอัมพ์อื่น ๆ', 0),
(1202, 93, 'Roadster', 'รถยนต์เปิดประทน', 0),
(1203, 94, '4Runner', '4Runner', 0),
(1204, 94, 'Avalon', 'รีสอร์ต', 0),
(1205, 94, 'Camry', 'คัมรี่', 0),
(1206, 94, 'Celica', 'เซลิก้า', 0),
(1207, 94, 'Corolla', 'กลีบดอกไม้', 0),
(1208, 94, 'Corona', 'มาลา', 0),
(1209, 94, 'Cressida', 'เครสสิด้า', 0),
(1210, 94, 'Echo', 'เสียงสะท้อน', 0),
(1211, 94, 'FJ Cruiser', 'FJ Cruiser', 0),
(1212, 94, 'Highlander', 'Highlander', 0),
(1213, 94, 'Land Cruiser', 'ครุยเซอร์แลนด์', 0),
(1214, 94, 'Matrix', 'มดลูก', 0),
(1215, 94, 'MR2', 'MR2', 0),
(1216, 94, 'MR2 Spyder', 'MR2 Spyder', 0),
(1217, 94, 'Paseo', 'Paseo', 0),
(1218, 94, 'Pickup', 'ไปรับ', 0),
(1219, 94, 'Previa', 'Previa', 0),
(1220, 94, 'Prius', 'พรีอุส', 0),
(1221, 94, 'Prius C', 'Prius ได', 0),
(1222, 94, 'Prius V', 'Prius V', 0),
(1223, 94, 'RAV4', 'RAV4', 0),
(1224, 94, 'Sequoia', 'ต้นสีคโวยะ', 0),
(1225, 94, 'Sienna', 'สีน้ำตาล', 0),
(1226, 94, 'Solara', 'Solara', 0),
(1227, 94, 'Starlet', 'ดาราหน้าใหม่', 0),
(1228, 94, 'Supra', 'Supra', 0),
(1229, 94, 'T100', 'T100', 0),
(1230, 94, 'Tacoma', 'ทาโคมา', 0),
(1231, 94, 'Tercel', 'Tercel', 0),
(1232, 94, 'Tundra', 'ทุ่งทุนดรา', 0),
(1233, 94, 'Van', 'รถตู้', 0),
(1234, 94, 'Venza', 'Venza', 0),
(1235, 94, 'Yaris', 'Yaris', 0),
(1236, 94, 'Other Toyota Models', 'โมเดลโตโยต้าอื่น ๆ', 0),
(1237, 85, '9-2X', '9-2X', 0),
(1238, 85, '9-3', '9-3', 0),
(1239, 85, '9-4X', '9-4X', 0),
(1240, 85, '9-5', '9-5', 0),
(1241, 85, '9-7X', '9-7X', 0),
(1242, 85, '900', 'เก้า​ร้อย', 0),
(1243, 85, '9000', 'เก้า​พัน', 0),
(1244, 85, 'Other Saab Models', 'โมเดลของ Saab อื่น ๆ', 0),
(1245, 86, 'Astra', 'แอสตร้า', 0),
(1246, 86, 'Aura', 'กลิ่นอาย', 0),
(1247, 86, 'ION', 'ไอออน', 0),
(1248, 86, 'L Series (3)', 'ซีรี่ส์ L (3)', 0),
(1249, 86, '- L100', '- L100', 0),
(1250, 86, '- L200', '- L200', 0),
(1251, 86, '- L300', '- L300', 0),
(1252, 86, 'LS', 'LS', 0),
(1253, 86, 'LW Series(4)', 'LW ซีรี่ส์ (4)', 0),
(1254, 86, '- LW1', '- LW1', 0),
(1255, 86, '- LW2', '- LW2', 0),
(1256, 86, '- LW200', '- LW200', 0),
(1257, 86, '- LW300', '- LW300', 0),
(1258, 86, 'Outlook', 'ภาพ', 0),
(1259, 86, 'Relay', 'ถ่ายทอด', 0),
(1260, 86, 'SC Series(2)', 'ซีรี่ส์ SC (2)', 0),
(1261, 86, '- SC1', '- SC1', 0),
(1262, 86, '- SC2', '- SC2', 0),
(1263, 86, 'Sky', 'ท้องฟ้า', 0),
(1264, 86, 'SL Series(3)', 'SL ซีรี่ส์ (3)', 0),
(1265, 86, '- SL', '- SL', 0),
(1266, 86, '- SL1', '- SL1', 0),
(1267, 86, '- SL2', '- SL2', 0),
(1268, 86, 'SW Series(2)', 'ซีรีย์ SW (2)', 0),
(1269, 86, '- SW1', '- SW1', 0),
(1270, 86, '- SW2', '- SW2', 0),
(1271, 86, 'Vue', 'Vue', 0),
(1272, 86, 'Other Saturn Models', 'รุ่นอื่น ๆ ของดาวเสาร์', 0),
(1273, 87, 'FR-S', 'FR-S', 0),
(1274, 87, 'iQ', 'iQ', 0),
(1275, 87, 'tC', 'tC', 0),
(1276, 87, 'xA', 'xA', 0),
(1277, 87, 'xB', 'xB', 0),
(1278, 87, 'xD', 'xD', 0),
(1279, 88, 'fortwo', 'สำหรับสอง', 0),
(1280, 88, 'Other smart Models', 'รุ่นสมาร์ทอื่น ๆ', 0),
(1281, 89, 'Viper', 'งูพิษ', 0),
(1282, 90, '825', 'แปด​ร้อย​ยี่​สิบ​ห้า', 0),
(1283, 90, '827', 'แปด​ร้อย​ยี่​สิบ​เจ็ด', 0),
(1284, 90, 'Other Sterling Models', 'สเตอร์ลิงรุ่นอื่น ๆ', 0),
(1285, 91, 'Baja', 'Baja', 0),
(1286, 91, 'Brat', 'เด็กเหลือขอ', 0),
(1287, 91, 'BRZ', 'BRZ', 0),
(1288, 91, 'Forester', 'ชาวป่า', 0),
(1289, 91, 'Impreza', 'Impreza', 0),
(1290, 91, 'Impreza WRX', 'Impreza WRX', 0),
(1291, 91, 'Justy', 'Justy', 0),
(1292, 91, 'L Series', 'ซีรี่ส์ L', 0),
(1293, 91, 'Legacy', 'มรดก', 0),
(1294, 91, 'Loyale', 'Loyale', 0),
(1295, 91, 'Outback', 'ชนบทห่างไกล', 0),
(1296, 91, 'SVX', 'SVX', 0),
(1297, 91, 'Tribeca', 'Tribeca', 0),
(1298, 91, 'XT', 'XT', 0),
(1299, 91, 'XV Crosstrek', 'XV Crosstrek', 0),
(1300, 91, 'Other Subaru Models', 'โมเดล Subaru อื่น ๆ', 0),
(1301, 92, 'Aerio', 'Aerio', 0),
(1302, 92, 'Equator', 'เส้นศูนย์สูตร', 0),
(1303, 92, 'Esteem', 'นับถือ', 0),
(1304, 92, 'Forenza', 'Forenza', 0),
(1305, 92, 'Grand Vitara', 'Grand Vitara', 0),
(1306, 92, 'Kizashi', 'Kizashi', 0),
(1307, 92, 'Reno', 'รีโน', 0),
(1308, 92, 'Samurai', 'ซามูไร', 0),
(1309, 92, 'Sidekick', 'เพื่อนสนิท', 0),
(1310, 92, 'Swift', 'รวดเร็ว', 0),
(1311, 92, 'SX4', 'SX4', 0),
(1312, 92, 'Verona', 'เวโรนา', 0),
(1313, 92, 'Vitara', 'Vitara', 0),
(1314, 92, 'X-900', 'X-90', 0),
(1315, 92, 'XL7', 'XL7', 0),
(1316, 92, 'Other Suzuki Models', 'โมเดล Suzuki อื่น ๆ', 0),
(1317, 92, 'XL8', 'XL8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_types`
--

CREATE TABLE `thai_category_types` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title_en` varchar(50) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_types`
--

INSERT INTO `thai_category_types` (`id`, `category_id`, `title_en`, `title_th`, `trash`) VALUES
(1, 4, 'New', 'ใหม่', 0),
(2, 4, 'Old', 'เก่า', 0),
(3, 5, 'New', 'ใหม่', 0),
(4, 5, 'Old', 'เก่า', 0),
(5, 6, 'New', 'ใหม่', 0),
(6, 6, 'Old', 'เก่า', 0),
(7, 7, 'New', 'ใหม่', 0),
(8, 7, 'Old', 'เก่า', 0),
(9, 8, 'Full-Time', 'เต็มเวลา', 0),
(10, 8, 'Part-Time', 'ไม่เต็มเวลา', 0),
(11, 8, 'Temporary', 'ชั่วคราว', 0),
(12, 9, 'Full-Time', 'เต็มเวลา', 0),
(13, 9, 'Part-Time', 'ไม่เต็มเวลา', 0),
(14, 9, 'Temporary', 'ชั่วคราว', 0),
(15, 10, 'Full-Time', 'เต็มเวลา', 0),
(16, 10, 'Part-Time', 'ไม่เต็มเวลา', 0),
(17, 10, 'Temporary', 'ชั่วคราว', 0),
(18, 11, 'Full-Time', 'เต็มเวลา', 0),
(19, 11, 'Part-Time', 'ไม่เต็มเวลา', 0),
(20, 11, 'Temporary', 'ชั่วคราว', 0),
(21, 12, 'Full-Time', 'เต็มเวลา', 0),
(22, 12, 'Part-Time', 'ไม่เต็มเวลา', 0),
(23, 12, 'Temporary', 'ชั่วคราว', 0),
(24, 13, 'Full-Time', 'เต็มเวลา', 0),
(25, 13, 'Part-Time', 'ไม่เต็มเวลา', 0),
(26, 13, 'Temporary', 'ชั่วคราว', 0),
(27, 18, 'Acura', 'Acura', 0),
(28, 18, 'Alfa Romeo', 'อัลฟ่าโรมิโอ', 0),
(29, 18, 'AMC', 'บบส.', 0),
(30, 18, 'Aston Martin', 'แอสตันมาร์ติน', 0),
(31, 18, 'Audi', 'ออดี้', 0),
(32, 18, 'Avanti', 'Avanti', 0),
(33, 18, 'Bentley', 'เบนท์ลีย์', 0),
(34, 18, 'BMW', 'BMW', 0),
(35, 18, 'Buick', 'บูอิค', 0),
(36, 18, 'Cadillac', 'ดิลแลค', 0),
(37, 18, 'Chevrolet', 'เชฟโรเลต', 0),
(38, 18, 'Chrysler', 'ไครสเลอร์', 0),
(39, 18, 'Daewoo', 'Daewoo', 0),
(40, 18, 'Daihatsu', 'ไดฮัทสุ', 0),
(41, 18, 'Datsun', 'Datsun', 0),
(42, 18, 'DeLorean', 'DeLorean', 0),
(43, 18, 'Dodge', 'หลบ', 0),
(44, 18, 'Eagle', 'นกอินทรีย์', 0),
(45, 18, 'Ferrari', 'เฟอร์รารี', 0),
(46, 18, 'FIAT', 'FIAT', 0),
(47, 18, 'Fisker', 'Fisker', 0),
(48, 18, 'Ford', 'ลุย', 0),
(49, 18, 'Freightliner', 'ไลเนอร์', 0),
(50, 18, 'Geo', 'ภูมิศาสตร์', 0),
(51, 18, 'GMC', 'GMC', 0),
(52, 18, 'Honda', 'ฮอนด้า', 0),
(53, 18, 'HUMMER', 'HUMMER', 0),
(54, 18, 'Hyundai', 'ฮุนได', 0),
(55, 18, 'Infiniti', 'อินฟินิตี้', 0),
(56, 18, 'Isuzu', 'อีซูซุ', 0),
(57, 18, 'Jaguar', 'เสือแผ้ว', 0),
(58, 18, 'Jeep', 'รถจี๊ป', 0),
(59, 18, 'Kia', 'Kia', 0),
(60, 18, 'Lamborghini', 'Lamborghini', 0),
(61, 18, 'Lancia', 'Lancia', 0),
(62, 18, 'Land Rover', 'แลนด์โรเวอร์', 0),
(63, 18, 'Lexus', 'เล็กซัส', 0),
(64, 18, 'Lincoln', 'ลิงคอล์น', 0),
(65, 18, 'Lotus', 'บัว', 0),
(66, 18, 'Maserati', 'เซราติ', 0),
(67, 18, 'Maybach', 'มายบัค', 0),
(68, 18, 'Mazda', 'มาสด้า', 0),
(69, 18, 'McLaren', 'แม็คลาเรน', 0),
(70, 18, 'Mercedes-Benz', 'Mercedes-Benz', 0),
(71, 18, 'Mercury', 'ปรอท', 0),
(72, 18, 'Merkur', 'Merkur', 0),
(73, 18, 'MINI', 'MINI', 0),
(74, 18, 'Mitsubishi', 'มิตซูบิชิ', 0),
(75, 18, 'Nissan', 'นิสสัน', 0),
(76, 18, 'Oldsmobile', 'Oldsmobile', 0),
(77, 18, 'Peugeot', 'เปอโยต์', 0),
(78, 18, 'Maserati', 'เซราติ', 0),
(79, 18, 'Plymouth', 'พลีมั ธ', 0),
(80, 18, 'Pontiac', 'Pontiac', 0),
(81, 18, 'Porsche', 'ปอร์เช่', 0),
(82, 18, 'RAM', 'แกะ', 0),
(83, 18, 'Renault', 'เรโนลต์', 0),
(84, 18, 'Rolls-Royce', 'Rolls-Royce', 0),
(85, 18, 'Saab', 'Saab', 0),
(86, 18, 'Saturn', 'ดาวเสาร์', 0),
(87, 18, 'Scion', 'หน่อ', 0),
(88, 18, 'smart', 'ฉลาด', 0),
(89, 18, 'SRT', 'SRT', 0),
(90, 18, 'Sterling', 'เงินสเตอร์ลิง', 0),
(91, 18, 'Subaru', 'ซูบารุ', 0),
(92, 18, 'Suzukii', 'อีกแห่งหนึ่งโดย', 0),
(93, 18, 'Tesla', 'เทสลา', 0),
(94, 18, 'Toyota', 'โตโยต้า', 0),
(95, 18, 'Volkswagen', 'โฟล์คสวาเก้น', 0),
(96, 18, 'Volvo', 'วอลโว่', 0),
(97, 18, 'Yugo', 'ยูโก้', 0),
(99, 19, 'Car Parts', 'ชิ้นส่วนรถยนต์', 0),
(100, 19, 'Other Parts', 'ส่วนอื่น ๆ', 0),
(101, 19, 'Spare Parts', 'อะไหล่สำรอง', 0),
(102, 20, 'Commercial Vehicles', 'รถยนต์เพื่อการพาณิชย์', 0),
(103, 21, 'Other Vehicles', 'ยานพาหนะอื่น ๆ', 0),
(104, 22, 'Honda', 'ฮอนด้า', 0),
(105, 22, 'Bajaj', 'Bajaj', 0),
(106, 22, 'TVS', 'TVS', 0),
(107, 22, 'Suzuki', 'อีกแห่งหนึ่งโดย', 0),
(108, 22, 'Kinetic', 'เกี่ยวกับการเคลื่อนไหว', 0),
(109, 22, 'Mahindra', 'Mahindra', 0),
(110, 23, 'Hercules', 'Hercules', 0),
(111, 23, 'BSA', 'บีเอสเอ', 0),
(112, 23, 'Atlas', 'สมุดแผนที่', 0),
(113, 23, 'Avon', 'เอวอน', 0),
(114, 23, 'Firefox', 'Firefox', 0),
(115, 23, 'Trek', 'ช่วงระยะการเดินทาง', 0),
(116, 25, 'Rent', 'ให้เช่า', 0),
(117, 25, 'Sale', 'การขาย', 0),
(118, 26, 'Rent', 'ให้เช่า', 0),
(119, 26, 'Sale', 'การขาย', 0),
(120, 27, 'Rent', 'ให้เช่า', 0),
(121, 27, 'Sale', 'การขาย', 0),
(122, 28, 'Lease', 'เช่า', 0),
(123, 28, 'Sale', 'การขาย', 0),
(124, 29, 'Sharing', 'ที่ใช้ร่วมกัน', 0),
(125, 29, 'Rent', 'ให้เช่า', 0),
(126, 30, 'Rent', 'ให้เช่า', 0),
(127, 32, 'Women', 'ผู้หญิง', 0),
(128, 32, 'Men', 'ผู้ชาย', 0),
(129, 33, 'Women', 'ผู้หญิง', 0),
(130, 33, 'Men', 'ผู้ชาย', 0),
(131, 34, 'Women', 'ผู้หญิง', 0),
(132, 34, 'Men', 'ผู้ชาย', 0),
(133, 36, 'Laptops', 'แล็ปท็อป', 0),
(134, 36, 'Computers', 'คอมพิวเตอร์', 0),
(135, 36, 'Internet', 'อินเทอร์เน็ต', 0),
(136, 36, 'Printers', 'เครื่องพิมพ์', 0),
(137, 36, 'Monitors', 'จอภาพ', 0),
(138, 36, 'Hard Disk', 'ฮาร์ดดิสก์', 0),
(139, 36, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ', 0),
(140, 37, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ', 0),
(141, 38, 'Video-Audio', 'วิดีโอและเสียง', 0),
(142, 38, 'TV', 'โทรทัศน์', 0),
(143, 39, 'Cameras', 'กล้อง', 0),
(144, 39, 'Lenses', 'เลนส์', 0),
(145, 39, 'Other Accessories', 'อุปกรณ์เสริมอื่น ๆ', 0),
(146, 40, 'Games and Entertainment', 'เกมและความบันเทิง', 0),
(147, 41, 'Fridges', 'ตู้เย็น', 0),
(148, 41, 'Washing Machines', 'เครื่องซักผ้า', 0),
(149, 41, 'AC', 'ไฟฟ้ากระแสสลับ', 0),
(150, 18, 'Triumph', 'triumph', 1);

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
(2, 12345, 4, 6, 6, 'Ut enim ad minima veniam, quis nostrum exercitationem.', 1, 0, '2020-01-28 22:14:18'),
(3, 12345, 4, 6, 5, 'This is my testing message', 1, 0, '2020-02-15 23:12:07'),
(4, 1234, 1, 6, 5, 'ld fjasldjk flskdjflkjs\'df', 1, 0, '2020-02-15 23:15:30'),
(5, 12345, 4, 6, 5, 'sdk flskdflsdfj', 1, 0, '2020-02-16 16:51:53'),
(6, 12345, 4, 6, 5, 'sdjfl sjl fsdfwoefj lskdfj', 1, 0, '2020-02-16 16:54:48'),
(7, 12345, 4, 5, 6, 'slkdj flsjd fkls', 1, 0, '2020-02-16 16:55:26'),
(8, 12345, 4, 5, 6, 'djf owiflsk jdfow fkls oiw', 1, 0, '2020-02-16 17:02:43'),
(9, 12345, 4, 6, 5, 'jf owfsoiwejs djfoiwjefjsfojiw oe ', 1, 0, '2020-02-16 17:05:25'),
(10, 12345, 4, 6, 5, 'mg jgj hg ', 1, 0, '2020-02-18 10:37:50'),
(23, 31, 3, 1, 6, 'hi', 1, 0, '2020-03-16 13:12:52'),
(24, 31, 3, 1, 6, 'helloo', 1, 0, '2020-03-16 13:14:45'),
(26, 31, 3, 1, 6, 'fine', 1, 0, '2020-03-16 13:19:32'),
(27, 31, 3, 1, 6, 'and u', 1, 0, '2020-03-16 13:20:16'),
(28, 31, 3, 6, 1, 'me 2', 1, 0, '2020-03-16 13:20:27'),
(30, 11, 1, 1, 5, 'hellooooooooo', 1, 0, '2020-03-16 15:02:09'),
(31, 11, 1, 1, 5, 'hellooooooooo hellooooooooo hellooooooooo hellooooooooo hellooooooooo hellooooooooo', 1, 0, '2020-03-16 15:02:27'),
(32, 101, 10, 1, 6, 'helloo', 1, 0, '2020-03-16 15:31:26'),
(33, 0, 31, 1, 6, 'i am fine', 1, 0, '2020-03-22 14:06:53'),
(34, 0, 1, 6, 5, 'hi', 1, 0, '2020-03-30 19:39:20'),
(35, 0, 1, 6, 5, 'hi', 1, 0, '2020-03-30 19:41:20'),
(36, 0, 1, 6, 5, 'hi', 1, 0, '2020-03-30 19:41:45'),
(37, 0, 1, 6, 5, 'hi', 1, 0, '2020-03-30 19:44:37'),
(38, 0, 1, 6, 5, 'helloo', 1, 0, '2020-03-30 19:50:42'),
(39, 0, 1, 6, 5, 'helloo', 1, 0, '2020-03-30 19:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `thai_cms`
--

CREATE TABLE `thai_cms` (
  `type` varchar(50) NOT NULL,
  `content_en` text DEFAULT NULL,
  `content_th` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_cms`
--

INSERT INTO `thai_cms` (`type`, `content_en`, `content_th`) VALUES
('aboutus', '<h1>About Us</h1>\r\n<p>This is our About Us page</p>', '<h1>เกี่ยวกับเรา</h1>\r\n\r\n<p>นี่คือหน้าเกี่ยวกับเรา</p>'),
('privacy_policy', '<h1>Privacy Policy</h1>\r\n<p>This is our privacy policy page</p>', '<h1>นโยบายความเป็นส่วนตัว</h1>\r\n<p>นี่คือหน้านโยบายความเป็นส่วนตัวของเรา</p>'),
('terms_and_conditions', '<h1>Terms and Conditions</h1>\r\n<p>This is our terms and conditions page</p>', '<h1>ข้อกำหนดและเงื่อนไข</h1>\r\n<p>นี่คือหน้าข้อกำหนดในการให้บริการของเรา</p>'),
('top_offers', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum เป็นเพียงตัวอย่างของอุตสาหกรรมการพิมพ์และการเรียงพิมพ์');

-- --------------------------------------------------------

--
-- Table structure for table `thai_coupon`
--

CREATE TABLE `thai_coupon` (
  `id` int(11) NOT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `category` int(10) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(10) NOT NULL DEFAULT 1,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_coupon`
--

INSERT INTO `thai_coupon` (`id`, `title_en`, `title_th`, `code`, `price`, `expiry_date`, `category`, `created_date`, `status`, `trash`) VALUES
(1, 'gold', 'ทอง', 'th1245', 125, '2020-04-08', 31, '2020-03-31 13:51:42', 1, 0),
(2, 'gold', 'ทอง', 'th124', 2, '2020-04-09', 1, '2020-03-31 14:05:56', 1, 0),
(3, 'silver', 'สีเงิน', 'th1122', 3, '2020-04-10', 3, '2020-03-31 18:54:32', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_coupon_used`
--

CREATE TABLE `thai_coupon_used` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `coupon_id` int(10) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_coupon_used`
--

INSERT INTO `thai_coupon_used` (`id`, `user_id`, `coupon_id`, `created_date`) VALUES
(5, 6, 2, '2020-03-31 15:38:43'),
(6, 6, 1, '2020-03-31 15:51:38'),
(7, 6, 3, '2020-03-31 15:55:10');

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
  `title_en` varchar(500) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_th` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trash` int(2) NOT NULL DEFAULT 0,
  `status` int(2) NOT NULL DEFAULT 1,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_faq`
--

INSERT INTO `thai_faq` (`id`, `title_en`, `title_th`, `description_en`, `description_th`, `trash`, `status`, `creation_date`) VALUES
(1, 'Simply dummy text of the printing', 'ข้อความที่เรียบง่ายของการพิมพ์', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum เป็นเพียงตัวอย่างของอุตสาหกรรมการพิมพ์และการเรียงพิมพ์', 0, 1, '2020-01-10 09:59:51'),
(2, 'What is faq ?', 'คำถามที่พบบ่อยคืออะไร', 'FAQ means frequently asked questions', 'คำถามที่พบบ่อยหมายถึงคำถามที่ถามบ่อย', 0, 1, '2020-01-10 10:02:56'),
(3, 'simply dummy text of the printing', 'ข้อความที่เรียบง่ายของการพิมพ์', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum เป็นเพียงตัวอย่างของอุตสาหกรรมการพิมพ์และการเรียงพิมพ์', 0, 1, '2020-01-10 11:37:48'),
(4, 'Dummy text', 'ตัวจำลองข้อความ', 'Lorem Ipsum องเป็นเพียงทอนครับข้อความของการพิมพ์และ typesetting นอุตสาหกรรม', 'Lorem Ipsum เป็นเพียงตัวอย่างของอุตสาหกรรมการพิมพ์และการเรียงพิมพ์', 0, 0, '2020-01-10 12:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `thai_news`
--

CREATE TABLE `thai_news` (
  `id` int(11) NOT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_th` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description_en` text NOT NULL,
  `description_th` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `tags_en` varchar(100) DEFAULT NULL,
  `tags_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `meta_description_en` varchar(100) DEFAULT NULL,
  `meta_description_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_news`
--

INSERT INTO `thai_news` (`id`, `title_en`, `title_th`, `description_en`, `description_th`, `img`, `status`, `trash`, `created_date`, `tags_en`, `tags_th`, `meta_description_en`, `meta_description_th`) VALUES
(1, 'Holiday Shopping Is Here, and Mostly on Our Mobile Devices', 'วันหยุดช้อปปิ้งอยู่ที่นี่และส่วนใหญ่ของเราเคลื่อนที่อุปกรณ์', 'When we think of Black Friday, we often picture people lining up outside stores at the crack of dawn, trampling each other in pursuit of a discounted television. For this holiday-shopping season, anchored by both Black Friday and Cyber Monday, more shoppers than ever will be staying at home and turning to their phones. ', 'ตอนที่เราคิดว่าจานสีดำวันศุกร์เรามักจะถ่ายรูปคนพวกนั้นคงจะเข้าแถวมาข้างนอกร้านขายที่ร้านของรุ่งอรุณ trampling กันและกันตามของ discounted งออกโทรทัศน์ เรื่องนี้วันหยุดของ-ซื้อของฤดูกาล,anchored โดยทั้งสองดำวันศุกร์และอาชญากรรมไซเบอร์วันจันทร์มากก shoppers กว่าที่จะอยู่ที่บ้านและเปลี่ยนไปใช้โทรศัพท์ ', 'blog1.png', 1, 0, '2020-02-10 00:08:06', 'sale', 'ขาย', 'best sale website', 'ที่ดีที่สุดที่เว็บไซต์ของการขาย'),
(2, 'Holiday Shopping Is Here, and Mostly on Our Mobile Devices', 'การช็อปปิ้งในวันหยุดอยู่ที่นี่และส่วนใหญ่บนอุปกรณ์มือถือของเรา', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo', 'อยู่ภายใต้มุมมองที่ผิดข้อผิดพลาดเกี่ยวกับการตั้งค่าการเรียกเก็บเงินค่าความเสียหาย, ค่าใช้จ่ายทั้งหมด, ค่าใช้จ่ายต่ำสุด, การตรวจสอบการสร้างและการตรวจสอบสถาปัตยกรรมแบบเสมือนจริง', 'blog2.png', 1, 0, '2020-02-10 00:32:28', NULL, NULL, NULL, NULL),
(3, 'No plugs needed: How wireless charging could set electric cars free  ', 'ไม่จำเป็นต้องใช้ปลั๊ก: การชาร์จแบบไร้สายสามารถทำให้รถยนต์ไฟฟ้ามีอิสระได้อย่างไร', 'ELECTRIC cars have several advantages over gas guzzlers, but having to plug them in every day isn’t one of them. The good news is that you may not need to – all electric cars could soon come with wireless chargers.“I won’t buy a car I have to plug in again,” says engineer Olaf Simon, who organised a trial of wireless charging in Berlin, Germany. ', 'รถยนต์ไฟฟ้ามีข้อได้เปรียบหลายอย่างเกี่ยวกับผู้ซัดแก๊ส แต่การเสียบปลั๊กทุกวันไม่ใช่หนึ่งในนั้น ข่าวดีก็คือคุณอาจไม่จำเป็นต้อง - รถยนต์ไฟฟ้าทุกคันจะมาพร้อมกับเครื่องชาร์จไร้สายในไม่ช้า \"ฉันจะไม่ซื้อรถยนต์ที่ฉันต้องเสียบอีกครั้ง\" วิศวกร Olaf Simon ผู้จัดทดลองการชาร์จไร้สายกล่าว กรุงเบอร์ลินประเทศเยอรมนี', 'blog3.png', 1, 0, '2020-02-10 00:33:27', NULL, NULL, NULL, NULL);

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
-- Table structure for table `thai_package_user`
--

CREATE TABLE `thai_package_user` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `package_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `post_ads` int(10) DEFAULT NULL,
  `bump_up` int(10) DEFAULT NULL,
  `social_media_ads` int(10) DEFAULT NULL,
  `feature_ads` int(10) DEFAULT NULL,
  `expiry_days` int(10) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(10) DEFAULT 1,
  `trash` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_package_user`
--

INSERT INTO `thai_package_user` (`id`, `user_id`, `package_id`, `category_id`, `post_ads`, `bump_up`, `social_media_ads`, `feature_ads`, `expiry_days`, `purchase_date`, `created_date`, `status`, `trash`) VALUES
(1, 6, 1, 31, 13, 11, 132, 110, 12, '2020-03-31 15:52:02', '2020-03-30 18:59:52', 1, 0),
(3, 6, 2, 3, 40, 12, 40, 48, 25, '2020-03-31 15:55:40', '2020-03-30 19:13:22', 1, 0),
(6, 6, 3, 1, 60, 80, 20, 10, 25, '2020-03-31 15:39:05', '2020-03-31 18:38:43', 1, 0);

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
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '0 = Pending, 1 = Active, 2 = Sold, 3 = Expired',
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
  `bedrooms` int(10) DEFAULT NULL,
  `bathrooms` int(10) DEFAULT NULL,
  `kitchens` int(10) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `sort_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) DEFAULT 0,
  `tags_en` varchar(100) DEFAULT NULL,
  `tags_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `meta_description_en` varchar(100) DEFAULT NULL,
  `meta_description_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_products`
--

INSERT INTO `thai_products` (`id`, `category_id`, `subcategory_id`, `user_id`, `title_en`, `title_th`, `description_en`, `description_th`, `status`, `trash`, `created_date`, `price`, `location`, `type`, `ad_type`, `submodel`, `model`, `brand`, `year_registration`, `driven`, `fuel_type`, `gearbox`, `features`, `featured`, `bedrooms`, `bathrooms`, `kitchens`, `latitude`, `longitude`, `sort_date`, `views`, `tags_en`, `tags_th`, `meta_description_en`, `meta_description_th`) VALUES
(1, 16, 18, 5, 'New Tesla5 for sale', 'ใหม่ Tesla5 สำหรับขาย', 'Test Drive First.New Tesla for sale is available', 'ทดสอบขับรถก่อนใหม่ Tesla สำหรับการขายอยู่', 1, 0, '2020-02-05 17:53:35', 800, 'Berlin, Germany', 'Audi', 0, NULL, 'SUV', 'Mercedes', 2020, 11, 'Gasoline', 'vbn', '1-3', 1, NULL, NULL, NULL, '51.58250734077006', '-1.4598505851562549', '2020-03-09 17:53:54', 133, NULL, NULL, NULL, NULL),
(2, 2, 8, 6, 'Full Stack Developer', 'เต็มไปด้วตั้งผู้พัฒนา', 'We are looking to hire urgently developer.The candidate must have Web Application Design and implementation. Work closely with Mobile App developers. Design and implement front-end and back-end of web dashboard for mobile', 'เรากำลังมองหาเพื่อจ้าง urgently อะไร-หุบปากไว้ดีกว่าผู้ลงสมัครคงต้องเว็บโปรแกรมออกแบบและ implementation. ทำงานใกล้ชิดกับเคลื่อนที่ลุ่มผู้พัฒนาโปรแกร. ออกแบบและเตรียมกำหน้า-สิ้นสุดแล้วกลับมา-สิ้นสุดของเว็บแดชบอร์ดสำหรับเคลื่อนที่', 1, 0, '2020-02-05 17:55:02', 750, 'Office#7, anchorage, Alaska', 'Urgent ', 0, NULL, '', 'Issac\\\'s Code', 2016, 0, '', '', '', 1, NULL, NULL, NULL, '', '', '2020-03-09 17:53:54', 53, NULL, NULL, NULL, NULL),
(3, 1, 7, 6, ' Multi Color Solar Light Pots for outdoor Garden', ' หลายของสีแสงสว่างสุริยะจักรวาลหม้อสำหรับสุนัขไม่มีสัญญาณกันขโมยและสวน', 'These plants pots are in multi color with solar light embedded.Best pots for your Outdoor garden', 'พวกต้นไม้หม้ออยู่ในหลายสีกับแสงสว่างสุริยะจักรวาลที่ฝังแนบ.ที่ดีที่สุดที่หม้อสำหรับคุณสุนัขไม่มีสัญญาณกันขโมยและสวน', 1, 0, '2020-02-10 07:24:22', 350, '25 notting hill, Anchorage, Alaska', '', 0, NULL, '', '', 0000, 0, '', '', '', 1, NULL, NULL, NULL, '', '', '2020-03-09 17:53:54', 133, NULL, NULL, NULL, NULL),
(4, 24, 25, 8, 'Puppy for sale', NULL, 'Its Half breed german shephard puppy for sale', NULL, 1, 0, '2020-02-10 13:45:07', 150, 'rawalpindi', 'rent', 0, NULL, 'Half-Breed small size ', 'Half Breed German Shephard', 2000, 0, '', '', '', 1, NULL, NULL, NULL, '	33.738045', '	73.084488', '2020-03-09 17:53:54', 13, NULL, NULL, NULL, NULL),
(5, 24, 25, 5, 'Fully Automatic Washing Machinw', NULL, '- 10 Year Motor Warranty, - Fully Automatic Washing Machine, - Anti Bacterial Wash, - One way wash', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-02-10 13:57:43', 500, 'Berlin, Germany', '', 0, NULL, ' HWM 85-826', 'Haier', 0000, 0, '', '', 'NO', 1, NULL, NULL, NULL, '', '', '2020-03-09 17:53:54', 15, NULL, NULL, NULL, NULL),
(6, 24, 26, 6, 'Khan Hut', 'Khan กระท่อม', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'Ut enim โฆษณา minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip องแฟนเก่า ea commodo consequat. Duis aute irure dolor ใน reprehenderit ใน voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2, 0, '2020-02-16 17:16:46', 40000, 'London, UK', 'rent', 0, NULL, '', '', 2013, 0, '', '', 'Lot of benefits', 0, NULL, NULL, NULL, '51.58250734077006', '-0.09754589765625488', '2020-03-09 17:53:54', 5, NULL, NULL, NULL, NULL),
(7, 24, 26, 6, 'Old Buddies', 'เพื่อนเก่า', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', 'Sed ut perspiciatis unde omnis iste natus เกิดข้อผิดพลาดนั่ง voluptatem accusantium doloremque laudantium,totam rem aperiam,eaque ipsa quae เกี่ illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ', 2, 0, '2020-02-16 17:37:41', 3000, 'North Wessex', 'buy', 0, NULL, '', '', 0000, 0, '', '', '', 0, NULL, NULL, NULL, '51.483411449684205', '-1.4598505851562549', '2020-03-09 17:53:54', 2, NULL, NULL, NULL, NULL),
(8, 2, 11, 6, 'testing for langauage', NULL, 'hello i am fine how are you\r\nhow are you\r\n\r\n', 'สวัสดีฉันสบายดีฉันสบายดีคุณเป็นยังไงบ้าง\r\nคุณเป็นยังไงบ้าง\r\n\r\n', 1, 0, '2020-03-09 13:20:27', 36, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Full-Time', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, '51.5073509', '-0.1277583', '2020-03-09 18:20:27', 11, NULL, NULL, NULL, NULL),
(9, 2, 13, 6, 'jobs needes', NULL, 'jobs are required', 'ทำงานต้องการ', 1, 0, '2020-03-10 07:11:59', 20000, 'Streatham, London, UK', 'Full-Time', 0, '', '', '', 0000, 0, '', NULL, '', 0, NULL, NULL, NULL, '51.5073509', '-0.1277583', '2020-03-10 12:11:59', 1, NULL, NULL, NULL, NULL),
(10, 24, 27, 6, 'House', NULL, 'house for rent', 'บ้านสำหรับค่าเช่า', 1, 0, '2020-03-10 08:05:15', 4334, 'Tate Modern, Bankside, London, UK', 'Rent', 0, '', '', '', 0000, 0, '', NULL, '', 0, NULL, NULL, NULL, '51.50759530000001', '-0.09935640000000001', '2020-03-10 13:05:15', 18, NULL, NULL, NULL, NULL),
(11, 16, 18, 6, 'Car for sale urgent', 'รถขายด่วน', 'urgent car sale in low price', 'เร่งด่วนรถขายในราคาต่ำ', 1, 0, '2020-03-10 08:15:50', 5678, 'Reading, UK', 'Avanti', 0, 'CL Models (4)', 'Pick Up', 'civic', 2018, 2500005, '2', NULL, '2::3', 0, 0, 0, 0, '51.5073509', '-0.1277583', '2020-03-10 13:15:50', 99, 'default', 'ค่าปริยาย', NULL, NULL),
(27, 24, 27, 6, 'ggg', NULL, 'ree', 'ree', 1, 0, '2020-03-12 06:34:56', 53, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Rent', 0, '', '', '', 0000, 0, '', NULL, '', 0, NULL, NULL, NULL, '51.5073509', '-0.1277583', '2020-03-12 11:34:56', 0, NULL, NULL, NULL, NULL),
(29, 16, 18, 6, 'checking', 'ตรวจ', 'send', 'ส่ง', 1, 0, '2020-03-12 13:59:18', 5545, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Audi', 0, 'MDX', 'Pick Up', '', 0000, 0, '', '', '', 0, NULL, NULL, NULL, '51.1536621', '-0.1820629', '2020-03-12 18:59:18', 9, NULL, NULL, NULL, NULL),
(30, 24, 27, 6, 'new house', 'บ้านใหม่', 'brand new house for sale', 'แบรนด์ใหม่บ้านสำหรับขาย', 1, 0, '2020-03-19 06:24:39', 555, 'Gatwick Airport, LGW (LGW), Horley, Gatwick, UK', 'Sale', 0, '', '', '', 0000, 0, '', NULL, '', 0, NULL, NULL, NULL, '51.1536621', '-0.1820629', '2020-03-27 12:41:44', 3, 'house,sale', 'บ้านหลังขาย', NULL, NULL),
(31, 24, 28, 6, 'shops in market now for sale', 'ร้านค้าในตลาดตอนนี้สำหรับขาย', 'shop for sale', 'ร้านขาย', 1, 0, '2020-03-19 10:34:27', 456581, 'Jermyn Street, London, UK', 'Sale', 0, '', '', '', 0000, 0, '', '', '', 0, 3, 2, 5, '51.5073509', '-0.1277583', '2020-03-27 12:39:21', 10, 'shops', 'ออกร้าน', NULL, NULL),
(35, 1, 6, 6, 'seconde hand', 'seconde มือ', 'seconde', 'seconde', 0, 0, '2020-03-31 07:19:43', 1254, 'John Radcliffe Hospital, Headley Way, Headington, Oxford, UK', '5', 0, '', '', '', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, '51.5073509', '-0.1277583', '2020-03-31 12:19:43', 0, 'hhjj', 'hhjj', NULL, NULL);

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
(40, 6, 4);

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
(37, 29, '202003121459181422.jpg', NULL, NULL, 1, 0),
(38, 30, '202003190724396296.jpg', NULL, NULL, 1, 0),
(39, 31, '202003191134279341.jpg', 'home', 'sweet home', 0, 0),
(40, 27, '202003191357348593.png', '', '', 1, 0),
(41, 8, '202003191424088960.png', NULL, NULL, 0, 0),
(42, 8, '202003191427058827.jpg', '', '', 1, 0),
(43, 31, '202003201137154536.jpg', NULL, NULL, 0, 1),
(44, 31, '202003201216297603.jpg', NULL, NULL, 0, 0),
(45, 31, '202003201219064899.jpg', NULL, NULL, 0, 0),
(46, 31, '202003201220191540.jpg', '', '', 1, 0),
(47, 32, '202003310911487013.jpg', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_settings`
--

CREATE TABLE `thai_settings` (
  `id` int(11) NOT NULL,
  `option_name` varchar(100) NOT NULL,
  `value_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_settings`
--

INSERT INTO `thai_settings` (`id`, `option_name`, `value_name`) VALUES
(1, 'site title', 'SALE THAILAND'),
(2, 'show records', '30'),
(18, 'top offers', '2020-04-05'),
(19, 'meta tags en', 'sell online,buy vehicle,house for rent, dog for sale'),
(20, 'meta tags th', 'ขายออนไลน์, ซื้อยานพาหนะ, บ้านให้เช่า, ขายสุนัข'),
(21, 'meta description en', 'a place where to sell and buy pets, vehicle,house,apartments etc.'),
(22, 'meta description th', 'สถานที่ที่จะขายและซื้อสัตว์เลี้ยงยานพาหนะบ้านอพาร์ทเมนท์ ฯลฯ');

-- --------------------------------------------------------

--
-- Table structure for table `thai_subscribe`
--

CREATE TABLE `thai_subscribe` (
  `id` int(100) NOT NULL,
  `email` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_subscribe`
--

INSERT INTO `thai_subscribe` (`id`, `email`) VALUES
(1, 'test@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `thai_users`
--

CREATE TABLE `thai_users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `zip` int(40) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_intro` text DEFAULT NULL,
  `post_ads` int(11) NOT NULL DEFAULT 0,
  `bump_up` int(11) NOT NULL DEFAULT 0,
  `package_id` int(11) NOT NULL DEFAULT 0,
  `package_date` datetime DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '0=user, 1=partner',
  `login` int(11) NOT NULL DEFAULT 0 COMMENT '0=logout, 1=login',
  `login_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_users`
--

INSERT INTO `thai_users` (`id`, `name`, `phone`, `email`, `password`, `img`, `status`, `zip`, `state`, `city`, `address`, `user_intro`, `post_ads`, `bump_up`, `package_id`, `package_date`, `trash`, `created_date`, `type`, `login`, `login_time`) VALUES
(1, 'thaitravel', NULL, 'user@softwaresbuilder.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, 39, 12, 0, NULL, 0, '2020-03-13 12:24:06', 0, 0, '2020-03-22 10:06:06'),
(2, 'username.msc', '1221212', 'username.msc@gmail.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, -1, 1, 0, NULL, 0, '2020-03-13 12:24:06', 1, 0, '2020-03-13 05:24:06'),
(4, 'info', '555555555', 'info@royal-sea.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, -1, 1, 0, NULL, 0, '2020-03-13 12:24:06', 1, 0, '2020-03-13 05:24:06'),
(5, 'moshene1', '1234556', 'phprocks4web@gmail.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, -1, 0, 0, NULL, 0, '2020-03-13 12:24:06', 1, 0, '2020-03-10 09:14:11'),
(6, 'phprocks4web', '+9444785-6666', 'vender@softwaresbuilder.com', 'MTIzNDU=', '202003191353405067.jpg', 1, 778855, 'yyy', 'xx', 'xyz', NULL, 7, 3, 2, NULL, 0, '2020-03-13 12:24:06', 1, 1, '2020-03-27 14:11:54'),
(7, 'themepair', '012345678', 'themepair@gmail.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, -1, 1, 0, NULL, 0, '2020-03-13 12:24:06', 1, 0, '2020-03-13 05:24:06'),
(8, 'ishrarkhan1984', '9899920712', 'ishrarkhan1984@gmail.com', 'MTIzNDU=', NULL, 1, NULL, NULL, NULL, NULL, NULL, -1, 1, 0, NULL, 0, '2020-03-13 12:24:06', 1, 0, '2020-03-13 05:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `thai_vendor_packages`
--

CREATE TABLE `thai_vendor_packages` (
  `id` int(11) NOT NULL,
  `title_en` varchar(20) DEFAULT NULL,
  `title_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `category` varchar(100) DEFAULT NULL,
  `post_ads` int(11) NOT NULL DEFAULT 0,
  `bump_up` int(11) NOT NULL DEFAULT 0,
  `social_media_ads` varchar(100) DEFAULT NULL,
  `feature_ads` varchar(100) DEFAULT NULL,
  `expiry_days` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_vendor_packages`
--

INSERT INTO `thai_vendor_packages` (`id`, `title_en`, `title_th`, `price`, `category`, `post_ads`, `bump_up`, `social_media_ads`, `feature_ads`, `expiry_days`, `status`, `trash`, `created_date`) VALUES
(1, 'Free', 'ฟรี', 1, '31', 3, 1, '12', '10', '12', 1, 0, '2020-02-16 17:49:30'),
(2, 'Silver', 'สีเงิน', 10, '3', 10, 3, '10', '12', '25', 1, 0, '2020-02-16 17:49:30'),
(3, 'Gold', 'ทอง', 15, '1', 30, 40, '10', '5', '25', 1, 0, '2020-03-18 13:27:16'),
(5, 'fdf', 'fdf', 4, '3', 4, 4, '44', '4', '4', 1, 1, '2020-03-31 13:56:27');

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
-- Indexes for table `thai_coupon`
--
ALTER TABLE `thai_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thai_coupon_used`
--
ALTER TABLE `thai_coupon_used`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `thai_package_user`
--
ALTER TABLE `thai_package_user`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `thai_categories`
--
ALTER TABLE `thai_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `thai_category_features`
--
ALTER TABLE `thai_category_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `thai_category_models`
--
ALTER TABLE `thai_category_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `thai_category_submodels`
--
ALTER TABLE `thai_category_submodels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1318;

--
-- AUTO_INCREMENT for table `thai_category_types`
--
ALTER TABLE `thai_category_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `thai_chat`
--
ALTER TABLE `thai_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `thai_coupon`
--
ALTER TABLE `thai_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thai_coupon_used`
--
ALTER TABLE `thai_coupon_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `thai_package_user`
--
ALTER TABLE `thai_package_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thai_products`
--
ALTER TABLE `thai_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `thai_product_favorites`
--
ALTER TABLE `thai_product_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `thai_product_images`
--
ALTER TABLE `thai_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `thai_settings`
--
ALTER TABLE `thai_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `thai_subscribe`
--
ALTER TABLE `thai_subscribe`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `thai_users`
--
ALTER TABLE `thai_users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4857;

--
-- AUTO_INCREMENT for table `thai_vendor_packages`
--
ALTER TABLE `thai_vendor_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
