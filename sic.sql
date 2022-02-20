-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2022 at 11:44 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sic`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_car` (INOUT `id` INT)  NO SQL
SELECT product.product_id  FROM product ORDER BY product_id DESC LIMIT 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `product_buyer` (IN `id` INT)  NO SQL
SELECT  buyer.buyer_id,imagesource.img_1, car.car_id, car.car_name , product.price,account.city,account.state FROM product,car,refowner,imagesource,account,buyer where imagesource.product_id=product.product_id and product.product_id=car.car_id  AND category_id=3 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id
UNION
SELECT  buyer.buyer_id,imagesource.img_1, cloths.cloths_id, cloths.cloth_name, product.price,account.city,account.state FROM product,cloths,refowner,imagesource,account,buyer  where imagesource.product_id=product.product_id and product.product_id=cloths.cloths_id AND category_id=5 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id
UNION
SELECT  buyer.buyer_id,imagesource.img_1, book.book_id,book.book_name, product.price,account.city,account.state FROM product,book,refowner,imagesource,account,buyer  where imagesource.product_id=product.product_id and product.product_id=book.book_id AND category_id=2 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id
UNION
SELECT buyer.buyer_id,imagesource.img_1, mobiles.mobile_id, mobiles.mobile_name, product.price,account.city,account.state FROM product,mobiles,refowner,imagesource,account,buyer where imagesource.product_id=product.product_id and product.product_id=mobiles.mobile_id AND category_id=5 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id




UNION
SELECT buyer.buyer_id,imagesource.img_1, food.food_id, food.food_name , product.price,account.city,account.state FROM product,food,refowner,imagesource,account,buyer where imagesource.product_id=product.product_id and product.product_id=food.food_id   AND category_id=6 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id
UNION
SELECT  buyer.buyer_id,imagesource.img_1, pet.pet_id, pet.pet_name, product.price,account.city,account.state FROM product,pet,refowner,imagesource,account,buyer where imagesource.product_id=product.product_id and product.product_id=pet.pet_id  AND category_id=5 AND buyer.buyer_id=refowner.buyer_id and refowner.ref_id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `product_seller` (IN `id` INT)  NO SQL
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, car.car_name , product.price FROM product,car,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=car.car_id AND refowner.ref_id=seller_id and refowner.ref_id=id
UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, pet.pet_name , product.price FROM product,pet,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=pet_id AND refowner.ref_id=seller_id and refowner.ref_id=id
UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, food.food_name , product.price FROM product,food,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=food.food_id AND refowner.ref_id=seller_id and refowner.ref_id=id
UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, mobiles.mobile_name , product.price FROM product,mobiles,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=mobiles.mobile_id AND refowner.ref_id=seller_id and refowner.ref_id=id
UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, cloths.cloth_name , product.price FROM product,cloths,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=cloths_id AND refowner.ref_id=seller_id and refowner.ref_id=id

UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, book.book_name , product.price FROM product,book,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=book.book_id AND refowner.ref_id=seller_id and refowner.ref_id=id
UNION
SELECT product.conditions,pdescription,date_time,imagesource.img_1, product.product_id, car.car_name , product.price FROM product,car,refowner,imagesource where imagesource.product_id=product.product_id and product.product_id=car.car_id AND refowner.ref_id=seller_id and refowner.ref_id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search` (IN `S` VARCHAR(20))  NO SQL
SELECT imagesource.img_1,product.date_time,car.car_id ,car.car_name ,product.price,account.city,account.state FROM product,car,refowner,account,imagesource where imagesource.product_id=product.product_id and product.product_id=car_id AND seller_id=ref_id AND category_id=3 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID) and car.car_name like CONCAT('%',S,'%')


UNION
SELECT imagesource.img_1, product.date_time,book.book_id,book.book_name, product.price,account.city,account.state FROM product,book,refowner,account,imagesource where imagesource.product_id=product.product_id and product.product_id=book.book_id AND seller_id=ref_id AND category_id=2 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID)and book.book_name like CONCAT('%', S , '%')


UNION


SELECT imagesource.img_1,product.date_time, pet.pet_id, pet.pet_name , product.price,account.city,account.state  FROM product,pet,refowner,imagesource,account where imagesource.product_id=product.product_id and product.product_id=pet.pet_id AND seller_id=ref_id AND category_id=6 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID) and pet.pet_name like CONCAT('%', S , '%')


UNION
SELECT imagesource.img_1,product.date_time,mobiles.mobile_id ,mobiles.mobile_name ,product.price,account.city,account.state  FROM product,mobiles,refowner,imagesource,account where  imagesource.product_id=product.product_id and product.product_id=mobiles.mobile_id AND seller_id=ref_id AND category_id=1 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID) and  mobiles.mobile_name like CONCAT('%', S , '%')
UNION
SELECT  imagesource.img_1, product.date_time,cloths.cloths_id, cloths.cloth_name  ,product.price,account.city,account.state  FROM product,cloths,refowner,imagesource,account where imagesource.product_id=product.product_id and product.product_id=cloths.cloths_id AND seller_id=ref_id AND category_id=5 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID) and cloths.cloth_name like CONCAT('%', S , '%')
UNION 
SELECT  imagesource.img_1,product.date_time,food.food_id ,food.food_name,product.price,account.city,account.state  FROM imagesource, product,food,refowner,account where imagesource.product_id=product.product_id and product.product_id=food.food_id AND seller_id=ref_id AND category_id=4 AND(refowner.seler_id=account.accountID||refowner.buyer_id=account.accountID) and food.food_name like CONCAT('%', S , '%')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `Postal_Code` int(2) DEFAULT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `type` varchar(8) NOT NULL,
  `date_time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountID`, `fname`, `lname`, `email`, `country`, `state`, `city`, `Postal_Code`, `mobile_no`, `Gender`, `pwd`, `type`, `date_time`) VALUES
(2, 'azmat', 'ali', 'scientistazmat@gmail.com', 'pakistan', 'karachi', 'hadeed', 49077, '3368149077', 'male', '$2y$10$4R4zEfmo/TbjdksNinjziObs3Rh2eJk1WmcA3c9LWeCam/aTFlRCK', 'Buyer', NULL),
(4, 'Azmat', 'Abedi', '18k0248@nu.edu.pk', 'pakistan', 'karachi', 'karachi', 7688, '036815907', 'Male', '$2y$10$w4yRBI14jRrLnwKwNSVXzOJbEEQzvAo3sQP2SK06IVthjhQ/zR8ye', 'Seller', NULL),
(11, 'Aftab', 'Ahmed', 'aftab.baloch69@gmail.com', 'Pakistan', 'Sindh', 'Karachi', 75200, '3496904833', 'Male', '$2y$10$ldrjSV7uszzPhDH0hCCrdO1muFKUq3iBzk2fkRvMSqdBVIb/Rv4ay', 'Buyer', NULL),
(12, 'Temp', 'Email', 'gixat53434@chatdays.com', 'Pakistan', 'Sindh', 'Karachi', 83748, '2394892892', 'Female', '$2y$10$pBJ7yM1VwUEkMyqAhkuTyOCBgR4ZeIu.NOUdFOeb05/dFI.7/rVvS', 'Doner', NULL),
(13, 'Borrower', 'one', 'borrower@gmail.com', 'India', 'UP', 'Hyderabad', 97646, '948574885473', 'Male', '$2y$10$pBJ7yM1VwUEkMyqAhkuTyOCBgR4ZeIu.NOUdFOeb05/dFI.7/rVvS', 'Borrower', NULL),
(21, 'Del', 'Lname', 'legnojaspa@nedoz.com', 'Sirilinka', 'Sindh', 'Khi', 123475, '78787', 'Other', '$2y$10$6WEncHfxdwRAGnIlgVyKW.1wcfbqnAMpNKF7ed8zwWLfFka2zhtW6', 'Seller', '2020-12-22 23:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(20) DEFAULT NULL,
  `author_name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `ISBN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `author_name`, `title`, `publisher`, `ISBN`) VALUES
(115, 'Let Us C', 'Yashwant Kanatkar', 'Let Us C Programming Book', 'Star', 3434343),
(157, 'The Science of Succe', 'Napoleon Hills', 'The Science of Success: Napole', ' Mega Books Store', 2147483647),
(162, 'SAT other preparatio', 'SAT ', 'Education', 'SAT', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `borrower_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_name` text NOT NULL,
  `model_no` text NOT NULL,
  `company_name` varchar(20) NOT NULL,
  `engin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_name`, `model_no`, `company_name`, `engin`) VALUES
(40, 'Mercandez', '2002', 'Mercandez', 1000),
(50, 'farari', '2020', 'farari', 2000),
(153, 'Suzuki Mehran Car', '2010', 'Suzuki', 2012),
(164, 'Suzuki Margalla Powe', '1998', 'Suzuki', 1400);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `cname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `cname`) VALUES
(1, 'Mobiles Phone'),
(2, 'Books'),
(3, 'Vehicles'),
(4, 'food'),
(5, 'cloths'),
(6, 'Pets');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `mchat_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `msg_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cloths`
--

CREATE TABLE `cloths` (
  `cloths_id` int(11) NOT NULL,
  `cloth_name` varchar(20) DEFAULT NULL,
  `color` varchar(20) NOT NULL,
  `lenght` int(11) NOT NULL,
  `company_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cloths`
--

INSERT INTO `cloths` (`cloths_id`, `cloth_name`, `color`, `lenght`, `company_name`) VALUES
(11, 'Cloth Shalwar And Ka', 'blue -light grey ', 38, 'Dinenr'),
(17, 'tshirt', ' light grey ', 0, 'levels'),
(20, 'pent', ' jeans blue ', 0, 'levels'),
(165, 'Dress Valima and Bar', 'Red', 36, 'Dress');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `coupon_holder` int(11) NOT NULL,
  `num_coupon` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_holder`, `num_coupon`) VALUES
