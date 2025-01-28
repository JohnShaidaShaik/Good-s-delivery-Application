-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2025 at 07:26 PM
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
-- Database: `logistics`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `customer_id`, `product_id`, `quantity`, `delivery_date`, `delivery_address`) VALUES
(1, 1, 1, 10, '2024-04-28', 'mym');

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

CREATE TABLE `missions` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `route` text NOT NULL,
  `mission_date` date NOT NULL,
  `status` enum('pending','completed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `missions`
--

INSERT INTO `missions` (`id`, `driver_id`, `route`, `mission_date`, `status`) VALUES
(1, 3, 'Delivery ID: 1', '2025-01-28', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(1, 'Electronics - Laptop', 1200.00),
(2, 'Electronics - Phone', 800.00),
(3, 'Furniture - Chair', 75.00),
(4, 'Furniture - Table', 150.00),
(5, 'Groceries - Rice (1kg)', 2.50),
(6, 'Groceries - Sugar (1kg)', 1.80),
(7, 'Groceries - Milk (1L)', 1.20),
(8, 'Books - Novel', 15.00),
(9, 'Books - Magazine', 8.00),
(10, 'Toys - Action Figure', 20.00),
(11, 'Toys - Puzzle', 10.00),
(12, 'Clothing - T-shirt', 12.00),
(13, 'Clothing - Jeans', 30.00),
(14, 'Appliances - Vacuum Cleaner', 250.00),
(15, 'Appliances - Washing Machine', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `role` enum('customer','scheduler','driver') NOT NULL,
  `truck_registration_number` varchar(50) DEFAULT NULL,
  `truck_capacity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `phone_number`, `role`, `truck_registration_number`, `truck_capacity`, `created_at`) VALUES
(1, 'js@gm.com', '123', '123', 'customer', NULL, NULL, '2025-01-28 17:43:07'),
(2, 'js1@gm.com', '123', '123', 'scheduler', NULL, NULL, '2025-01-28 17:44:17'),
(3, 'js2@gm.com', '123', '123', 'driver', '200', 20, '2025-01-28 17:50:00'),
(4, 'dr@gm.com', '123', '123', 'driver', '190', 200, '2025-01-28 18:17:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
