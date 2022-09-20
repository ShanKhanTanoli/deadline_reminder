-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 05:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deadline_reminder`
--

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'usd', 'United States', '7xozEkmO4D', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(2, 'eur', 'Europe', 'ueruHRz9YC', '2022-09-20 08:05:04', '2022-09-20 08:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `subscription_id`, `user_id`, `name`, `email`, `number`, `address`, `note`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 'customer1', 'customer1@customer.com', NULL, 'This is Address', 'This is a Note', '6QIJ3USEVOG5856CBYIE', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(2, NULL, 2, 'customer2', 'customer2@customer.com', NULL, 'This is Address', 'This is a Note', 'WDTVQOFVHETSAEJSRLWJ', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(3, NULL, 2, 'customer3', 'customer3@customer.com', NULL, 'This is Address', 'This is a Note', 'QRTGNSVZASTYRXXCLVDX', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(4, NULL, 2, 'customer4', 'customer4@customer.com', NULL, 'This is Address', 'This is a Note', 'UFZYMSYTQQJFCU9RXFIZ', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(5, NULL, 2, 'customer5', 'customer5@customer.com', NULL, 'This is Address', 'This is a Note', 'NTBIS7XFFWLFKXIVKTLO', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(6, NULL, 2, 'customer6', 'customer6@customer.com', NULL, 'This is Address', 'This is a Note', 'YKLWLKKEF5XU3XJCR7AQ', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(7, NULL, 2, 'customer7', 'customer7@customer.com', NULL, 'This is Address', 'This is a Note', 'QDKIZMGABYUEHQDVZHA5', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(8, NULL, 2, 'customer8', 'customer8@customer.com', NULL, 'This is Address', 'This is a Note', 'JJH9RMDXNKSVMY4YFKY0', '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(9, NULL, 2, 'customer9', 'customer9@customer.com', NULL, 'This is Address', 'This is a Note', 'XWYS5JUIRPI5LOZJ3GLY', '2022-09-20 08:05:04', '2022-09-20 08:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `deadlines`
--

CREATE TABLE `deadlines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `renew_state` enum('to_renew','waiting_cash','renewed','deleted') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_renew` enum('domain','hosting','hosting_email','wpml','privacy_cookie','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder` enum('30_days_before','60_days_before') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deadlines`
--

INSERT INTO `deadlines` (`id`, `subscription_id`, `user_id`, `customer_id`, `name`, `date`, `amount`, `renew_state`, `type_of_renew`, `note`, `private_note`, `reminder`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 1, 'Deadline1', '2022-02-11', 52, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'VCUMFAOMFVKRGQ0NP9LP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(2, NULL, 2, 1, 'Deadline2', '2022-03-12', 48, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'SVBEQ9GQT29TW1AEJF1U', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(3, NULL, 2, 1, 'Deadline3', '2022-02-01', 25, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'WNR4IBMDBPYWBARLRZTN', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(4, NULL, 2, 1, 'Deadline4', '2022-03-21', 20, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'VRDZSM60XIREFTSFFTVU', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(5, NULL, 2, 1, 'Deadline5', '2022-02-09', 88, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NTUGRNBS0LZTU6MG8GL7', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(6, NULL, 2, 1, 'Deadline6', '2022-03-28', 87, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'SNIYYAPH6XWHLWVEWKLS', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(7, NULL, 2, 2, 'Deadline1', '2022-02-19', 48, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '15AH2PD0HUGVZICLCPZP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(8, NULL, 2, 2, 'Deadline2', '2022-02-23', 36, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '88X6K2ZFHEBBAWFAROQB', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(9, NULL, 2, 2, 'Deadline3', '2022-03-04', 64, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'ZVQC3NYZKC8TH5XMSDJN', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(10, NULL, 2, 2, 'Deadline4', '2022-02-05', 32, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CDCGI2MLLNFIE71EHC7B', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(11, NULL, 2, 2, 'Deadline5', '2022-03-12', 99, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'V6JVZSBU8UVB4CUFHHEP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(12, NULL, 2, 2, 'Deadline6', '2022-03-09', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'D2NWXQQI1MFIQITH24XJ', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(13, NULL, 2, 3, 'Deadline1', '2022-03-04', 81, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'WPVRWGY3FI5TYICVPBOU', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(14, NULL, 2, 3, 'Deadline2', '2022-02-11', 37, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NKXXFYMILCT6UQIGG4F1', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(15, NULL, 2, 3, 'Deadline3', '2022-03-10', 94, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'S9FSSS9JVKGHCEFNVTZX', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(16, NULL, 2, 3, 'Deadline4', '2022-02-09', 35, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'TXA7RCLQQ6PPEVWFVHJL', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(17, NULL, 2, 3, 'Deadline5', '2022-03-27', 33, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '3CPAU2JE4WX2URHSRIB8', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(18, NULL, 2, 3, 'Deadline6', '2022-03-03', 78, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'UWKS0O7K50LFHOVBG56X', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(19, NULL, 2, 4, 'Deadline1', '2022-02-04', 53, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'I3USAWNLPWDAXAVOOHSM', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(20, NULL, 2, 4, 'Deadline2', '2022-02-14', 77, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'IGBRU9RLSOLGIN4GQRVB', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(21, NULL, 2, 4, 'Deadline3', '2022-02-09', 63, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '60APIOXMXBFBCPSCCRTV', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(22, NULL, 2, 4, 'Deadline4', '2022-03-06', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'L7UP2511STFSNHP9UQP0', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(23, NULL, 2, 4, 'Deadline5', '2022-03-22', 10, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '2IFQ0HFAUEYYBFWCIUPP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(24, NULL, 2, 4, 'Deadline6', '2022-02-13', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'HPTWHZLNKGW0EQRVFGNF', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(25, NULL, 2, 4, 'Deadline7', '2022-02-24', 91, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '04KERIZM8JJJHMRPPTCR', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(26, NULL, 2, 4, 'Deadline8', '2022-02-01', 97, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'QDY9SPRTLHZTDPPLIUDO', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(27, NULL, 2, 5, 'Deadline1', '2022-02-11', 42, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'E4XCCNXVWEVZQEHCQEAP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(28, NULL, 2, 5, 'Deadline2', '2022-03-22', 69, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CF0TE0QDNAQHHBKBYJMS', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(29, NULL, 2, 5, 'Deadline3', '2022-02-06', 23, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'HP0BCJM8DLFP216EAMPL', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(30, NULL, 2, 5, 'Deadline4', '2022-02-27', 46, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '8ZADTMALZZXOMKCWKA6P', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(31, NULL, 2, 5, 'Deadline5', '2022-02-04', 23, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'DVYCCAE9WHMPO8YZYILU', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(32, NULL, 2, 6, 'Deadline1', '2022-03-25', 13, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'ZRS9PTGAQHYSIUWXXWTN', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(33, NULL, 2, 6, 'Deadline2', '2022-03-24', 96, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'EO64OPJRYO34MIGOIVWQ', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(34, NULL, 2, 6, 'Deadline3', '2022-03-25', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'PMY8I8F6Y1SPCS5TIXPC', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(35, NULL, 2, 6, 'Deadline4', '2022-02-01', 71, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CIR8ICQ22QO8GZ4VBJ53', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(36, NULL, 2, 7, 'Deadline1', '2022-03-13', 68, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KVUFEVULDDB52FXIQGNP', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(37, NULL, 2, 7, 'Deadline2', '2022-03-09', 80, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CGICHOIMBHHR2WZZLUEY', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(38, NULL, 2, 7, 'Deadline3', '2022-03-11', 78, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'Z0CBGWLJIKBGLZLWXPZ2', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(39, NULL, 2, 7, 'Deadline4', '2022-02-11', 83, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'GV79OT9SSIJVQKNDNCGR', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(40, NULL, 2, 8, 'Deadline1', '2022-02-24', 26, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'O6PLS5NUCACCAU2EIS2A', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(41, NULL, 2, 8, 'Deadline2', '2022-02-14', 55, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'WUHAZZS5CJXCPR62NR02', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(42, NULL, 2, 8, 'Deadline3', '2022-02-09', 77, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'BOYBHWD5FYRQIRALKNUZ', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(43, NULL, 2, 8, 'Deadline4', '2022-03-06', 98, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'YYC967QHT9CHLNQN4BKK', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(44, NULL, 2, 8, 'Deadline5', '2022-03-15', 99, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'SBT8CXLABZC2J4VWABUN', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(45, NULL, 2, 8, 'Deadline6', '2022-03-10', 74, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'RJX854G6VQUXPNDDLLUH', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(46, NULL, 2, 8, 'Deadline7', '2022-02-04', 42, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '08GMXFYMYPJQT5UXDCOX', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(47, NULL, 2, 8, 'Deadline8', '2022-03-01', 13, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'WY6ODORDQADZZWZXGMYY', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(48, NULL, 2, 9, 'Deadline1', '2022-02-01', 15, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'YOOX5Q324DIXRIGUQBEO', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(49, NULL, 2, 9, 'Deadline2', '2022-02-15', 45, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'JFSKAD2MEOIUZNPJJQSY', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(50, NULL, 2, 9, 'Deadline3', '2022-03-23', 41, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'UMLPQQRVJC9JCHSP1SLR', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(51, NULL, 2, 9, 'Deadline4', '2022-03-12', 48, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'L4OBC2BSJIZJHAUQVDXN', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(52, NULL, 2, 9, 'Deadline5', '2022-03-07', 79, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NZ39DJOH0IXJ9BUGJLXD', '2022-09-20 08:05:05', '2022-09-20 08:05:05'),
(53, NULL, 2, 9, 'Deadline6', '2022-03-21', 71, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'LUXYAJKPICJJF3NHILFZ', '2022-09-20 08:05:05', '2022-09-20 08:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `deadline_chronologies`
--

CREATE TABLE `deadline_chronologies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deadline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `renew_state` enum('to_renew','waiting_cash','renewed','deleted') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_renew` enum('domain','hosting','hosting_email','wpml','privacy_cookie','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder` enum('30_days_before','60_days_before') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2021_11_24_201631_create_stripe_configurations_table', 1),
(9, '2022_04_13_041510_create_currencies_table', 1),
(10, '2022_04_17_185829_create_settings_table', 1),
(11, '2022_04_22_231511_create_user_business_details_table', 1),
(12, '2022_04_26_184206_create_customers_table', 1),
(13, '2022_04_26_184225_create_deadlines_table', 1),
(14, '2022_04_28_180101_create_deadline_chronologies_table', 1),
(15, '2022_05_30_183710_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `company_name`, `company_logo`, `company_email`, `company_phone`, `company_address`, `currency_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(2, 2, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(3, 3, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(4, 4, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(5, 5, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(6, 6, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(7, 7, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(8, 8, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(9, 9, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(10, 10, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(11, 11, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(12, 12, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(13, 13, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(14, 14, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(15, 15, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(16, 16, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(17, 17, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(18, 18, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(19, 19, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(20, 20, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(21, 21, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(22, 22, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(23, 23, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(24, 24, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(25, 25, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(26, 26, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(27, 27, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(28, 28, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(29, 29, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(30, 30, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(31, 31, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(32, 32, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(33, 33, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(34, 34, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(35, 35, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(36, 36, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(37, 37, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(38, 38, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(39, 39, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(40, 40, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(41, 41, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(42, 42, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(43, 43, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(44, 44, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(45, 45, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(46, 46, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(47, 47, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(48, 48, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(49, 49, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(50, 50, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(51, 51, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(52, 52, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(53, 53, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(54, 54, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(55, 55, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(56, 56, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(57, 57, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(58, 58, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(59, 59, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(60, 60, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(61, 61, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(62, 62, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(63, 63, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(64, 64, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(65, 65, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(66, 66, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(67, 67, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(68, 68, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(69, 69, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(70, 70, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(71, 71, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(72, 72, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(73, 73, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(74, 74, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(75, 75, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(76, 76, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(77, 77, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(78, 78, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(79, 79, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(80, 80, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(81, 81, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(82, 82, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(83, 83, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(84, 84, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(85, 85, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(86, 86, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(87, 87, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(88, 88, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(89, 89, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(90, 90, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(91, 91, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(92, 92, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(93, 93, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(94, 94, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(95, 95, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(96, 96, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(97, 97, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(98, 98, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(99, 99, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `stripe_configurations`
--

CREATE TABLE `stripe_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `public_key` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` enum('test','live') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stripe_configurations`
--

INSERT INTO `stripe_configurations` (`id`, `public_key`, `secret_key`, `payment_mode`, `created_at`, `updated_at`) VALUES
(1, 'pk_test_yKF28OfsGchVLbr4FmAH8x61002zuh3083', 'sk_test_sQJFDUoOy3WAqtUupBH9V5aM00zebNYJaP', 'test', '2022-09-20 08:05:04', '2022-09-20 08:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_business_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `avatar`, `name`, `user_name`, `email`, `email_verified_at`, `number`, `password`, `role`, `role_id`, `slug`, `parent_business_id`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, NULL, 'admin', 'admin', 'admin@admin.com', NULL, '434439524364', '$2y$10$t2ac7p8kFPYSeEhU.kE23.TC5zu4E4u9ISqC/FosQJgnaoPZQjqb6', 'admin', '1', '3F913BXGCUTFQCNIYYXE', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(2, NULL, 'user1', 'user1', 'user1@user.com', NULL, '377497674069', '$2y$10$Zrb3Bkbi3Pd/xt98oiQ1j.iTyjv3i7F1hOkxsV/SoYMPLXGdPyw3.', 'user', '2', '2JVUG5WT5BR2E1ZZQG1O', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(3, NULL, 'user2', 'user2', 'user2@user.com', NULL, '997007782035', '$2y$10$GLuZR4s0.FjeDRRTlU.BNuMZiM1cTuiuq.Le9us4LlguPy0m1Jl.K', 'user', '2', 'DQVFVWC8A1FCTHI8GTMK', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(4, NULL, 'user3', 'user3', 'user3@user.com', NULL, '848228814801', '$2y$10$IQEV98vs7bD7Es.eRUxsmOUcfY8lfk/iAod8MzbSJCVT5GR.Ds4He', 'user', '2', 'BKSJL4QXWQEFECDGDOPD', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(5, NULL, 'user4', 'user4', 'user4@user.com', NULL, '545980201165', '$2y$10$RWlKg6V53jkfFMPIH1xxY.BRvrfQvEHcKo3ZJTyBbEwb2x8YCToz2', 'user', '2', 'P91PYIFSXORLDLGXZOA4', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(6, NULL, 'user5', 'user5', 'user5@user.com', NULL, '311185661693', '$2y$10$dB/wxbBRLwPRVWxsw5GJvOZmUKP5AVZM7Jv9Va.tlfsijOGCx9bTG', 'user', '2', 'TZLKS07DMKBCHN6TL6UY', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(7, NULL, 'user6', 'user6', 'user6@user.com', NULL, '594461791247', '$2y$10$tSL81FtrCMh7nAR45DNYvODhO2zwaSMvyEiEVatM5y/tEwPCpS6.e', 'user', '2', 'OOSKVCPSMGFHJFCVJ0TE', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(8, NULL, 'user7', 'user7', 'user7@user.com', NULL, '680432144907', '$2y$10$JFE.qDktMZ7zwBnBAEo1NueeLwBr5XzrwBqgYMQlW6u7ku7eQSrdW', 'user', '2', 'UO49J0VC1S0U1K4AFYYT', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(9, NULL, 'user8', 'user8', 'user8@user.com', NULL, '832633224019', '$2y$10$3SjNyDg2QXz5w1e5sbsewOXAgpbv9FyDQV1bxO3taYKXE8FpiydGS', 'user', '2', 'UCFSJTO0WUJO0PJLB2L6', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(10, NULL, 'user9', 'user9', 'user9@user.com', NULL, '274883392737', '$2y$10$QrkMxwdPaavSZE6gL4Hzl./gQebVvX0AJ4cO88TKEUeU3ccvnKURC', 'user', '2', 'CA0LZBQOW2Q9BIFDRFB8', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(11, NULL, 'user10', 'user10', 'user10@user.com', NULL, '566869558936', '$2y$10$oSD7DTypUDJprgQHi45DPOh1XmSGyWGxvX7lrRzaFnjf450Ae/eGS', 'user', '2', 'K6SE3H85WXCZ3T2AWTIA', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(12, NULL, 'user11', 'user11', 'user11@user.com', NULL, '270095104754', '$2y$10$xyeQY/xo9kYw/a66LC3m1.nzUFMk2l5HyZiUZD5nPahQh02NmtDmy', 'user', '2', 'LWJFMZLWAVYEUPKCJN0E', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(13, NULL, 'user12', 'user12', 'user12@user.com', NULL, '195493806274', '$2y$10$STHvBfOU3n5xkSGfHtQqz.idWuAXbdhYeZ9ljszgWkXPzh8qz/Iqi', 'user', '2', 'B8QLJ7PVNQRQV6HJZTZ1', NULL, NULL, '2022-09-20 08:04:56', '2022-09-20 08:04:56', NULL, NULL, NULL, NULL),
(14, NULL, 'user13', 'user13', 'user13@user.com', NULL, '638669189736', '$2y$10$wmTIrmfUjEspCuSlAuJen.Q5gCP4mgX23.WOwS7h3B0Q5shwHE.OO', 'user', '2', 'HIWL6TXU840V5MRDIZCC', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(15, NULL, 'user14', 'user14', 'user14@user.com', NULL, '490301267886', '$2y$10$P0mVOp76Ur6PwqHyDSfD/uFS1SdAQjBl6TkS0OuJFHW6wRyIoQw.y', 'user', '2', 'Q7IPGCVK62BFVJHYRCBH', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(16, NULL, 'user15', 'user15', 'user15@user.com', NULL, '487353866929', '$2y$10$8Xk0qrfVy3E7cEoj/lCtzeJhvHjyUGjkCmEr2Ye8/4NFsjSNLLDqe', 'user', '2', '8XMAMHT9ZMVBWVG3Z0Y5', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(17, NULL, 'user16', 'user16', 'user16@user.com', NULL, '307885314895', '$2y$10$/eSPk0Pls5514Io41ZsZrebBMpB33mw.d.4KVKWaJpsaKAgyE7Gym', 'user', '2', 'TBHVOAZEIE1AHZWKOVDN', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(18, NULL, 'user17', 'user17', 'user17@user.com', NULL, '700115171604', '$2y$10$rKe5oit.HBn8D2vYEen.yeLAB8S00QqIKNBccVLtr2bZy9LTHQbfK', 'user', '2', 'PAQMLWH7SYBKIYT87BEQ', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(19, NULL, 'user18', 'user18', 'user18@user.com', NULL, '887087123629', '$2y$10$gkUjodoJk0V1Xsa6YBK94.2N/1qOFRRqtLV.5L/8xw2D0ghZ09l6q', 'user', '2', 'MIQ6KBOOS3KBTDEJAH3G', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(20, NULL, 'user19', 'user19', 'user19@user.com', NULL, '186178500941', '$2y$10$2g9GE16Id4rPuFZ3XM2vYOy/dLYTPY6neuw/8YEMfLne1a7uze2.6', 'user', '2', 'WGRJQNURFYNGPZQ6BX4Z', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(21, NULL, 'user20', 'user20', 'user20@user.com', NULL, '712306791577', '$2y$10$pY8bqjG2v3xyDcXxNmcElejN8NA.eLBsJxv718ZWYjIuTAYlXhSuS', 'user', '2', 'V7INIEODDUFQOG73K6YS', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(22, NULL, 'user21', 'user21', 'user21@user.com', NULL, '542123596355', '$2y$10$eSeRSC4dcV1PmC6W7qkfhudW.B5ykJ0dU/lrulzmiRq3OpmP8FUwO', 'user', '2', 'VJGHRTTWVZTSAMRNTTIR', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(23, NULL, 'user22', 'user22', 'user22@user.com', NULL, '660255376159', '$2y$10$auJjW/o4bFLUEHqDbtyIk.C4DbHqcXyFYZHs.8fczDSba2VFbrl1e', 'user', '2', 'FNBMV4W6JEFCEE5UVEMZ', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(24, NULL, 'user23', 'user23', 'user23@user.com', NULL, '403470837566', '$2y$10$NUy0PBeycj.Mpacf5qtMZ.0eVSvkEXY5pXSodTaYwfeJQj2DDf4.6', 'user', '2', 'FIC8BIY5C405SGNXW8RC', NULL, NULL, '2022-09-20 08:04:57', '2022-09-20 08:04:57', NULL, NULL, NULL, NULL),
(25, NULL, 'user24', 'user24', 'user24@user.com', NULL, '602758035863', '$2y$10$qoeOjq2berWt/lYHmxXo5.YKbfqOOH7OCvUzXJuL3Sv5L/MEHMMD2', 'user', '2', 'UWCOY6ZSPEPO7EXTICZN', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(26, NULL, 'user25', 'user25', 'user25@user.com', NULL, '549030756252', '$2y$10$959SH3lXA6ld7xA8f6Z6lecaUDB2i8CBxRPgEU/Hx0Yjbm7IeC0fy', 'user', '2', '4MZ06ACOHLPBB9NDOMSY', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(27, NULL, 'user26', 'user26', 'user26@user.com', NULL, '741846078532', '$2y$10$.y7iGZbVMJphMrr4GFO76eHIAvKw.qi8VAMxIhOlo7UlvoAr9uCEO', 'user', '2', 'XFHLZMT08NXWTDU1NKDD', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(28, NULL, 'user27', 'user27', 'user27@user.com', NULL, '913378759434', '$2y$10$EcN8r9OzwCNUL3m8uKaUG.LJI9FU9T7d8AHWkga6jrFMwzrIwt2ay', 'user', '2', '4MMD9JYR7KSJKX95OAP6', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(29, NULL, 'user28', 'user28', 'user28@user.com', NULL, '660085559980', '$2y$10$bBXRiRtI.naH17CaZ9Aln.mA6wSwZqA2.aW6xElSKgxm5uDNopjo.', 'user', '2', 'OHHJGNRBVYGUNRK9IJUX', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(30, NULL, 'user29', 'user29', 'user29@user.com', NULL, '368165291423', '$2y$10$dJzSnp4pGQzF//ExvSY8XOvbjldoYGPv9duhWlIP1F3s2OmCjTW2W', 'user', '2', '80JWUPUQ4FRDQHNDYJAB', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(31, NULL, 'user30', 'user30', 'user30@user.com', NULL, '996723697151', '$2y$10$PSByBIPAf6J/osqmpV88JeXUlZfUv13wY8WF5WMnhI0.Uf5DiPWcu', 'user', '2', 'O4U0PHTGKLINFAN8SVGN', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(32, NULL, 'user31', 'user31', 'user31@user.com', NULL, '206514450370', '$2y$10$5WCPtfBthp3Zf9OnIvqA1eN7m75Tj0csXhZa.a34xuV1NEX0/p3S2', 'user', '2', '25WKRVK6VBMJAXA9ISXT', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(33, NULL, 'user32', 'user32', 'user32@user.com', NULL, '466350651484', '$2y$10$zHe2n9n4ah/sGhOJVTJ2ROjElcjc/qXOk9QqgeH80NsvnDwwFg6XO', 'user', '2', 'ZWXRSWTDRX5SQBFGTWVN', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(34, NULL, 'user33', 'user33', 'user33@user.com', NULL, '466431575577', '$2y$10$2qoFx9lPhpVlUb6J/G8jBu.FxmWuucc/VLrYbIN2vECBRVL.FnVOW', 'user', '2', '1QF9ZBYNEEVZEMMWVAQ2', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(35, NULL, 'user34', 'user34', 'user34@user.com', NULL, '681251145403', '$2y$10$uumtBdvJE8XdswdwgnGNWukdcppavkTLqQ3VhIHgcluWhhNN5v1Ru', 'user', '2', '95GSKBGXOJO5SUHJ1DFI', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(36, NULL, 'user35', 'user35', 'user35@user.com', NULL, '474721100146', '$2y$10$5d1iSzsfRGAuOMIlK9mmtOjioak6SoQXka.8w6w/2VfsmSeh/c/TK', 'user', '2', 'ENRAPRNUGIQAKCZULQDR', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(37, NULL, 'user36', 'user36', 'user36@user.com', NULL, '976362942004', '$2y$10$LL3VExSWf/Xjo76.SP9g7uTTnNcGyWzXQe87DhnplCLe/BbXZZ16i', 'user', '2', '0B0T8ATZU5GNTM53VAJK', NULL, NULL, '2022-09-20 08:04:58', '2022-09-20 08:04:58', NULL, NULL, NULL, NULL),
(38, NULL, 'user37', 'user37', 'user37@user.com', NULL, '142312021697', '$2y$10$qCQjZPRhXBqy7t7FkdgztOiBuXM22.TBR4Pan40yGacCtt3/NM.oy', 'user', '2', 'ZYIPI0SVEDGQ3THJEXFC', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(39, NULL, 'user38', 'user38', 'user38@user.com', NULL, '298061096225', '$2y$10$VyKo/3F7eOsIwK6rg7NXKO.4Exx38kicr1WU5p.pdlJuw8wv4WrWa', 'user', '2', 'RTNFNVJSVXUDFRKAIWZI', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(40, NULL, 'user39', 'user39', 'user39@user.com', NULL, '568238780843', '$2y$10$ISKCTmgkOHJC8kjcQ1TGRuQybcAfea2XpRLuUbMAPbCA.1Y.CDmtS', 'user', '2', 'NRROGIKLGEMLWDAMGCMM', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(41, NULL, 'user40', 'user40', 'user40@user.com', NULL, '945108629019', '$2y$10$dCRo5iHeH5he1J5q08pMhuhramqCOXZgymlms41ne8X8.vZwCCHES', 'user', '2', 'GFS8NNL4BQOVIMPDGGE2', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(42, NULL, 'user41', 'user41', 'user41@user.com', NULL, '466662502378', '$2y$10$SPg/ZF4qVY1ysxwM4K3K8ulfUCMmqcgndxTg0rrnRGrMHaVRSyG5S', 'user', '2', 'HKVQY9LEXDHSZLOSM0NZ', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(43, NULL, 'user42', 'user42', 'user42@user.com', NULL, '879720242673', '$2y$10$/sGwlzX2aYI4L9mNaYNNMO91ym9zuwEZq6zaf.s8Zd4lC6T/tmb6S', 'user', '2', '0MVU0UZAYRHQVHT9SXSE', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(44, NULL, 'user43', 'user43', 'user43@user.com', NULL, '945435145897', '$2y$10$GLGCdt978mD5ye4/90BnCuoh8rvQzgE8VRA/EJrE1.8ULXRpzP1Wq', 'user', '2', 'DC6QY2LTBAMPDEFFZZXJ', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(45, NULL, 'user44', 'user44', 'user44@user.com', NULL, '578314576609', '$2y$10$YS9FsJ6S1bIifI7jn83FyOfY56JJsasyQCAgCqADI0yEqLgLtn6NW', 'user', '2', 'NGRLCCAPZLFEIARJT9HQ', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(46, NULL, 'user45', 'user45', 'user45@user.com', NULL, '645331087768', '$2y$10$lIkgfx1u4Fwrj2teZQjywezH2AmHILsWzgbNnbLlpJ4S9arkwLBYK', 'user', '2', '9EVY1MYNWTYYL1MASLYX', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(47, NULL, 'user46', 'user46', 'user46@user.com', NULL, '650895697116', '$2y$10$uzRr4whcmMN8Ew/Dcz0o2ur7zyA4NbZdkkTDCH8Xq65d8bF6TFwl2', 'user', '2', 'F67OS5FLTQXCTMSIOG1S', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(48, NULL, 'user47', 'user47', 'user47@user.com', NULL, '830994984366', '$2y$10$XIo6HMtq9uqlAXB7EcPmjOqCiPHP00Vw3PAGiA8H1mIzotR.xqEwy', 'user', '2', 'JZBUZHN3IPTCJGFRDBJ5', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(49, NULL, 'user48', 'user48', 'user48@user.com', NULL, '791344781273', '$2y$10$5DkoVzn7PnhYyQefoQMeXu5CGVzSaw/XDGdhVDjgAKRUrgDtzwte6', 'user', '2', 'YSLLMHPYYBSBQF8JYEKT', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(50, NULL, 'user49', 'user49', 'user49@user.com', NULL, '431737990883', '$2y$10$Ye8HeSlAvIaJuz93Xx.ODeM1vZpSJOgsf5ZN8IoWP8dA85GdOWUBK', 'user', '2', 'MRWDXPM5ETYMAO9WNYPS', NULL, NULL, '2022-09-20 08:04:59', '2022-09-20 08:04:59', NULL, NULL, NULL, NULL),
(51, NULL, 'user50', 'user50', 'user50@user.com', NULL, '401884950702', '$2y$10$4e2GEKHAaEQQEHjT9dFYZeH9V6.5TURZ6dvk3UXI337VVAV.8Tv4C', 'user', '2', 'MESRWF0RNKGNPWUAAEFS', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(52, NULL, 'user51', 'user51', 'user51@user.com', NULL, '902176175805', '$2y$10$JE/kzwbF0AD.SkYCKpWPjO1eyO/KL3PK1LQ7g6r7ZRmeuzJvcF1IC', 'user', '2', 'MD6TASVIWXZQJHDVODUE', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(53, NULL, 'user52', 'user52', 'user52@user.com', NULL, '879353426470', '$2y$10$ejUGLF1GRG2idOeNpdxYEuWZtfM4Royzh/6RwNrer55sReCuJ8y62', 'user', '2', 'JXOFAZ4ZYN6PVGZ7CJIA', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(54, NULL, 'user53', 'user53', 'user53@user.com', NULL, '454701107707', '$2y$10$5QcBUsuyhCesXAz/HzMp4edhiBp04y5VU/HxOo7r3II5eRFhb1aYe', 'user', '2', 'G9PARJEJ6DMQMDTOX5C1', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(55, NULL, 'user54', 'user54', 'user54@user.com', NULL, '788421481351', '$2y$10$f48l451Gsed3XvTK9c3QpuGLZJb.qlA7eUahLUIM8Phw7gpDFFXXO', 'user', '2', 'UHJAIZZDABCR2NE9H6LU', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(56, NULL, 'user55', 'user55', 'user55@user.com', NULL, '892129720754', '$2y$10$ZL7s4Pv6bx1yBWTx5CXvLO0L62gI8JqUqPeD8bzWnqgSrsDHHkNce', 'user', '2', 'CLZDLEKBSLUHDSZSH7QK', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(57, NULL, 'user56', 'user56', 'user56@user.com', NULL, '532187513582', '$2y$10$e4Pl9smRBnRSfCbh6.ysZeWEpzKpXZTtmSPgsfWR5qaUXecONkVwy', 'user', '2', 'DRUCPM4EBDSKJDU8SKRR', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(58, NULL, 'user57', 'user57', 'user57@user.com', NULL, '158446415598', '$2y$10$D0rB8QuvErDkxTVs/7X94eVA8VRTVkhwJgYX6Td/uckaBbgbdtmo.', 'user', '2', 'PDHQPHYUI1OJHWMJZDUQ', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(59, NULL, 'user58', 'user58', 'user58@user.com', NULL, '214210882290', '$2y$10$cnopc27IKGVfbGeBrg5Couixv/okbRljJwtFjKvdKD69YPHcc8Aie', 'user', '2', 'ZM92NIXZCSL8FAEG7PXL', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(60, NULL, 'user59', 'user59', 'user59@user.com', NULL, '455352255042', '$2y$10$3yGB8wT6it4h9gNxWGYsDOYq7SOJ1fdi3ItrJFds4xbDBj4Onaqu2', 'user', '2', 'REWRO8EBQNXSWIVXAGRL', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(61, NULL, 'user60', 'user60', 'user60@user.com', NULL, '721582938551', '$2y$10$yFSjNIFI3FtQaa68rsbRbOD2mpr1e1tcjuSgpIE1fguUc7YqvXecC', 'user', '2', 'LWOHP81WSNUXDYFYFRM5', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(62, NULL, 'user61', 'user61', 'user61@user.com', NULL, '141291645833', '$2y$10$X1swImqhloFnc21OoSl9MuziPmPS78UNb//Uj1RfsN4UKftocP9KG', 'user', '2', 'EDOVILMN5SD84YO1UF1P', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(63, NULL, 'user62', 'user62', 'user62@user.com', NULL, '866747615913', '$2y$10$vX1ruN5bKQ.lSsIDrqSecuHvy5c8p1Pb0uWylBSG6SrPX5XeUn0/e', 'user', '2', 'JXAXVSRE816CPVHFXTYV', NULL, NULL, '2022-09-20 08:05:00', '2022-09-20 08:05:00', NULL, NULL, NULL, NULL),
(64, NULL, 'user63', 'user63', 'user63@user.com', NULL, '695205547994', '$2y$10$S0YNxulMGxqyf1sdiX3Md.obcdWX7f3OdwWEi41E1o9e8qcT71MCa', 'user', '2', '6UQUESLLMWJL1ASN4LHH', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(65, NULL, 'user64', 'user64', 'user64@user.com', NULL, '182452461798', '$2y$10$QmziU3ywuxicegugnP53xOKDL74KkQpcSPJpdqz5IzmHsaaBPglYy', 'user', '2', 'I68VXHIYMVLATDBWKJOQ', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(66, NULL, 'user65', 'user65', 'user65@user.com', NULL, '339467610151', '$2y$10$OtVEIZWss3iuXUlgo5QyvO1rXsBBzU3EqW6vicGT37gaBozLhi3GO', 'user', '2', 'CWRWJ51TSVWZJ40DVMF3', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(67, NULL, 'user66', 'user66', 'user66@user.com', NULL, '746631238566', '$2y$10$AcYf2kJNAPnkp6pmhq3JLu9Q.W/GOJ5rorhsPUF/byo4oGRgv/liy', 'user', '2', '1THBKRDTDFDEJV1YFNCY', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(68, NULL, 'user67', 'user67', 'user67@user.com', NULL, '934032576319', '$2y$10$1Lw/p9OLj0tVr2hi2wb7Je1.X3kjL9.XIxtBXmzPGPz7NRsICEAFK', 'user', '2', 'SIPFBCVNWQ20NCSJCLGM', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(69, NULL, 'user68', 'user68', 'user68@user.com', NULL, '699587698199', '$2y$10$9OirxtG5VymyFRv4nxPc1.K2r4c522WvlRwslANPdeMxPAceZmV2m', 'user', '2', 'FPE18SZW6ZMKOWVPJNXZ', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(70, NULL, 'user69', 'user69', 'user69@user.com', NULL, '493598972519', '$2y$10$.SacQBG44EH2OusWqADiteH8z0A0gsXrreJC8Ox.y2y1LmVKlNPAW', 'user', '2', 'K9L0XSI4E6TRGZFYWG0Z', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(71, NULL, 'user70', 'user70', 'user70@user.com', NULL, '155262667236', '$2y$10$PC1AZzMVwk/xfNOWyRZaKuKskMqw5uYTkB0buR87l76T7K2UykZli', 'user', '2', 'ZY8BSMFPNFUQSULOXCTC', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(72, NULL, 'user71', 'user71', 'user71@user.com', NULL, '399591768249', '$2y$10$KbSiao4h/zo7FPJAAQ2CX.fUjB46fVupuz77M2GHy8NPpCJdlhd/a', 'user', '2', 'JSIN52RIHPTAFZIUKASE', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(73, NULL, 'user72', 'user72', 'user72@user.com', NULL, '336791216333', '$2y$10$6lyZfht1Q9K2r8xEdkczPO/TMb8/UXkZ5xBN10op6ncgKJADnMdfe', 'user', '2', 'TP89HBWRTGQGUMZ4KUR6', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(74, NULL, 'user73', 'user73', 'user73@user.com', NULL, '722916998069', '$2y$10$uOJ4qj0GUj9N1E5bcJtZ7.zsYY/hF9iIetvdw1Szf2TZ.7t7M387q', 'user', '2', 'QHWPEFLGSIFYUG6GJRB8', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(75, NULL, 'user74', 'user74', 'user74@user.com', NULL, '428412180018', '$2y$10$ccKft50T3WGhFojfUktTcO.RaLAerqGihcudGIYN4rBeLuzoqeqSS', 'user', '2', 'XWFAYG6WYXC9QMZWJXFX', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(76, NULL, 'user75', 'user75', 'user75@user.com', NULL, '503871764347', '$2y$10$lEA0etFOWVrNypTEYY9U9uC1xQNFIk9uJmi40zOVgyjx7fiBzfdIm', 'user', '2', 'IFVAJRDFC4WC3COJNBF3', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(77, NULL, 'user76', 'user76', 'user76@user.com', NULL, '451501548453', '$2y$10$DA/6xLP.rPRXA.In8kWLdOTKWK78lwr61584dSzSKc.tbADvgx1hK', 'user', '2', 'PIL9IDKCYMDNFDDWGLLA', NULL, NULL, '2022-09-20 08:05:01', '2022-09-20 08:05:01', NULL, NULL, NULL, NULL),
(78, NULL, 'user77', 'user77', 'user77@user.com', NULL, '182098107363', '$2y$10$wGVPLz1EMv5PpdzhcXDSn.30QBOU2BLYm7uRNXRvDkR.siPDLju/W', 'user', '2', 'I3IK3ZHBJKNDGWAIXL3W', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(79, NULL, 'user78', 'user78', 'user78@user.com', NULL, '562536597627', '$2y$10$wGrRhrrxZEhE8sIw8MeEd.kQSHIpmohPeL3urb50L.7R.5bbaP9P2', 'user', '2', 'DXLYQY1IWSA9M8GUOQRI', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(80, NULL, 'user79', 'user79', 'user79@user.com', NULL, '119124821314', '$2y$10$pYdW7ZVAhyJNZpCFgTON5u9CRZ2ZDF3MyMWUCzBGwYOWiJtfBMkZq', 'user', '2', 'RYAN0LJNQT6QMOYH3LM9', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(81, NULL, 'user80', 'user80', 'user80@user.com', NULL, '204151547370', '$2y$10$4/3N2JMqtoVwJVi1NpJNKeAmVQJBfdr/DTbm0iCizMyzbNhybHvva', 'user', '2', 'PW4LPGGVD7QDRHPQ47BA', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(82, NULL, 'user81', 'user81', 'user81@user.com', NULL, '265567334441', '$2y$10$Qn8ELh8YVdnAoLOYe.JrT.9o4Kt99QE.d.XW1/W8AL/AKZTmQCjdG', 'user', '2', 'CGMIFPNEUEWXT4BN3LHI', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(83, NULL, 'user82', 'user82', 'user82@user.com', NULL, '536882037354', '$2y$10$LlB8DshGy1LgFdI6.5UsJ.lKLkQ3T.JRe9/V/P3Tl7nYVWaP1BqPe', 'user', '2', 'CBOTJ3KYUI6B9I6459BA', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(84, NULL, 'user83', 'user83', 'user83@user.com', NULL, '492014542543', '$2y$10$5aICdRUMwWmIopzSOSm9y.Dw81EruONr7qE7lci/d6vLxuHGqe0fe', 'user', '2', 'DIBQGQWZA0KNWVIA6TCP', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(85, NULL, 'user84', 'user84', 'user84@user.com', NULL, '241726224165', '$2y$10$N2cAvvtaABkxLOOIw8ZHXeWG30kiUjJm5fqHmRaugeDLpu0tdc.iS', 'user', '2', 'SC9LLJHLIPR4GHADC0MM', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(86, NULL, 'user85', 'user85', 'user85@user.com', NULL, '341464363718', '$2y$10$k5npJ0483/oLNSSr9zpC1u23aXIyKoZdW.FXHHLRABgN6eJc4.PEu', 'user', '2', '7TPI1MHFLILTBCQQ4523', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(87, NULL, 'user86', 'user86', 'user86@user.com', NULL, '144587022387', '$2y$10$Z8mZ2ZfvwKpwxKXGVfOJF.DtX/C/A7JLPvJBWmWiAEgXujuynh/YS', 'user', '2', 'ZEDLZPBFPSKZ63HAEYOF', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(88, NULL, 'user87', 'user87', 'user87@user.com', NULL, '536827429557', '$2y$10$0kIy5I9K6mLGKlMQHI6.W.AizEKfVpeSqamt6gUkiJfGhN.YEizkC', 'user', '2', '4NQJWZIMPXSUHRGAHOED', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(89, NULL, 'user88', 'user88', 'user88@user.com', NULL, '226571155946', '$2y$10$W/w9IoUYx5OxOGygsWJDT.Y478Z2GpAMQN5sFlT50LLNI139PWZ1u', 'user', '2', 'EAVOPC8PL236USWZXZPK', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(90, NULL, 'user89', 'user89', 'user89@user.com', NULL, '386220001486', '$2y$10$Lo9jp7WXxb7PX/IsGjn8X.QN0kKLcA4t.UTc6jtk68hq/sDMVf.NW', 'user', '2', 'ZGR8FRJPGEQEEAZ4BYEM', NULL, NULL, '2022-09-20 08:05:02', '2022-09-20 08:05:02', NULL, NULL, NULL, NULL),
(91, NULL, 'user90', 'user90', 'user90@user.com', NULL, '509829411084', '$2y$10$8N7EZOpIGIO4Ygmhu4yRiOBdIzmwg35cVqGNP393aLel.ppbC60/G', 'user', '2', '820QKFCWCIGADNMNG4WV', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(92, NULL, 'user91', 'user91', 'user91@user.com', NULL, '511014212180', '$2y$10$9PC2eqKa3pUCRp.tH2BU.eBuziCMIJ8znEHpdGaIRQFQYFVUwPnHu', 'user', '2', '6RIS7Q2L9GNBBMTUKZ8V', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(93, NULL, 'user92', 'user92', 'user92@user.com', NULL, '358999459283', '$2y$10$SeMM5Z8tmwAshnSIH2Ad2ufPhFUI5.gGXofLnoly47zxNvlgVlRXK', 'user', '2', 'HDLGD3FJM7YV8ANJCV63', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(94, NULL, 'user93', 'user93', 'user93@user.com', NULL, '779008561203', '$2y$10$ZB38gKuXNMY7/2y5TDZBBOmIXa8./GSsO6cqhIY0VKJhysOUI7h4S', 'user', '2', 'ECCWXJG0TCEZE2CUCWUZ', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(95, NULL, 'user94', 'user94', 'user94@user.com', NULL, '139396617394', '$2y$10$AAaXUJYCplUa8FefJifzx.afgvhW/NU80K3osLECkHgRIunLrLomG', 'user', '2', 'WH1KENH8M0PUDYFREBDG', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(96, NULL, 'user95', 'user95', 'user95@user.com', NULL, '170232477118', '$2y$10$f50HJsH8aIzf96X2w6ijfef5dCTxGtKaWLuVM.CmlefKMvcWzp2QO', 'user', '2', 'VAN8BJ0IOLU32WUTUYLU', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(97, NULL, 'user96', 'user96', 'user96@user.com', NULL, '305158186980', '$2y$10$bVQFxi52SKXpkzbzVMc0tOQUTKArtTOtqud7k3edwgbN9HcM4aI0.', 'user', '2', 'UUQSVY2JING5MHTORZHO', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(98, NULL, 'user97', 'user97', 'user97@user.com', NULL, '449719373676', '$2y$10$ohrgLztX8VUGBlSUUS1uJOZveasS3Ew5xn7pYkX9LMSC9efIf1G.K', 'user', '2', 'AE0UBADCTJ6RVGPRCX6G', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(99, NULL, 'user98', 'user98', 'user98@user.com', NULL, '387998862387', '$2y$10$NJANXGpj/o9XjJvuFEPdvekaREXYNFdovGWne3IUrkLf1IK3ZXFEO', 'user', '2', '4ZWDVJ7RG23PTKGZUFOA', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(100, NULL, 'user99', 'user99', 'user99@user.com', NULL, '199762806531', '$2y$10$Jc3sr3s8sf62siQGs9Jd.OAT5EOOE9HhRmf/cmQoDxip1G14V9ycC', 'user', '2', 'EBCQPNTAZS2HIE8JCWWE', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL),
(101, NULL, 'user100', 'user100', 'user100@user.com', NULL, '431312278341', '$2y$10$Nsuz.E9ot3cib18liEUzduCANW2kLbGhdlp9XdneEq7YB5z5vKyia', 'user', '2', 'ERUXWYZ8MIKCQ4XEABYE', NULL, NULL, '2022-09-20 08:05:03', '2022-09-20 08:05:03', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_business_details`
--

CREATE TABLE `user_business_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_business_details`
--

INSERT INTO `user_business_details` (`id`, `user_id`, `business_name`, `business_logo`, `business_email`, `business_phone`, `vat_id`, `business_address`, `currency_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '360', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(2, 2, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '379', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:07:34'),
(3, 3, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '593', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(4, 4, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '769', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(5, 5, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '173', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(6, 6, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '287', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(7, 7, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '97', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(8, 8, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '906', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(9, 9, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '333', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(10, 10, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '28', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(11, 11, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '523', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(12, 12, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '239', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(13, 13, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '879', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(14, 14, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '335', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(15, 15, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '348', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(16, 16, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '578', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(17, 17, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '247', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(18, 18, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '125', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(19, 19, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '421', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(20, 20, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '916', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(21, 21, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '846', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(22, 22, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '468', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(23, 23, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '350', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(24, 24, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '134', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(25, 25, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '760', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(26, 26, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '11', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(27, 27, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '621', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(28, 28, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '753', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(29, 29, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '938', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(30, 30, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '731', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(31, 31, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '12', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(32, 32, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '358', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(33, 33, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '232', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(34, 34, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '20', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(35, 35, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '337', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(36, 36, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '111', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(37, 37, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '470', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(38, 38, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '751', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(39, 39, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '621', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(40, 40, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '108', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(41, 41, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '880', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(42, 42, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '915', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(43, 43, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '250', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(44, 44, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '812', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(45, 45, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '456', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(46, 46, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '973', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(47, 47, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '659', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(48, 48, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '346', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(49, 49, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '970', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(50, 50, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '534', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(51, 51, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '525', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(52, 52, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '191', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(53, 53, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '552', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(54, 54, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '554', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(55, 55, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '227', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(56, 56, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '108', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(57, 57, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '32', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(58, 58, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '429', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(59, 59, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '329', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(60, 60, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '98', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(61, 61, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '350', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(62, 62, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '234', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(63, 63, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '415', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(64, 64, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '963', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(65, 65, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '974', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(66, 66, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '803', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(67, 67, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '722', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(68, 68, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '664', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(69, 69, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '205', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(70, 70, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '307', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(71, 71, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '903', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(72, 72, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '517', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(73, 73, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '663', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(74, 74, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '870', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(75, 75, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '347', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(76, 76, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '948', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(77, 77, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '170', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(78, 78, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '838', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(79, 79, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '364', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(80, 80, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '185', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(81, 81, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '122', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(82, 82, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '101', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(83, 83, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '226', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(84, 84, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '804', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(85, 85, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '613', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(86, 86, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '646', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(87, 87, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '92', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(88, 88, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '761', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(89, 89, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '74', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(90, 90, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '332', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(91, 91, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '390', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(92, 92, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '539', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(93, 93, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '845', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(94, 94, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '526', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(95, 95, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '704', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(96, 96, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '448', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(97, 97, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '862', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(98, 98, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '491', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04'),
(99, 99, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '253', 'This is the Address', 1, '2022-09-20 08:05:04', '2022-09-20 08:05:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_slug_unique` (`slug`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_slug_unique` (`slug`),
  ADD KEY `customers_subscription_id_foreign` (`subscription_id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `deadlines`
--
ALTER TABLE `deadlines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deadlines_slug_unique` (`slug`),
  ADD KEY `deadlines_subscription_id_foreign` (`subscription_id`),
  ADD KEY `deadlines_user_id_foreign` (`user_id`),
  ADD KEY `deadlines_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `deadline_chronologies`
--
ALTER TABLE `deadline_chronologies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deadline_chronologies_deadline_id_foreign` (`deadline_id`),
  ADD KEY `deadline_chronologies_user_id_foreign` (`user_id`),
  ADD KEY `deadline_chronologies_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_user_id_foreign` (`user_id`),
  ADD KEY `settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `stripe_configurations`
--
ALTER TABLE `stripe_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_number_unique` (`number`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_business_details`
--
ALTER TABLE `user_business_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_business_details_user_id_foreign` (`user_id`),
  ADD KEY `user_business_details_currency_id_foreign` (`currency_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deadlines`
--
ALTER TABLE `deadlines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `deadline_chronologies`
--
ALTER TABLE `deadline_chronologies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `stripe_configurations`
--
ALTER TABLE `stripe_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user_business_details`
--
ALTER TABLE `user_business_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deadlines`
--
ALTER TABLE `deadlines`
  ADD CONSTRAINT `deadlines_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deadlines_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deadlines_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deadline_chronologies`
--
ALTER TABLE `deadline_chronologies`
  ADD CONSTRAINT `deadline_chronologies_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deadline_chronologies_deadline_id_foreign` FOREIGN KEY (`deadline_id`) REFERENCES `deadlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deadline_chronologies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_business_details`
--
ALTER TABLE `user_business_details`
  ADD CONSTRAINT `user_business_details_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_business_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
