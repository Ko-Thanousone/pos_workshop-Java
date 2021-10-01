-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2021 at 01:12 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_workshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL COMMENT 'ລະຫັດຍີ່ຫໍ້',
  `brand_name` varchar(30) NOT NULL COMMENT 'ຊື່ຍີ່ຫໍ້',
  `status` varchar(10) NOT NULL COMMENT 'ສະຖານະ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `id` int(11) NOT NULL COMMENT 'ລະຫັດພະນັກງານ',
  `username` varchar(30) NOT NULL COMMENT 'ບັນຊີເຂົ້າໃຊ້',
  `password` varchar(30) NOT NULL COMMENT 'ລະຫັດຜ່ານ',
  `status` varchar(30) NOT NULL COMMENT 'ສະຖານະ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT 'ລະຫັດປະເພດ',
  `category_name` varchar(30) NOT NULL COMMENT 'ຊື່ປະເພດ',
  `status` varchar(10) NOT NULL COMMENT 'ສະຖານະ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `barcode` varchar(13) NOT NULL COMMENT 'ລະຫັດສິນຄ້າ',
  `product_name` varchar(30) NOT NULL COMMENT 'ຊື່ສິນຄ້າ',
  `qty` int(4) NOT NULL COMMENT 'ຈໍານວນ',
  `cost_price` decimal(9,0) NOT NULL COMMENT 'ລາຄາຕົ້ນທຶນ',
  `retial_price` decimal(9,0) NOT NULL COMMENT 'ລາຄາຂາຍ',
  `brand_id` int(11) NOT NULL COMMENT 'ລະຫັດຍີ່ຫໍ້',
  `cat_id` int(11) NOT NULL COMMENT 'ລະຫັດປະເພດ',
  `status` varchar(10) NOT NULL COMMENT 'ສະຖານະ',
  `description` varchar(255) NOT NULL COMMENT 'ລາຍລະອຽດສິນຄ້າ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL COMMENT 'ລະຫັດການຂາຍ',
  `cashier_id` int(11) NOT NULL COMMENT 'ລະຫັດພະນັກງານ',
  `date_sales` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ວັນເວລາຂາຍ',
  `subtotal` decimal(9,0) NOT NULL COMMENT 'ລາຄາທັງໝົດ',
  `pay` decimal(9,0) NOT NULL COMMENT 'ເງິນຊໍາລະ',
  `money_change` decimal(9,0) NOT NULL COMMENT 'ເງິນທອນ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales_product`
--

CREATE TABLE `sales_product` (
  `id` int(11) NOT NULL COMMENT 'ລະຫັດລາຍລະອຽດການຂາຍ',
  `sales_id` int(11) NOT NULL COMMENT 'ລະຫັດການຂາຍ',
  `product_id` varchar(13) NOT NULL COMMENT 'ລະຫັດສິນຄ້າ',
  `qty` int(3) NOT NULL COMMENT 'ຈໍານວນ',
  `price` decimal(9,0) NOT NULL COMMENT 'ລາຄາຕໍ່ໜ່ວຍ',
  `total` decimal(9,0) NOT NULL COMMENT 'ລາຄາລວມ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`barcode`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sales_id` (`sales_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ລະຫັດຍີ່ຫໍ້';

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ລະຫັດພະນັກງານ';

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ລະຫັດປະເພດ';

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ລະຫັດການຂາຍ';

--
-- AUTO_INCREMENT for table `sales_product`
--
ALTER TABLE `sales_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ລະຫັດລາຍລະອຽດການຂາຍ';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cashier_id`) REFERENCES `cashier` (`id`);

--
-- Constraints for table `sales_product`
--
ALTER TABLE `sales_product`
  ADD CONSTRAINT `sales_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`barcode`),
  ADD CONSTRAINT `sales_product_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
