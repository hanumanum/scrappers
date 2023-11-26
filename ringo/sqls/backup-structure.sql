-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: ringo
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backup_clients`
--

DROP TABLE IF EXISTS `backup_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_clients` (
  `client_id` int NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_activale` datetime DEFAULT NULL,
  `discount_per` varchar(255) DEFAULT NULL,
  `total_payed_sum` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `client_sex` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text,
  `phone_number` bigint DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `client_groups_id` int DEFAULT NULL,
  `client_groups_discount` varchar(255) DEFAULT NULL,
  `loyalty_type` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `ewallet_balance` decimal(10,4) DEFAULT NULL,
  `client_transaction_last_date` datetime DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `edit_link` varchar(255) DEFAULT NULL,
  `actions` text,
  `on_click` tinyint(1) DEFAULT NULL,
  `disableEditing` json DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_transactions`
--

DROP TABLE IF EXISTS `backup_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_transactions` (
  `transaction_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `date_start_new` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `spot_id` int DEFAULT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  `payed_cash` decimal(10,2) DEFAULT NULL,
  `payed_card` decimal(10,2) DEFAULT NULL,
  `payed_ewallet` decimal(10,2) DEFAULT NULL,
  `payed_bonus` decimal(10,2) DEFAULT NULL,
  `payed_third_party` decimal(10,2) DEFAULT NULL,
  `tip_sum` decimal(10,2) DEFAULT NULL,
  `round_sum` decimal(10,2) DEFAULT NULL,
  `tax_sum` decimal(10,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `payed_card_type` int DEFAULT NULL,
  `transaction_comment` text,
  `client_id` int DEFAULT NULL,
  `uses_payed_cert` int DEFAULT NULL,
  `pay_type` int DEFAULT NULL,
  `order_source` varchar(10) DEFAULT NULL,
  `promotion_id` int DEFAULT NULL,
  `summary_seconds` varchar(20) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `payed_sum` decimal(10,2) DEFAULT NULL,
  `payment_method_cash_sum` decimal(10,2) DEFAULT NULL,
  `payment_method_card_sum` decimal(10,2) DEFAULT NULL,
  `payed_cert` decimal(10,2) DEFAULT NULL,
  `promotion_ids` varchar(255) DEFAULT NULL,
  `payment_method_id` varchar(10) DEFAULT NULL,
  `cash_shift_id` int DEFAULT NULL,
  `courier_id` varchar(10) DEFAULT NULL,
  `opened_seconds` varchar(20) DEFAULT NULL,
  `preparing_seconds` varchar(20) DEFAULT NULL,
  `transit_seconds` varchar(20) DEFAULT NULL,
  `client_name` text,
  `client_groups_id` int DEFAULT NULL,
  `delivery_price` decimal(10,2) DEFAULT NULL,
  `delivery_zone_id` int DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total_profit` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `action_details` text,
  `actions` text,
  `transaction_plain_comment` text,
  `link_date_end` datetime DEFAULT NULL,
  `link_date_start` datetime DEFAULT NULL,
  `on_click_type` text,
  `disableEditing` text,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 13:31:53
