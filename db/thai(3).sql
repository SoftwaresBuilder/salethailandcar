-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 12:48 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

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

DROP TABLE IF EXISTS `thai_admin`;
CREATE TABLE `thai_admin` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_admin`
--

INSERT INTO `thai_admin` (`id`, `fname`, `lname`, `email`, `password`, `status`, `trash`) VALUES
(1, 'Super', 'Admin', 'admin@thai.com', 'MTIzNDU=', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_bidding`
--

DROP TABLE IF EXISTS `thai_bidding`;
CREATE TABLE `thai_bidding` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidder_id` int(10) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(10) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thai_categories`
--

DROP TABLE IF EXISTS `thai_categories`;
CREATE TABLE `thai_categories` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_name` varchar(20) DEFAULT NULL,
  `banner_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_categories`
--

INSERT INTO `thai_categories` (`id`, `pid`, `title`, `description`, `status`, `trash`, `created_date`, `card_name`, `banner_name`) VALUES
(1, 0, 'Second Hand', 'Looking for second hand stuff', 1, 0, '2020-02-05 17:08:53', 'card_job', NULL),
(2, 0, 'Jobs', 'Find relevant jobs in town', 1, 0, '2020-02-05 17:08:53', 'card_job', 'banner_jobs'),
(3, 0, 'Pets', 'Its one of best place to find cute pets here', 1, 0, '2020-02-05 17:29:58', 'card_job', NULL),
(4, 1, 'Sofa And Dining', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 1, 0, '2020-02-08 15:42:33', '', NULL),
(5, 1, 'Other Household Items', '', 1, 0, '2020-02-08 15:45:48', '', NULL),
(6, 1, 'Beds And Wardrobes', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione', 1, 0, '2020-02-08 15:48:33', '', NULL),
(7, 1, 'Home Decor and Garden', 'Create the perfect front yard and backyard landscapes with our gardening tips. We\\\'ll tell you about beautiful annual, perennial, bulb, and rose flowers, as well as trees, shrubs, and groundcovers that put on a year-round gardening show.', 1, 0, '2020-02-10 10:10:32', NULL, NULL),
(8, 2, 'IT and Computer Jobs', 'Find IT and Computer related jobs  in town', 1, 0, '2020-02-10 10:28:45', NULL, NULL),
(9, 2, 'Sales and Marketing', 'Find Sales and Marketing related jobs  in town', 1, 0, '2020-02-10 10:33:49', NULL, NULL),
(10, 2, 'Hotels and Tourism', 'Find best Hotel and Tourism services in town', 1, 0, '2020-02-10 10:41:52', NULL, NULL),
(11, 2, 'Accounting and Finance', 'Get Accounting and Finance', 1, 0, '2020-02-10 10:45:01', NULL, NULL),
(12, 2, 'Advertising and PR', 'Find Advertising and PR jobs here', 1, 0, '2020-02-10 10:46:16', NULL, NULL),
(13, 2, 'Human Resources', 'Hire Human Resources here', 1, 0, '2020-02-10 10:46:48', NULL, NULL),
(14, 3, 'Cat', 'here you can find cute cats ', 1, 0, '2020-02-10 10:49:21', NULL, NULL),
(15, 3, 'Rabbit', 'Searching for innocent animal rabbit', 1, 0, '2020-02-10 10:50:19', NULL, NULL),
(16, 0, 'Vehicle', 'here are best vehicles and related stuff', 1, 0, '2020-02-10 10:58:58', 'card_car', 'banner_vehicle'),
(18, 16, 'Cars', 'Find latest Cars here', 1, 0, '2020-02-10 11:05:23', NULL, NULL),
(19, 16, 'Spare Parts', 'get old and new spare parts here', 1, 0, '2020-02-10 11:06:04', NULL, NULL),
(20, 16, 'Commercial Vehicles', 'Get Commercial Vehicles here', 1, 0, '2020-02-10 11:07:33', NULL, NULL),
(21, 16, 'Other Vehicles', 'Find other vehicles here', 1, 0, '2020-02-10 11:08:47', NULL, NULL),
(22, 16, 'Scooter', 'Get Scooters here', 1, 0, '2020-02-10 11:09:16', NULL, NULL),
(23, 16, 'Bicycles', 'Get your bicycles here', 1, 0, '2020-02-10 11:09:50', NULL, NULL),
(24, 0, 'Real Estate', 'Find real estate related sub categories here', 1, 0, '2020-02-10 11:11:02', 'card_real_state', 'banner_real_state'),
(25, 24, 'Land and Plots', 'Find Land and Plots here', 1, 0, '2020-02-10 11:13:08', NULL, NULL),
(26, 24, 'Apartments', 'Get your apartments here', 1, 0, '2020-02-10 11:14:07', NULL, NULL),
(27, 24, 'House', 'Search for house here', 1, 0, '2020-02-10 11:14:58', NULL, NULL),
(28, 24, 'Shops and Offices Commercial Space', 'Find your Shops and Offices Commercial Space here', 1, 0, '2020-02-10 11:17:04', NULL, NULL),
(29, 24, 'PG and Roommates', 'PG and Roommates', 1, 0, '2020-02-10 11:17:52', NULL, NULL),
(30, 24, 'Vacation Rentals and Guest Houses', 'Looking for Vacation Rentals and Guest Houses', 1, 0, '2020-02-10 11:19:40', NULL, NULL),
(31, 0, 'Fashion', 'Get latest Fashion here', 1, 0, '2020-02-10 11:21:33', 'card_job', NULL),
(32, 31, 'Accessories', 'Get Quality Accessories here', 1, 0, '2020-02-10 11:47:36', NULL, NULL),
(33, 31, 'Clothes', 'Grab Nice Clothing here', 1, 0, '2020-02-10 11:48:38', NULL, NULL),
(34, 31, 'Footwear', 'Get your comfortable  and cozy Footwear here', 1, 0, '2020-02-10 11:49:26', NULL, NULL),
(35, 0, 'Electronics Goods', 'Grab for you some Qualitative electronic goods', 1, 0, '2020-02-10 11:50:39', 'card_job', NULL),
(36, 35, 'Computers and Accessories', 'Looking  for latest and old Computers and Accessories', 1, 0, '2020-02-10 11:53:06', NULL, NULL),
(37, 35, 'Kitchen and Other Appliances', 'Looking for Stylish  Kitchen and Other Appliances', 1, 0, '2020-02-10 11:54:22', NULL, NULL),
(38, 35, 'TV Video and Audio', 'Searching for TV Video and Audio', 1, 0, '2020-02-10 11:55:34', NULL, NULL),
(39, 35, 'Cameras and Accessories', 'Need Latest Cameras and Accessories?', 1, 0, '2020-02-10 11:56:14', NULL, NULL),
(40, 35, 'Games and Entertainment', 'Badly looking for Games and Entertainment ', 1, 0, '2020-02-10 11:57:48', NULL, NULL),
(41, 35, 'Fridge AC and Washing Machine', 'Searching for Fridge AC and Washing Machine??', 1, 0, '2020-02-10 12:01:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_features`
--

