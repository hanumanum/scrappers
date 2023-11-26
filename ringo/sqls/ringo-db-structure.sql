-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 08 2023 г., 17:31
-- Версия сервера: 8.0.35-0ubuntu0.22.04.1
-- Версия PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ringo-soft`
--

-- --------------------------------------------------------

--
-- Структура таблицы `back_files`
--

CREATE TABLE `back_files` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `sell_file_id` int NOT NULL DEFAULT '0',
  `warehouse_id` int NOT NULL,
  `comment` text NOT NULL,
  `mony_back` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `main_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `fixed` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `back_file_list`
--

CREATE TABLE `back_file_list` (
  `id` int NOT NULL,
  `back_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `total` varchar(50) NOT NULL,
  `delete_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `back_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `back_total` (
`product_id` int
,`total` double
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `back_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `back_warehouse` (
`product_id` int
,`total` double
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `branches`
--

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(5000) NOT NULL,
  `map_address` varchar(5000) NOT NULL,
  `coordinates` varchar(2000) NOT NULL,
  `color` varchar(100) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `calculation_files`
--

CREATE TABLE `calculation_files` (
  `id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `uid` varchar(50) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `fixed` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `calculation_file_list`
--

CREATE TABLE `calculation_file_list` (
  `id` int NOT NULL,
  `calculation_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `get_file_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `delete_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `call_priorities`
--

CREATE TABLE `call_priorities` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `call_priorities_list`
--

CREATE TABLE `call_priorities_list` (
  `id` int NOT NULL,
  `call_num` varchar(200) NOT NULL,
  `priorities` varchar(100) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cashregisters`
--

CREATE TABLE `cashregisters` (
  `id` int NOT NULL,
  `name_arm` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name_eng` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name_rus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `default_transfer_cashregister` int NOT NULL,
  `branch_id` int NOT NULL,
  `idram` int NOT NULL DEFAULT '0',
  `pos_terminal` int NOT NULL DEFAULT '0',
  `price` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `sex` int DEFAULT '0',
  `address` varchar(500) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `client_history`
--

CREATE TABLE `client_history` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `name` varchar(2000) NOT NULL,
  `surname` varchar(2000) NOT NULL,
  `insert_user` int NOT NULL,
  `phone_id` int NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `client_paying`
--

CREATE TABLE `client_paying` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `sum` varchar(10) NOT NULL,
  `paying_type` int NOT NULL,
  `type` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `real_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `client_phone`
--

CREATE TABLE `client_phone` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `number` varchar(80) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `color_system`
--

CREATE TABLE `color_system` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `header_type` varchar(100) NOT NULL,
  `header` varchar(300) NOT NULL,
  `header_mode` varchar(100) NOT NULL DEFAULT 'light',
  `menu_type` varchar(100) NOT NULL,
  `menu` varchar(300) NOT NULL,
  `menu_mode` varchar(100) NOT NULL DEFAULT 'light',
  `sidemenu_type` varchar(100) NOT NULL,
  `sidemenu` varchar(300) NOT NULL,
  `sidemenu_mode` varchar(100) NOT NULL DEFAULT 'light',
  `css_code` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `social` text NOT NULL,
  `time` text NOT NULL,
  `user_id` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `map_name` varchar(5000) NOT NULL,
  `country_code` varchar(100) NOT NULL,
  `coordinates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_of_geoobject` varchar(1000) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cron`
--

CREATE TABLE `cron` (
  `id` int NOT NULL,
  `a` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `districts`
--

CREATE TABLE `districts` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country_id` int NOT NULL,
  `state_id` int NOT NULL,
  `type_of_geoobject` varchar(500) NOT NULL,
  `notes` varchar(200) NOT NULL,
  `branch_id` int NOT NULL,
  `delivery_price` int NOT NULL,
  `map_name` varchar(2000) NOT NULL,
  `coordinates` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state_name` varchar(2000) NOT NULL,
  `icon` text NOT NULL,
  `color` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `expenses`
--

CREATE TABLE `expenses` (
  `id` int NOT NULL,
  `expenses` int NOT NULL,
  `driver_id` int NOT NULL DEFAULT '0',
  `hdm_number` varchar(30) NOT NULL,
  `cashregister_id` int NOT NULL,
  `comment` varchar(5000) NOT NULL,
  `ignore_report` int NOT NULL DEFAULT '0',
  `expenses_type` int NOT NULL,
  `expenses_type_id` int NOT NULL,
  `expenses_filtre_id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` date NOT NULL,
  `real_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `expenses_filtre`
--

CREATE TABLE `expenses_filtre` (
  `id` int NOT NULL,
  `catalog_id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `comment` text NOT NULL,
  `position` int NOT NULL,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `expenses_type`
--

CREATE TABLE `expenses_type` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `priority_users` varchar(500) NOT NULL,
  `comment` text NOT NULL,
  `permanent_expense` int NOT NULL DEFAULT '0',
  `position` int NOT NULL,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `folder_id` int NOT NULL,
  `uid` varchar(100) NOT NULL,
  `file` tinytext NOT NULL,
  `position` int NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'image',
  `insert_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `folders`
--

CREATE TABLE `folders` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `get_files`
--

CREATE TABLE `get_files` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `partner_id` int NOT NULL,
  `cargo_partner_id` int NOT NULL,
  `cargo_debt` varchar(50) NOT NULL,
  `broker_id` int NOT NULL,
  `broker_percent` varchar(11) NOT NULL,
  `debt` varchar(25) NOT NULL,
  `other_cost` int NOT NULL,
  `rate_type` int NOT NULL,
  `rate` varchar(11) NOT NULL,
  `file_uniqid` varchar(50) NOT NULL,
  `file` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `fixed` int NOT NULL,
  `type` int NOT NULL,
  `aah` int NOT NULL,
  `form_type` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `user_id` int NOT NULL,
  `edit_user_id` int NOT NULL,
  `insert_date` date DEFAULT NULL,
  `main_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `get_file_list`
--

CREATE TABLE `get_file_list` (
  `id` int NOT NULL,
  `get_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `invoice` int NOT NULL DEFAULT '0',
  `invoice_total` varchar(11) NOT NULL DEFAULT '0',
  `old_invoice_total` varchar(11) NOT NULL,
  `cost_price` varchar(500) NOT NULL DEFAULT '0',
  `other_cost` varchar(255) NOT NULL DEFAULT '0',
  `price_1` varchar(11) DEFAULT '0',
  `price_2` varchar(11) DEFAULT '0',
  `weight` varchar(25) NOT NULL DEFAULT '1',
  `type` int NOT NULL,
  `invoice_file_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `get_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `get_total` (
`product_id` int
,`total` double
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `get_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `get_warehouse` (
`product_id` int
,`total` double
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `invoice_files`
--

CREATE TABLE `invoice_files` (
  `id` int NOT NULL,
  `get_file_id` int NOT NULL,
  `u_id` text NOT NULL,
  `file_name` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `invoice_files_product`
--

CREATE TABLE `invoice_files_product` (
  `id` int NOT NULL,
  `get_file_id` int NOT NULL,
  `file_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `product_code` text NOT NULL,
  `product_name` text NOT NULL,
  `count` int NOT NULL,
  `price` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `icon` text NOT NULL,
  `submenu` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `position` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `notification_id` int NOT NULL,
  `data` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user` int NOT NULL,
  `seen` int NOT NULL DEFAULT '0',
  `seen_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `notifications_system`
--

CREATE TABLE `notifications_system` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `text` text NOT NULL,
  `url` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `order_number` varchar(500) NOT NULL,
  `arca_uid` varchar(500) NOT NULL,
  `printed` int NOT NULL,
  `ip` varchar(100) NOT NULL,
  `from_program` int NOT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL,
  `driver_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `status` int NOT NULL,
  `order_priority_id` int NOT NULL,
  `refuse_comment_id` int NOT NULL,
  `collected` int NOT NULL DEFAULT '0',
  `collection_date` timestamp NULL DEFAULT NULL,
  `given_date` timestamp NULL DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `price` int NOT NULL COMMENT 'Բոլոր ապրանքների ընդհանուր գումար առանց առաքման արժեքի',
  `sale_percent` int NOT NULL COMMENT 'Զեղչի %',
  `sale_amount` int NOT NULL COMMENT 'Զեղչի գումարի չափ',
  `delivery_price` int NOT NULL COMMENT 'Առաքման արժեք',
  `order_total` int NOT NULL COMMENT 'Պատվերի ընդհանուր արժեք + առաքման արժեք',
  `total_price` int NOT NULL COMMENT 'Բոլոր ապրանքների գումարը զեղչված արժեքով + առաքման գումար',
  `payed` int NOT NULL,
  `sale_category_id` int NOT NULL,
  `address` varchar(500) NOT NULL,
  `apartment` varchar(500) NOT NULL,
  `state_id` int NOT NULL,
  `district_id` int NOT NULL,
  `paying_method` int NOT NULL DEFAULT '1',
  `coordinates` varchar(300) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `delivery_type` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `filter_date` timestamp NULL DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `position_y` int NOT NULL,
  `barcode` varchar(500) NOT NULL,
  `delete_user` int NOT NULL,
  `delete_date` timestamp NULL DEFAULT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_box_info`
--

CREATE TABLE `order_box_info` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `box_id` int NOT NULL,
  `item_id` int NOT NULL,
  `count` int NOT NULL,
  `removed_variations` varchar(5000) NOT NULL,
  `first_price` int NOT NULL,
  `sale` int NOT NULL,
  `price` int NOT NULL,
  `total_price` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_id` int NOT NULL,
  `status_change_date` timestamp NULL DEFAULT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_collection_time`
--

CREATE TABLE `order_collection_time` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `stop_date` timestamp NULL DEFAULT NULL,
  `finished` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order_delivery_date_history`
--

CREATE TABLE `order_delivery_date_history` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `old_delivery_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `new_delivery_date` timestamp NULL DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order_delivery_groups`
--

CREATE TABLE `order_delivery_groups` (
  `id` int NOT NULL,
  `order_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `branch_id` int NOT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `driver_id` int NOT NULL,
  `delivery_type` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '0 - Հավաքագրման նոր խումբ, 1 - վարորդին հանձնված, 2 - ավարտված',
  `comment` varchar(500) NOT NULL,
  `collected` int NOT NULL,
  `collection_date` timestamp NULL DEFAULT NULL,
  `driver_check` int NOT NULL DEFAULT '0',
  `driver_check_date` timestamp NULL DEFAULT NULL,
  `delivery_start` timestamp NULL DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `change_user` int NOT NULL DEFAULT '0',
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_delivery_group_list`
--

CREATE TABLE `order_delivery_group_list` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `order_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_user` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL COMMENT '0 -> ակտիվ, 1-> ջնջված, 2 -> խումբը տեղափոխած'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_list`
--

CREATE TABLE `order_list` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_box_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL,
  `removed_variations` varchar(5000) NOT NULL,
  `first_price` int NOT NULL,
  `sale` int NOT NULL,
  `price` int NOT NULL,
  `total` int NOT NULL,
  `total_price` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `given_date` timestamp NULL DEFAULT NULL,
  `given_driver` int NOT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `hide_report` int NOT NULL DEFAULT '0',
  `status_id` int NOT NULL,
  `status_change_date` timestamp NULL DEFAULT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_logs`
--

CREATE TABLE `order_logs` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_list_id` int NOT NULL,
  `box` int NOT NULL,
  `paying_id` int NOT NULL,
  `text` text NOT NULL,
  `count` int NOT NULL,
  `change_log` int NOT NULL,
  `user_id` int NOT NULL,
  `website_id` int NOT NULL DEFAULT '0',
  `action_day` date DEFAULT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order_priorities`
--

CREATE TABLE `order_priorities` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` text NOT NULL,
  `color` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `position` int NOT NULL,
  `unchangable` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order_priority_groups`
--

CREATE TABLE `order_priority_groups` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_sos`
--

CREATE TABLE `order_sos` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `done` int NOT NULL,
  `done_user` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `order_status_changes`
--

CREATE TABLE `order_status_changes` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `status_from` int NOT NULL,
  `status_to` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `out_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `out_total` (
`count` varchar(11)
,`insert_date` timestamp
,`product_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `supplier` int NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `fatherland` varchar(50) DEFAULT NULL,
  `passport` varchar(50) DEFAULT NULL,
  `sex` int DEFAULT '0',
  `address` varchar(500) DEFAULT NULL,
  `del_address` varchar(500) DEFAULT NULL,
  `countr` int NOT NULL DEFAULT '0',
  `position` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `b_day` date DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `internal_order` int NOT NULL DEFAULT '0',
  `soc_card` varchar(50) DEFAULT NULL,
  `auto_report` int DEFAULT NULL,
  `max_debt` varchar(45) DEFAULT NULL,
  `hvhh` varchar(45) DEFAULT NULL,
  `opening_date` varchar(45) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `partner_type` int NOT NULL,
  `default_id` int NOT NULL DEFAULT '0',
  `debt` varchar(15) DEFAULT NULL,
  `debt_cron` int DEFAULT '0',
  `site_id` int NOT NULL DEFAULT '0',
  `site_username` text,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partners_group`
--

CREATE TABLE `partners_group` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` text,
  `partners` text NOT NULL,
  `type` int NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partners_group_history`
--

CREATE TABLE `partners_group_history` (
  `id` int NOT NULL,
  `history_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` text,
  `users` text NOT NULL,
  `type` int NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_history`
--

CREATE TABLE `partner_history` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `phone_id` int NOT NULL,
  `phone` varchar(100) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_paying`
--

CREATE TABLE `partner_paying` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `sum` varchar(10) NOT NULL,
  `paying_type` int NOT NULL,
  `type` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `real_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_paying_sort`
--

CREATE TABLE `partner_paying_sort` (
  `id` int NOT NULL,
  `sell_file_id` int NOT NULL,
  `partner_id` int NOT NULL,
  `sum` int NOT NULL,
  `paying_type` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` varchar(5000) NOT NULL,
  `display` int NOT NULL,
  `remove` int NOT NULL,
  `insert_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_phone`
--

CREATE TABLE `partner_phone` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `number` varchar(80) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_type`
--

CREATE TABLE `partner_type` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `partner_type` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `partner_type_list`
--

CREATE TABLE `partner_type_list` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `old` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `paying`
--

CREATE TABLE `paying` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `arca_orderId` varchar(500) NOT NULL,
  `expense_id` int NOT NULL,
  `category_id` int NOT NULL,
  `idram_transation_id` varchar(500) NOT NULL,
  `paying` int NOT NULL,
  `paying_type` int DEFAULT '1',
  `action_type` int NOT NULL,
  `branch_id` int NOT NULL DEFAULT '0',
  `partner_paying_id` int NOT NULL,
  `cashregister_id` int NOT NULL,
  `cashregister_to` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `main_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int NOT NULL,
  `change_user` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remove_date` timestamp NULL DEFAULT NULL,
  `arca_json` varchar(5000) NOT NULL,
  `orderStatus` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `paying_methods`
--

CREATE TABLE `paying_methods` (
  `id` int NOT NULL,
  `name_arm` varchar(255) NOT NULL,
  `name_rus` varchar(255) NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `editable` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `paying_types`
--

CREATE TABLE `paying_types` (
  `id` int NOT NULL,
  `name_arm` varchar(255) NOT NULL,
  `name_rus` varchar(255) NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `branch_id` int NOT NULL,
  `cashregister_id` int NOT NULL,
  `paying_group` int NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `editable` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `priorities_group_system`
--

CREATE TABLE `priorities_group_system` (
  `id` int NOT NULL,
  `name_arm` varchar(100) NOT NULL,
  `name_rus` varchar(100) NOT NULL,
  `name_eng` varchar(100) NOT NULL,
  `menu_id` int NOT NULL,
  `submenu_id` int NOT NULL,
  `controller` varchar(100) NOT NULL,
  `func` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `priorities_system`
--

CREATE TABLE `priorities_system` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `name_arm` varchar(100) NOT NULL,
  `name_rus` varchar(200) NOT NULL,
  `name_eng` varchar(200) NOT NULL,
  `menu_id` int NOT NULL,
  `submenu_id` int NOT NULL,
  `controller` varchar(100) NOT NULL,
  `func` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `value` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `priority`
--

CREATE TABLE `priority` (
  `id` int NOT NULL,
  `name_arm` varchar(200) NOT NULL,
  `name_rus` varchar(255) NOT NULL,
  `name_eng` varchar(255) NOT NULL,
  `access` text NOT NULL,
  `url` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `unit_id` int NOT NULL DEFAULT '0',
  `product_type_id` int NOT NULL,
  `sell_product` int NOT NULL DEFAULT '1',
  `default` int NOT NULL,
  `tendency` int NOT NULL DEFAULT '0',
  `name_arm` varchar(100) NOT NULL,
  `name_eng` varchar(150) NOT NULL,
  `name_rus` varchar(150) NOT NULL,
  `print_name` varchar(5000) NOT NULL,
  `code` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `other_images` text NOT NULL,
  `notes` varchar(500) NOT NULL,
  `start_price` float(11,2) NOT NULL,
  `sale_percent` float(11,2) NOT NULL,
  `sale_amount` float(11,2) NOT NULL,
  `price` int NOT NULL,
  `price_1` int NOT NULL,
  `price_2` int NOT NULL,
  `min_order` int NOT NULL,
  `min_count` int NOT NULL,
  `service` int NOT NULL DEFAULT '1',
  `details` text NOT NULL,
  `adk` varchar(50) NOT NULL,
  `close_view` int NOT NULL DEFAULT '0',
  `first_invoice` float(11,2) NOT NULL,
  `first_price_1` text NOT NULL,
  `first_price_2` text NOT NULL,
  `first_partner_id` int NOT NULL,
  `first_get_file_id` int NOT NULL,
  `spec_price` varchar(11) NOT NULL,
  `weight` float(9,4) NOT NULL DEFAULT '0.0000',
  `weight_old` varchar(22) NOT NULL,
  `search_key` text NOT NULL,
  `cron_convert` int NOT NULL,
  `partner_id` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_product` int NOT NULL,
  `position` int NOT NULL,
  `sell_position` int NOT NULL,
  `display` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `product_all`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `product_all` (
`back` double
,`barcode` varchar(50)
,`category_id` int
,`first_get_file_id` int
,`first_invoice` float(11,2)
,`first_partner_id` int
,`first_price_1` text
,`first_price_2` text
,`get` double
,`id` int
,`min_count` int
,`min_order` int
,`name` varchar(100)
,`partner_id` int
,`price_1` int
,`price_2` int
,`product_code` varchar(100)
,`product_type_id` int
,`search_key` text
,`sell` double
,`subcategory_id` int
,`weight` float(9,4)
,`write_off` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `product_boxes`
--

CREATE TABLE `product_boxes` (
  `id` int NOT NULL,
  `box_type` int NOT NULL,
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `items_show_type` int NOT NULL,
  `default` int NOT NULL,
  `name_arm` varchar(100) NOT NULL,
  `name_eng` varchar(150) NOT NULL,
  `name_rus` varchar(150) NOT NULL,
  `code` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `other_images` text NOT NULL,
  `notes` varchar(500) NOT NULL,
  `start_price` float(11,2) NOT NULL,
  `sale_percent` float(11,2) NOT NULL,
  `sale_amount` float(11,2) NOT NULL,
  `price` int NOT NULL,
  `min_count` int NOT NULL,
  `details` text NOT NULL,
  `adk` varchar(50) NOT NULL,
  `weight` float(9,4) NOT NULL DEFAULT '0.0000',
  `search_key` text NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `position` int NOT NULL,
  `sell_position` int NOT NULL,
  `display` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_box_items`
--

CREATE TABLE `product_box_items` (
  `id` int NOT NULL,
  `box_id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `print_name` varchar(5000) NOT NULL,
  `count` int NOT NULL,
  `price` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_box_item_products`
--

CREATE TABLE `product_box_item_products` (
  `id` int NOT NULL,
  `box_id` int NOT NULL,
  `item_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int NOT NULL,
  `name_arm` varchar(200) NOT NULL,
  `name_eng` varchar(200) NOT NULL,
  `name_rus` varchar(200) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `image` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_image` varchar(5000) NOT NULL,
  `code` varchar(50) NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL DEFAULT '1',
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `product_groups`
--

CREATE TABLE `product_groups` (
  `id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `code` varchar(50) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `product_group_list`
--

CREATE TABLE `product_group_list` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `product_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `product_prices`
--

CREATE TABLE `product_prices` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `website_id` int NOT NULL,
  `start_price` float(11,2) NOT NULL,
  `sale_percent` float(11,2) NOT NULL,
  `sale_amount` float(11,2) NOT NULL,
  `price` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `product_subcategories`
--

CREATE TABLE `product_subcategories` (
  `id` int NOT NULL,
  `name_arm` varchar(200) NOT NULL,
  `name_eng` varchar(200) NOT NULL,
  `name_rus` varchar(200) NOT NULL,
  `category_id` int NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL DEFAULT '1',
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `product_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `product_total` (
`adk` varchar(50)
,`back` double
,`barcode` varchar(50)
,`category_id` int
,`close_view` int
,`delete` int
,`delete_type` int
,`details` text
,`display` int
,`first_get_file_id` int
,`first_invoice` float(11,2)
,`first_partner_id` int
,`first_price_1` text
,`first_price_2` text
,`get` double
,`id` int
,`image` varchar(200)
,`min_count` int
,`min_order` int
,`name` varchar(100)
,`name_arm` varchar(100)
,`name_eng` varchar(150)
,`name_rus` varchar(150)
,`notes` varchar(500)
,`partner_id` int
,`price` int
,`price_1` int
,`price_2` int
,`product_code` varchar(100)
,`product_type_id` int
,`sale_amount` float(11,2)
,`search_key` text
,`sell` double
,`start_price` float(11,2)
,`subcategory_id` int
,`tendency` int
,`uid` varchar(100)
,`unit_id` int
,`weight` float(9,4)
,`write_off` decimal(54,0)
,`write_off_total` decimal(54,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `product_type_list`
--

CREATE TABLE `product_type_list` (
  `id` int NOT NULL,
  `name` varchar(5000) NOT NULL,
  `changable` int NOT NULL,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_units`
--

CREATE TABLE `product_units` (
  `id` int NOT NULL,
  `name_arm` varchar(100) NOT NULL,
  `name_eng` varchar(100) NOT NULL,
  `name_rus` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `user_id` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `box_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `variation_product` int NOT NULL DEFAULT '0',
  `unit_id` int NOT NULL,
  `count` float(9,4) NOT NULL DEFAULT '0.0000',
  `fixed` int NOT NULL DEFAULT '1',
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `refund_files`
--

CREATE TABLE `refund_files` (
  `id` int NOT NULL,
  `sell_file_id` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `fixed` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `refund_file_list`
--

CREATE TABLE `refund_file_list` (
  `id` int NOT NULL,
  `refund_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `delete_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `refuse_comments`
--

CREATE TABLE `refuse_comments` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `comment` text NOT NULL,
  `position` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `return_types`
--

CREATE TABLE `return_types` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `show_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `sale_categories`
--

CREATE TABLE `sale_categories` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `percent` int NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `position` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sale_type`
--

CREATE TABLE `sale_type` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `background` varchar(25) NOT NULL,
  `type` int NOT NULL,
  `close` int NOT NULL,
  `delete` int NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `sale_type_history`
--

CREATE TABLE `sale_type_history` (
  `id` int NOT NULL,
  `history_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `background` varchar(25) NOT NULL,
  `close` int NOT NULL,
  `type` int NOT NULL,
  `delete` int NOT NULL,
  `position` int NOT NULL,
  `display` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `sell_files`
--

CREATE TABLE `sell_files` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `broker_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `comment` text NOT NULL,
  `total_price` varchar(22) NOT NULL,
  `sell_type` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `note_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `main_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `fixed` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `sell_file_list`
--

CREATE TABLE `sell_file_list` (
  `id` int NOT NULL,
  `sell_file_id` int NOT NULL,
  `get_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `cost_price` int NOT NULL,
  `price` varchar(11) NOT NULL,
  `total` varchar(25) NOT NULL,
  `delete_type` int NOT NULL,
  `sell_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `sell_paying`
--

CREATE TABLE `sell_paying` (
  `id` int NOT NULL,
  `sell_file_id` int NOT NULL,
  `paying_type` int NOT NULL,
  `paying` int NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `main_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sell_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sell_total` (
`product_id` int
,`total` double
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sell_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sell_warehouse` (
`product_id` int
,`total` double
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `shift_info`
--

CREATE TABLE `shift_info` (
  `id` int NOT NULL,
  `branch_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `type` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '1 -> Բացել, 2 -> Փակել',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_user` int NOT NULL DEFAULT '0',
  `delete_date` int DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_config`
--

CREATE TABLE `site_config` (
  `id` int NOT NULL,
  `uid` varchar(200) NOT NULL,
  `info` text NOT NULL,
  `contacts` text NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_min_price` int NOT NULL,
  `minimal_delivery_duration` int NOT NULL DEFAULT '0',
  `minimal_delivery_branch_duration` varchar(5000) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_config_history`
--

CREATE TABLE `site_config_history` (
  `id` int NOT NULL,
  `config_id` int NOT NULL,
  `uid` varchar(200) NOT NULL,
  `info` text NOT NULL,
  `contacts` text NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_min_price` int NOT NULL,
  `minimal_delivery_duration` int NOT NULL DEFAULT '0',
  `minimal_delivery_branch_duration` varchar(5000) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `change_type` int NOT NULL DEFAULT '0' COMMENT '0 -> Ընդհանուր կարգաբերումներից փոփոխված, 1 -> միայն մինիմալ առաքման ժամի փոփոխություն',
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `states`
--

CREATE TABLE `states` (
  `id` int NOT NULL,
  `country_id` int NOT NULL,
  `name` varchar(500) NOT NULL,
  `coordinates` varchar(2000) NOT NULL,
  `map_name` varchar(5000) NOT NULL,
  `type_of_geoobject` varchar(1000) NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id` int NOT NULL,
  `name_arm` varchar(300) NOT NULL,
  `name_eng` varchar(300) NOT NULL,
  `name_rus` varchar(300) NOT NULL,
  `group_view` int NOT NULL DEFAULT '0' COMMENT 'Վահանակում տեսքը խմբավորված',
  `group_change` int NOT NULL DEFAULT '0' COMMENT 'Խումբ ստեղծելու հնարավորություն',
  `default` int NOT NULL,
  `color` varchar(20) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `change_type` int NOT NULL,
  `changable` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `soft_positions` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `submenu`
--

CREATE TABLE `submenu` (
  `id` int NOT NULL,
  `menu_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `show` int NOT NULL DEFAULT '1',
  `deleted` int NOT NULL,
  `position` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `transfer_files`
--

CREATE TABLE `transfer_files` (
  `id` int NOT NULL,
  `warehouse_from` int NOT NULL,
  `warehouse_to` int NOT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `fixed` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `transfer_file_list`
--

CREATE TABLE `transfer_file_list` (
  `id` int NOT NULL,
  `transfer_file_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` varchar(11) NOT NULL,
  `delete_type` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `transfer_from_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `transfer_from_warehouse` (
`product_id` int
,`total` double
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `transfer_to_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `transfer_to_warehouse` (
`product_id` int
,`total` double
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `translate`
--

CREATE TABLE `translate` (
  `id` int NOT NULL,
  `key` varchar(50) NOT NULL,
  `arm` text NOT NULL,
  `rus` text NOT NULL,
  `eng` text NOT NULL,
  `comment` text,
  `menu_id` int DEFAULT NULL,
  `submenu_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `position` int NOT NULL,
  `folders` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `translate_groups`
--

CREATE TABLE `translate_groups` (
  `id` int NOT NULL,
  `name_arm` varchar(100) NOT NULL,
  `name_rus` varchar(300) NOT NULL,
  `name_eng` varchar(500) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `user-settings`
--

CREATE TABLE `user-settings` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `width` varchar(100) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `color_id` int NOT NULL,
  `menu_close` int NOT NULL DEFAULT '0',
  `icon_style` int NOT NULL DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `user-settings-table`
--

CREATE TABLE `user-settings-table` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `settings` text NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `users_s2s`
--

CREATE TABLE `users_s2s` (
  `id` int NOT NULL,
  `unchangable` int NOT NULL,
  `branches` varchar(500) NOT NULL,
  `warehouse_id` int NOT NULL,
  `telegram_id` text NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `name_2` varchar(200) NOT NULL,
  `delivery_company` int NOT NULL,
  `small_name` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL,
  `email_personal` varchar(250) NOT NULL,
  `image` varchar(255) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `company_phone` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `color_text` varchar(500) NOT NULL,
  `priority` int NOT NULL,
  `user_type` int NOT NULL,
  `lang` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user` int NOT NULL,
  `arm_post` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `users_s2s_history`
--

CREATE TABLE `users_s2s_history` (
  `id` int NOT NULL,
  `data_id` int NOT NULL,
  `telegram_id` text NOT NULL,
  `uid` varchar(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `name_2` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL,
  `email_personal` varchar(250) NOT NULL,
  `image` varchar(255) NOT NULL,
  `phone` varchar(500) NOT NULL,
  `color` varchar(50) NOT NULL,
  `color_text` varchar(500) NOT NULL,
  `priority` int NOT NULL,
  `lang` varchar(100) NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_user` int NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `user_types`
--

CREATE TABLE `user_types` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `changable` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `warehouse_actions`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `warehouse_actions` (
`delete_type` int
,`insert_date` datetime
,`partner_id` varchar(11)
,`product_id` int
,`sell_count` double
,`status` varchar(13)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `warehouse_all_actions`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `warehouse_all_actions` (
`count` varchar(11)
,`delete_type` int
,`document_id` int
,`insert_date` datetime
,`partner_id` varchar(11)
,`product_id` int
,`status` varchar(13)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `warehouse_list`
--

CREATE TABLE `warehouse_list` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `name_arm` varchar(200) NOT NULL,
  `name_rus` varchar(200) NOT NULL,
  `name_eng` varchar(200) NOT NULL,
  `main` int NOT NULL,
  `position` int NOT NULL,
  `insert_user` int NOT NULL DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_type` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `warehouse_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `warehouse_total` (
`count` varchar(11)
,`delete_type` int
,`document_id` int
,`insert_date` datetime
,`partner_id` varchar(11)
,`price` varchar(11)
,`product_id` int
,`status` varchar(13)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `warehouse_total_actions`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `warehouse_total_actions` (
`count` varchar(11)
,`delete_type` int
,`document_id` int
,`insert_date` datetime
,`partner_id` varchar(11)
,`price` varchar(11)
,`product_id` int
,`status` varchar(13)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура таблицы `write_off_files`
--

CREATE TABLE `write_off_files` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `warehouse_id` int NOT NULL,
  `order_id` int NOT NULL DEFAULT '0',
  `partner_id` int NOT NULL DEFAULT '0',
  `defect` int NOT NULL,
  `reason` int NOT NULL,
  `day` date DEFAULT NULL,
  `comment` text NOT NULL,
  `user_id` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `real_insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archive` int NOT NULL,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  `delete_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `write_off_file_list`
--

CREATE TABLE `write_off_file_list` (
  `id` int NOT NULL,
  `write_off_file_id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_list_id` int NOT NULL,
  `order_box_id` int NOT NULL DEFAULT '0',
  `order_box_item_id` int NOT NULL DEFAULT '0',
  `variation` int NOT NULL DEFAULT '0' COMMENT '1 => Որպես հավելյալ ապրանք է դուրս գրվել',
  `product_id` int NOT NULL,
  `defect` int NOT NULL,
  `reason` int NOT NULL,
  `count` int NOT NULL,
  `delete_type` int NOT NULL,
  `insert_user` int NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `collection_date` timestamp NULL DEFAULT NULL,
  `change_user_id` int NOT NULL,
  `status` int NOT NULL,
  `delete` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `write_off_total`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `write_off_total` (
`product_id` int
,`total` decimal(32,0)
,`totalLeft` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `write_off_warehouse`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `write_off_warehouse` (
`product_id` int
,`total` decimal(32,0)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Структура для представления `back_total`
--
DROP TABLE IF EXISTS `back_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `back_total`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total` FROM (`back_file_list` `s` left join `back_files` `f` on((`f`.`id` = `s`.`back_file_id`))) WHERE (`f`.`delete_type` = 0) GROUP BY `s`.`product_id` ORDER BY sum(`s`.`count`) DESC ;

-- --------------------------------------------------------

--
-- Структура для представления `back_warehouse`
--
DROP TABLE IF EXISTS `back_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `back_warehouse`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total`, `f`.`warehouse_id` AS `warehouse_id` FROM (`back_file_list` `s` left join `back_files` `f` on((`f`.`id` = `s`.`back_file_id`))) WHERE (`f`.`delete_type` = 0) GROUP BY `s`.`product_id`, `f`.`warehouse_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `get_total`
--
DROP TABLE IF EXISTS `get_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `get_total`  AS SELECT `g`.`product_id` AS `product_id`, sum(`g`.`count`) AS `total` FROM (`get_file_list` `g` left join `get_files` `gf` on((`gf`.`id` = `g`.`get_file_id`))) WHERE (`gf`.`delete_type` = 0) GROUP BY `g`.`product_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `get_warehouse`
--
DROP TABLE IF EXISTS `get_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `get_warehouse`  AS SELECT `g`.`product_id` AS `product_id`, sum(`g`.`count`) AS `total`, `gf`.`warehouse_id` AS `warehouse_id` FROM (`get_file_list` `g` left join `get_files` `gf` on((`gf`.`id` = `g`.`get_file_id`))) WHERE (`gf`.`delete_type` = 0) GROUP BY `g`.`product_id`, `gf`.`warehouse_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `out_total`
--
DROP TABLE IF EXISTS `out_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `out_total`  AS SELECT `l`.`product_id` AS `product_id`, `l`.`count` AS `count`, `s`.`insert_date` AS `insert_date` FROM (`sell_file_list` `l` left join `sell_files` `s` on((`s`.`id` = `l`.`sell_file_id`))) WHERE (`s`.`warehouse_id` = '1') ;

-- --------------------------------------------------------

--
-- Структура для представления `product_all`
--
DROP TABLE IF EXISTS `product_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `product_all`  AS SELECT `p`.`id` AS `id`, `p`.`barcode` AS `barcode`, `p`.`product_type_id` AS `product_type_id`, `p`.`min_count` AS `min_count`, `p`.`min_order` AS `min_order`, `p`.`name` AS `name`, `p`.`product_code` AS `product_code`, `p`.`weight` AS `weight`, `p`.`search_key` AS `search_key`, `p`.`partner_id` AS `partner_id`, `p`.`subcategory_id` AS `subcategory_id`, `p`.`category_id` AS `category_id`, ifnull(`p`.`sell`,0) AS `sell`, ifnull(`p`.`back`,0) AS `back`, ifnull(`p`.`get`,0) AS `get`, ifnull(`p`.`write_off`,0) AS `write_off`, `p`.`first_invoice` AS `first_invoice`, `p`.`price_1` AS `price_1`, `p`.`price_2` AS `price_2`, `p`.`first_price_1` AS `first_price_1`, `p`.`first_price_2` AS `first_price_2`, `p`.`first_get_file_id` AS `first_get_file_id`, `p`.`first_partner_id` AS `first_partner_id` FROM `product_total` AS `p` ;

-- --------------------------------------------------------

--
-- Структура для представления `product_total`
--
DROP TABLE IF EXISTS `product_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `product_total`  AS SELECT `p`.`id` AS `id`, `p`.`delete` AS `delete`, `p`.`display` AS `display`, `p`.`tendency` AS `tendency`, `p`.`product_type_id` AS `product_type_id`, `p`.`unit_id` AS `unit_id`, `p`.`uid` AS `uid`, `p`.`image` AS `image`, `p`.`notes` AS `notes`, `p`.`price` AS `price`, `p`.`details` AS `details`, `p`.`adk` AS `adk`, `p`.`start_price` AS `start_price`, `p`.`sale_amount` AS `sale_amount`, `p`.`delete` AS `delete_type`, `p`.`close_view` AS `close_view`, `p`.`barcode` AS `barcode`, `p`.`first_get_file_id` AS `first_get_file_id`, `p`.`first_partner_id` AS `first_partner_id`, `p`.`first_invoice` AS `first_invoice`, `p`.`first_price_1` AS `first_price_1`, `p`.`first_price_2` AS `first_price_2`, `p`.`price_1` AS `price_1`, `p`.`price_2` AS `price_2`, `p`.`min_count` AS `min_count`, `p`.`min_order` AS `min_order`, `p`.`name_arm` AS `name`, `p`.`name_arm` AS `name_arm`, `p`.`name_eng` AS `name_eng`, `p`.`name_rus` AS `name_rus`, `p`.`product_code` AS `product_code`, `p`.`weight` AS `weight`, `p`.`search_key` AS `search_key`, `p`.`partner_id` AS `partner_id`, `p`.`category_id` AS `category_id`, `p`.`subcategory_id` AS `subcategory_id`, (select sum(`sell_total`.`total`) from `sell_total` where (`sell_total`.`product_id` = `p`.`id`)) AS `sell`, (select sum(`get_total`.`total`) from `get_total` where (`get_total`.`product_id` = `p`.`id`)) AS `get`, (select sum(`write_off_total`.`total`) from `write_off_total` where (`write_off_total`.`product_id` = `p`.`id`)) AS `write_off`, (select sum(`write_off_total`.`totalLeft`) from `write_off_total` where (`write_off_total`.`product_id` = `p`.`id`)) AS `write_off_total`, (select sum(`back_total`.`total`) from `back_total` where (`back_total`.`product_id` = `p`.`id`)) AS `back` FROM `products` AS `p` GROUP BY `p`.`id` ;

-- --------------------------------------------------------

--
-- Структура для представления `sell_total`
--
DROP TABLE IF EXISTS `sell_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `sell_total`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total` FROM (`sell_file_list` `s` left join `sell_files` `sf` on((`sf`.`id` = `s`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) GROUP BY `s`.`product_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `sell_warehouse`
--
DROP TABLE IF EXISTS `sell_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `sell_warehouse`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total`, `sf`.`warehouse_id` AS `warehouse_id` FROM (`sell_file_list` `s` left join `sell_files` `sf` on((`sf`.`id` = `s`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) GROUP BY `s`.`product_id`, `sf`.`warehouse_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `transfer_from_warehouse`
--
DROP TABLE IF EXISTS `transfer_from_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `transfer_from_warehouse`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total`, `f`.`warehouse_from` AS `warehouse_id` FROM (`transfer_file_list` `s` left join `transfer_files` `f` on((`f`.`id` = `s`.`transfer_file_id`))) WHERE (`f`.`delete_type` = 0) GROUP BY `s`.`product_id`, `f`.`warehouse_from` ;

-- --------------------------------------------------------

--
-- Структура для представления `transfer_to_warehouse`
--
DROP TABLE IF EXISTS `transfer_to_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `transfer_to_warehouse`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total`, `f`.`warehouse_to` AS `warehouse_id` FROM (`transfer_file_list` `s` left join `transfer_files` `f` on((`f`.`id` = `s`.`transfer_file_id`))) WHERE (`f`.`delete_type` = 0) GROUP BY `s`.`product_id`, `f`.`warehouse_to` ;

-- --------------------------------------------------------

--
-- Структура для представления `warehouse_actions`
--
DROP TABLE IF EXISTS `warehouse_actions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `warehouse_actions`  AS SELECT 'sell' AS `status`, sum(`sl`.`count`) AS `sell_count`, `sl`.`product_id` AS `product_id`, `sf`.`warehouse_id` AS `warehouse_id`, `sf`.`partner_id` AS `partner_id`, `sf`.`insert_date` AS `insert_date`, `sf`.`delete_type` AS `delete_type` FROM (`sell_file_list` `sl` left join `sell_files` `sf` on((`sf`.`id` = `sl`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) GROUP BY `sl`.`product_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `warehouse_all_actions`
--
DROP TABLE IF EXISTS `warehouse_all_actions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `warehouse_all_actions`  AS SELECT 'sell' AS `status`, `sl`.`count` AS `count`, `sl`.`product_id` AS `product_id`, `sf`.`warehouse_id` AS `warehouse_id`, `sf`.`partner_id` AS `partner_id`, `sf`.`insert_date` AS `insert_date`, `sf`.`delete_type` AS `delete_type`, `sf`.`id` AS `document_id` FROM (`sell_file_list` `sl` left join `sell_files` `sf` on((`sf`.`id` = `sl`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) ;

-- --------------------------------------------------------

--
-- Структура для представления `warehouse_total`
--
DROP TABLE IF EXISTS `warehouse_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `warehouse_total`  AS SELECT 'sell' AS `status`, `sl`.`count` AS `count`, `sl`.`product_id` AS `product_id`, `sf`.`warehouse_id` AS `warehouse_id`, `sf`.`partner_id` AS `partner_id`, `sf`.`insert_date` AS `insert_date`, `sf`.`delete_type` AS `delete_type`, `sf`.`id` AS `document_id`, `sl`.`price` AS `price` FROM (`sell_file_list` `sl` left join `sell_files` `sf` on((`sf`.`id` = `sl`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) ;

-- --------------------------------------------------------

--
-- Структура для представления `warehouse_total_actions`
--
DROP TABLE IF EXISTS `warehouse_total_actions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `warehouse_total_actions`  AS SELECT 'sell' AS `status`, `sl`.`count` AS `count`, `sl`.`product_id` AS `product_id`, `sf`.`warehouse_id` AS `warehouse_id`, `sf`.`partner_id` AS `partner_id`, `sf`.`insert_date` AS `insert_date`, `sf`.`delete_type` AS `delete_type`, `sf`.`id` AS `document_id`, `sl`.`price` AS `price` FROM (`sell_file_list` `sl` left join `sell_files` `sf` on((`sf`.`id` = `sl`.`sell_file_id`))) WHERE (`sf`.`delete_type` = 0) ;

-- --------------------------------------------------------

--
-- Структура для представления `write_off_total`
--
DROP TABLE IF EXISTS `write_off_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `write_off_total`  AS SELECT `s`.`product_id` AS `product_id`, ifnull(sum(if(((`s`.`status` = '0') or (`s`.`status` = '2') or (`s`.`status` = '3') or (`s`.`status` = '4')),`s`.`count`,0)),0) AS `total`, ifnull(sum(if(((`s`.`status` = '0') or (`s`.`status` = '2') or (`s`.`status` = '3') or (`s`.`status` = '4')),`s`.`count`,0)),0) AS `totalLeft` FROM (`write_off_file_list` `s` left join `write_off_files` `f` on((`f`.`id` = `s`.`write_off_file_id`))) WHERE ((`f`.`delete_type` = 0) AND (`s`.`delete` = 0)) GROUP BY `s`.`product_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `write_off_warehouse`
--
DROP TABLE IF EXISTS `write_off_warehouse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ringo-soft`@`localhost` SQL SECURITY DEFINER VIEW `write_off_warehouse`  AS SELECT `s`.`product_id` AS `product_id`, sum(`s`.`count`) AS `total`, `f`.`warehouse_id` AS `warehouse_id` FROM (`write_off_file_list` `s` left join `write_off_files` `f` on((`f`.`id` = `s`.`write_off_file_id`))) WHERE ((`f`.`delete_type` = 0) AND (`s`.`delete` = 0) AND (`s`.`status` = 0)) GROUP BY `s`.`product_id`, `f`.`warehouse_id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `back_files`
--
ALTER TABLE `back_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `back_file_list`
--
ALTER TABLE `back_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `calculation_files`
--
ALTER TABLE `calculation_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `calculation_file_list`
--
ALTER TABLE `calculation_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `call_priorities`
--
ALTER TABLE `call_priorities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `call_priorities_list`
--
ALTER TABLE `call_priorities_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashregisters`
--
ALTER TABLE `cashregisters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_history`
--
ALTER TABLE `client_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_paying`
--
ALTER TABLE `client_paying`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_phone`
--
ALTER TABLE `client_phone`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `color_system`
--
ALTER TABLE `color_system`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cron`
--
ALTER TABLE `cron`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `expenses_filtre`
--
ALTER TABLE `expenses_filtre`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `expenses_type`
--
ALTER TABLE `expenses_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `get_files`
--
ALTER TABLE `get_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `get_file_list`
--
ALTER TABLE `get_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `invoice_files`
--
ALTER TABLE `invoice_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `invoice_files_product`
--
ALTER TABLE `invoice_files_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications_system`
--
ALTER TABLE `notifications_system`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `order_priority_id` (`order_priority_id`);

--
-- Индексы таблицы `order_box_info`
--
ALTER TABLE `order_box_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `box_id` (`box_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Индексы таблицы `order_collection_time`
--
ALTER TABLE `order_collection_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_delivery_date_history`
--
ALTER TABLE `order_delivery_date_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_delivery_groups`
--
ALTER TABLE `order_delivery_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Индексы таблицы `order_delivery_group_list`
--
ALTER TABLE `order_delivery_group_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_box_id` (`order_box_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `order_logs`
--
ALTER TABLE `order_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_priorities`
--
ALTER TABLE `order_priorities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_priority_groups`
--
ALTER TABLE `order_priority_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_sos`
--
ALTER TABLE `order_sos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_status_changes`
--
ALTER TABLE `order_status_changes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners_group`
--
ALTER TABLE `partners_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners_group_history`
--
ALTER TABLE `partners_group_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_history`
--
ALTER TABLE `partner_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_paying`
--
ALTER TABLE `partner_paying`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_paying_sort`
--
ALTER TABLE `partner_paying_sort`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_phone`
--
ALTER TABLE `partner_phone`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_type`
--
ALTER TABLE `partner_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partner_type_list`
--
ALTER TABLE `partner_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `paying`
--
ALTER TABLE `paying`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `paying_methods`
--
ALTER TABLE `paying_methods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `paying_types`
--
ALTER TABLE `paying_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `priorities_group_system`
--
ALTER TABLE `priorities_group_system`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `priorities_system`
--
ALTER TABLE `priorities_system`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_boxes`
--
ALTER TABLE `product_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_box_items`
--
ALTER TABLE `product_box_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_box_item_products`
--
ALTER TABLE `product_box_item_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_group_list`
--
ALTER TABLE `product_group_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_type_list`
--
ALTER TABLE `product_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refund_files`
--
ALTER TABLE `refund_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refund_file_list`
--
ALTER TABLE `refund_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `refuse_comments`
--
ALTER TABLE `refuse_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `return_types`
--
ALTER TABLE `return_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sale_categories`
--
ALTER TABLE `sale_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sale_type`
--
ALTER TABLE `sale_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sale_type_history`
--
ALTER TABLE `sale_type_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sell_files`
--
ALTER TABLE `sell_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sell_file_list`
--
ALTER TABLE `sell_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sell_paying`
--
ALTER TABLE `sell_paying`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shift_info`
--
ALTER TABLE `shift_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `site_config`
--
ALTER TABLE `site_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `site_config_history`
--
ALTER TABLE `site_config_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transfer_files`
--
ALTER TABLE `transfer_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transfer_file_list`
--
ALTER TABLE `transfer_file_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translate_groups`
--
ALTER TABLE `translate_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user-settings`
--
ALTER TABLE `user-settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user-settings-table`
--
ALTER TABLE `user-settings-table`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_s2s`
--
ALTER TABLE `users_s2s`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_s2s_history`
--
ALTER TABLE `users_s2s_history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `warehouse_list`
--
ALTER TABLE `warehouse_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `write_off_files`
--
ALTER TABLE `write_off_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `write_off_file_list`
--
ALTER TABLE `write_off_file_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `back_files`
--
ALTER TABLE `back_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `back_file_list`
--
ALTER TABLE `back_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `calculation_files`
--
ALTER TABLE `calculation_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `calculation_file_list`
--
ALTER TABLE `calculation_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `call_priorities`
--
ALTER TABLE `call_priorities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `call_priorities_list`
--
ALTER TABLE `call_priorities_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cashregisters`
--
ALTER TABLE `cashregisters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `client_history`
--
ALTER TABLE `client_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `client_paying`
--
ALTER TABLE `client_paying`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `client_phone`
--
ALTER TABLE `client_phone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `color_system`
--
ALTER TABLE `color_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cron`
--
ALTER TABLE `cron`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `expenses_filtre`
--
ALTER TABLE `expenses_filtre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `expenses_type`
--
ALTER TABLE `expenses_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `get_files`
--
ALTER TABLE `get_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `get_file_list`
--
ALTER TABLE `get_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `invoice_files`
--
ALTER TABLE `invoice_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `invoice_files_product`
--
ALTER TABLE `invoice_files_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notifications_system`
--
ALTER TABLE `notifications_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_box_info`
--
ALTER TABLE `order_box_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_collection_time`
--
ALTER TABLE `order_collection_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_delivery_date_history`
--
ALTER TABLE `order_delivery_date_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_delivery_groups`
--
ALTER TABLE `order_delivery_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_delivery_group_list`
--
ALTER TABLE `order_delivery_group_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_logs`
--
ALTER TABLE `order_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_priorities`
--
ALTER TABLE `order_priorities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_priority_groups`
--
ALTER TABLE `order_priority_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_sos`
--
ALTER TABLE `order_sos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_status_changes`
--
ALTER TABLE `order_status_changes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partners_group`
--
ALTER TABLE `partners_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partners_group_history`
--
ALTER TABLE `partners_group_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_history`
--
ALTER TABLE `partner_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_paying`
--
ALTER TABLE `partner_paying`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_paying_sort`
--
ALTER TABLE `partner_paying_sort`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_phone`
--
ALTER TABLE `partner_phone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_type`
--
ALTER TABLE `partner_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `partner_type_list`
--
ALTER TABLE `partner_type_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `paying`
--
ALTER TABLE `paying`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `paying_methods`
--
ALTER TABLE `paying_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `paying_types`
--
ALTER TABLE `paying_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `priorities_group_system`
--
ALTER TABLE `priorities_group_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `priorities_system`
--
ALTER TABLE `priorities_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_boxes`
--
ALTER TABLE `product_boxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_box_items`
--
ALTER TABLE `product_box_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_box_item_products`
--
ALTER TABLE `product_box_item_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_group_list`
--
ALTER TABLE `product_group_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_subcategories`
--
ALTER TABLE `product_subcategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_type_list`
--
ALTER TABLE `product_type_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `refund_files`
--
ALTER TABLE `refund_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `refund_file_list`
--
ALTER TABLE `refund_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `refuse_comments`
--
ALTER TABLE `refuse_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `return_types`
--
ALTER TABLE `return_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sale_categories`
--
ALTER TABLE `sale_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sale_type`
--
ALTER TABLE `sale_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sale_type_history`
--
ALTER TABLE `sale_type_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sell_files`
--
ALTER TABLE `sell_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sell_file_list`
--
ALTER TABLE `sell_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sell_paying`
--
ALTER TABLE `sell_paying`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shift_info`
--
ALTER TABLE `shift_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `site_config`
--
ALTER TABLE `site_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `site_config_history`
--
ALTER TABLE `site_config_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `states`
--
ALTER TABLE `states`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transfer_files`
--
ALTER TABLE `transfer_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transfer_file_list`
--
ALTER TABLE `transfer_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `translate_groups`
--
ALTER TABLE `translate_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user-settings`
--
ALTER TABLE `user-settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user-settings-table`
--
ALTER TABLE `user-settings-table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_s2s`
--
ALTER TABLE `users_s2s`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_s2s_history`
--
ALTER TABLE `users_s2s_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `warehouse_list`
--
ALTER TABLE `warehouse_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `write_off_files`
--
ALTER TABLE `write_off_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `write_off_file_list`
--
ALTER TABLE `write_off_file_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
