-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2018 at 10:22 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `status`) VALUES
(1, 0, 1),
(2, 0, 1),
(3, 4, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_descriptions`
--

CREATE TABLE `category_descriptions` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_descriptions`
--

INSERT INTO `category_descriptions` (`id`, `category_id`, `name`, `description`, `lang_id`) VALUES
(1, 1, 'phones', '', 1),
(2, 1, 'հեռախոսներ', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `url`, `product_id`) VALUES
(1, 'https://s.list.am/p/331/25578331.webp', 1),
(2, 'https://s.list.am/p/332/25578332.webp', 1),
(3, 'https://s.list.am/p/334/25578334.webp', 1),
(4, 'https://s.list.am/p/749/24427749.webp', 2);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`) VALUES
(1, 'hy', 'Հայերեն'),
(2, 'ru', 'русский'),
(3, 'en', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `price`, `user_id`, `category_id`, `status`) VALUES
(1, 4002, 2, 1, 0),
(2, 170004, 2, 1, 0),
(3, 170006, 2, 1, 0),
(4, 170008, 2, 1, 0),
(5, 170010, 2, 1, 0),
(6, 170012, 2, 1, 0),
(7, 170014, 2, 1, 0),
(8, 170015, 2, 1, 0),
(9, 170016, 2, 1, 0),
(10, 170017, 2, 1, 0),
(11, 170018, 2, 1, 0),
(12, 170019, 2, 1, 0),
(13, 170020, 2, 1, 0),
(14, 170021, 2, 1, 0),
(15, 170022, 2, 1, 0),
(16, 170023, 2, 1, 0),
(17, 170024, 2, 1, 0),
(18, 170025, 2, 1, 0),
(19, 170026, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_descriptions`
--

CREATE TABLE `product_descriptions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_descriptions`
--

INSERT INTO `product_descriptions` (`id`, `product_id`, `name`, `description`, `lang_id`) VALUES
(1, 1, 'LG K20 V 16GB, 2GB RAM, 4x1.4 GHz, 5.3\" 720p, 13MP, ?????????, Android 7.0', 'Այլ հեռախոսների համար դիտեք իմ մյուս հայտարարությունները։\r\nԲոլոր նկարները հենց վաճառվող հեռախոսինն են։ Գտնվում է իդեալական վիճակում։ Ունի մատնահետքի սենսոր։ Աշխատում է Android 7.0 Nougat համակարգով։ Նկարում է գերազանց նկարներ և վիդեո։', 1),
(2, 2, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(3, 3, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(4, 4, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(5, 5, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(6, 6, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(7, 7, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(8, 8, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(9, 9, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(10, 10, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(11, 11, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(12, 12, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(13, 13, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(14, 14, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(15, 15, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(16, 16, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(17, 17, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(18, 18, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1),
(19, 19, 'Apple iPhone 6s 64gb space gray. gold ev rose gold Nor erashxiq + Aparik 0%', 'IPhone 6s space gray gold and rose gold Pak tup\r\n16gb-155000 64gb-170000\r\nAparik vajarq 0% kanxavjar ACBA ECONOM. VTB\r\nAraqum ANVJAR\r\nNver patyan ev dimapaki\r\nErashxiq!\r\nORIGINAL!', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone_number` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`) VALUES
(1, 'Arsen', 'Grigoryan', 'arsen-grigoryan@gmail.com', 'd66b3bac5c819c46c63f60fad08716950c97f5e3', '+37477864570'),
(2, 'Vahe', 'Mkrtchyan', 'vcmkrtchyan@gmail.com', '7e240de74fb1ed08fa08d38063f6a6a91462a815', '+37495914536');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_descriptions`
--
ALTER TABLE `category_descriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_descriptions`
--
ALTER TABLE `product_descriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_descriptions`
--
ALTER TABLE `category_descriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_descriptions`
--
ALTER TABLE `product_descriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
