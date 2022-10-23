-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 11:49 PM
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
(1, 'usd', 'United States', 'WH4p8JB7D4', '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(2, 'eur', 'Europe', 'NbzjLFsXuL', '2022-10-20 15:56:22', '2022-10-20 15:56:22');

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
(1, NULL, 2, 'customer1', 'customer1@customer.com', NULL, 'This is Address', 'This is a Note', 'ZA4OWRZSVZFD5AMOY6CR', '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(2, NULL, 2, 'customer2', 'customer2@customer.com', NULL, 'This is Address', 'This is a Note', 'R2CXGVV91X5D55DFRJL4', '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(3, NULL, 2, 'customer3', 'customer3@customer.com', NULL, 'This is Address', 'This is a Note', 'Z6FWWNC3TPZVXIBV1LH1', '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(4, NULL, 2, 'customer4', 'customer4@customer.com', NULL, 'This is Address', 'This is a Note', 'BIOLO68JY86YLX6XZBJX', '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(5, NULL, 2, 'customer5', 'customer5@customer.com', NULL, 'This is Address', 'This is a Note', 'QBWUSZFBU1DTTE0LJZ7C', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(6, NULL, 2, 'customer6', 'customer6@customer.com', NULL, 'This is Address', 'This is a Note', 'S2SGZ1DN7GUGLUBEAKCA', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(7, NULL, 2, 'customer7', 'customer7@customer.com', NULL, 'This is Address', 'This is a Note', 'G9RD07OPRXX7O5XTTUTQ', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(8, NULL, 2, 'customer8', 'customer8@customer.com', NULL, 'This is Address', 'This is a Note', 'IONKENUC3C6OPCFGSGXG', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(9, NULL, 2, 'customer9', 'customer9@customer.com', NULL, 'This is Address', 'This is a Note', 'ZOLQHUOAYT61273DWHLP', '2022-10-20 15:56:23', '2022-10-20 15:56:23');

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
(1, NULL, 2, 1, 'Deadline1', '2022-03-27', 47, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KPHWIZA894WWMEIFKJAG', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(2, NULL, 2, 1, 'Deadline2', '2022-03-22', 69, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'ILSH2PZ3MTOHPML52RMA', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(3, NULL, 2, 1, 'Deadline3', '2022-03-15', 86, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'IY4RAOO069ZLF3ADD9NG', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(4, NULL, 2, 1, 'Deadline4', '2022-03-02', 37, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'UGWOAPXPJNFI5V3EZBC7', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(5, NULL, 2, 1, 'Deadline5', '2022-02-12', 63, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NEJ80ISCXI0LYLO5EMXK', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(6, NULL, 2, 2, 'Deadline1', '2022-02-07', 41, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'LTHGYXJUK1JT9ANZ2M6U', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(7, NULL, 2, 2, 'Deadline2', '2022-03-17', 37, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'JV4BOG9TUS7XHRZX3XQU', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(8, NULL, 2, 2, 'Deadline3', '2022-02-07', 84, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'DFYMFYUSSG1H2XFQOAAB', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(9, NULL, 2, 2, 'Deadline4', '2022-02-02', 54, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'SYDNOSLAUKVFBXRUR1ZX', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(10, NULL, 2, 2, 'Deadline5', '2022-03-07', 20, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'IJY2LXY9V6D6JVJQODII', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(11, NULL, 2, 2, 'Deadline6', '2022-02-10', 60, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KGS7XNJZFBFJTZOIZ4S0', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(12, NULL, 2, 2, 'Deadline7', '2022-02-21', 16, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'OURHVV6AS6CV8ZPWO4QN', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(13, NULL, 2, 2, 'Deadline8', '2022-02-02', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'QBM69V05UOMMJZ9MQL9B', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(14, NULL, 2, 2, 'Deadline9', '2022-03-02', 48, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'QGWNEVS6WR7FW23UM53E', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(15, NULL, 2, 3, 'Deadline1', '2022-03-17', 32, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '3RNH3XDMZLI9QTYO2GHS', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(16, NULL, 2, 3, 'Deadline2', '2022-03-06', 96, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '3JAJAYLZNJMMOD6NVGK1', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(17, NULL, 2, 3, 'Deadline3', '2022-02-23', 48, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'N6PR100XQC03LI9LPWGZ', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(18, NULL, 2, 3, 'Deadline4', '2022-03-27', 31, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'HJOE2YNEDAKDNVTSAW4N', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(19, NULL, 2, 3, 'Deadline5', '2022-03-27', 25, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '4M8XC60YG0HXMBNICUOO', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(20, NULL, 2, 3, 'Deadline6', '2022-02-05', 29, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NYWSIWW7ISKRAU2HO3GC', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(21, NULL, 2, 3, 'Deadline7', '2022-02-12', 13, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CCYXHJO5JJ8QX6LJVGR7', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(22, NULL, 2, 3, 'Deadline8', '2022-02-12', 67, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'OEV6OBI7NVZ7JZGUL7AR', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(23, NULL, 2, 4, 'Deadline1', '2022-02-03', 76, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'NWMZGMNQV8HESO5J7WML', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(24, NULL, 2, 4, 'Deadline2', '2022-03-14', 25, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CQF3OWOLE233P6FSDFS2', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(25, NULL, 2, 4, 'Deadline3', '2022-02-10', 74, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'TIALDHUWNVC9DYBEDXSI', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(26, NULL, 2, 4, 'Deadline4', '2022-02-07', 84, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '5K5EVK7LXKXN3M0PREQC', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(27, NULL, 2, 4, 'Deadline5', '2022-02-28', 93, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'UEMK4XKKYHRUQICE03FH', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(28, NULL, 2, 5, 'Deadline1', '2022-03-17', 85, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'AZKCVTXQ5MVDH5ENUR6T', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(29, NULL, 2, 5, 'Deadline2', '2022-03-28', 12, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'DADTJMZSL6KKFNEI3UKA', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(30, NULL, 2, 5, 'Deadline3', '2022-03-21', 89, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '8J1OV4T0P5LXPPKKQT7D', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(31, NULL, 2, 5, 'Deadline4', '2022-03-05', 30, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'U49CKEOQXQ4PKB3DCT6R', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(32, NULL, 2, 6, 'Deadline1', '2022-02-24', 38, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'EMFMWQWUMASJ1CMVRURP', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(33, NULL, 2, 6, 'Deadline2', '2022-02-23', 34, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'MLXX1VYV17PBBBOS7HR9', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(34, NULL, 2, 6, 'Deadline3', '2022-02-19', 44, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CM1T5WWTDZLALYKOMNIE', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(35, NULL, 2, 6, 'Deadline4', '2022-02-22', 93, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'GLUHPZAQWYBT86I9DUXN', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(36, NULL, 2, 6, 'Deadline5', '2022-02-21', 46, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KEP2R9ZLMECW3V2GVLLH', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(37, NULL, 2, 7, 'Deadline1', '2022-03-15', 75, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KLZNRNUOK9MMYKR1JOFT', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(38, NULL, 2, 7, 'Deadline2', '2022-03-09', 52, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '3FVOG70FCCWX08DN81RN', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(39, NULL, 2, 7, 'Deadline3', '2022-02-09', 39, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'LTBWAOUTSYLZ69HKJ5ZY', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(40, NULL, 2, 7, 'Deadline4', '2022-03-04', 15, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'SFXKHBPWG2E9FP57WY0V', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(41, NULL, 2, 8, 'Deadline1', '2022-02-04', 80, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'EIU4B1KCXQF9RZAI3AV8', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(42, NULL, 2, 8, 'Deadline2', '2022-02-26', 76, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'QSEM9QTAVOXDFAE0GCQT', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(43, NULL, 2, 8, 'Deadline3', '2022-02-15', 28, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KOEU2QYVI1YKYXTRA8JX', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(44, NULL, 2, 8, 'Deadline4', '2022-03-18', 11, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'GOFX54MFLQC9BRCMMHUQ', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(45, NULL, 2, 8, 'Deadline5', '2022-03-03', 37, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'WED3G0UMU4WAEF2KPPVN', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(46, NULL, 2, 9, 'Deadline1', '2022-03-27', 54, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'CKDCFLVWIK1WJSJZCCQK', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(47, NULL, 2, 9, 'Deadline2', '2022-03-22', 61, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'G8CUXFRPOXVEYX31KZXM', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(48, NULL, 2, 9, 'Deadline3', '2022-02-05', 45, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'KIEICY5TLEIAQZG1CADM', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(49, NULL, 2, 9, 'Deadline4', '2022-03-13', 80, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'TPBLNJHHIE4TFYI4FCRJ', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(50, NULL, 2, 9, 'Deadline5', '2022-03-07', 85, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', '1ZBKYWAAVEXMHSEQLDQE', '2022-10-20 15:56:23', '2022-10-20 15:56:23'),
(51, NULL, 2, 9, 'Deadline6', '2022-02-25', 83, 'to_renew', 'domain', 'This is a Public Note', 'This is a Private Note', '30_days_before', 'W5WQBWKTPKBA2PKU9AIU', '2022-10-20 15:56:23', '2022-10-20 15:56:23');

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
(15, '2022_05_30_183710_create_jobs_table', 1),
(16, '2022_10_20_195051_update_user_business_details', 1);

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
(1, 1, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(2, 2, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(3, 3, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(4, 4, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(5, 5, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(6, 6, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(7, 7, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(8, 8, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(9, 9, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(10, 10, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(11, 11, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(12, 12, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(13, 13, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(14, 14, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(15, 15, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(16, 16, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(17, 17, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(18, 18, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(19, 19, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(20, 20, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(21, 21, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(22, 22, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(23, 23, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(24, 24, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(25, 25, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(26, 26, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(27, 27, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(28, 28, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(29, 29, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(30, 30, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(31, 31, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(32, 32, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(33, 33, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(34, 34, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(35, 35, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(36, 36, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(37, 37, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(38, 38, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(39, 39, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(40, 40, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(41, 41, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(42, 42, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(43, 43, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(44, 44, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(45, 45, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(46, 46, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(47, 47, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(48, 48, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(49, 49, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(50, 50, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(51, 51, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(52, 52, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(53, 53, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(54, 54, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(55, 55, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(56, 56, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(57, 57, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(58, 58, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(59, 59, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(60, 60, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(61, 61, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(62, 62, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(63, 63, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(64, 64, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(65, 65, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(66, 66, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(67, 67, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(68, 68, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(69, 69, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(70, 70, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(71, 71, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(72, 72, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(73, 73, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(74, 74, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(75, 75, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(76, 76, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(77, 77, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(78, 78, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(79, 79, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(80, 80, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(81, 81, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(82, 82, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(83, 83, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(84, 84, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(85, 85, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(86, 86, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(87, 87, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(88, 88, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(89, 89, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(90, 90, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(91, 91, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(92, 92, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(93, 93, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(94, 94, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(95, 95, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(96, 96, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(97, 97, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(98, 98, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22'),
(99, 99, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22');

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
(1, 'pk_test_yKF28OfsGchVLbr4FmAH8x61002zuh3083', 'sk_test_sQJFDUoOy3WAqtUupBH9V5aM00zebNYJaP', 'test', '2022-10-20 15:56:22', '2022-10-20 15:56:22');

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
(1, NULL, 'admin', 'admin', 'admin@admin.com', NULL, '231582671257', '$2y$10$KrkmXn6PFvcKSvDnQnhCxeBhkbIJ2.ZS5/K3w7fsehX6fIz1n.k/i', 'admin', '1', 'YOADIOLHFYVQYIAKUXMY', NULL, NULL, '2022-10-20 15:56:14', '2022-10-20 15:56:14', NULL, NULL, NULL, NULL),
(2, NULL, 'user1', 'user1', 'user1@user.com', NULL, '715415793578', '$2y$10$h4ztJ/bCU57myOaSrHkotOIe3HdM9e5ZuE6vo.WrxjsAI1xFn0Nv2', 'user', '2', 'BDNGJK8NHODYMF4VG65V', NULL, NULL, '2022-10-20 15:56:14', '2022-10-20 15:56:14', NULL, NULL, NULL, NULL),
(3, NULL, 'user2', 'user2', 'user2@user.com', NULL, '293015668637', '$2y$10$Wr8lSEqgerOUVPQnj4XfxOd1pQD00m5U/zzZSOdK9rkG5iHAdnReu', 'user', '2', 'FFAEKA2BCCUTIPAIDTFU', NULL, NULL, '2022-10-20 15:56:14', '2022-10-20 15:56:14', NULL, NULL, NULL, NULL),
(4, NULL, 'user3', 'user3', 'user3@user.com', NULL, '161056775425', '$2y$10$Ixx75OcBxdWj6WDk.ZXipe5WLDvQOjOF74wx84VmQGapHCxFU0Ryy', 'user', '2', '00TO2S8LJYGPR5YQ0EID', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(5, NULL, 'user4', 'user4', 'user4@user.com', NULL, '790410718919', '$2y$10$03rWRkJpK7Q1A53zfZfR/uo605eILTe8d/WKdwbW1FtII7D2ln9qS', 'user', '2', 'VWOLYGUC5NXN0UNYDMUO', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(6, NULL, 'user5', 'user5', 'user5@user.com', NULL, '182916723915', '$2y$10$Zq4ziKJQ40mTkqrL1TrC5OLnA2IR.FnzYh/d7tx32kb/.UaScuLr.', 'user', '2', 'O203J8YDFVW7VCLDB2QZ', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(7, NULL, 'user6', 'user6', 'user6@user.com', NULL, '265668078601', '$2y$10$o7.bvZQcYkvbXxyFddYcSOY6zH9KNE0kPmfQDUwXm/UsUmuqs49Yq', 'user', '2', 'VOMCDRGET7NHGOI6GITC', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(8, NULL, 'user7', 'user7', 'user7@user.com', NULL, '485570411370', '$2y$10$AQspJ3nsM/NxuYqYl1QAFu9QoYDLkZmc7dZG4r2RdEal2K06ypduy', 'user', '2', 'T3ASUEP4H9OOQJ1FSMWJ', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(9, NULL, 'user8', 'user8', 'user8@user.com', NULL, '523993500490', '$2y$10$gP3XMvdpJ9akN/cFng1R9ewZ2Zz8OqEEDHQTAYa45JWUObWlxTCVi', 'user', '2', '55XQ0XH7QJH1MOP0EMGK', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(10, NULL, 'user9', 'user9', 'user9@user.com', NULL, '690030575093', '$2y$10$WDX9LYRtd608JDNsZejeVORxKzgb5ehZx96kqUeh/GWG/yCDSx1qG', 'user', '2', '9FYAY9OEAC7XWPQXQZ9E', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(11, NULL, 'user10', 'user10', 'user10@user.com', NULL, '919402664515', '$2y$10$aUKr9bwpb1ZeBsRARL1tVuRJiRcC8le9JEnwLcRSUjTDxjVmtOg.S', 'user', '2', 'CZM3AR4SRULP4PBZSDGZ', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(12, NULL, 'user11', 'user11', 'user11@user.com', NULL, '697510751934', '$2y$10$tgAraO6RmDXS5yVfUNTxz.zinBwzTWL2aHbVHag9SwDQROWhWAOEi', 'user', '2', 'VGSDC27FNJUVEHGIMRKB', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(13, NULL, 'user12', 'user12', 'user12@user.com', NULL, '498438823416', '$2y$10$zqxxoi432w2B4i1hVjbvdeEM7jFOItd4BSQNUmWDAT/DmjO4ecj.G', 'user', '2', 'XRC4JRAJIRVRGWXJX27D', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(14, NULL, 'user13', 'user13', 'user13@user.com', NULL, '908637636938', '$2y$10$qvw78YF4BBnfp/CYRRiDoOlR2jRLXvpQaZZZUVB9xA.kqqQ7ochpi', 'user', '2', 'CUAUMMRLVMBZ9L2KDCAA', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(15, NULL, 'user14', 'user14', 'user14@user.com', NULL, '973861684954', '$2y$10$mhZC8jFhurhW6.td3mPW6.4Tv/.rmPda1V4Nfy5TOWoUZF8JSns8K', 'user', '2', 'Y4FXWMBDAWWXW28YAK7B', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(16, NULL, 'user15', 'user15', 'user15@user.com', NULL, '711144148055', '$2y$10$IqXsW4HgOWmyqfTJBMWO2uGk.LdseG5rGKjGE8mN7i7aJc2HFH.f2', 'user', '2', 'GOFMGNAQ7HPISMLYQC4L', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(17, NULL, 'user16', 'user16', 'user16@user.com', NULL, '369758897806', '$2y$10$ulmC5Z1.mSif10AAmqTOtOxFnIa2FdWTaH9tkaih.EvQ3C6cGnzVC', 'user', '2', 'OAQGQVG1WXOP8PG5KYLW', NULL, NULL, '2022-10-20 15:56:15', '2022-10-20 15:56:15', NULL, NULL, NULL, NULL),
(18, NULL, 'user17', 'user17', 'user17@user.com', NULL, '832971537721', '$2y$10$owauz4r95WEj03s6zo5MAe7ghFtR5tOg5pjfiJfwqkjFmn4OOKEr2', 'user', '2', 'Q8SZFMKCQM0VSNGCG7TH', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(19, NULL, 'user18', 'user18', 'user18@user.com', NULL, '568077560132', '$2y$10$gPdGlnfSgrfH.XOFLBH3ve87Y3Y6NqaoEyt2U3ZsWAYkQPbcFf0uu', 'user', '2', 'DXZVFNVTPS4TS5U6YHXH', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(20, NULL, 'user19', 'user19', 'user19@user.com', NULL, '587227359861', '$2y$10$QeucJ7KXWnNUEOqN9tlmOuQI0GwDGPk1StaYW10sVH49bE46/rlYe', 'user', '2', 'XMNOCH1LZMH3JYEUGGLA', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(21, NULL, 'user20', 'user20', 'user20@user.com', NULL, '766388957655', '$2y$10$9rPKED2Ovv8S0fMuW4SHvOmR07zqQMQcW3uVM3RLKrnczDTs2H7.q', 'user', '2', 'N5V5G11HNUK9D2RQYL0U', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(22, NULL, 'user21', 'user21', 'user21@user.com', NULL, '593821853865', '$2y$10$B84Aqj5pr0n05l9S5gmiXORAhSAuHkIyKLDRiHSvvCNd8ijoZCob6', 'user', '2', 'MJ2O9S0CWHH498UI6PYK', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(23, NULL, 'user22', 'user22', 'user22@user.com', NULL, '700972255561', '$2y$10$V4JJO3OyOusPclGXu/KzWeSSdtnsf9O3LZLDHWYvwPg.V5I0WIpNa', 'user', '2', 'V39XJTYGLCKG2PULIBB4', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(24, NULL, 'user23', 'user23', 'user23@user.com', NULL, '492367793720', '$2y$10$ZhRDCoIyb0EIJeXkQ6f89uYJILhScjS4T/e2ComvsXSdxoae9f3Vq', 'user', '2', 'YFROJSMHTL9FQVXSNJWI', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(25, NULL, 'user24', 'user24', 'user24@user.com', NULL, '820035043336', '$2y$10$MOOHtTM5Lf.hZ2JXRKf44OvGhbQYbd6qfiWxCNqlZbDfw.iQrsQ/K', 'user', '2', 'RUN19ZAUCV3LZR3C09GL', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(26, NULL, 'user25', 'user25', 'user25@user.com', NULL, '749419567525', '$2y$10$kUfaUvhp5YD7a7J5ZShhmOhbFlHltKlGhWDf0et/d9Lti/iAO3lpu', 'user', '2', 'TF6ACJ5ZZEPEQLYHKAVS', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(27, NULL, 'user26', 'user26', 'user26@user.com', NULL, '915005191138', '$2y$10$YL6hwpzuK7KvB1RpzPVgae6EH/KWpD0JvWgft4wW5M86dWu0FV0bK', 'user', '2', 'ZKPNAMNZOCPSBLNLZIEJ', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(28, NULL, 'user27', 'user27', 'user27@user.com', NULL, '741598527029', '$2y$10$Jd57m89oS4q035hrIdfO0Oct2xt32745AQPGRFHWR/fLKmfQVSALO', 'user', '2', 'LM6TLEWMLOOJ2ICNVMRG', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(29, NULL, 'user28', 'user28', 'user28@user.com', NULL, '324486166312', '$2y$10$nWmx3Ut/YWqEWttrxbQuJel37TyBoa/56.bQ35qwl9ymGcom6w0C2', 'user', '2', 'PYKNQULPHWTJWQVPT1SS', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(30, NULL, 'user29', 'user29', 'user29@user.com', NULL, '698160277067', '$2y$10$X19AKhj1tiUxFgHl7g1nzOBGj4VBPi7cEvjMNMVaxLa54sbFe7s7i', 'user', '2', 'OWVAGYS6YWK3JSADM3WR', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(31, NULL, 'user30', 'user30', 'user30@user.com', NULL, '168179371611', '$2y$10$t6a1eXdQxsJu0Se89vDjQup4GjLcY9NCplo3AR7Do0or6AzHUmFWq', 'user', '2', 'TML17A0V8Q5OVQV7CCW1', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(32, NULL, 'user31', 'user31', 'user31@user.com', NULL, '120476781503', '$2y$10$ALXFbOvw.8chH6c2ysPdR.op9YOp15X8O16EoYLkx9/HpiX2cSU/S', 'user', '2', 'D3CQECLO3DZZ4TFBYLZK', NULL, NULL, '2022-10-20 15:56:16', '2022-10-20 15:56:16', NULL, NULL, NULL, NULL),
(33, NULL, 'user32', 'user32', 'user32@user.com', NULL, '364197543835', '$2y$10$R2VSN0c7U0UXXLy/BWvJ3eIHcY1hG7yPc39UVZZEHYtQPHd6nhLz2', 'user', '2', 'MTPF7QHZGELIAMXBGNZW', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(34, NULL, 'user33', 'user33', 'user33@user.com', NULL, '631954465256', '$2y$10$ekqGHqqcOlEHDmtfOH/Fj.F/4kH3Nta3OWEXQSjGhvslVcvdM.Kpu', 'user', '2', 'X6CB9IVLJAAZUAHDYFNA', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(35, NULL, 'user34', 'user34', 'user34@user.com', NULL, '556785381489', '$2y$10$gYQyPGSvU1ave89RLsWHkOWTL1/G.yqFddJfoQ1/FnQoEW2SrZK3.', 'user', '2', '1QJILAVP56I9MCQBKWCO', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(36, NULL, 'user35', 'user35', 'user35@user.com', NULL, '240112725193', '$2y$10$4EcjiyIi6mZ6SsWUHRqVIeVM26H5WMcGe4E/86BiZQmFsE0oo52wS', 'user', '2', 'L7LMDVBI0PMIZY791FIG', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(37, NULL, 'user36', 'user36', 'user36@user.com', NULL, '853832024172', '$2y$10$xbonFZQT.VLWlnfhSbtYOOO.ZAltrAvmrsAcZgAudsG6J/16QaGAq', 'user', '2', 'LXOXTCQNVWVWXSMCRDHX', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(38, NULL, 'user37', 'user37', 'user37@user.com', NULL, '901036481671', '$2y$10$B1UvXH/RM5ms.PIeOny.x.id7mD4BFBY2qTuH/21ggwGnisLiJpa2', 'user', '2', 'LJ08KEBSMPLOTOH2WU0I', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(39, NULL, 'user38', 'user38', 'user38@user.com', NULL, '988381198855', '$2y$10$yDUKmBS21w9iC7MwYtDiYuwHK4.wdRxZFPolLNGoxrrnaAHzzHg/W', 'user', '2', 'X4OXB337THIAALH70SGU', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(40, NULL, 'user39', 'user39', 'user39@user.com', NULL, '886024177510', '$2y$10$QPnSi2WvPe8lkVX0.je5nOgCWttlebVqRL8WNLiCi49C8MJTvxklK', 'user', '2', 'RGXI7W61QJLSZNCTHH3P', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(41, NULL, 'user40', 'user40', 'user40@user.com', NULL, '958938676185', '$2y$10$NilFDWKNuB5/iHQ1duiS9O4kFQ1qhnh/oUoVzFMxcjXC5/aaF2h7m', 'user', '2', 'K6KSCPCPETTCL2AGGFAF', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(42, NULL, 'user41', 'user41', 'user41@user.com', NULL, '678326454025', '$2y$10$y35xy9isL/aWv4wR5DNoDewXOzX2RLPfeNYHBHh8GqN97qGFx40ee', 'user', '2', 'PE5BVOWRAWTYFMTIXJWV', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(43, NULL, 'user42', 'user42', 'user42@user.com', NULL, '750778491738', '$2y$10$4hH0N4nlgfnFL7cPu6V7OeIs.rH3Mn.K.v.gBtjxpH4A9bOCuqKhS', 'user', '2', 'CMIRIBFYIHZFD8X3YXDC', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(44, NULL, 'user43', 'user43', 'user43@user.com', NULL, '618788790544', '$2y$10$EhIwASbj7OKnji7e2djxo.EbuOfmzQWSKovvIVoyWSsOKAaty1lQW', 'user', '2', 'YX8ZXLQX5NGPCOSWS7SE', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(45, NULL, 'user44', 'user44', 'user44@user.com', NULL, '635666038661', '$2y$10$B6mMNSK3KlcqjGPcFPeUJONknqxpVOJf/AKU526EX9P36V2la9K0u', 'user', '2', 'MJPH0AQUFBGRGZGDCDUX', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(46, NULL, 'user45', 'user45', 'user45@user.com', NULL, '753859649106', '$2y$10$FVxD4aVvax9AEWKVGqTy9.4ro1SrY6Dp/zmcqvyPW1wQSGkDFsLhu', 'user', '2', 'IHWO6QT1VJ80XTDNUAX2', NULL, NULL, '2022-10-20 15:56:17', '2022-10-20 15:56:17', NULL, NULL, NULL, NULL),
(47, NULL, 'user46', 'user46', 'user46@user.com', NULL, '414077020765', '$2y$10$jhjoZm7IE7SdKC.unR8coeBEQMtrQdomdfIlHCtK72wa.DIhmqkD2', 'user', '2', 'YMXAFKL5ECVV4AIOF1WR', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(48, NULL, 'user47', 'user47', 'user47@user.com', NULL, '555259056100', '$2y$10$UsazLpUFZI3YzpOaJAlJF.lgiNpQY136Rm7NdBRdq2K4D4nQJpkoe', 'user', '2', 'FPVLGPXIVSE2CKHFABUZ', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(49, NULL, 'user48', 'user48', 'user48@user.com', NULL, '114505133286', '$2y$10$PwMpKxg0.BPs2c7BDapAseKrAi9xbZ4YXXWa8s/RK4pK1pYoU29UW', 'user', '2', '0EU7QSLQCDGIHZCPYHMR', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(50, NULL, 'user49', 'user49', 'user49@user.com', NULL, '210306195743', '$2y$10$P/BnX5bLLDRtXTEC1KuqDeaPjCLaRC2qhH566Xas8YCD2W8uVA28e', 'user', '2', 'VT1WIOU6CM3QCEWES4QS', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(51, NULL, 'user50', 'user50', 'user50@user.com', NULL, '556216092472', '$2y$10$lvjxo8I7ZwtpvTgXO.0o7uyhWdYz.aYj3wr3Suaol0J2KrESOx1jS', 'user', '2', 'AYOBQLY192QH3RITCEOR', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(52, NULL, 'user51', 'user51', 'user51@user.com', NULL, '369623552401', '$2y$10$wLnThAmhhhJkFW0AZIA7zurw.XlK1mP33Qq55CuszGpctZ2ow14.2', 'user', '2', 'KA6BY86NSXH2TNVBVZDA', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(53, NULL, 'user52', 'user52', 'user52@user.com', NULL, '850734136310', '$2y$10$VK1byZcrfEQXWkifpQhXl.zi9PE0ecwAFb1gi4g0Lwn3WohXy/kyO', 'user', '2', '1B7K3ZAYSNWIELS9WQNN', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(54, NULL, 'user53', 'user53', 'user53@user.com', NULL, '946361933601', '$2y$10$pj.0VV1IXNQrPTQJQRJCluebhVA8OXxNUu.D.ZzFKu7.t3/TB.BVS', 'user', '2', 'PFW7WLHROFRCN6L61USE', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(55, NULL, 'user54', 'user54', 'user54@user.com', NULL, '908998814657', '$2y$10$UTOXZgSmoWycaVFwXFu1Zu2iY8hm9Q.HpthZF.XbTV2LmEQc8CAD.', 'user', '2', 'DWP4CKGYTEWJI5IDGQXL', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(56, NULL, 'user55', 'user55', 'user55@user.com', NULL, '495760595441', '$2y$10$HSHSYJ..jzuhP/jCic.Ty.K6dj2PjLw7sOkNDAZP4f/ydsK9eoCS.', 'user', '2', '2VCIHUW3RDDYUO8DDA1P', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(57, NULL, 'user56', 'user56', 'user56@user.com', NULL, '286670342514', '$2y$10$2f7OMlu9j7MUdgIV5M7IQusdtnZTmwSPhjEi5HXp1HqnQS/vEjAHS', 'user', '2', 'KCTU0HQ5UCNIJ6XARDRB', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(58, NULL, 'user57', 'user57', 'user57@user.com', NULL, '301773413079', '$2y$10$1VHIqYzBkJrqhYfSqJX.VOpUfEuW6KQEHbZKGia1SE4g.TFf6hFou', 'user', '2', 'WEOGZAX7ZRJARGJBBVBS', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(59, NULL, 'user58', 'user58', 'user58@user.com', NULL, '701892286316', '$2y$10$tvumruryl8TvewGbLLIE2.gRLHl6a8BcYEmVJNnuvEluNhVUAPXqy', 'user', '2', '8W21SC5BZND5Q1ARQPSF', NULL, NULL, '2022-10-20 15:56:18', '2022-10-20 15:56:18', NULL, NULL, NULL, NULL),
(60, NULL, 'user59', 'user59', 'user59@user.com', NULL, '321182953909', '$2y$10$ifz.N4J.JQr20o.FJ19I8.HK.UU813FZ1uX7y//HKFjq1E7V60aam', 'user', '2', 'NI9KM8VHKEYJUCXMR0ZP', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(61, NULL, 'user60', 'user60', 'user60@user.com', NULL, '816174405154', '$2y$10$.27kXtGDgug45aAoW4AFEOsacyQCzmmvOA/8fTjzoB9nrf10ABnSa', 'user', '2', 'XHASQDGENSXYHTZXPIXJ', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(62, NULL, 'user61', 'user61', 'user61@user.com', NULL, '993529332001', '$2y$10$E7ogEzhn7VEJI59qAaJ4beRXkCktoTBQzrRoxe5Ruqd5rMLEQErvu', 'user', '2', 'H3LJ0MEZPOBAFRRGHKW0', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(63, NULL, 'user62', 'user62', 'user62@user.com', NULL, '136619281578', '$2y$10$LCvJiX1aj2g.tv0hJi1PTOnMVtxEicGi7DF1fdKBpa5LmSIVTEvzm', 'user', '2', '7YVPBZSMEIVYDMGEPQAC', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(64, NULL, 'user63', 'user63', 'user63@user.com', NULL, '897168835896', '$2y$10$tq6Dhg4G3cYkkywvoisxxewi5C52PjWsVhexW.I5VcMBHCx5H1Uya', 'user', '2', 'NT5OLXMAOVJSTNCYERD8', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(65, NULL, 'user64', 'user64', 'user64@user.com', NULL, '211298804030', '$2y$10$GMgoZNlubNlO6N3wfrIzi.7U2viP7wjTmlGNvBUEtb8plEmIEU13m', 'user', '2', 'QLZZ8UYBCMNKCLLGP7G2', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(66, NULL, 'user65', 'user65', 'user65@user.com', NULL, '136209659183', '$2y$10$oE8zC4wCs4o79FH5v7fPWuV/UDBsmAai0Wq3EMyN1ee66V90U9WgW', 'user', '2', 'EI2RUYWZSIKRHJCAUGDX', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(67, NULL, 'user66', 'user66', 'user66@user.com', NULL, '547195850738', '$2y$10$6/s3/NwFOaAfw1IjSx5wjObBsrHLGB.Mh2w5tBWcs1bJ/ucPc1xzS', 'user', '2', '2AMK2T6LZCRB2YBBYCK9', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(68, NULL, 'user67', 'user67', 'user67@user.com', NULL, '941995933393', '$2y$10$YBBwcXM0x6.5gWyCtYu8lei6C..rli4/3/huLaLUqIhi/ACo.dKq.', 'user', '2', 'USVG19M4VGXY9X5LTY0N', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(69, NULL, 'user68', 'user68', 'user68@user.com', NULL, '469646688854', '$2y$10$nPNXZwyUZsGAvpLSBnjMgOWF9w1t/yRUq8TyVX.8ykEn9JUa5SwPi', 'user', '2', 'YL3ELLY2EU9OVQO8TYYV', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(70, NULL, 'user69', 'user69', 'user69@user.com', NULL, '463793251370', '$2y$10$Gc1p8l3PaAeqrbfGWS/f4e/lSjIbM3bYuiUhWF0XEaRqhF1RNKDju', 'user', '2', 'A171GJNU58JDHPMX0PMG', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(71, NULL, 'user70', 'user70', 'user70@user.com', NULL, '258819389906', '$2y$10$h8B/KLYPy/cXgM2Ft.ScG.1pAaauzfTdVSx1Mf/TXsYiCa3h.gVM6', 'user', '2', '1K4J8MU2J9Z86UIVVPCK', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(72, NULL, 'user71', 'user71', 'user71@user.com', NULL, '239432545525', '$2y$10$dLWhkW6mP.sud93mosBDx.gAeEEQLhVUPSCZGQ6H6fd1iHlW1WImG', 'user', '2', 'YJYZ295WMPYZLI9R0KXN', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(73, NULL, 'user72', 'user72', 'user72@user.com', NULL, '134265922624', '$2y$10$tM7sbQlOhLowCCOllaS8yO/8v/WmZTu.lGqivloFtna2kcZqk5nhS', 'user', '2', 'EWQ06ACPSJIL0ZOA4HNO', NULL, NULL, '2022-10-20 15:56:19', '2022-10-20 15:56:19', NULL, NULL, NULL, NULL),
(74, NULL, 'user73', 'user73', 'user73@user.com', NULL, '851625174237', '$2y$10$DBpESr6C8IzA/nkRYatlWOTtYhV/oBLy8RmDfNiEmXf4JqryVeQeS', 'user', '2', 'KIHGHT36ZPZCAMTFXGB4', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(75, NULL, 'user74', 'user74', 'user74@user.com', NULL, '854096061911', '$2y$10$OJhhMmXjygema.VW0d54FO4Ft8NMx.QlAYbkiztxEoFMHuIBE40be', 'user', '2', 'WX7XUEGKVWEYDKYOGZFV', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(76, NULL, 'user75', 'user75', 'user75@user.com', NULL, '746156408308', '$2y$10$XTf6Su2mnbhMjt8m5YWX7e3Pae9aK0IpHzsR68vpiHBU1XKxWRute', 'user', '2', 'RI5GZWMJ2YBBZNHJMLBQ', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(77, NULL, 'user76', 'user76', 'user76@user.com', NULL, '819722216459', '$2y$10$kI/oNjK9r5OUX3EGaGJZXObWEyI11wqwfhJgPcWYcwhRBXHbA.a/W', 'user', '2', 'RVYKS9GSXI2YSZPFAGE8', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(78, NULL, 'user77', 'user77', 'user77@user.com', NULL, '291961155913', '$2y$10$IvwUmRv8IifPJhon32ghcOEbk0rGvlpglluyykyBUQwIbyk29ZtY2', 'user', '2', 'QAA9DUSUP8GBVTKJTKRZ', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(79, NULL, 'user78', 'user78', 'user78@user.com', NULL, '884975043735', '$2y$10$TwG0VBtWuz8zqFCgDf3k.OPai4CMbswIfqI10c1.qekLteh4REp/2', 'user', '2', 'QQH7S8LVVQ87EQOCXFTB', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(80, NULL, 'user79', 'user79', 'user79@user.com', NULL, '697139814946', '$2y$10$sTZU2JFq5DrIw0/heG5YX.tCfzNrqqVdkASe7zfSdzEYi3zJqrXUO', 'user', '2', 'HPMB12IXVJQSPCGJMRCX', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(81, NULL, 'user80', 'user80', 'user80@user.com', NULL, '258764998313', '$2y$10$chgkByrPdVzjovIGcflCH.lnNYFoS57h4j1lbjRAW4aQX0l3UODfe', 'user', '2', 'SY9Q1XTI459IOREZVJAN', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(82, NULL, 'user81', 'user81', 'user81@user.com', NULL, '475914843390', '$2y$10$SHvEVtEkcr9aRiwuH9fQg.7O9RmdvGf62Y8iCdLTukPikw7vzTc2G', 'user', '2', 'AX7XRR3X1UKLQ4RTUFEQ', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(83, NULL, 'user82', 'user82', 'user82@user.com', NULL, '856483624801', '$2y$10$5KwahmEP7ikyQa5hrFQSEO9aNfHDq4APLYnBEbSic7GY3K9LbWpyu', 'user', '2', 'QUVZSVTLJHQK2CLAFMRX', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(84, NULL, 'user83', 'user83', 'user83@user.com', NULL, '725270961755', '$2y$10$xjYsARqY.zDNqyK2Yz1qB.RVkA9rqSWwDZDEkLoIGrVjuRw21sI1q', 'user', '2', 'DTRCAKXEJRKCRVVB0M0C', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(85, NULL, 'user84', 'user84', 'user84@user.com', NULL, '120350825669', '$2y$10$L/.3mzGaYkjhXThPBsmLsuVN79JADDsUqlLmq/6zxnJ3qhABoUb5C', 'user', '2', '8KHQ2W14UD75RTI26ZO9', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(86, NULL, 'user85', 'user85', 'user85@user.com', NULL, '408473390268', '$2y$10$YPUoEmC8MWRJ4.SNmrrcHeWSb.dIMUraHj9hob4vY2Flb60cO61RG', 'user', '2', 'B2TIVMZITSSJKWHZAFGM', NULL, NULL, '2022-10-20 15:56:20', '2022-10-20 15:56:20', NULL, NULL, NULL, NULL),
(87, NULL, 'user86', 'user86', 'user86@user.com', NULL, '691427128649', '$2y$10$vrlLxwFy/kNnx381W958d.yUenJ6B1xAqJ7gCb2gOx5VEumPIEgWm', 'user', '2', 'JN4Q4RGU863UEZGCAKUE', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(88, NULL, 'user87', 'user87', 'user87@user.com', NULL, '918809449735', '$2y$10$zPqc96ZZl.5ta8edPSVHwOiZ8sSc.bue3CSf..lX/em6bGlwtiIUy', 'user', '2', '74RLIUJ8C9O3CYVERIQF', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(89, NULL, 'user88', 'user88', 'user88@user.com', NULL, '207305818676', '$2y$10$SmgOZeADpVCrgtQ3Ez9GTuUc2JxQfMiw9BKVBom5LrSKBuMFG9Wy6', 'user', '2', 'NEMFU6ZGZB9LTMCDXBQS', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(90, NULL, 'user89', 'user89', 'user89@user.com', NULL, '997278427801', '$2y$10$DNz28zVh31SkvY4KieNU8u70HLyp9nvopDUuWQk3nZPMlEb5yjbwu', 'user', '2', 'D2OYJTJXD2R8W3IYLRQW', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(91, NULL, 'user90', 'user90', 'user90@user.com', NULL, '494111532459', '$2y$10$mGjBtxYnhAavjzTlHh.KCOqSpIvv4xTwkMEYouKkL4umCI5S8riYC', 'user', '2', 'G8VQQ7VQGTSULYUSQZD6', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(92, NULL, 'user91', 'user91', 'user91@user.com', NULL, '170549969270', '$2y$10$iO1A/U.IWQdWaCirA2FDguD8G6jNWeqrb1zJfPDeZWloe5dEPLqsC', 'user', '2', 'VQB7VCZPEYRCOFTGQZAD', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(93, NULL, 'user92', 'user92', 'user92@user.com', NULL, '481848334288', '$2y$10$w7HGvQ938U1o2Bx3lChrieAwvxKSAimRF7JIltvtQ5ogCrYzi64L2', 'user', '2', 'MUIDLH2NTPAZGG9OHDGD', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(94, NULL, 'user93', 'user93', 'user93@user.com', NULL, '462629163324', '$2y$10$A3zCiu8A6GkCKk6lu9Z/VevtdzaDDUXVW8L3pI10h/AAKUrBSY9Au', 'user', '2', 'QS83TROW7ARZMR6L1AOK', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(95, NULL, 'user94', 'user94', 'user94@user.com', NULL, '870803336502', '$2y$10$qiNnJWxV5aMVDIKoJf.SWeIpNznE4GMOO8YIKjCeTkQ878L.v9Lja', 'user', '2', 'FF1EEVTPVWFVGLVZAXOX', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(96, NULL, 'user95', 'user95', 'user95@user.com', NULL, '297347454763', '$2y$10$Q6ZQ5I4PDFKTi08IvBVCguJK1V6AALRNPOxpyKiShIAetUELfwInC', 'user', '2', '15OAXIB72FFDURZMQZ5F', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(97, NULL, 'user96', 'user96', 'user96@user.com', NULL, '964014323093', '$2y$10$TOUe1E5eZOYkwdTDM.uoUOLxBgLWuFg6sxxaEaBeSGOIzoRONEZwq', 'user', '2', 'PXWL9M85HGGFQAGLQLAP', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(98, NULL, 'user97', 'user97', 'user97@user.com', NULL, '312212069827', '$2y$10$aXQ9mUsFWIkNn.hRq7qFT.nDP.svrrLHZ/dt53uWO5OxnQ596IZCy', 'user', '2', '0VGAUKL9VJL16U7UBFOM', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(99, NULL, 'user98', 'user98', 'user98@user.com', NULL, '940235425567', '$2y$10$zsQZmgPG2tgAq6wyyCv3v.4Y8/W3FSRAEAKPtCRw/ukH6.gIldQyW', 'user', '2', 'HSTJIFT4DUWT481WMBC9', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(100, NULL, 'user99', 'user99', 'user99@user.com', NULL, '915755919127', '$2y$10$troNIKacH8dNorBubRZPse59M//L4Wm83ZNXAPn8kkoGlhrwQz2K6', 'user', '2', 'HFCVKIMQZAMRDHRAFJLE', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL),
(101, NULL, 'user100', 'user100', 'user100@user.com', NULL, '859589356949', '$2y$10$YEZAN6MZiJvpixClq0cXvOloreiHbvSqe7bLBVhQi28yemVM2OML.', 'user', '2', '53F1RFD0CNK67JSMALTJ', NULL, NULL, '2022-10-20 15:56:21', '2022-10-20 15:56:21', NULL, NULL, NULL, NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_template` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_business_details`
--

INSERT INTO `user_business_details` (`id`, `user_id`, `business_name`, `business_logo`, `business_email`, `business_phone`, `vat_id`, `business_address`, `currency_id`, `created_at`, `updated_at`, `email_template`) VALUES
(1, 1, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '204', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(2, 2, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '430', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-23 17:31:32', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; letter-spacing: normal;\"></h2><h2 style=\"font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 16px; line-height: 22px; white-space: pre;\"><font color=\"#000000\" style=\"letter-spacing: -0.05rem; text-align: var(--bs-body-text-align); color: rgb(0, 0, 0); font-weight: 400;\">Dear customer_name</font><span style=\"letter-spacing: -0.05rem; text-align: var(--bs-body-text-align); color: rgb(0, 0, 0); font-weight: 400;\">, There is a news for you.</span><br></h2><div style=\"font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 16px; line-height: 22px; white-space: pre;\"><span style=\"color: rgb(0, 0, 0); text-align: var(--bs-body-text-align); font-weight: 400;\">Your </span><span style=\"color: rgb(163, 21, 21); text-align: var(--bs-body-text-align); font-weight: normal;\">type_of_renew </span><span style=\"color: rgb(0, 0, 0); text-align: var(--bs-body-text-align); font-weight: 400;\">is renew_state</span><span style=\"color: rgb(0, 0, 0); text-align: var(--bs-body-text-align); font-weight: 400;\"> </span><span style=\"text-align: var(--bs-body-text-align);\">at </span><span style=\"text-align: var(--bs-body-text-align); color: rgb(163, 21, 21);\">payment_date</span><span style=\"text-align: var(--bs-body-text-align);\">.</span></div><div style=\"font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 16px; line-height: 22px; white-space: pre;\"><span style=\"text-align: var(--bs-body-text-align);\">The amount is only </span><span style=\"text-align: var(--bs-body-text-align); color: rgb(163, 21, 21);\">payment_amount</span><span style=\"text-align: var(--bs-body-text-align);\">.</span></div>'),
(3, 3, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '450', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(4, 4, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '986', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(5, 5, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '358', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(6, 6, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '270', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(7, 7, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '772', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(8, 8, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '289', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(9, 9, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '273', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(10, 10, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '132', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(11, 11, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '72', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(12, 12, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '74', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(13, 13, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '979', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(14, 14, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '688', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(15, 15, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '517', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(16, 16, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '383', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(17, 17, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '637', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(18, 18, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '853', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(19, 19, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '377', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(20, 20, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '866', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(21, 21, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '388', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(22, 22, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '324', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(23, 23, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '924', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(24, 24, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '448', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(25, 25, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '944', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(26, 26, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '854', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(27, 27, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '924', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(28, 28, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '750', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(29, 29, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '299', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(30, 30, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '738', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(31, 31, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '846', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(32, 32, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '925', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(33, 33, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '948', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(34, 34, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '573', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(35, 35, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '972', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(36, 36, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '448', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(37, 37, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '647', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(38, 38, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '203', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(39, 39, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '130', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(40, 40, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '181', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(41, 41, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '89', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(42, 42, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '52', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(43, 43, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '123', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(44, 44, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '49', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(45, 45, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '168', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(46, 46, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '722', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(47, 47, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '725', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(48, 48, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '114', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(49, 49, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '100', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(50, 50, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '656', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(51, 51, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '428', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(52, 52, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '506', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(53, 53, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '111', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(54, 54, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '182', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(55, 55, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '536', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(56, 56, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '92', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(57, 57, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '828', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(58, 58, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '253', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(59, 59, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '546', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(60, 60, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '570', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(61, 61, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '38', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(62, 62, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '288', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(63, 63, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '428', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(64, 64, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '586', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(65, 65, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '36', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(66, 66, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '456', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(67, 67, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '58', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(68, 68, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '576', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(69, 69, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '255', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(70, 70, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '643', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(71, 71, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '97', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(72, 72, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '839', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(73, 73, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '235', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(74, 74, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '918', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(75, 75, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '613', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(76, 76, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '981', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(77, 77, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '84', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(78, 78, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '106', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(79, 79, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '188', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(80, 80, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '613', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(81, 81, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '879', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(82, 82, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '726', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(83, 83, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '391', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(84, 84, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '487', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(85, 85, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '878', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(86, 86, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '421', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(87, 87, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '59', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(88, 88, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '125', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(89, 89, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '163', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(90, 90, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '997', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(91, 91, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '927', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(92, 92, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '879', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(93, 93, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '296', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(94, 94, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '516', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(95, 95, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '550', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(96, 96, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '118', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(97, 97, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '423', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(98, 98, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '205', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL),
(99, 99, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', '198', 'This is the Address', 1, '2022-10-20 15:56:22', '2022-10-20 15:56:22', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `deadline_chronologies`
--
ALTER TABLE `deadline_chronologies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
