-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 07, 2018 at 03:03 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multivendor`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `tier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `tier`) VALUES
(1, 'Phone', 1),
(2, 'Laptop', 1),
(3, 'Glass', 1),
(4, 'Watch', 1),
(5, 'Clothes', 1),
(6, 'Dress', 2),
(7, 'Pants', 2),
(8, 'Shoes', 2),
(9, 'Sunglasses', 2),
(10, 'Tshirts', 2),
(11, 'Watches', 2),
(12, 'Category Test', 1),
(13, 'Hoa Hong Test ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
CREATE TABLE IF NOT EXISTS `membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_member` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_Created` datetime DEFAULT NULL,
  `date_End` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `package_member`, `duration`, `price`, `date_Created`, `date_End`) VALUES
(1, 'Basic Package', 30, 50, NULL, NULL),
(2, 'Profesional Package', 60, 90, NULL, NULL),
(3, 'Three months', 90, 200, NULL, NULL),
(4, 'Free', 10, 0, NULL, NULL),
(5, 'Six months', 180, 500, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `ordersId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ordersId`,`productId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`ordersId`, `productId`, `quantity`, `price`, `status`) VALUES
(18, 29, 1, 12, 'Shipping'),
(19, 29, 1, 12, 'Shipping'),
(20, 29, 1, 12, 'Shipping'),
(21, 29, 1, 12, 'Shipping'),
(22, 29, 1, 12, 'Shipping'),
(23, 29, 1, 12, 'Shipping'),
(24, 29, 1, 12, 'Shipping'),
(25, 29, 1, 12, 'Shipping'),
(26, 28, 1, 12, 'Pending'),
(27, 6, 1, 7, 'Pending'),
(27, 30, 1, 12, 'Shipping'),
(28, 30, 1, 12, 'Pending'),
(29, 29, 1, 12, 'Pending'),
(29, 31, 1, 12, 'Shipping');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `payment_method` varchar(250) NOT NULL,
  `date_Created` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(250) NOT NULL,
  `confirm_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userid`, `payment_method`, `date_Created`, `status`, `name`, `confirm_number`) VALUES