(1, 2, 0),
(2, 11, 0),
(3, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `donate_product`
--

CREATE TABLE `donate_product` (
  `dpid` int(11) NOT NULL,
  `donerid` int(11) NOT NULL,
  `dpname` varchar(20) DEFAULT NULL,
  `procondition` varchar(50) NOT NULL,
  `ptype` int(11) DEFAULT NULL,
  `pdescription` varchar(50) DEFAULT NULL,
  `pro_img` text NOT NULL,
  `entry_date` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donate_product`
--

INSERT INTO `donate_product` (`dpid`, `donerid`, `dpname`, `procondition`, `ptype`, `pdescription`, `pro_img`, `entry_date`) VALUES
(10, 13, 'Roti3', 'New', 4, 'Hello i want to give roti to needed one', 'Donate_Product_Images/5fe26eb2632617.51497651_1.jpg', '2020-12-22 14:09:54'),
(12, 13, 'Detol Soap', 'New', 5, 'I want to donate this soap contact me', 'Donate_Product_Images/5fe4608eecc899.19027352_1.jpg', '2020-12-24 01:34:06'),
(15, 13, 'Car', 'Used', 3, 'adkj', 'Donate_Product_Images/5fe48e2f587378.48725397_1.jpg', '2020-12-24 04:48:47'),
(17, 13, 'Free Dars Of Quran', 'New', 2, 'I want to teach Holy Quran to any one who want to ', 'Donate_Product_Images/noimage.jpg', '2020-12-24 05:00:50'),
(19, 13, 'Jeans Paint', 'Used', 5, 'For needy one', 'Donate_Product_Images/5fe851ad70f621.54986316_1.jpg', '2020-12-27 14:19:41'),
(20, 13, 'Electric Bike', 'New', 3, 'This is electric bike.\r\nIt has a bettery and charg', 'Donate_Product_Images/5fe8ef82995d39.42795133_1.png', '2020-12-28 01:33:06'),
(21, 13, 'Simple L.G Mibile', 'Used', 1, 'Simple L.G Mibile single sim pta approved.\r\nGood m', 'Donate_Product_Images/5fe8f025e34e65.13956206_1.png', '2020-12-28 01:35:49'),
(23, 13, 'Computer Science', 'Used', 2, 'Computer Science books Bscs in for donate\r\n', 'Donate_Product_Images/5fe8f544c310c0.47402685_1.png', '2020-12-28 01:57:40'),
(26, 13, 'Sweaters', 'New', 5, 'New sweater sale in just free donate for needy Fes', 'Donate_Product_Images/5fe8f6dce7c094.70987431_1.jpg', '2020-12-28 02:04:28'),
(27, 13, 'G five Mobile', 'Used', 1, 'Mubail chalo hai 2no sim chala raha ha battary tai', 'Donate_Product_Images/5fe8f7838836f4.98684782_1.png', '2020-12-28 02:07:15');

--
-- Triggers `donate_product`
--
DELIMITER $$
CREATE TRIGGER `doner_insertion_history` AFTER INSERT ON `donate_product` FOR EACH ROW INSERT into doner_insertion_history VALUES(new.dpid,new.donerid,new.entry_date)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doner`
--

CREATE TABLE `doner` (
  `doner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doner`
--

INSERT INTO `doner` (`doner_id`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `doner_insertion_history`
--

CREATE TABLE `doner_insertion_history` (
  `product_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doner_insertion_history`
--

INSERT INTO `doner_insertion_history` (`product_id`, `ref_id`, `date_time`) VALUES
(22, 13, '2020-12-27 20:52:58'),
(23, 13, '2020-12-27 20:57:40'),
(24, 13, '2020-12-27 21:01:11'),
(25, 13, '2020-12-27 21:03:55'),
(26, 13, '2020-12-27 21:04:28'),
(27, 13, '2020-12-27 21:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(20) NOT NULL,
  `food_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `food_name`, `food_type`) VALUES
(4, 'Biryani', 'rice'),
(7, 'Chinese Dish Fresh', 'Biryani Rice '),
(9, 'Nihari', 'soup'),
(138, 'Salad And Raita', 'Salad'),
(141, 'Vegetables', 'food');

-- --------------------------------------------------------

--
-- Table structure for table `imagesource`
--

CREATE TABLE `imagesource` (
  `img_1` varchar(20) DEFAULT NULL,
  `img_2` varchar(20) DEFAULT NULL,
  `img_3` varchar(20) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `imagesource`
--

INSERT INTO `imagesource` (`img_1`, `img_2`, `img_3`, `product_id`) VALUES
('images/4_1.jpg', 'images/4_2.jpg', 'images/4_3.jpg', 4),
('images/7_1.jpg', 'images/7_2.jpg', 'images/7_3.jpg', 7),
('images/9_1.jpg', 'images/9_2.jpg', 'images/9_3.jpg', 9),
('images/11_1.jpg', 'images/11_2.jpg', 'images/11_3.jpg', 11),
('images/17_1.jpg', 'images/17_2.jpg', 'images/17_3.jpg', 17),
('images/20_1.jpg', 'images/20_2.jpg', 'images/20_3.jpg', 20),
('images/25_1.jpg', 'images/25_2.jpg', 'images/25_3.jpg', 25),
('images/32_1.jpg', 'images/32_2.jpg', 'images/32_3.jpg', 32),
('images/35_1.jpg', 'images/35_2.jpg', 'images/35_3.jpg', 35),
('images/40_1.jpg', 'images/40_2.jpg', 'images/40_3.jpg', 40),
('images/113_1.jpg', 'images/113_2.jpg', 'images/noimage.jpg', 113),
('images/115_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 115),
('images/119_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 119),
('images/138_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 138),
('images/140_1.png', 'images/noimage.jpg', 'images/noimage.jpg', 140),
('images/141_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 141),
('images/153_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 153),
('images/157_1.png', 'images/noimage.jpg', 'images/noimage.jpg', 157),
('images/160_1.png', 'images/noimage.jpg', 'images/noimage.jpg', 160),
('images/161_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 161),
('images/162_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 162),
('images/163_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 163),
('images/164_1.png', 'images/noimage.jpg', 'images/noimage.jpg', 164),
('images/165_1.jpg', 'images/noimage.jpg', 'images/noimage.jpg', 165);

-- --------------------------------------------------------

--
-- Table structure for table `insertion_history`
--

CREATE TABLE `insertion_history` (
  `product_id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insertion_history`
--

INSERT INTO `insertion_history` (`product_id`, `ref_id`, `date_time`) VALUES
(124, 12, '2020-12-27 11:11:48'),
(125, 2, '2020-12-27 11:11:48'),
(139, 2, '2020-12-27 12:35:58'),
(140, 2, '2020-12-27 16:11:00'),
(141, 2, '2020-12-27 16:18:55'),
(142, 2, '2020-12-27 16:38:27'),
(143, 2, '2020-12-27 16:40:24'),
(144, 2, '2020-12-27 16:41:30'),
(145, 2, '2020-12-27 16:44:07'),
(146, 2, '2020-12-27 16:44:29'),
(147, 2, '2020-12-27 17:05:26'),
(148, 2, '2020-12-27 17:08:33'),
(149, 2, '2020-12-27 17:09:18'),
(150, 2, '2020-12-27 17:10:13'),
(151, 2, '2020-12-27 17:11:07'),
(152, 2, '2020-12-27 17:12:34'),
(153, 2, '2020-12-27 17:15:05'),
(154, 2, '2020-12-27 19:10:02'),
(155, 2, '2020-12-27 19:11:25'),
(156, 2, '2020-12-27 19:11:40'),
(157, 2, '2020-12-27 19:12:14'),
(158, 2, '2020-12-27 19:13:52'),
(159, 2, '2020-12-27 19:17:35'),
(160, 2, '2020-12-27 19:33:48'),
(161, 12, '2020-12-27 19:36:31'),
(162, 12, '2020-12-27 19:44:00'),
(163, 12, '2020-12-27 19:47:40'),
(164, 12, '2020-12-27 20:03:28'),
(165, 12, '2020-12-27 20:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `mobiles`
--

CREATE TABLE `mobiles` (
  `mobile_id` int(11) NOT NULL,
  `mobile_name` varchar(50) DEFAULT NULL,
  `processor` text NOT NULL,
  `dispaly` text NOT NULL,
  `memory` text NOT NULL,
  `battery` text NOT NULL,
  `price` double DEFAULT NULL,
  `company_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobiles`
--

INSERT INTO `mobiles` (`mobile_id`, `mobile_name`, `processor`, `dispaly`, `memory`, `battery`, `price`, `company_name`) VALUES
(32, 'vivo_19', '3', '2400', '16', '4000', 25000, 'vivo'),
(35, 'Iphone 11', '2.8 Ghz', '1080p @ 1.6 ', '128 GB', '3000 mAh', 2010, 'Apple'),
(140, 'Iphone X', '3.2 GHz', '1080p @ 2.8  ', '256 GB', '4000 mAh', NULL, 'Apple'),
(161, 'Nokia Mobile E63', '512 Ram', '720p', '256 mb phone memory', '3000 mAh', NULL, 'Nokia');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL,
  `pet_name` varchar(20) NOT NULL,
  `pet_color` varchar(20) NOT NULL,
  `pet_age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`pet_id`, `pet_name`, `pet_color`, `pet_age`) VALUES
(25, 'dilber Parrot', 'multi-color', 5),
(160, 'Cat', 'White', 2),
(163, 'Puppies', 'White', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `conditions` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pdescription` longtext NOT NULL,
  `date_time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `seller_id`, `price`, `conditions`, `category_id`, `pdescription`, `date_time`) VALUES
(4, 2, 100, 'new', 4, 'sample data', NULL),
(7, 2, 400, 'New', 4, 'We are representing You To Serve Our Best Dish', NULL),
(9, 3, 300, 'sour of bons', 4, 'to serve you is our job', NULL),
(11, 2, 1000, 'New', 5, 'blue shalwar kamiz for ladies', NULL),
(17, 2, 1200, 'new variety', 5, 'T shirt', NULL),
(20, 3, 1200, 'new variety ', 5, 'pent ', NULL),
(25, 2, 2000, 'New', 6, 'yellow and red parrot dilber for sale', NULL),
(32, 3, 20000, 'new', 1, 'mobile', NULL),
(35, 2, 250000, 'Used', 1, 'I want to sale my iphone 11 with all accesseries cheap mobile', NULL),
(40, 3, 160000, 'Used', 3, 'I want To Sale My Mercandiez Car cheap price', NULL),
(45, 3, 2000, 'new ', 2, 'book science fiction', '2020-12-15 08:02:34'),
(50, 3, 2776, 'new', 2, 'new mobile', '2020-12-20 08:43:50'),
(51, 2, 3007, 'new', 2, 'new veriety', '2020-12-20 08:52:00'),
(52, 2, 3007, 'new', 2, 'new veriety', '2020-12-20 08:54:26'),
(55, 2, 3007, 'new', 2, 'new veriety', '2020-12-20 09:18:10'),
(113, 12, 439844, '2', 3, 'Toyota Corolla gli automatic\r\nModel 2019\r\nNew tail Blue metallic colour\r\nLeather seats\r\nToyota grade alloys cost of 1 lac\r\nOriginal Japanese Android t', '2020-12-22 00:06:48'),
(115, 12, 1200, 'New', 2, 'Let Us C is a popular introductory book to the world of C programming. Its simple and approachable style has kept it a popular resource for newbies for many years.', '2020-12-22 01:21:48'),
(119, 12, 4500, 'New', 2, 'hink and Grow Rich was written by Napoleon Hill in 1937 and promoted as a personal development and self-improvement book. He claimed to be inspired by a suggestion from business magnate and later-philanthropist Andrew Carnegie', '2020-12-23 00:53:32'),
(136, 12, 4500, 'New', 4, 'asjfhjahjf', '2020-12-27 15:01:17'),
(138, 12, 200, 'New', 4, 'Salad', '2020-12-27 15:06:17'),
(140, 2, 190800, 'New', 1, 'Successor to the iPhone XR, iPhone 11 was launched in 2019. The phone is available in different colour options like Red, Black, White, Yellow, Green', '2020-12-27 21:11:00'),
(141, 2, 450, 'New', 4, 'Harvard Health - Harvard University\r\n5 foods to eat to help your heart - Harvard Health', '2020-12-27 21:18:55'),
(142, 2, 45000, 'Used', 3, 'اس وڈیو میں بتائی گئی پروڈکٹ / گاڑی کے مالک یا کمپنی سے ہمارا کوئی تعلق نہیں ہے اور نہ ہی ہم کسی قسم کے لین دین کے زمہ دار ہیں۔ وڈیو میں بتائی گئی معلومات انٹرنیٹ پہ اشتہار کی صورت میں دستیاب ہیں جنہیں انفارمیشن کے مقصد کی خاطر آپ کے ساتھ شئیر کیا گیا ہے۔ تمام لین دین کے معاملات اپنی زمہ داری اور سمجھ بوجھ کے مطابق کریں۔ شکریہ', '2020-12-27 21:38:27'),
(143, 2, 45000, 'Used', 3, 'اس وڈیو میں بتائی گئی پروڈکٹ / گاڑی کے مالک یا کمپنی سے ہمارا کوئی تعلق نہیں ہے اور نہ ہی ہم کسی قسم کے لین دین کے زمہ دار ہیں۔ وڈیو میں بتائی گئی معلومات انٹرنیٹ پہ اشتہار کی صورت میں دستیاب ہیں جنہیں انفارمیشن کے مقصد کی خاطر آپ کے ساتھ شئیر کیا گیا ہے۔ تمام لین دین کے معاملات اپنی زمہ داری اور سمجھ بوجھ کے مطابق کریں۔ شکریہ', '2020-12-27 21:40:24'),
(148, 2, 45000, 'Used', 3, 'اس وڈیو میں بتائی گئی پروڈکٹ / گاڑی کے مالک یا کمپنی سے ہمارا کوئی تعلق نہیں ہے اور نہ ہی ہم کسی قسم کے لین دین کے زمہ دار ہیں۔ وڈیو میں بتائی گئی معلومات انٹرنیٹ پہ اشتہار کی صورت میں دستیاب ہیں جنہیں انفارمیشن کے مقصد کی خاطر آپ کے ساتھ شئیر کیا گیا ہے۔ تمام لین دین کے معاملات اپنی زمہ داری اور سمجھ بوجھ کے مطابق کریں۔ شکریہ', '2020-12-27 22:08:33'),
(149, 2, 45000, 'Used', 3, 'اس وڈیو میں بتائی گئی پروڈکٹ / گاڑی کے مالک یا کمپنی سے ہمارا کوئی تعلق نہیں ہے اور نہ ہی ہم کسی قسم کے لین دین کے زمہ دار ہیں۔ وڈیو میں بتائی گئی معلومات انٹرنیٹ پہ اشتہار کی صورت میں دستیاب ہیں جنہیں انفارمیشن کے مقصد کی خاطر آپ کے ساتھ شئیر کیا گیا ہے۔ تمام لین دین کے معاملات اپنی زمہ داری اور سمجھ بوجھ کے مطابق کریں۔ شکریہ', '2020-12-27 22:09:18'),
(153, 2, 45000, 'Used', 3, 'اس وڈیو میں بتائی گئی پروڈکٹ / گاڑی کے مالک یا کمپنی سے ہمارا کوئی تعلق نہیں ہے اور نہ ہی ہم کسی قسم کے لین دین کے زمہ دار ہیں۔ وڈیو میں بتائی گئی معلومات انٹرنیٹ پہ اشتہار کی صورت میں دستیاب ہیں جنہیں انفارمیشن کے مقصد کی خاطر آپ کے ساتھ شئیر کیا گیا ہے۔ تمام لین دین کے معاملات اپنی زمہ داری اور سمجھ بوجھ کے مطابق کریں۔ شکریہ', '2020-12-27 22:15:05'),
(154, 2, 249, 'New', 2, 'The Science of Success is a collection of writings by and about Napoleon Hill, author of the most widely read book on personal prosperity philosophy ever published, Think and Grow Rich. These essays and writings contain teachings on the nature of prosperity and how to attain it, and are published here in book form for the very first time. This work is a must-have item for Hill’s millions of fans worldwide!\r\nHome Delivery Available', '2020-12-28 00:10:02'),
(155, 2, 249, 'New', 2, 'The Science of Success is a collection of writings by and about Napoleon Hill, author of the most widely read book on personal prosperity philosophy ever published, Think and Grow Rich. These essays and writings contain teachings on the nature of prosperity and how to attain it, and are published here in book form for the very first time. This work is a must-have item for Hills millions of fans worldwide!\r\nHome Delivery Available', '2020-12-28 00:11:25'),
(156, 2, 249, 'New', 2, 'The Science of Success is a collection of writings by and about Napoleon Hill, author of the most widely read book on personal prosperity philosophy ever published, Think and Grow Rich. These essays and writings contain teachings on the nature of prosperity and how to attain it, and are published here in book form for the very first time. This work is a must-have item for Hills millions of fans worldwide!\r\nHome Delivery Available', '2020-12-28 00:11:40'),
(157, 2, 249, 'New', 2, 'The Science of Success is a collection of writings by and about Napoleon Hill, author of the most widely read book on personal prosperity philosophy ever published, Think and Grow Rich. \r\nHome Delivery Available', '2020-12-28 00:12:14'),
(160, 2, 45000, 'New', 6, 'The cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family', '2020-12-28 00:33:48'),
(161, 12, 3500, 'Used', 1, 'for sale pta approved kesi kisam ka problem ni ha phone ma 100% ok phone ha with orignal battery only serious buyer contect me ', '2020-12-28 00:36:31'),
(162, 12, 1200, 'New', 2, 'SAT ,Gmat, Gre , Ecat , Mcat and other preparational Books available price is negotiable delivery charges apply minimun rate further information call sms whats app', '2020-12-28 00:44:00'),
(163, 12, 9000, 'New', 6, 'Russian Dogs for sale. A very friendly And loving dog. white colour.. fully vaccinated.3 dogs.age 4 months.', '2020-12-28 00:47:40'),
(164, 12, 490000, 'New', 3, 'I am selling my car Margalla 98 Power Plus with new battery. New Radiator only serious buyers can contact. zero three zero four eight six eight nine seven eight six .', '2020-12-28 01:03:28'),
(165, 12, 25000, 'New', 5, 'Red Bridal Dress new 15k\r\nValima maxi new 15k\r\nNew dress hai used nahi hai dono lenge tu 25k main dedenge real buyer contact kare..\r\nWhatsApp', '2020-12-28 01:24:08');

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `Insertion_History` AFTER INSERT ON `product` FOR EACH ROW insert into insertion_history values (new.product_id,new.seller_id,new.date_time)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `PRid` int(11) NOT NULL,
  `PRemail` text NOT NULL,
  `PRselector` text NOT NULL,
  `PRtoken` longtext NOT NULL,
  `PRexpire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwdreset`
--

INSERT INTO `pwdreset` (`PRid`, `PRemail`, `PRselector`, `PRtoken`, `PRexpire`) VALUES
(5, 'scientistazmat2@gmail.com', 'c8919f7e50353b49', '$2y$10$Zhqu4WNhlgPk8vQurcIAgu0SQOk0TJqlNXctB3DEwmM525pH7zR/6', '1608473293'),
(7, 'scientistazmat@gmail.com', 'b63ff73b230dbfa7', '$2y$10$cCQdL9vJuEZivNos2o2JfO2U7olb46n.YjqLOPKUhatWAvGwWAC4S', '1608584725'),
(9, 'k180225@nu.edu.pk', '9448c9c5db4b9972', '$2y$10$AU3dDpF7j7ZHMe5I33GnFuAx6EKaKyow9XVP9GEV./29xgZc2We9G', '1608593878'),
(10, 'k180225@nu.edu.pk', 'fe2c0a6ee3339baf', '$2y$10$l7dsfTAwcixYQyLdnApEfOeqvxv7iu/4JCchP./DnWKr4kKsTkihi', '1608593885'),
(11, 'k180225@nu.edu.pk', '60f6fe21f1c36bec', '$2y$10$f7kHT9cM1uG1W/QBVuPrXeRjKjSwGp1ADcEwEm6G0hPhviN8FF7ka', '1608593891'),
(12, 'k180225@nu.edu.pk', 'd63561023b559117', '$2y$10$i61kZxt.ntc4f1nMEvNlo.vJ44AfB4hoKoxVltHw2L0opOEUoxbWe', '1608593978');

-- --------------------------------------------------------

--
-- Table structure for table `refowner`
--

CREATE TABLE `refowner` (
  `ref_id` int(11) NOT NULL,
  `seler_id` int(11) DEFAULT NULL,
  `doner_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refowner`
--

INSERT INTO `refowner` (`ref_id`, `seler_id`, `doner_id`, `buyer_id`) VALUES
(2, 2, NULL, NULL),
(3, 4, NULL, NULL),
(12, NULL, NULL, 11),
(13, NULL, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seler`
--

CREATE TABLE `seler` (
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seler`
--

INSERT INTO `seler` (`seller_id`) VALUES
(2),
(4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `virtual_table`
-- (See below for the actual view)
--
CREATE TABLE `virtual_table` (
`product_id` int(11)
,`cloth_name` varchar(20)
,`book_name` varchar(20)
,`mobile_name` varchar(50)
,`pet_name` varchar(20)
,`food_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `virtual_table`
--
DROP TABLE IF EXISTS `virtual_table`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `virtual_table`  AS SELECT `product`.`product_id` AS `product_id`, `cloths`.`cloth_name` AS `cloth_name`, `book`.`book_name` AS `book_name`, `mobiles`.`mobile_name` AS `mobile_name`, `pet`.`pet_name` AS `pet_name`, `food`.`food_name` AS `food_name` FROM ((((((`product` join `cloths`) join `book`) join `mobiles`) join `pet`) join `food`) join `car`) WHERE `product`.`product_id` = `cloths`.`cloths_id` OR `product`.`product_id` = `book`.`book_id` OR `product`.`product_id` = `mobiles`.`mobile_id` OR `product`.`product_id` = `pet`.`pet_id` OR `product`.`product_id` = `food`.`food_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`borrower_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`,`cname`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `raid` (`receiver_id`),
  ADD KEY `said` (`sender_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD KEY `mchatid` (`mchat_id`);

--
-- Indexes for table `cloths`
--
ALTER TABLE `cloths`
  ADD PRIMARY KEY (`cloths_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `fkacc` (`coupon_holder`);

--
-- Indexes for table `donate_product`
--
ALTER TABLE `donate_product`
  ADD PRIMARY KEY (`dpid`),
  ADD KEY `fkiddoner` (`donerid`);

--
-- Indexes for table `doner`
--
ALTER TABLE `doner`
  ADD PRIMARY KEY (`doner_id`);

--
-- Indexes for table `doner_insertion_history`
--
ALTER TABLE `doner_insertion_history`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `imagesource`
--
ALTER TABLE `imagesource`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `insertion_history`
--
ALTER TABLE `insertion_history`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `mobiles`
--
ALTER TABLE `mobiles`
  ADD PRIMARY KEY (`mobile_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fkcid2` (`category_id`),
  ADD KEY `fksid1` (`seller_id`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`PRid`);

--
-- Indexes for table `refowner`
--
ALTER TABLE `refowner`
  ADD PRIMARY KEY (`ref_id`),
  ADD UNIQUE KEY `seler_id` (`seler_id`),
  ADD UNIQUE KEY `doner_id` (`doner_id`),
  ADD KEY `fkisbyer` (`buyer_id`);

--
-- Indexes for table `seler`
--
ALTER TABLE `seler`
  ADD PRIMARY KEY (`seller_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `donate_product`
--
ALTER TABLE `donate_product`
  MODIFY `dpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `PRid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `refowner`
--
ALTER TABLE `refowner`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fkbook` FOREIGN KEY (`book_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrower`
--
ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `account` (`accountID`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `fkbid` FOREIGN KEY (`buyer_id`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fkpidc` FOREIGN KEY (`car_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `raid` FOREIGN KEY (`receiver_id`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `said` FOREIGN KEY (`sender_id`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `mchatid` FOREIGN KEY (`mchat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cloths`
--
ALTER TABLE `cloths`
  ADD CONSTRAINT `clothsfk` FOREIGN KEY (`cloths_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `caid` FOREIGN KEY (`coupon_holder`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donate_product`
--
ALTER TABLE `donate_product`
  ADD CONSTRAINT `fkiddoner` FOREIGN KEY (`donerid`) REFERENCES `refowner` (`ref_id`);

--
-- Constraints for table `doner`
--
ALTER TABLE `doner`
  ADD CONSTRAINT `FKDID` FOREIGN KEY (`doner_id`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `fookdfkid` FOREIGN KEY (`food_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imagesource`
--
ALTER TABLE `imagesource`
  ADD CONSTRAINT `fkimgs` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mobiles`
--
ALTER TABLE `mobiles`
  ADD CONSTRAINT `fkmodid` FOREIGN KEY (`mobile_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `fkpetid` FOREIGN KEY (`pet_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fkcid2` FOREIGN KEY (`category_id`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fksid1` FOREIGN KEY (`seller_id`) REFERENCES `refowner` (`ref_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refowner`
--
ALTER TABLE `refowner`
  ADD CONSTRAINT `fkidseler` FOREIGN KEY (`seler_id`) REFERENCES `seler` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkisbyer` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkisdoner` FOREIGN KEY (`doner_id`) REFERENCES `doner` (`doner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seler`
--
ALTER TABLE `seler`
  ADD CONSTRAINT `FKSID` FOREIGN KEY (`seller_id`) REFERENCES `account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