DROP TABLE IF EXISTS `thai_category_features`;
CREATE TABLE `thai_category_features` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_features`
--

INSERT INTO `thai_category_features` (`id`, `category_id`, `title`) VALUES
(1, 18, 'Air conditionar'),
(2, 18, 'Music System'),
(3, 18, 'GPS'),
(5, 18, 'Security System'),
(6, 18, 'Parking Sensor'),
(7, 18, 'Parking Camera'),
(8, 18, 'Stepney'),
(9, 18, 'Jack'),
(10, 18, 'Auto Gear'),
(11, 18, 'Fog Lamo'),
(12, 18, 'ABS'),
(13, 18, 'Air Bags'),
(14, 22, 'Speedometer'),
(15, 22, 'Fuel Guage'),
(16, 22, 'Digital Fuel Guage'),
(17, 22, 'Electric Start'),
(18, 22, 'Tachometer'),
(19, 22, 'Low Fuel Indicator'),
(20, 22, 'Low Oil Indicator'),
(21, 22, 'Low Battery Indicato'),
(22, 22, 'Battery'),
(23, 22, 'Pass Light');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_models`
--

DROP TABLE IF EXISTS `thai_category_models`;
CREATE TABLE `thai_category_models` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_models`
--

INSERT INTO `thai_category_models` (`id`, `category_id`, `title`) VALUES
(1, 18, 'SUV'),
(2, 18, 'MPV'),
(3, 18, 'Pick Up'),
(4, 18, 'Seaden'),
(5, 18, 'Hatchback'),
(6, 18, 'Sport'),
(7, 22, 'Big Scooter'),
(8, 22, 'Chooper'),
(9, 22, 'Moto Cross'),
(10, 22, 'Naked Bike'),
(11, 22, 'Sports'),
(12, 22, 'Touring');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_submodels`
--