(18, 1, 'cash', '2018-12-06 07:51:33', 0, 'hoa don user 1', 17506),
(19, 1, 'paypal', '2018-12-06 08:07:47', 0, 'hoa don user 1', 10459),
(20, 1, 'cash', '2018-12-06 09:05:42', 0, 'hoa don user 1', 11580),
(21, 1, 'cash', '2018-12-06 09:08:13', 0, 'hoa don user 1', 16590),
(22, 1, 'cash', '2018-12-06 09:16:36', 0, 'hoa don user 1', 17290),
(23, 1, 'cash', '2018-12-06 09:21:52', 0, 'hoa don user 1', 14321),
(24, 1, 'cash', '2018-12-06 09:26:22', 0, 'hoa don user 1', 10904),
(25, 1, 'cash', '2018-12-06 09:29:14', 0, 'hoa don user 1', 18670),
(26, 1, 'paypal', '2018-12-06 22:08:04', 0, 'hoa don user 1', 17048),
(27, 1, 'paypal', '2018-12-06 22:51:49', 0, 'hoa don user 1', 13315),
(28, 1, 'paypal', '2018-12-06 22:55:38', 0, 'hoa don user 1', 17561),
(29, 1, 'paypal', '2018-12-07 09:31:19', 0, 'hoa don user 1', 10889);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `name`, `productid`) VALUES
(1, 'CheckedShortDress1.jpg', 4),
(2, 'CheckedShortDress1-1.jpg', 4),
(3, 'SlimFitChinos1.jpg', 5),
(4, 'SlimFitChinos1-1.jpg', 5),
(5, 'DarkBrownBoots1.jpg', 7),
(6, 'DarkBrownBoots1-1.jpg', 7),
(7, 'DarkBrownBoots1-2.jpg', 7),
(8, 'LightBlueDenimDress2.jpg', 6),
(9, 'LightBlueDenimDress2-2.jpg', 6),
(10, 'LightBlueDenimDress2-1.jpg', 6),
(12, 'UnisexSunglasses12.jpg', 1),
(13, 'UnisexSunglasses13.jpg', 1),
(14, 'SilverChromeWatch11.jpg', 2),
(15, 'SilverChromeWatch12.jpg', 2),
(16, 'MenGreyCasualShoes11.jpg', 3),
(17, 'MenGreyCasualShoes12.jpg', 3),
(18, 'MenGreyCasualShoes13.jpg', 3),
(19, 'MenGreyCasualShoes14.jpg', 3),
(20, 'MenGreyCasualShoes15.jpg', 3),
(21, 'thumb1.gif', 8),
(22, 'thumb2.gif', 8),
(23, 'thumb3.gif', 8),
(24, 'thumb2.gif', 9),
(25, 'thumb3.gif', 9),
(26, 'thumb2.gif', 10),
(27, 'thumb3.gif', 10),
(28, '29345255_2038930219679251_1122158690_n.png', 11),
(29, 'thumb2.gif', 11),
(31, 'thumb2.gif', 14),
(33, 'thumb3.gif', 14),
(34, 'thumb2.gif', 5),
(35, 'download.jpg', 15),
(36, 'thumb2.gif', 16),
(37, 'thumb3.gif', 16),
(38, 'download.jpg', 17),
(39, 'download.jpg', 18),
(40, 'download.jpg', 19),
(41, 'thumb1.gif', 21),
(42, 'thumb2.gif', 21),
(43, 'thumb2.gif', 22),
(44, 'thumb3.gif', 22),
(45, 'download.jpg', 23),
(46, 'download.jpg', 24),
(47, 'thumb1.gif', 25),
(48, 'thumb2.gif', 25),
(49, 'thumb1.gif', 26),
(50, 'thumb2.gif', 27),
(51, 'thumb3.gif', 28),
(52, 'thumb1.gif', 29),
(53, 'thumb1.gif', 30),
(54, 'thumb1.gif', 31);

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
CREATE TABLE IF NOT EXISTS `producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'SamSung'),
(3, 'Unisex'),
(4, 'Con tho');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `shopid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `accountid` int(11) NOT NULL,
  `discount` double DEFAULT NULL,
  `producerid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_Created` date DEFAULT NULL,
  `isnew` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  KEY `accountid` (`accountid`),
  KEY `shopid` (`shopid`),
  KEY `producerid` (`producerid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `shopid`, `status`, `categoryid`, `accountid`, `discount`, `producerid`, `quantity`, `date_Created`, `isnew`) VALUES
(1, 'Unisex Sunglasses', 55, 'Kinh mat thoi trang', 2, 1, 3, 1, 0, 3, 10, '2018-11-01', 0),
(2, 'Silver Chrome Watch', 11, 'Dong ho sieu xin', 3, 1, 4, 5, 0, 4, 5, '2018-09-18', 0),
(3, 'Men Grey Casual Shoes', 12, 'Giay nam mau xam ', 2, 0, 3, 3, 20, 4, 9, '2018-10-31', 0),
(4, 'Checked Short Dress', 4, 'Vay ngan', 3, 1, 5, 3, 0, 3, 10, '2018-10-16', 0),
(5, 'Slim Fit Chinos', 8, 'Quan ka ki', 3, 1, 5, 0, NULL, 4, 8, NULL, 0),
(6, 'Light Blue Denim Dress', 7, 'vay xanh da troi ', 2, 1, 5, 4, 20, 3, 8, '2018-10-08', 0),
(7, 'Dark Brown Boots', 4, 'giay da chat luong cao ', 2, 1, 8, 5, 30, 3, 10, '2018-10-01', 0),
(8, 'Iphone 7', 23, 'dien thoai sieu xin ', 2, 1, 1, 0, NULL, 1, 12, '2018-11-10', 0),
(9, 'Galaxy Note 9', 12, 'luot nhe , luot em', 3, 1, 1, 0, NULL, 2, 0, '2018-11-10', 0),
(10, 'Galaxy Note 9', 12, 'luot nhe , luot em', 3, 1, 1, 0, NULL, 2, 2, '2018-11-10', 0),
(11, 'ZenPhone', 12, 'dasdasdas', 4, 1, 1, 0, NULL, 4, 123, '2018-11-10', 0),
(12, 'Men Grey Casual Shoes', 6, 'Giay nam mau xam ', 3, 0, 3, 0, NULL, 4, 9, '2018-11-17', 0),
(13, 'Men Grey Casual Shoes', 12, 'Giay nam mau xam ', 3, 0, 3, 0, NULL, 4, 9, '2018-11-17', 0),
(14, 'Men Grey Casual Shoes', 12, 'Giay nam mau xanh', 2, 1, 3, 0, NULL, 4, 12, NULL, 0),
(15, 'Iphone X', 12, 'dsadas', 4, 0, 1, 0, 12, 1, 12, NULL, 0),
(16, 'Iphone X', 500000, 'description product test', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(17, 'Iphone X', 500000, 'description iphone x', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(18, 'Iphone X', 500000, 'description iphone x', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(19, 'Iphone X', 500000, 'description iphone x', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(20, 'Product Test', 500000, '', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(21, 'Product Test', 500000, 'sdvsaDvasdvasd', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(22, 'Product Test 2', 40000, 'dvcdsvcA', 9, 0, 1, 0, 0, 1, 10, NULL, 0),
(23, 'dasdas', 12, 'sadsa', 4, 0, 1, 0, 0, 1, 12, NULL, 0),
(24, 'dsadsa', 12, 'dsadsad', 4, 0, 1, 0, 0, 1, 12, NULL, 0),
(25, 'Product Tset', 120000, 'dscasdv a', 8, 0, 1, 0, 0, 1, 10, NULL, 0),
(26, 'Gio Hoa', 12, 'hoa dep', 11, 1, 12, 0, 0, 3, 12, NULL, 0),
(27, 'Doa Hoa', 12, 'Hoa Hong', 11, 1, 1, 0, 0, 1, 12, NULL, 1),
(28, 'Hoa Hong', 12, 'Hoa Hong', 11, 1, 1, 0, 0, 1, 11, NULL, 1),
(29, 'Hoa Ly Da Lat', 12, 'Hoa Ly Da Lat , chat Luong cao ', 11, 1, 1, 0, 0, 1, 3, NULL, 0),
(30, 'Hoa Hong do', 12, 'Hoa Hong do ', 9, 1, 12, 0, NULL, 3, 12, NULL, 0),
(31, 'Hoa Hong da lat', 12, 'hoa hong', 13, 1, 13, 0, 0, 1, 11, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) DEFAULT NULL,
  `date_Created` date DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `content`, `date_Created`, `userid`, `productid`) VALUES
(1, 'dsadsad', '2018-11-06', 1, 3),
(2, 'ssss', '2018-11-06', 1, 4),
(3, '', '2018-12-06', 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `roleforuser`
--

DROP TABLE IF EXISTS `roleforuser`;
CREATE TABLE IF NOT EXISTS `roleforuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roleforuser`
--

INSERT INTO `roleforuser` (`id`, `name`) VALUES
(1, 'ROLE_Buyer'),
(2, 'ROLE_Seller'),
(3, 'ROLE_SuperAdmin'),
(4, 'ROLE_Admin'),
(5, 'ROLE_Shipper');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `vote` double DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `membershipid` int(11) NOT NULL DEFAULT '4',
  `identity_card` int(11) NOT NULL,
  `date_Created` datetime NOT NULL,
  `bankNumber` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `date_End` date DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `membershipid` (`membershipid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `description`, `vote`, `username`, `password`, `membershipid`, `identity_card`, `date_Created`, `bankNumber`, `status`, `email`, `address`, `profile`, `date_End`, `token`) VALUES
