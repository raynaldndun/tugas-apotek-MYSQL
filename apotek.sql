-- phpMyAdmin SQL Dump (Modified)
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2025 at 06:01 AM (Original)
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
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB 
-- --------------------------------------------------------

--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB 
-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--
CREATE TABLE `diseases` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(45) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--
CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(6) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `drug_disease`
--
CREATE TABLE `drug_disease` (
  `ID` int(11) NOT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `drug_type`
--
CREATE TABLE `drug_type` (
  `id` int(20) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--
CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `purchase_detail`
--
CREATE TABLE `purchase_detail` (
  `detail_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB 



-- 1.  `roles`
ALTER TABLE `roles`
    MODIFY COLUMN `role_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 2.  `users`
ALTER TABLE `users`
    MODIFY COLUMN `user_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 3.  `diseases`
ALTER TABLE `diseases`
    MODIFY COLUMN `disease_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 4.  `drugs`
ALTER TABLE `drugs`
    MODIFY COLUMN `drug_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 5.  `drug_disease`
ALTER TABLE `drug_disease`
    MODIFY COLUMN `ID` INT(11) NOT NULL AUTO_INCREMENT;

-- 6.  `drug_type`
ALTER TABLE `drug_type`
    MODIFY COLUMN `id` INT(20) NOT NULL AUTO_INCREMENT;

-- 7.  `purchases`
ALTER TABLE `purchases`
    MODIFY COLUMN `purchase_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 8.  `purchase_detail`
ALTER TABLE `purchase_detail`
    MODIFY COLUMN `detail_id` INT(11) NOT NULL AUTO_INCREMENT;

-- 9.  `suppliers`
ALTER TABLE `suppliers`
    MODIFY COLUMN `supplier_id` INT(11) NOT NULL AUTO_INCREMENT;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`disease_id`),
  ADD KEY `fk_diseases_created_by` (`created_by`),
  ADD KEY `fk_diseases_updated_by` (`updated_by`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `fk_drug_type` (`type_id`),
  ADD KEY `fk_drugs_created_by` (`created_by`),
  ADD KEY `fk_drugs_updated_by` (`updated_by`);

--
-- Indexes for table `drug_disease`
--
ALTER TABLE `drug_disease`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_drug_id_disease` (`drug_id`),
  ADD KEY `fk_disease_id` (`disease_id`),
  ADD KEY `fk_drug_disease_created_by` (`created_by`),
  ADD KEY `fk_drug_disease_updated_by` (`updated_by`);

--
-- Indexes for table `drug_type`
--
ALTER TABLE `drug_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`),
  ADD KEY `fk_drug_type_created_by` (`created_by`),
  ADD KEY `fk_drug_type_updated_by` (`updated_by`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `fk_supplier_id` (`supplier_id`),
  ADD KEY `fk_purchases_created_by` (`created_by`),
  ADD KEY `fk_purchases_updated_by` (`updated_by`);

--
-- Indexes for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_purchase_id` (`purchase_id`),
  ADD KEY `fk_drug_id` (`drug_id`),
  ADD KEY `fk_purchase_detail_created_by` (`created_by`),
  ADD KEY `fk_purchase_detail_updated_by` (`updated_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `fk_suppliers_created_by` (`created_by`),
  ADD KEY `fk_suppliers_updated_by` (`updated_by`);


ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

--
-- Constraints for all tables (Menghubungkan created_by/updated_by ke users.user_id)
--
ALTER TABLE `diseases`
  ADD CONSTRAINT `fk_diseases_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_diseases_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `drugs`
  ADD CONSTRAINT `fk_drug_type` FOREIGN KEY (`type_id`) REFERENCES `drug_type` (`id`),
  ADD CONSTRAINT `fk_drugs_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_drugs_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `drug_disease`
  ADD CONSTRAINT `fk_disease_id` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`disease_id`),
  ADD CONSTRAINT `fk_drug_id_disease` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`drug_id`),
  ADD CONSTRAINT `fk_drug_disease_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_drug_disease_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `drug_type`
  ADD CONSTRAINT `fk_drug_type_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_drug_type_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `purchases`
  ADD CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `fk_purchases_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_purchases_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `purchase_detail`
  ADD CONSTRAINT `fk_drug_id` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`drug_id`),
  ADD CONSTRAINT `fk_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`),
  ADD CONSTRAINT `fk_purchase_detail_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_purchase_detail_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `suppliers`
  ADD CONSTRAINT `fk_suppliers_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_suppliers_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;