DROP TABLE IF EXISTS `thai_category_submodels`;
CREATE TABLE `thai_category_submodels` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_submodels`
--

INSERT INTO `thai_category_submodels` (`id`, `type_id`, `title`) VALUES
(1, 27, 'CL Models (4)'),
(2, 27, '-2.2CL'),
(3, 27, '-2.3CL'),
(4, 27, '-3.0CL'),
(5, 27, '-3.2CL'),
(6, 27, 'ILX'),
(7, 27, 'Integra'),
(8, 27, 'Legend'),
(9, 27, 'MDX'),
(10, 27, 'NSX'),
(11, 27, 'RDX'),
(12, 27, 'RL Models (2)'),
(13, 27, '-3.5RL'),
(14, 27, '-RL'),
(15, 27, 'RSX'),
(16, 27, 'SLX'),
(17, 27, 'TL Models (3)'),
(18, 27, '-2.5TL'),
(19, 27, '-3.2TL'),
(20, 27, '-TL'),
(21, 27, 'TSX'),
(22, 27, 'Vigor'),
(23, 27, 'ZDX'),
(24, 27, 'Other Accura Models'),
(25, 28, '164'),
(26, 28, '8C Competizione'),
(27, 28, 'GTV-6'),
(28, 28, 'Milano'),
(29, 28, 'Spider'),
(30, 28, 'Other Alfa Romeo Mod'),
(32, 29, 'Alliance'),
(33, 29, 'Concord'),
(34, 29, 'Eagle'),
(35, 29, 'Encore'),
(36, 29, 'Spirit'),
(37, 29, 'Other AMC Models'),
(38, 30, 'DB7'),
(39, 30, 'DB9'),
(40, 30, 'DBS'),
(41, 30, 'Lagonda'),
(42, 30, 'Rapide'),
(43, 30, 'V12 Vantage'),
(44, 30, 'V8 Vantage'),
(45, 30, 'Vanquish'),
(46, 30, 'Virage'),
(47, 30, 'Other Aston Martin M'),
(48, 31, '100'),
(49, 31, '200'),
(50, 31, '4000'),
(51, 31, '5000'),
(52, 31, '80'),
(53, 31, '90'),
(54, 31, 'A4'),
(55, 31, 'A3'),
(56, 31, 'A5'),
(57, 31, 'A6'),
(58, 31, 'A7'),
(59, 31, 'A8'),
(60, 31, 'allroad'),
(61, 31, 'Cabriolet'),
(62, 31, 'Coupe'),
(63, 31, 'Q3'),
(64, 31, 'Q5'),
(65, 31, 'Q7'),
(66, 31, 'Quattro'),
(67, 31, 'R8'),
(68, 31, 'RS 4'),
(69, 31, 'RS 5'),
(70, 31, 'RS 6'),
(71, 31, 'DBS'),
(72, 31, 'S4'),
(73, 31, 'S5'),
(74, 31, 'S6'),
(75, 31, 'S7'),
(76, 31, 'S8'),
(77, 31, 'TT'),
(78, 31, 'TT RS'),
(79, 31, 'V8 Quattro'),
(80, 31, 'TTS'),
(81, 31, 'Other Audi Models'),
(82, 32, 'Convertible'),
(83, 32, 'Coupe'),
(84, 32, 'Sedan'),
(85, 32, 'Other Avanti Models'),
(86, 33, 'Arnage'),
(87, 33, 'Azure'),
(88, 33, 'Brooklands'),
(89, 33, 'Continental'),
(90, 33, 'Corniche'),
(91, 33, 'Eight'),
(92, 33, 'Mulsanne'),
(93, 33, 'Turbo R'),
(94, 33, 'Other Bentley Models'),
(95, 34, '1 Series (3)'),
(96, 34, '- 128i'),
(97, 34, '- 135i'),
(98, 34, '- 135is'),
(99, 34, '3 Series (29)'),
(100, 34, '- 318i'),
(101, 34, '- 318iC'),
(102, 34, '- 318iS'),
(103, 34, '- 318ti'),
(104, 34, '- 320i'),
(105, 34, '- 323ci'),
(106, 34, '- 323i'),
(107, 34, '- 323is'),
(108, 34, '- 323iT'),
(109, 34, '- 325Ci'),
(110, 34, '- 325e'),
(111, 34, '- 325es'),
(112, 34, '- 325i'),
(113, 34, '- 325is'),
(114, 34, '- 325iX'),
(115, 34, '- 325xi'),
(116, 34, '- 328Ci'),
(117, 34, '- 328Ci'),
(118, 34, '- 328i'),
(119, 34, '- 328iS'),
(120, 34, '- 328xi'),
(121, 34, '- 330Ci'),
(122, 34, '- 330i'),
(123, 34, '- 330xi'),
(124, 34, '- 335d'),
(125, 34, '- 335i'),
(126, 34, '- 335is'),
(127, 34, '- 335xi'),
(128, 34, '- ActiveHybrid 3'),
(129, 34, '- 325'),
(130, 34, '5 Series (19)'),
(131, 34, ' - 524td'),
(132, 34, '- 525i'),
(133, 34, '- 525xi'),
(134, 34, '- 528e'),
(135, 34, '- 528i'),
(136, 34, '- 528iT'),
(137, 34, '- 530i'),
(138, 34, '- 530iT'),
(139, 34, '- 530xi'),
(140, 34, '- 533i'),
(141, 34, '- 535i'),
(142, 34, '- 535i Gran Turismo'),
(143, 34, '- 535xi'),
(144, 34, '- 540i'),
(145, 34, '- 545i'),
(146, 34, '- 550i'),
(147, 34, '- 550i Gran Turismo'),
(148, 34, '-ActiveHybrid 5'),
(149, 34, '6 Series (8)'),
(150, 34, '- 633CSi'),
(151, 34, '- 635CSi'),
(152, 34, '- 640i'),
(153, 34, '- 640i Gran Coupe'),
(154, 34, '- 645Ci'),
(155, 34, '- 650i'),
(156, 34, '- 650i Gran Coupe'),
(157, 34, '- L6'),
(158, 34, '7 Series (15)'),
(159, 34, '- 733i'),
(160, 34, '- 735i'),
(161, 34, '- 735iL'),
(162, 34, '- 740i'),
(163, 34, '- 740iL'),
(164, 34, '- 740Li'),
(165, 34, '- 745i'),
(166, 34, '- 745Li'),
(167, 34, '- 750i'),
(168, 34, '- 750iL'),
(169, 34, '- 750Li'),
(170, 34, '- 760i'),
(171, 34, '- 760Li'),
(172, 34, '- ActiveHybrid 7'),
(173, 34, '- Alpina B7'),
(174, 34, '8 Series 4'),
(175, 34, '- 840Ci'),
(176, 34, '- 850Ci'),
(177, 34, '- 850CSi'),
(178, 34, '- 850i'),
(179, 34, 'L Series (1)'),
(180, 34, '- L7'),
(181, 34, '- M Series (8)'),
(182, 34, '- 1 Series M'),
(183, 34, '- M Coupe'),
(184, 34, '- M Roadster'),
(185, 34, '- M3'),
(186, 34, '- M5'),
(187, 34, '- M6'),
(188, 34, '- X5 M'),
(189, 34, '- X6 M'),
(190, 34, 'X Series (5)'),
(191, 34, '- ActiveHybrid X6'),
(192, 34, '- X1'),
(193, 34, '- X3'),
(194, 34, '- X5'),
(195, 34, '- X6'),
(196, 34, 'Z Series (3)'),
(197, 34, '- Z3'),
(198, 34, '- Z4'),
(199, 34, '- Z8'),
(200, 34, 'Other BMW Models'),
(201, 35, 'Century'),
(202, 35, 'Electra '),
(203, 35, 'Enclave'),
(204, 35, 'Encore'),
(205, 35, 'LaCrosse'),
(206, 35, 'Le Sabre'),
(207, 35, 'Lucerne'),
(208, 35, 'Park Avenue'),
(209, 35, 'Rainier'),
(210, 35, 'Reatta'),
(211, 35, 'Regal'),
(212, 35, 'Rendezvous'),
(213, 35, 'Riviera'),
(214, 35, 'Roadmaster'),
(215, 35, 'Skyhawk'),
(216, 35, 'Skylark'),
(217, 35, 'Somerset'),
(218, 35, 'Terraza'),
(219, 35, 'Verano'),
(220, 35, 'Other Buick Models'),
(221, 36, 'Allante'),
(222, 36, 'ATS '),
(223, 36, 'Brougham'),
(224, 36, 'Catera'),
(225, 36, 'Cimarron'),
(226, 36, 'CTS'),
(227, 36, 'De Ville'),
(228, 36, 'DTS'),
(229, 36, 'Eldorado'),
(230, 36, 'Escalade'),
(231, 36, 'Escalade ESV'),
(232, 36, 'Escalade EXT'),
(233, 36, 'Fleetwood'),
(234, 36, 'Seville'),
(235, 36, 'SRX'),
(236, 36, 'STS'),
(237, 36, 'XLR'),
(238, 36, 'XTS'),
(239, 36, 'Other Cadillac Model'),
(240, 37, 'Astro'),
(241, 37, 'Avalanche '),
(242, 37, 'Aveo'),
(243, 37, 'Aveo5'),
(244, 37, 'Beretta'),
(245, 37, 'Blazer'),
(246, 37, 'Camaro'),
(247, 37, 'Caprice'),
(248, 37, 'Captiva Sport'),
(249, 37, 'Cavalier'),
(250, 37, 'Celebrity'),
(251, 37, 'Chevette'),
(252, 37, 'Citation'),
(253, 37, 'Cobalt'),
(254, 37, 'Colorado'),
(255, 37, 'Corsica'),
(256, 37, 'Corvette'),
(257, 37, 'Cruze'),
(258, 37, 'El Camino'),
(259, 37, 'Equinox'),
(260, 37, 'Express Van'),
(261, 37, 'G Van'),
(262, 37, 'HHR'),
(263, 37, 'Impala'),
(264, 37, 'Kodiak C4500'),
(265, 37, 'Lumina'),
(266, 37, 'Lumina APV'),
(267, 37, 'LUV'),
(268, 37, 'Malibu'),
(269, 37, 'Metro'),
(270, 37, 'Monte Carlo'),
(271, 37, 'Nova'),
(272, 37, 'Prizm'),
(273, 37, 'S10 Blazer'),
(274, 37, 'S10 Pickup'),
(275, 37, 'Silverado and other '),
(276, 37, 'Silverado and other '),
(277, 37, 'Silverado and other '),
(278, 37, 'Sonic'),
(279, 37, 'Spark'),
(280, 37, 'Spectrum'),
(281, 37, 'Sprint'),
(282, 37, 'SSR'),
(283, 37, 'Suburban'),
(284, 37, 'Tahoe'),
(285, 37, 'Tracker'),
(286, 37, 'TrailBlazer'),
(287, 37, 'TrailBlazer EXT'),
(288, 37, 'Traverse'),
(289, 37, 'Uplander'),
(290, 37, 'Venture'),
(291, 37, 'Volt'),
(292, 37, 'Other Chevrolet Mode'),
(293, 38, '200'),
(294, 38, '300'),
(295, 38, '300M'),
(296, 38, 'Aspen'),
(297, 38, 'Caravan'),
(298, 38, 'Cirrus'),
(299, 38, 'Concorde'),
(300, 38, 'Conquest'),
(301, 38, 'Cordoba'),
(302, 38, 'Crossfire'),
(303, 38, 'E Class'),
(304, 38, 'Fifth Avenue'),
(305, 38, 'Grand Voyager'),
(306, 38, 'Imperial'),
(307, 38, 'Intrepid'),
(308, 38, 'Laser'),
(309, 38, 'LeBaron'),
(310, 38, 'LHS'),
(311, 38, 'Neon'),
(312, 38, 'New Yorker'),
(313, 38, 'Newport'),
(314, 38, 'Pacifica'),
(315, 38, 'Prowler'),
(316, 38, 'PT Cruiser'),
(317, 38, 'Sebring'),
(318, 38, 'TC by Maserati'),
(319, 38, 'Town & Country'),
(320, 38, 'Voyager'),
(321, 38, 'Other Chrysler Model'),
(322, 39, 'Lanos'),
(323, 39, 'Leganza'),
(324, 39, 'Nubira'),
(325, 39, 'Other Daewoo Models'),
(326, 40, 'Charade'),
(327, 40, 'Rocky'),
(328, 40, 'Other Daihatsu Model'),
(329, 41, '200XS'),
(330, 41, '210'),
(331, 41, '280ZX'),
(332, 41, '300ZX'),
(333, 41, '310'),
(334, 41, '510'),
(335, 41, '720'),
(336, 41, '810'),
(337, 41, 'Maxima'),
(338, 41, 'Pickup'),
(339, 41, 'Pulsar'),
(340, 41, 'Sentra'),
(341, 41, 'Stanza'),
(342, 41, 'Other Datsun Models'),
(343, 42, 'DMC-12'),
(344, 43, '400'),
(345, 43, '600'),
(346, 43, 'Aries'),
(347, 43, 'Avenger'),
(348, 43, 'Caliber'),
(349, 43, 'Caravan'),
(350, 43, 'Challenger'),
(351, 43, 'Charger'),
(352, 43, 'Colt'),
(353, 43, 'Conquest'),
(354, 43, 'D/W Truck'),
(355, 43, 'Dakota'),
(356, 43, 'Dart'),
(357, 43, 'Daytona'),
(358, 43, 'Diplomat'),
(359, 43, 'Durango'),
(360, 43, 'Dynasty'),
(361, 43, 'Grand Caravan'),
(362, 43, 'Intrepid'),
(363, 43, 'Journey'),
(364, 43, 'Lancer'),
(365, 43, 'Magnum'),
(366, 43, 'Mirada'),
(367, 43, 'Monaco'),
(368, 43, 'Neon'),
(369, 43, 'Nitro'),
(370, 43, 'Omni'),
(371, 43, 'Raider'),
(372, 43, 'Ram 1500 Truck'),
(373, 43, 'Ram 2500 Truck'),
(374, 43, 'Ram 3500 Truck'),
(375, 43, 'Ram 4500 Truck'),
(376, 43, 'Ram 50 Truck'),
(377, 43, 'RAM C/V'),
(378, 43, 'Ram SRT-10'),
(379, 43, 'Ram Van'),
(380, 43, 'Ram Wagon'),
(381, 43, 'Ramcharger'),
(382, 43, 'Rampage'),
(383, 43, 'Shadow'),
(384, 43, 'Spirit'),
(385, 43, 'Sprinter'),
(386, 43, 'SRT-4'),
(387, 43, 'St. Regis'),
(388, 43, 'Stealth'),
(389, 43, 'Stratus'),
(390, 43, 'Viper'),
(391, 43, 'Other Dodge Models'),
(392, 44, 'Medallion'),
(393, 44, 'Premier'),
(394, 44, 'Summit'),
(395, 44, 'Talon'),
(396, 44, 'Vision'),
(397, 44, 'Other Eagle Models'),
(398, 45, '308 GTB Quattrovalvo'),
(399, 45, '308 GTBI'),
(400, 45, '308 GTS Quattrovalvo'),
(401, 45, '308 GTSI'),
(402, 45, '328 GTB'),
(403, 45, '328 GTS'),
(404, 45, '348 GTB'),
(405, 45, '348 GTS'),
(406, 45, '348 Spider'),
(407, 45, '348 TB'),
(408, 45, '348 TS'),
(409, 45, '360'),
(410, 45, '456 GT'),
(411, 45, '456M GT'),
(412, 45, '458 Italia'),
(413, 45, '512 BBi'),
(414, 45, '512M'),
(415, 45, '512TR'),
(416, 45, '550 Maranello'),
(417, 45, '575M Maranello'),
(418, 45, '599 GTB Fiorano'),
(419, 45, '599 GTO'),
(420, 45, '612 Scaglietti'),
(421, 45, 'California'),
(422, 45, 'Enzo'),
(423, 45, 'F355'),
(424, 45, 'F40'),
(425, 45, 'F430'),
(426, 45, 'F50'),
(427, 45, 'FF'),
(428, 45, 'Mondial'),
(429, 45, 'Testarossa'),
(430, 45, 'Other Ferrari Models'),
(431, 46, '2000 Spider'),
(432, 46, '500'),
(433, 46, 'Bertone X1/9'),
(434, 46, 'Brava'),
(435, 46, 'Pininfarina Spider'),
(436, 46, 'Strada'),
(437, 46, 'X1/9'),
(438, 46, 'Other Fiat Models'),
(439, 47, 'Karma'),
(440, 48, 'Aerostar'),
(441, 48, 'Aspire'),
(442, 48, 'Bronco'),
(443, 48, 'Bronco II'),
(444, 48, 'C-MAX'),
(445, 48, 'Club Wagon'),
(446, 48, 'Contour'),
(447, 48, 'Courier'),
(448, 48, 'Crown Victoria'),
(449, 48, 'E-150 and Econoline '),
(450, 48, 'E-250 and Econoline '),
(451, 48, 'E-350 and Econoline '),
(452, 48, 'Edge'),
(453, 48, 'Escape'),
(454, 48, 'Escort'),
(455, 48, 'Excursion'),
(456, 48, 'EXP'),
(457, 48, 'Expedition'),
(458, 48, 'Expedition EL'),
(459, 48, 'Explorer'),
(460, 48, 'Explorer Sport Trac'),
(461, 48, 'F100'),
(462, 48, 'F150'),
(463, 48, 'F250'),
(464, 48, 'F350'),
(465, 48, 'F450'),
(466, 48, 'Fairmont'),
(467, 48, 'Festiva'),
(468, 48, 'Fiesta'),
(469, 48, 'Five Hundred'),
(470, 48, 'Flex'),
(471, 48, 'Focus'),
(472, 48, 'Freestar'),
(473, 48, 'Freestyle'),
(474, 48, 'Fusion'),
(475, 48, 'Granada'),
(476, 48, 'Other Ford Models');

-- --------------------------------------------------------

--
-- Table structure for table `thai_category_types`
--

DROP TABLE IF EXISTS `thai_category_types`;
CREATE TABLE `thai_category_types` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_category_types`
--