(2, 'shop1', 'shop cua user 2', 0, 'shoper1', '$2a$10$qmFs1aiKr/Y13JyjHzw0Ru81b2vgxj0K6nlK6qKg/yhZbiRLV7Vse', 1, 184598876, '2018-11-01 00:00:00', NULL, 1, '', NULL, NULL, '2018-12-25', NULL),
(3, 'shop2', 'shop cua user 3', 0, 'shoper2', '$2a$10$qmFs1aiKr/Y13JyjHzw0Ru81b2vgxj0K6nlK6qKg/yhZbiRLV7Vse', 2, 184219937, '2018-11-02 00:00:00', NULL, 0, '', NULL, NULL, '2018-11-04', NULL),
(4, 'Shop 4', 'WEVAEVSD', NULL, 'shop4_vn', '$2a$12$uzM9MzD1Y61jygkd/4ONj.8fiHqCMrUrK555MqzoRphQ2pLaWx1Iy', 4, 184256691, '2018-12-06 10:31:46', 123456789, 1, 'hamtruong33@gmail.com', 'fdfsfsdfsdf', 'download.jpg', '2018-12-16', NULL),
(5, 'Shop 5', NULL, 1, 'shop5_vn', '$2a$10$qmFs1aiKr/Y13JyjHzw0Ru81b2vgxj0K6nlK6qKg/yhZbiRLV7Vse', 4, 184998573, '2018-10-25 00:00:00', NULL, 0, '', NULL, NULL, '2018-12-02', NULL),
(6, 'Shop Ban Iphone', NULL, NULL, NULL, '$2a$12$IX.gTsUVeI5pkHSKI1j/6.8kI0xWTy7.uMxaprbMYM3ZTR8YW1vzq', 4, 213213, '2018-12-01 20:06:24', 321321, 0, 'shopiphone@gmail.com', 'AAAAA', NULL, '2018-11-05', NULL),
(7, 'Shop Ban Iphone', NULL, NULL, NULL, '$2a$12$hrOe7yIAsca2WoxxnUBL9OXdW7mfkPHAGhw3EQHFHMlx7QVT9k33y', 4, 3123123, '2018-12-04 00:14:55', 321321312, 1, 'huythong@gmail.com', 'AAAAA', NULL, '2018-12-14', NULL),
(8, 'Shop Test', 'asdvadv', NULL, NULL, '$2a$12$pFsaZifTsgsa4M4Plt0zUOD3hDXW2eSaLvNVc67mBD0s4n5.xzgw6', 4, 123456789, '2018-12-05 13:11:45', 1234567890, 1, 'tuancongtu020498@gmail.com', '36 nguyen tien quan 3', 'thumb1.gif', '2018-12-15', '6d535088-388d-40cc-98a5-24ddf5ead8db'),
(9, 'Shop Test', NULL, NULL, NULL, '$2a$12$NE3sRvTZTQG1VrcICmlTNOnjjUbxTJqGEvzw4IA3UXn0VchFAQhCK', 4, 123456789, '2018-12-05 12:00:26', 1234567890, 1, 'shoptest@gmail.com', 'address test', NULL, '2018-12-15', NULL),
(10, 'Test Shop', NULL, NULL, NULL, '$2a$12$iLtmPkGyJ3mJtqRGaC/7yeDOLoaZsX45PMuNHukMKoyvQLQ3oUTqS', 4, 123456789, '2018-12-05 13:20:51', 1234567890, 1, 'testshop@gmail.com', 'dskj vbads', 'thumb1.gif', '2018-12-15', NULL),
(11, 'Minh', 'dsa', NULL, NULL, '$2a$12$AvB.kFcqaAV8DaJtxbIj5.agU3cWpWss9SffBrpkewZg4rgqhfN..', 4, 123456789, '2018-12-06 10:14:52', 123456789, 1, 'minh@gmail.com', 'Cu Chi', 'thumb1.gif', '2018-12-16', NULL),
(12, 'Follower shop', NULL, NULL, NULL, '$2a$12$H2pw04aEc2IHt3LDYqlnwunuMpySdqqk4dpSZfgE/P.dOrHgB3ARe', 1, 1234678, '2018-12-06 22:49:37', 1234567898, 1, 'shophoa@gmail.com', 'Nguyen Dinh Chieu Quan 3', 'download.jpg', '2019-01-05', NULL),
(13, 'shop hoa Hong', NULL, NULL, NULL, '$2a$12$BNo9KisAEBtecix0jI.P1up/wHWHiULdFlWmPRpOk39CxHh3Jqd4K', 1, 123456889, '2018-12-07 09:29:07', 1234567890, 1, 'shophoahong@gmail.com', 'Nguyen Dinh Chieu Quan 3', 'download.jpg', '2019-01-06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_role`
--

DROP TABLE IF EXISTS `shop_role`;
CREATE TABLE IF NOT EXISTS `shop_role` (
  `shopid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`shopid`,`roleid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_role`
--

INSERT INTO `shop_role` (`shopid`, `roleid`) VALUES
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullName` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullName`, `email`, `address`, `phone`, `token`, `photo`) VALUES
(1, 'user1', '$2a$10$qmFs1aiKr/Y13JyjHzw0Ru81b2vgxj0K6nlK6qKg/yhZbiRLV7Vse', 'Nguyen Van User', 'user1@gmail.com', '1 noi nao do khong co em', 923132132, NULL, 'thumb3.gif'),
(15, 'admin1', '$2a$10$KDPiKV0GmF7nO0CyHXsEs.FsKWiEyEUE0NcXm19dloNrTgECEBKDW', 'Admin ', 'admin1@gmail.com', 'some where', NULL, NULL, NULL),
(19, 'fuser', '$2a$10$qSiUtMJOCW3AxmrB0Mly9ORs9wYH7Id/EMQq6BHkAIXa7mUNkA4Ra', 'Nguyen Van F', 'f@gmail.com', 'Anywhere', NULL, NULL, NULL),
(20, 'test', '$2a$10$C44dKOwkY2dRmsoaPu744uIuzQ8PNj7LKrZKsgujii.kGx2EK/VkW', 'Test', 'test@gmail.com', 'test', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(19, 1),
(20, 1),
(15, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`producerid`) REFERENCES `producer` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`membershipid`) REFERENCES `membership` (`id`);

--
-- Constraints for table `shop_role`
--
ALTER TABLE `shop_role`
  ADD CONSTRAINT `shop_role_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roleforuser` (`id`),
  ADD CONSTRAINT `shop_role_ibfk_2` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roleforuser` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
