-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2020 at 12:49 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `thai_categories`
--

CREATE TABLE `thai_categories` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) DEFAULT NULL,
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
('terms_and_conditions', '<h1>Terms and Conditions</h1>\r\n<p>This is our terms and conditions page</p>');

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
(3, 'change password', 'Admin', 'Change Password', '<p>Dear {{Name}}</p>\r\n<p>Your password have been changed successfully</p>\r\n<p>Your Email: {{Email}}</p>\r\n<p>Password: {{Password}}</p>\r\n<p>&nbsp;</p>', 'info@domain.com');

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
  `description` text DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `trash` int(2) DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL DEFAULT 0,
  `location` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `year_registration` year(4) DEFAULT NULL,
  `driven` int(11) NOT NULL DEFAULT 0,
  `fuel_type` varchar(50) DEFAULT NULL,
  `gearbox` varchar(50) DEFAULT NULL,
  `features` varchar(100) DEFAULT NULL,
  `featured` int(11) NOT NULL DEFAULT 0,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thai_products`
--

INSERT INTO `thai_products` (`id`, `category_id`, `subcategory_id`, `user_id`, `title`, `description`, `status`, `trash`, `created_date`, `price`, `location`, `type`, `model`, `brand`, `year_registration`, `driven`, `fuel_type`, `gearbox`, `features`, `featured`, `latitude`, `longitude`) VALUES
(1, 16, 18, 5, 'New Tesla5 for sale', 'Test Drive First.New Tesla for sale is available', 1, 0, '2020-02-05 17:53:35', 800, 'Berlin, Germany', 'abc', 'TS-5T', 'Mercedes', 2020, 11, 'Gasoline', 'vbn', 'No', 1, '', ''),
(2, 2, 8, 6, 'Full Stack Developer', 'We are looking to hire urgently developer.The candidate must have Web Application Design and implementation. Work closely with Mobile App developers. Design and implement front-end and back-end of web dashboard for mobile', 1, 0, '2020-02-05 17:55:02', 750, 'Office#7, anchorage, Alaska', 'Urgent ', '', 'Issac\\\'s Code', 2016, 0, '', '', '', 1, '', ''),
(3, 1, 7, 6, ' Multi Color Solar Light Pots for outdoor Garden', 'These plants pots are in multi color with solar light embedded.Best pots for your Outdoor garden', 1, 0, '2020-02-10 07:24:22', 350, '25 notting hill, Anchorage, Alaska', '', '', '', 0000, 0, '', '', '', 1, '', ''),
(4, 24, 25, 8, 'Puppy for sale', 'Its Half breed german shephard puppy for sale', 1, 0, '2020-02-10 13:45:07', 150, 'rawalpindi', 'Animal(Puppy)', 'Half-Breed small size ', 'Half Breed German Shephard', 2000, 0, '', '', '', 1, '', ''),
(5, 24, 25, 5, 'Fully Automatic Washing Machinw', '- 10 Year Motor Warranty, - Fully Automatic Washing Machine, - Anti Bacterial Wash, - One way wash', 1, 0, '2020-02-10 13:57:43', 500, 'Berlin, Germany', '', ' HWM 85-826', 'Haier', 0000, 0, '', '', 'NO', 1, '', ''),
(6, 24, 25, 0, 'Khan Hut', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1, 0, '2020-02-16 17:16:46', 40000, 'London, UK', 'rent', '', '', 2013, 0, '', '', 'Lot of benefits', 0, '51.58250734077006', '-0.09754589765625488'),
(7, 24, 26, 6, 'Old Buddies', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', 1, 0, '2020-02-16 17:37:41', 3000, 'North Wessex', 'buy', '', '', 0000, 0, '', '', '', 0, '51.483411449684205', '-1.4598505851562549');

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
(21, 7, '202002161837418629.jpg', 0, 0);

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
  `img` varchar(20) DEFAULT NULL,
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
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0=user, 1=partner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thai_users`
--

INSERT INTO `thai_users` (`name`, `phone`, `email`, `id`, `password`, `img`, `status`, `zip`, `state`, `city`, `address`, `post_ads`, `bump_up`, `package_id`, `package_date`, `trash`, `created_date`, `type`) VALUES
('Test', '12344', 'test@test.com', 5, 'MTIzNDU=', NULL, 1, 123456, 'statee', 'Bjdiensl', 'dkljfijw elkdj ifwk djiwo', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0),
('vender 1', '9009', 'test1@test1.com', 6, 'MTIzNDU=', NULL, 1, 12345, 'Rljwei', 'Piwjesp', 'Idlkweji wie jsd wfgi gdj fjxvsnjd', 22, 6, 1, NULL, 0, '2020-01-10 06:52:30', 1),
('Test2', '1098761', 'test2@test2.com', 8, 'MTIzNDU=', NULL, 0, 12345, 'Jfiekl', 'Lweijdi', 'Saoi asdifj  cxm nv,mxjvd nvdjsdl', 0, 0, 0, NULL, 0, '2020-01-10 06:52:30', 0),
('test4', NULL, 'test4@test4.com', 17, 'MTIzNDU=', NULL, 1, 0, 'fsdff', 'fsdfdf', 'fddfdf', 0, 0, 0, NULL, 0, '2020-02-28 10:03:56', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thai_bidding`
--
ALTER TABLE `thai_bidding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `thai_categories`
--
ALTER TABLE `thai_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