INSERT INTO `thai_category_types` (`id`, `category_id`, `title`) VALUES
(1, 4, 'New'),
(2, 4, 'Old'),
(3, 5, 'New'),
(4, 5, 'Old'),
(5, 6, 'New'),
(6, 6, 'Old'),
(7, 7, 'New'),
(8, 7, 'Old'),
(9, 8, 'Full-Time'),
(10, 8, 'Part-Time'),
(11, 8, 'Temporary'),
(12, 9, 'Full-Time'),
(13, 9, 'Part-Time'),
(14, 9, 'Temporary'),
(15, 10, 'Full-Time'),
(16, 10, 'Part-Time'),
(17, 10, 'Temporary'),
(18, 11, 'Full-Time'),
(19, 11, 'Part-Time'),
(20, 11, 'Temporary'),
(21, 12, 'Full-Time'),
(22, 12, 'Part-Time'),
(23, 12, 'Temporary'),
(24, 13, 'Full-Time'),
(25, 13, 'Part-Time'),
(26, 13, 'Temporary'),
(27, 18, 'Acura'),
(28, 18, 'Alfa Romeo'),
(29, 18, 'AMC'),
(30, 18, 'Aston Martin'),
(31, 18, 'Audi'),
(32, 18, 'Avanti'),
(33, 18, 'Bentley'),
(34, 18, 'BMW'),
(35, 18, 'Buick'),
(36, 18, 'Cadillac'),
(37, 18, 'Chevrolet'),
(38, 18, 'Chrysler'),
(39, 18, 'Daewoo'),
(40, 18, 'Daihatsu'),
(41, 18, 'Datsun'),
(42, 18, 'DeLorean'),
(43, 18, 'Dodge'),
(44, 18, 'Eagle'),
(45, 18, 'Ferrari'),
(46, 18, 'FIAT'),
(47, 18, 'Fisker'),
(48, 18, 'Ford'),
(49, 18, 'Freightliner'),
(50, 18, 'Geo'),
(51, 18, 'GMC,'),
(52, 18, 'Honda,'),
(53, 18, 'HUMMER'),
(54, 18, 'Hyundai'),
(55, 18, 'Infiniti'),
(56, 18, 'Isuzu'),
(57, 18, 'Jaguar'),
(58, 18, 'Jeep'),
(59, 18, 'Kia'),
(60, 18, 'Lamborghini'),
(61, 18, 'Lancia'),
(62, 18, 'Land Rover'),
(63, 18, 'Lexus'),
(64, 18, 'Lincoln'),
(65, 18, 'Lotus'),
(66, 18, 'Maserati'),
(67, 18, 'Maybach'),
(68, 18, 'Mazda'),
(69, 18, 'McLaren'),
(70, 18, 'Mercedes-Benz'),
(71, 18, 'Mercury'),
(72, 18, 'Merkur'),
(73, 18, 'MINI'),
(74, 18, 'Mitsubishi'),
(75, 18, 'Nissan'),
(76, 18, 'Oldsmobile'),
(77, 18, 'Peugeot'),
(78, 18, 'Maserati'),
(79, 18, 'Plymouth'),
(80, 18, 'Pontiac'),
(81, 18, 'Porsche'),
(82, 18, 'RAM'),
(83, 18, 'Renault'),
(84, 18, 'Rolls-Royce'),
(85, 18, 'Saab'),
(86, 18, 'Saturn'),
(87, 18, 'Scion'),
(88, 18, 'smart'),
(89, 18, 'SRT'),
(90, 18, 'Sterling'),
(91, 18, 'Subaru'),
(92, 18, 'Suzuki'),
(93, 18, 'Tesla'),
(94, 18, 'Toyota'),
(95, 18, 'Volkswagen'),
(96, 18, 'Volvo'),
(97, 18, 'Yugo'),
(98, 18, 'Triumph'),
(99, 19, 'Car Parts'),
(100, 19, 'Other Parts'),
(101, 19, 'Spare Parts'),
(102, 20, 'Commercial Vehicles'),
(103, 21, 'Other Vehicles'),
(104, 22, 'Honda'),
(105, 22, 'Bajaj'),
(106, 22, 'TVS'),
(107, 22, 'Suzuki'),
(108, 22, 'Kinetic'),
(109, 22, 'Mahindra'),
(110, 23, 'Hercules'),
(111, 23, 'BSA'),
(112, 23, 'Atlas'),
(113, 23, 'Avon'),
(114, 23, 'Firefox'),
(115, 23, 'Trek'),
(116, 25, 'Rent'),
(117, 25, 'Sale'),
(118, 26, 'Rent'),
(119, 26, 'Sale'),
(120, 27, 'Rent'),
(121, 27, 'Sale'),
(122, 28, 'Lease'),
(123, 28, 'Sale'),
(124, 29, 'Sharing'),
(125, 29, 'Rent'),
(126, 30, 'Rent'),
(127, 32, 'Women'),
(128, 32, 'Men'),
(129, 33, 'Women'),
(130, 33, 'Men'),
(131, 34, 'Women'),
(132, 34, 'Men'),
(133, 36, 'Laptops'),
(134, 36, 'Computers'),
(135, 36, 'Internet'),
(136, 36, 'Printers'),
(137, 36, 'Monitors'),
(138, 36, 'Hard Disk'),
(139, 36, 'Other Accessories'),
(140, 37, 'Other Accessories'),
(141, 38, 'Video-Audio'),
(142, 38, 'TV'),
(143, 39, 'Cameras'),
(144, 39, 'Lenses'),
(145, 39, 'Other Accessories'),
(146, 40, 'Games and Entertainm'),
(147, 41, 'Fridges'),
(148, 41, 'Washing Machines'),
(149, 41, 'AC');

-- --------------------------------------------------------

--
-- Table structure for table `thai_chat`
--

DROP TABLE IF EXISTS `thai_chat`;
CREATE TABLE `thai_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `touser_id` int(11) NOT NULL DEFAULT '0',
  `msg` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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

DROP TABLE IF EXISTS `thai_cms`;
CREATE TABLE `thai_cms` (
  `type` varchar(50) NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_cms`
--

INSERT INTO `thai_cms` (`type`, `content`) VALUES
('aboutus', '<h1>About Us</h1>\r\n<p>This is our About Us page</p>'),
('privacy_policy', '<h1>Privacy Policy</h1>\r\n<p>This is our privacy policy page</p>'),
('terms_and_conditions', '<h1>Terms and Conditions</h1>\r\n<p>This is our terms and conditions page</p>');

-- --------------------------------------------------------

--
-- Table structure for table `thai_emails`
--

DROP TABLE IF EXISTS `thai_emails`;
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
(3, 'change password', 'Admin', 'Change Password', '<p>Dear {{Name}}</p>\r\n<p>Your password have been changed successfully</p>\r\n<p>Your Email: {{Email}}</p>\r\n<p>Password: {{Password}}</p>\r\n<p>&nbsp;</p>', 'info@domain.com');

-- --------------------------------------------------------

--
-- Table structure for table `thai_faq`
--

DROP TABLE IF EXISTS `thai_faq`;
CREATE TABLE `thai_faq` (
  `id` int(25) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` text,
  `trash` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '1',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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

DROP TABLE IF EXISTS `thai_news`;
CREATE TABLE `thai_news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `img` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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

DROP TABLE IF EXISTS `thai_orders`;
CREATE TABLE `thai_orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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

DROP TABLE IF EXISTS `thai_products`;
CREATE TABLE `thai_products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '0 = Pending, 1 = Active, 2 = Sold, 3 = Expired',
  `trash` int(2) DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int(11) NOT NULL DEFAULT '0',
  `location` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ad_type` int(11) NOT NULL DEFAULT '0' COMMENT '0=Private, 1=Business',
  `submodel` varchar(20) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `year_registration` year(4) DEFAULT NULL,
  `driven` int(11) NOT NULL DEFAULT '0',
  `fuel_type` varchar(50) DEFAULT NULL,
  `gearbox` varchar(50) DEFAULT NULL,
  `features` varchar(100) DEFAULT NULL,
  `featured` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_products`
--

INSERT INTO `thai_products` (`id`, `category_id`, `subcategory_id`, `user_id`, `title`, `description`, `status`, `trash`, `created_date`, `price`, `location`, `type`, `ad_type`, `submodel`, `model`, `brand`, `year_registration`, `driven`, `fuel_type`, `gearbox`, `features`, `featured`, `latitude`, `longitude`) VALUES
(1, 16, 18, 5, 'New Tesla5 for sale', 'Test Drive First.New Tesla for sale is available', 1, 0, '2020-02-05 17:53:35', 800, 'Berlin, Germany', 'abc', 0, NULL, 'TS-5T', 'Mercedes', 2020, 11, 'Gasoline', 'vbn', 'No', 1, '51.58250734077006', '-1.4598505851562549'),
(2, 2, 8, 6, 'Full Stack Developer', 'We are looking to hire urgently developer.The candidate must have Web Application Design and implementation. Work closely with Mobile App developers. Design and implement front-end and back-end of web dashboard for mobile', 1, 0, '2020-02-05 17:55:02', 750, 'Office#7, anchorage, Alaska', 'Urgent ', 0, NULL, '', 'Issac\\\'s Code', 2016, 0, '', '', '', 1, '', ''),
(3, 1, 7, 6, ' Multi Color Solar Light Pots for outdoor Garden', 'These plants pots are in multi color with solar light embedded.Best pots for your Outdoor garden', 1, 0, '2020-02-10 07:24:22', 350, '25 notting hill, Anchorage, Alaska', '', 0, NULL, '', '', 0000, 0, '', '', '', 1, '', ''),
(4, 24, 25, 8, 'Puppy for sale', 'Its Half breed german shephard puppy for sale', 3, 0, '2020-02-10 13:45:07', 150, 'rawalpindi', 'rent', 0, NULL, 'Half-Breed small size ', 'Half Breed German Shephard', 2000, 0, '', '', '', 1, '	33.738045', '	73.084488'),
(5, 24, 25, 5, 'Fully Automatic Washing Machinw', '- 10 Year Motor Warranty, - Fully Automatic Washing Machine, - Anti Bacterial Wash, - One way wash', 1, 0, '2020-02-10 13:57:43', 500, 'Berlin, Germany', '', 0, NULL, ' HWM 85-826', 'Haier', 0000, 0, '', '', 'NO', 1, '', ''),
(6, 24, 25, 0, 'Khan Hut', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2, 0, '2020-02-16 17:16:46', 40000, 'London, UK', 'rent', 0, NULL, '', '', 2013, 0, '', '', 'Lot of benefits', 0, '51.58250734077006', '-0.09754589765625488'),
(7, 24, 26, 6, 'Old Buddies', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 2, 0, '2020-02-16 17:37:41', 3000, 'North Wessex', 'buy', 0, NULL, '', '', 0000, 0, '', '', '', 0, '51.483411449684205', '-1.4598505851562549');

-- --------------------------------------------------------

--
-- Table structure for table `thai_product_favorites`
--

DROP TABLE IF EXISTS `thai_product_favorites`;
CREATE TABLE `thai_product_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0'
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

DROP TABLE IF EXISTS `thai_product_images`;
CREATE TABLE `thai_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `img` varchar(50) NOT NULL,
  `main` int(2) NOT NULL DEFAULT '0' COMMENT '1=main image',
  `trash` int(11) NOT NULL DEFAULT '0'
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
(21, 7, '202002161837418629.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `thai_settings`
--

DROP TABLE IF EXISTS `thai_settings`;
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

DROP TABLE IF EXISTS `thai_subscribe`;
CREATE TABLE `thai_subscribe` (
  `id` int(100) NOT NULL,
  `email` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `thai_users`
--

DROP TABLE IF EXISTS `thai_users`;
CREATE TABLE `thai_users` (
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id` int(100) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `img` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `zip` int(40) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `post_ads` int(11) NOT NULL DEFAULT '0',
  `bump_up` int(11) NOT NULL DEFAULT '0',
  `package_id` int(11) NOT NULL DEFAULT '0',
  `package_date` datetime DEFAULT NULL,
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0=user, 1=partner',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT '0=logout, 1=login',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_users`
--

INSERT INTO `thai_users` (`name`, `phone`, `email`, `id`, `password`, `img`, `status`, `zip`, `state`, `city`, `address`, `post_ads`, `bump_up`, `package_id`, `package_date`, `trash`, `created_date`, `type`, `login`, `login_time`) VALUES
('Ben Dunk', '+98712364-55', 'test@test.com', 5, 'MTIzNDU=', NULL, 1, 123456, 'north', 'Bjdiensl', 'thailand', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0, 1, '2020-03-06 17:24:46'),
('vender 1', '9009', 'test1@test1.com', 6, 'MTIzNDU=', NULL, 1, 12345, 'Rljwei', 'Piwjesp', 'Idlkweji wie jsd wfgi gdj fjxvsnjd', 22, 6, 1, NULL, 0, '2020-01-10 06:52:30', 1, 1, '2020-03-06 07:17:13'),
('sammy', '1098761', 'test2@test2.com', 8, 'MTIzNDU=', NULL, 1, 12345, 'Jfiekl', 'Lweijdi', 'Saoi asdifj  cxm nv,mxjvd nvdjsdl', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0, 0, '2020-03-05 11:59:45'),
('test4', NULL, 'test4@test4.com', 17, 'MTIzNDU=', NULL, 1, 0, 'fsdff', 'fsdfdf', 'fddfdf', 0, 0, 0, NULL, 0, '2020-02-28 10:03:56', 0, 0, '2020-03-05 11:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `thai_vendor_packages`
--

DROP TABLE IF EXISTS `thai_vendor_packages`;
CREATE TABLE `thai_vendor_packages` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `post_ads` int(11) NOT NULL DEFAULT '0',
  `bump_up` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `trash` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
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
-- AUTO_INCREMENT for table `thai_bidding`
--
ALTER TABLE `thai_bidding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thai_categories`
--
ALTER TABLE `thai_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `thai_product_favorites`
--
ALTER TABLE `thai_product_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thai_product_images`
--
ALTER TABLE `thai_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
