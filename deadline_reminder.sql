-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 11:15 PM
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
(1, 'usd', 'United States', 'hGEfkc2sD3', '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(2, 'eur', 'Europe', 'q8oj2qNM71', '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(3, 'pkr', 'Pakistan', 'yn7itxnUtY', '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(4, 'inr', 'India', 'qcxjCc011k', '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(5, 'gbp', 'Great Britian', 'iWRGdSkyIY', '2022-05-30 16:14:59', '2022-05-30 16:14:59');

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
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `reminder` enum('30_days_before','60_days_before') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(2, 2, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(3, 3, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(4, 4, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(5, 5, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(6, 6, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(7, 7, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(8, 8, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(9, 9, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(10, 10, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(11, 11, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(12, 12, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(13, 13, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(14, 14, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(15, 15, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(16, 16, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(17, 17, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(18, 18, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(19, 19, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(20, 20, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(21, 21, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(22, 22, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(23, 23, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(24, 24, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(25, 25, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(26, 26, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(27, 27, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(28, 28, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(29, 29, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(30, 30, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(31, 31, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(32, 32, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(33, 33, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(34, 34, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(35, 35, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(36, 36, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(37, 37, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(38, 38, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(39, 39, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(40, 40, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(41, 41, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(42, 42, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(43, 43, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(44, 44, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(45, 45, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(46, 46, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(47, 47, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(48, 48, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(49, 49, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(50, 50, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(51, 51, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(52, 52, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(53, 53, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(54, 54, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(55, 55, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(56, 56, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(57, 57, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(58, 58, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(59, 59, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(60, 60, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(61, 61, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(62, 62, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(63, 63, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(64, 64, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(65, 65, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(66, 66, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(67, 67, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(68, 68, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(69, 69, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(70, 70, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(71, 71, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(72, 72, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(73, 73, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(74, 74, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(75, 75, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(76, 76, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(77, 77, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(78, 78, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(79, 79, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(80, 80, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(81, 81, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(82, 82, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(83, 83, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(84, 84, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(85, 85, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(86, 86, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(87, 87, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(88, 88, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(89, 89, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(90, 90, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(91, 91, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(92, 92, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(93, 93, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(94, 94, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(95, 95, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(96, 96, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(97, 97, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(98, 98, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(99, 99, 'Deadline Reminder', NULL, 'company@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59');

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
(1, 'pk_test_yKF28OfsGchVLbr4FmAH8x61002zuh3083', 'sk_test_sQJFDUoOy3WAqtUupBH9V5aM00zebNYJaP', 'test', '2022-05-30 16:14:58', '2022-05-30 16:14:58');

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
(1, NULL, 'admin', 'admin', 'admin@admin.com', NULL, '412537508197', '$2y$10$PXHKwCCs40Kj7Nn4CpLfr.J59sg3UuOqUY9QXw0u7f7zCJzvD.oq2', 'admin', '1', 'STJEUOGRVHZBJ7KGXZMA', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(2, NULL, 'user1', 'user1', 'user1@user.com', NULL, '591394855832', '$2y$10$T7y2fqdiKkuGcLixhTrQ2.vTmZmzb5u1EnQz3CQQvkOSTREfigbQK', 'user', '2', 'MQDDIGVDEWLLFXJFQZT3', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(3, NULL, 'user2', 'user2', 'user2@user.com', NULL, '770207304632', '$2y$10$sYb77jnEGQLs6hZulWHYQOoO22fYmpQqQEhnMQrT7uMBw.qLypCO6', 'user', '2', 'E90IHQLTCMD2O2L8UUED', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(4, NULL, 'user3', 'user3', 'user3@user.com', NULL, '674196462751', '$2y$10$FOvAX0jX4t.VFFhk/.pR7OieQdtq5sz7iiv/PVXyh8ZrXV0Jkrjm2', 'user', '2', 'UMQMJTEVZCFYR15I7BEP', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(5, NULL, 'user4', 'user4', 'user4@user.com', NULL, '859699946430', '$2y$10$AQpz992eW3RQ2WWNP5rpgubXF6dtwxH.VETl3eqOpEZeH9lBzHESu', 'user', '2', 'RIFEQBPRIRANBWBIHUBX', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(6, NULL, 'user5', 'user5', 'user5@user.com', NULL, '797692580421', '$2y$10$yfnW8eLkdA9oU0RtRCLVQurME2BQ243Cdk9m6J5o7SB1BIpxvh0ba', 'user', '2', 'FBFQKFWL0RJYKEIHNKEM', NULL, NULL, '2022-05-30 16:14:51', '2022-05-30 16:14:51', NULL, NULL, NULL, NULL),
(7, NULL, 'user6', 'user6', 'user6@user.com', NULL, '963098078796', '$2y$10$Shm3/A38VOqAilrPSi69lO3PGUytiJ6QMfIGK9zAX9sTP9QrWIPza', 'user', '2', 'ZUIPSKALXOCHT5PHO232', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(8, NULL, 'user7', 'user7', 'user7@user.com', NULL, '639044108506', '$2y$10$RKT5XVb3EkEBaNWv/Yxz7.PPVRUE27.saLOAg0HqNQJXyf4JesxnC', 'user', '2', 'T2ST5YJ6J0SGFP36TZHW', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(9, NULL, 'user8', 'user8', 'user8@user.com', NULL, '344363592982', '$2y$10$WiVFQ3FV4rqLFKS9KBNIIuaW1AOfC3byCGe6cGxX4QoA95erfyGfa', 'user', '2', 'GNYXZ5SG4QJUNMZEGQTV', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(10, NULL, 'user9', 'user9', 'user9@user.com', NULL, '859317908070', '$2y$10$huq1aJOPEQzzjOeVkmaO.OaDSLHBSmO8qdSx0Am2GnDhfVTnRBlOm', 'user', '2', '7BG3UL4LFW8RIT87DWXL', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(11, NULL, 'user10', 'user10', 'user10@user.com', NULL, '622902018704', '$2y$10$G3zz7D098zbmJFN60bhiLO.tGnlxqxAE3UXb.KgnyxnoXnetD6vqu', 'user', '2', '4ZRKXX3PWMXJ00VGYGTM', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(12, NULL, 'user11', 'user11', 'user11@user.com', NULL, '331533370144', '$2y$10$g/2dsHJFUekCKnuzFRyyOOXg3Dz3nPLcejzffNxNXKj.ss3U3bP7O', 'user', '2', 'GYXTXNIXXSO3891TEZJ9', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(13, NULL, 'user12', 'user12', 'user12@user.com', NULL, '613052621011', '$2y$10$N35vPzpHaEDlEkapzHeXX.I2W3GnJkVHKMsWejXxupjoyjhLIisja', 'user', '2', '8NP9SZR2N0PPBJJPWNKI', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(14, NULL, 'user13', 'user13', 'user13@user.com', NULL, '719690168173', '$2y$10$FZpsBX8.a5hWr/RVq2iEbeGDXwDU2YQBMC1Qx0uPicwURmzo8o9bu', 'user', '2', '0HGWFVDSGZMXW7KPV6RX', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(15, NULL, 'user14', 'user14', 'user14@user.com', NULL, '475257355306', '$2y$10$Cb0JQghUJ9f/rkE6iZlzFOoVjrZKv4TidlYAZCbRqnciMClzCK5QG', 'user', '2', 'GMPYBLTZGDXJCJMGRMRL', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(16, NULL, 'user15', 'user15', 'user15@user.com', NULL, '265556404775', '$2y$10$IyP6MqKkqJkR1qexWbVi7ugjg0iO5L37pwZ/JUxWqIkQPrxv95T16', 'user', '2', 'PGIPNCK6JBNHJLUTRQKL', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(17, NULL, 'user16', 'user16', 'user16@user.com', NULL, '232807884903', '$2y$10$8PKDnOHJLsUiP5Cmqynpguc745NioewlsNG1ge9ZJZ/Mo079vgKKm', 'user', '2', 'C7FUWCVHLAPCGNFWZPGF', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(18, NULL, 'user17', 'user17', 'user17@user.com', NULL, '665222036730', '$2y$10$nVY9370IRhZvmHaehFwpn.LT7CBM8a29H8/voxo2fAEw35ah1EIFy', 'user', '2', 'CMHND8S3K3REYY5IGGU7', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(19, NULL, 'user18', 'user18', 'user18@user.com', NULL, '417418018117', '$2y$10$86qSsN.7cQVQ2q6rxAotXOb7tFNZPaJ94mhOlbAtAHLEmpJg1pgV.', 'user', '2', 'OVKI0EP3AOBHHORBPRKW', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(20, NULL, 'user19', 'user19', 'user19@user.com', NULL, '112657375991', '$2y$10$oWRqYdziOIsg2ZTf5h1TMuu0bQhziS.aEOoFqU.wKSBgvYWZTryBW', 'user', '2', 'XU7Q3XWE50BI2FS5CS6X', NULL, NULL, '2022-05-30 16:14:52', '2022-05-30 16:14:52', NULL, NULL, NULL, NULL),
(21, NULL, 'user20', 'user20', 'user20@user.com', NULL, '839465754897', '$2y$10$WBpKREBCmoBLlL7SsVX29OkFV.nvMoN32A5WsYooSXjgtmlTtaJfC', 'user', '2', 'ZAFYQE1KLPXJCXQN0FSL', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(22, NULL, 'user21', 'user21', 'user21@user.com', NULL, '995985806939', '$2y$10$XK5t2LAMgL5FU/MLoJeM6uV.5W7J48UAfCuJwJjC0s3O55nFA/d/a', 'user', '2', 'DQCGJIR9FYCTJUFKUEQC', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(23, NULL, 'user22', 'user22', 'user22@user.com', NULL, '266836699834', '$2y$10$m/K2J9cSIEZEzwAh6ZqD4ull6JPRxkSiyL9kiyFexGv6g3aYeoX3O', 'user', '2', 'W9SF0ZMCSVLEP3ZCKFAI', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(24, NULL, 'user23', 'user23', 'user23@user.com', NULL, '451895980683', '$2y$10$AF1zCQS3tNBibHhcatspFuMJbU/AuI.T3dWVlthxLw8KCa2mHZvG6', 'user', '2', 'PHDMBJYSPPZTYNJZ7EEK', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(25, NULL, 'user24', 'user24', 'user24@user.com', NULL, '863788023434', '$2y$10$czAezXwIGWL7QuELlgaT5uYI6PUY/7YyXKUQjxdzTGoyIFem/gpgS', 'user', '2', 'KJMS6EAOGIQYKHNIGK6F', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(26, NULL, 'user25', 'user25', 'user25@user.com', NULL, '843308394434', '$2y$10$RLKSj5lgAKnw8mHKz8e9cObgASq4MuSAdnrKh2uvXtFJIAfUV1qH2', 'user', '2', 'XQMIBS2OED8MU5OFJSTE', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(27, NULL, 'user26', 'user26', 'user26@user.com', NULL, '231478874393', '$2y$10$hAxdv.IzglRvC9.rxElT2u439AKnPyKICtuIpiNIQ.cvc9dc5IOH6', 'user', '2', 'IQXGLJPFH65BHIDD4NTF', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(28, NULL, 'user27', 'user27', 'user27@user.com', NULL, '582244671706', '$2y$10$8AjOsJB4al9JE6FGKNeOK.08rSdpKVrDGh.zdb36aJPh/oPmR7y.a', 'user', '2', 'PSBRVSJIMR4YLQKCTTB0', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(29, NULL, 'user28', 'user28', 'user28@user.com', NULL, '292377988630', '$2y$10$FwJJaM990QTzghYlPE0hDOCJ8Owm9RGfYgbJq0K2SxkLLHHLSJ/em', 'user', '2', 'N5UZGUGZZH9JCJGCSBJJ', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(30, NULL, 'user29', 'user29', 'user29@user.com', NULL, '136489076849', '$2y$10$tXKwXxDxRZCHmQGU46p2fuYjA7VOwU.WGR/2f8IJ82NOYK3nX0C2C', 'user', '2', 'Q4F98TUV8ND3XWT7XCQK', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(31, NULL, 'user30', 'user30', 'user30@user.com', NULL, '391044953797', '$2y$10$FvkcWCQts2A6Hlz1BV/exuh7ptYz9BAUjqmasfDcw6qreGEoSOaBe', 'user', '2', 'TJQAZXRZDUILUGMRHDAF', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(32, NULL, 'user31', 'user31', 'user31@user.com', NULL, '576691191505', '$2y$10$eFrK4lTR8iHiFLmjK/LWtulSad1lN3VctdkiUHrmVojluEdLbhZ/q', 'user', '2', 'YJDIKF4ZFQR6KWE1NJVO', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(33, NULL, 'user32', 'user32', 'user32@user.com', NULL, '907401449658', '$2y$10$IXB5lfvuPyu2M1GYVDJMdunPI3ePf5JCXKSMR/BFDt5QTN1.kTwz6', 'user', '2', 'BYYOU5JF1J67RUKEZWKF', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(34, NULL, 'user33', 'user33', 'user33@user.com', NULL, '674192585108', '$2y$10$o8D7kRKjQotR4fW5HBGrXuUocySsn5MqvMqud/NZtpc4ARPdL9GhK', 'user', '2', 'BKXMT3BXMFAJEH9PRIZS', NULL, NULL, '2022-05-30 16:14:53', '2022-05-30 16:14:53', NULL, NULL, NULL, NULL),
(35, NULL, 'user34', 'user34', 'user34@user.com', NULL, '211323349456', '$2y$10$HjETtAkcZapzzSZSjVwR1OLybifvvVuA.RD.L1gfzetozFGQWhbUu', 'user', '2', 'MCOHRATCMGSSKO6CL3IX', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(36, NULL, 'user35', 'user35', 'user35@user.com', NULL, '736907227871', '$2y$10$jRe6KQ/Y.YFeHo/jKFISteICmb5ZyW2HhmPopETWtpg1x4WfTzNay', 'user', '2', '6XHALJLHPDCF3SOBC24I', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(37, NULL, 'user36', 'user36', 'user36@user.com', NULL, '152619205652', '$2y$10$6EBY8LbZFSMiNOUEAMIw7uOiT2vQjFcgV4Tufn2msZ6869JNuG5e.', 'user', '2', 'XOW4OJQHUPCUVQPO6TBM', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(38, NULL, 'user37', 'user37', 'user37@user.com', NULL, '232889905452', '$2y$10$eN85KfIjnKrfaUslJ8RhKOoVWwcMrUouHp1b9nCFqpP//8mgFcfsy', 'user', '2', 'LRCXG0SM7MSAG4EM6SLG', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(39, NULL, 'user38', 'user38', 'user38@user.com', NULL, '591685455938', '$2y$10$VUT9ajIaksrk9vtuO/23huq0nw2E72mJZMDHZLs8sfy2gtEO4RB/6', 'user', '2', 'QMDTWWX6L5XME0KH6ZQI', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(40, NULL, 'user39', 'user39', 'user39@user.com', NULL, '639486288029', '$2y$10$t3miOLk0kpgLqS9hxivHeuzrY8YoW5Jb0UaEBuMDTYP/sZjpUnHbG', 'user', '2', 'NY8BFB7CWELQWPORL2CW', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(41, NULL, 'user40', 'user40', 'user40@user.com', NULL, '137901671795', '$2y$10$oOdoTtievpO2TZjZkoOc3O8.BMyn6nGPtL1IX.45BrlMBOW1fS63m', 'user', '2', 'XWVSP8WN13CYPKHUQHK4', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(42, NULL, 'user41', 'user41', 'user41@user.com', NULL, '513260522510', '$2y$10$AdnhfcET2Y7.HgkEXAWace5WZ/JGMEQp.W/fZQInt4FtW6IDGpu3.', 'user', '2', 'UCCWIXHU37JTKF17UVZC', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(43, NULL, 'user42', 'user42', 'user42@user.com', NULL, '820492678074', '$2y$10$H4v8lRpNPfryWfltpiL...q2vSjJRUjU4ICaypq9UFzsbWPosVfqu', 'user', '2', 'XSIZZPOQLUSGSYXIWLEV', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(44, NULL, 'user43', 'user43', 'user43@user.com', NULL, '741464296836', '$2y$10$A7bVealT5Cb0pBMyrAqzjukPYIeDYikOwTPIFuG6eWYizCY2UjyHO', 'user', '2', 'FOFCDBYTUVVNXV0RMEO7', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(45, NULL, 'user44', 'user44', 'user44@user.com', NULL, '290007526696', '$2y$10$Rmly5pDe2G9V4B4ELBb1au1TsTJWz2uWgsgWSDY2ZhfCNXhWIMNJK', 'user', '2', 'PTFOUJXCT2BTYCX32SSS', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(46, NULL, 'user45', 'user45', 'user45@user.com', NULL, '848973963609', '$2y$10$UfM.W8zzYNBRE8QKL0EMHOiH0SR5VMbbHMCJb3RZsg03TpOkPdE1C', 'user', '2', 'ZGUOBVQLATZTQ0XVDTZK', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(47, NULL, 'user46', 'user46', 'user46@user.com', NULL, '230875512341', '$2y$10$lMm4gYzBk0mwLofsEs7yNuZ2FLNSLNNPYZH1UnDNSn8CigMsVM.3a', 'user', '2', 'OGQ8B1Y9MOODRMSSIYQY', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(48, NULL, 'user47', 'user47', 'user47@user.com', NULL, '140790854777', '$2y$10$RI05xWTkUtNnzcuXpD7HtelzYmL7.KYrjMogUxlKS/ZSgVxUEYvCG', 'user', '2', 'SBHLI4TWKO4C6V6K3URW', NULL, NULL, '2022-05-30 16:14:54', '2022-05-30 16:14:54', NULL, NULL, NULL, NULL),
(49, NULL, 'user48', 'user48', 'user48@user.com', NULL, '268847234379', '$2y$10$8uADio.6vMYM3dNe38KSJuRhx7HXEOSRfTmLNtx8fNHlpdEaEjxE6', 'user', '2', '0R7UDWDLU2IFQ6CQ7SSS', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(50, NULL, 'user49', 'user49', 'user49@user.com', NULL, '404096024262', '$2y$10$tPFGtZWEhniktmFFH8XOpOS6pY2gLCALfW8ulI2VDc4BqV/tO6J2e', 'user', '2', '09VXQAIPHMTPC7DAYRQS', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(51, NULL, 'user50', 'user50', 'user50@user.com', NULL, '471444719376', '$2y$10$dQgZZBkhngdZsd36HLkQOOO9fYB9rOOUH9Xw6X25SvKdu2YYXalVy', 'user', '2', 'IWCG3AVEVXLUANRVKGDT', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(52, NULL, 'user51', 'user51', 'user51@user.com', NULL, '529773724012', '$2y$10$tNRfBDZicpZYoXFPMKMKbuKV8fP51fySjqhY3wHPzt2LZPoLeaqeK', 'user', '2', 'T1MXGOXMTU1V3ZWZMPAR', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(53, NULL, 'user52', 'user52', 'user52@user.com', NULL, '408327634467', '$2y$10$CD7Cd8Q4tGcjq4RHzo0AgeaD.JoTkzc7CB5K0XHfoP7FvFpQpT40y', 'user', '2', 'MXSWXI7E2DAMRGFKO3NW', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(54, NULL, 'user53', 'user53', 'user53@user.com', NULL, '112190342989', '$2y$10$CjqkUHhEDiid39S.vJuX0u9Mk7Jr.A.dVkfdQsrBaOXOaaihrVSSe', 'user', '2', 'DMSGHRSPVLMOO9TPAQAF', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(55, NULL, 'user54', 'user54', 'user54@user.com', NULL, '735865875979', '$2y$10$uCotj/iQtM4e0WUXQ4KsHunqd5HRQPKjCCdsjmJTAPBP/Dg5QaaO2', 'user', '2', 'BR9G6NVQ4ZEY8JQCRGMU', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(56, NULL, 'user55', 'user55', 'user55@user.com', NULL, '562933628942', '$2y$10$qEZkpz/9EoGYmxcd8WpuFux12KiZmyPve3jee8hjK0zOIr5Hhu5xi', 'user', '2', 'GS71FAUKIHZOQNF6KRJK', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(57, NULL, 'user56', 'user56', 'user56@user.com', NULL, '193243418906', '$2y$10$PcdI1OqCw8OJfYuF2BD.oO6yO7ZaDmp.aIQ6zz2/U5sQr2NmgzkAm', 'user', '2', 'NXA201ZR8VQQDFLYOIGG', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(58, NULL, 'user57', 'user57', 'user57@user.com', NULL, '847678937587', '$2y$10$HtgXZ/PwRj9BZkc7ZMa4h.ZPRod6TSwxbjcfq999K7LSjrZcElV22', 'user', '2', 'I2RK82VQBAVGRNQP7GPH', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(59, NULL, 'user58', 'user58', 'user58@user.com', NULL, '205578643537', '$2y$10$unk7LAtS1NsJf.SfV67Fy.iKUdin/ThVRWvJbHkqDSbFJBwcQveWu', 'user', '2', 'I75H3AWPAIWXPEHHQPNI', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(60, NULL, 'user59', 'user59', 'user59@user.com', NULL, '756133397786', '$2y$10$Fgk2EgFc0Zyg4jkpxu4AiOwCkuZkAWaMQERpm4d8A5p31y.5rxLnS', 'user', '2', 'GUOT5S6YGVEOO8UHVEQZ', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(61, NULL, 'user60', 'user60', 'user60@user.com', NULL, '168087169551', '$2y$10$0X1KEG.B0TJ1Fit8tW0YX.cALgwUISAUt0DGZb8ao.uENdkCwJ/9C', 'user', '2', 'ZCP4CPWHHYOQLYI3A9TI', NULL, NULL, '2022-05-30 16:14:55', '2022-05-30 16:14:55', NULL, NULL, NULL, NULL),
(62, NULL, 'user61', 'user61', 'user61@user.com', NULL, '846465967857', '$2y$10$loZL6lGTv9U9Vk3U4COkd.44y.bZhHhAcRB6/ZfAoHICJ0GyPXbwe', 'user', '2', 'EHSB2V9D5Y89GGVP5UZQ', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(63, NULL, 'user62', 'user62', 'user62@user.com', NULL, '504518940209', '$2y$10$kASa760Dj9/NaxIP8dExJOwER63KrvUO3lM.jPyc8ADBE2hBHhwf.', 'user', '2', 'LO5XDV6WJ1JFH7KCIRDB', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(64, NULL, 'user63', 'user63', 'user63@user.com', NULL, '364893935256', '$2y$10$fFaNjT289CJFT/KjPIyoluGB3jkEuXR8bfaDhkVVzzlNQHaSS8BGm', 'user', '2', 'F41UN6HLJQTSYX8XEKUR', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(65, NULL, 'user64', 'user64', 'user64@user.com', NULL, '282756713373', '$2y$10$wtJRqkRg5hrs6K.8f4OTi.BXHFW2OuTxAujOmMiWAyVv41fB/5VuG', 'user', '2', 'C3J5PTY8LPOGSVAQMTHI', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(66, NULL, 'user65', 'user65', 'user65@user.com', NULL, '571575606697', '$2y$10$tRjaxexDsrzzINSmIcIp5.S/5HB0KGw7NtOT6wdLKveE0rZxH.Qtm', 'user', '2', 'UGPPAQWGRVKS7VBXYJXK', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(67, NULL, 'user66', 'user66', 'user66@user.com', NULL, '317748787477', '$2y$10$TQepaer.JWuP4eLTwuvGNeiH6r7knfoqp9sMiOyyyzp3IiazVQuLa', 'user', '2', 'HWLJACOSO9LLFE8UVPC3', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(68, NULL, 'user67', 'user67', 'user67@user.com', NULL, '747876681075', '$2y$10$Ez4W.n2ceZ51cWu7zs.8aeBnszDccTptzuV55E/0QqpyuAwFWU4ly', 'user', '2', 'N5AGTMZC4NMURAKFONNO', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(69, NULL, 'user68', 'user68', 'user68@user.com', NULL, '583652751131', '$2y$10$MR/yDVcbbM0IAvprALbDcepTFGv/b/Bv0ViPZuVGKzvT263/fKEai', 'user', '2', 'INRJUOGXCPQQKCLP79UJ', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(70, NULL, 'user69', 'user69', 'user69@user.com', NULL, '990816194494', '$2y$10$0TxSRFi2I7G9k4Cd.GQc.Ofhdom9d6NtsrDBY6Kr.iEqJaV/ZtPUu', 'user', '2', 'EGEO6O6SS7LEZ5O0GOAY', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(71, NULL, 'user70', 'user70', 'user70@user.com', NULL, '621492679849', '$2y$10$YgkKnbsUhdxVVWANy3bReuF/gzYhEhLJoTL2IPs9Mehw3l1pF1N/m', 'user', '2', 'LXHEKRYP47HUZV331NDI', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(72, NULL, 'user71', 'user71', 'user71@user.com', NULL, '618647538275', '$2y$10$QrbtwSMcl7eLj04TqFWoNOhSYUH5hAFVdzN78MM8VV9ZvZ/pZDE0q', 'user', '2', 'PIO20PINT1SYDTVRKWIH', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(73, NULL, 'user72', 'user72', 'user72@user.com', NULL, '402984156661', '$2y$10$9FJRhuInD6WNK980NKRCQezd0Eb.Fpb4u/3bam3qLVRFsfvsjb6Qa', 'user', '2', '6U4JFYRTFDKFKAJ9BVD8', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(74, NULL, 'user73', 'user73', 'user73@user.com', NULL, '522756173655', '$2y$10$uSoWqjQM1q0cl.hLMAE4YO7UME0tDaMBO8eWO/3kHKz/y54kizIHu', 'user', '2', '7LIB7WPLM9OJBSGC9ANB', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(75, NULL, 'user74', 'user74', 'user74@user.com', NULL, '286785102246', '$2y$10$7P6LsR8NNNV0tddjfqdF4OICgHKIsAFlBF3wBy.eb7sKHfjxoSVPG', 'user', '2', 'UBSRKWYLODJIIB7IWR9L', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(76, NULL, 'user75', 'user75', 'user75@user.com', NULL, '674882813714', '$2y$10$8gmrXY0S2tOXjea7LoHvd.O6P3kb7NjYNAmgl4fCaM.4NzIbDi9pm', 'user', '2', 'ENFAWOCQJD9JOVRVTTGP', NULL, NULL, '2022-05-30 16:14:56', '2022-05-30 16:14:56', NULL, NULL, NULL, NULL),
(77, NULL, 'user76', 'user76', 'user76@user.com', NULL, '529745626522', '$2y$10$4LVobAqK/D3IgoIfbvNaKuC0tOjUifCU96qmLHV61lTs3cO2bptpm', 'user', '2', 'YWZPEVLIJ3EJLQEEOHUI', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(78, NULL, 'user77', 'user77', 'user77@user.com', NULL, '317445849152', '$2y$10$srADypBrXkcMyiJ.hS89rOru3QAD0Ot9eaxgSVqXDUjhhSQZIvdxK', 'user', '2', 'DHTXZFO7VDT10Y5PTMP8', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(79, NULL, 'user78', 'user78', 'user78@user.com', NULL, '128049002373', '$2y$10$kf5B33HTb3F4V5fDPoWiNu5qxjhAkth.c0YigfDjLrDVZEThOvrU.', 'user', '2', 'MFWXUJMR0PUHHV5342XX', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(80, NULL, 'user79', 'user79', 'user79@user.com', NULL, '110509187809', '$2y$10$y0.9CAeX4joA4P5RYGJPku.ijPV8u2.nqxURUtpYry.LXPws707AS', 'user', '2', '4HSHQFEZYDHCRNJAFRO4', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(81, NULL, 'user80', 'user80', 'user80@user.com', NULL, '973075150487', '$2y$10$ur.JSDZyV0vFD1lw2nUHZ.vr6Wwl2HoD5T4rUbJRFYUpCem8rjmvS', 'user', '2', 'NFSOXEKNJCTHNAPUUNXE', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(82, NULL, 'user81', 'user81', 'user81@user.com', NULL, '661753068536', '$2y$10$5nKzb1ZCNTfPhtLTln98VeoHHyqJxR/CkbViuc6sppkOFT9M0eLqC', 'user', '2', 'GG3R3RREFSLBDQ8UROUO', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(83, NULL, 'user82', 'user82', 'user82@user.com', NULL, '539582680109', '$2y$10$TGNVpywtYx0m3udKW3JhY..aTfqtK3T662mjmghhaETalDygMYRyO', 'user', '2', '4PQCA0UGBJV2G6KK6TNI', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(84, NULL, 'user83', 'user83', 'user83@user.com', NULL, '270201274140', '$2y$10$lK6Uztuku37Cc8iWIdbtpu8Ryr4IrCL3KAnSulKcF/z2jZTWpzt3q', 'user', '2', 'UMZCGVGRMI65CUQED5YS', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(85, NULL, 'user84', 'user84', 'user84@user.com', NULL, '274297889309', '$2y$10$tAQd4chluBTFCUP3Rv8V3OZ.ECaFpNuGk7FrW6HCybgNHDTv7VFmS', 'user', '2', 'GTD546GPRMVYMSMXWGVC', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(86, NULL, 'user85', 'user85', 'user85@user.com', NULL, '979768486330', '$2y$10$eespiv8LM7Zlk3HsI2Fevedpa1CEmUS4sINy2vSe7Xjxzg.FPb9bO', 'user', '2', '7ADARX5TGBWPC0OBDVBL', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(87, NULL, 'user86', 'user86', 'user86@user.com', NULL, '443500555769', '$2y$10$YpXy5fcl7bKWClMcvwFt5usxv6ylC7QfQt9vMgEEBik1Xbla9jBSW', 'user', '2', 'RL2NZXUTEHXCX3UM4IKA', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(88, NULL, 'user87', 'user87', 'user87@user.com', NULL, '698647695150', '$2y$10$Utj075pYDs5FEyl9N6vzquR2t/d2Sa25Q0oSMvvoKxpJSgOREehQi', 'user', '2', 'MXEGXWUBA4IJZSTGVDRF', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(89, NULL, 'user88', 'user88', 'user88@user.com', NULL, '673158134612', '$2y$10$uFgj/lFv1KOmisG7ntVw3.SGknCQkdU9AUCNQeFO.2HPdOiyqsTge', 'user', '2', 'DASWE3Z4COUHGHHRUUII', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(90, NULL, 'user89', 'user89', 'user89@user.com', NULL, '275110421232', '$2y$10$2m/n78SLnFaW3wB/9PnH3eVwE.wSXP7d1VH1IaqlyHHdGZNt9kEGS', 'user', '2', 'EPCSEV2UL7IROXIUF9ZU', NULL, NULL, '2022-05-30 16:14:57', '2022-05-30 16:14:57', NULL, NULL, NULL, NULL),
(91, NULL, 'user90', 'user90', 'user90@user.com', NULL, '825272132804', '$2y$10$upLqfNgeVeq2ecXeqjBhzOs6ZWD9VF2B9xTUwEA9RQv/An/Ee2mmS', 'user', '2', 'OZM0CMS6PYVIW71HZRXV', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(92, NULL, 'user91', 'user91', 'user91@user.com', NULL, '916832129990', '$2y$10$aWqAYPe.ubIBqp1AixLqj.2UwXkkruyJINgSWSHCzxYrjmd2okS1K', 'user', '2', 'DIVOEBQXNEWRFY0VPKXZ', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(93, NULL, 'user92', 'user92', 'user92@user.com', NULL, '891320329652', '$2y$10$IVBR46GpMRqQ0BdI4yPJKOAWXZfQ5m4RXksq.T1ZmIpGzeWtn/9.S', 'user', '2', 'LXTZ6K20GFIRYZIQT8TJ', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(94, NULL, 'user93', 'user93', 'user93@user.com', NULL, '573936809467', '$2y$10$Ll4.FIWOgivzjH5J3iOweOp4W6fwq9V7AjUOEZ.2hWhsDruCgcEKG', 'user', '2', '5MAXAVJUBRCLAKSTFVDJ', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(95, NULL, 'user94', 'user94', 'user94@user.com', NULL, '788546306758', '$2y$10$VrHg27Uj732DwhqLfMxvR.vm/IJRdmjKze0D3tjvsLNnD6r1qXTsi', 'user', '2', 'ZPAUJ0NECGYZY2TGR6LS', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(96, NULL, 'user95', 'user95', 'user95@user.com', NULL, '802638749557', '$2y$10$9LTo88wRcPccIGPcTAImXOHPNqOHJhz/m8FKpDKUtQKmaf8X8s6GO', 'user', '2', 'SNCJNMJPQJQPJHCDNXGD', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(97, NULL, 'user96', 'user96', 'user96@user.com', NULL, '548110803254', '$2y$10$MK80tLDSMK6o2zFwUYwFEeZr.QdNnnsuliJIHvzIM20S5lNsiTE9S', 'user', '2', 'ESMDNWHSDTDLFQUGCBVH', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(98, NULL, 'user97', 'user97', 'user97@user.com', NULL, '294881446103', '$2y$10$HZkrwbKleqmz7xix/usiWOgG9knydEBXgAtKU0uDSKW8hd6TOfYJa', 'user', '2', 'CJOV4U3GBVJGLWAIZLQQ', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(99, NULL, 'user98', 'user98', 'user98@user.com', NULL, '128169069822', '$2y$10$MMBF4RwahGpxBmY0moKfpuLuZM/cQkyKiVMZrQ0aDieJjTBfxhbY2', 'user', '2', 'U9YM5TNEEIVYUJPNGAY0', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(100, NULL, 'user99', 'user99', 'user99@user.com', NULL, '642120044972', '$2y$10$H614P43rsmjYVAYblBATbO8beq.1Zo/3Gv.vmdqQ0rVOfzAIF2QRK', 'user', '2', 'S9LT0ACGWKDFW1NG9B4A', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL),
(101, NULL, 'user100', 'user100', 'user100@user.com', NULL, '934927382667', '$2y$10$dTXKVxmvX8RpWUnx7YoMzeVlPIW6QOfgYzttfb8S2YcEO7bpX0tuq', 'user', '2', 'NLUOOFOK7LTFZTICDAXY', NULL, NULL, '2022-05-30 16:14:58', '2022-05-30 16:14:58', NULL, NULL, NULL, NULL);

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
  `business_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_business_details`
--

INSERT INTO `user_business_details` (`id`, `user_id`, `business_name`, `business_logo`, `business_email`, `business_phone`, `business_address`, `currency_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(2, 2, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(3, 3, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(4, 4, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(5, 5, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(6, 6, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(7, 7, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(8, 8, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(9, 9, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(10, 10, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(11, 11, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(12, 12, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(13, 13, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(14, 14, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(15, 15, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(16, 16, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(17, 17, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(18, 18, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(19, 19, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(20, 20, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(21, 21, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(22, 22, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(23, 23, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(24, 24, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(25, 25, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(26, 26, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(27, 27, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(28, 28, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(29, 29, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(30, 30, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(31, 31, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(32, 32, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(33, 33, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(34, 34, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(35, 35, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(36, 36, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(37, 37, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(38, 38, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(39, 39, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(40, 40, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(41, 41, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(42, 42, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(43, 43, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(44, 44, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(45, 45, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(46, 46, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(47, 47, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(48, 48, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(49, 49, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(50, 50, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(51, 51, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(52, 52, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(53, 53, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(54, 54, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(55, 55, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(56, 56, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(57, 57, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(58, 58, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(59, 59, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(60, 60, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(61, 61, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(62, 62, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(63, 63, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(64, 64, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(65, 65, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(66, 66, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(67, 67, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(68, 68, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(69, 69, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(70, 70, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(71, 71, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(72, 72, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(73, 73, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(74, 74, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(75, 75, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(76, 76, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(77, 77, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(78, 78, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(79, 79, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(80, 80, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(81, 81, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(82, 82, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(83, 83, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(84, 84, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(85, 85, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(86, 86, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(87, 87, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(88, 88, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(89, 89, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(90, 90, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(91, 91, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(92, 92, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(93, 93, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(94, 94, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(95, 95, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(96, 96, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(97, 97, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(98, 98, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59'),
(99, 99, 'Deadline Reminder', NULL, 'business@email.com', '+00000000000', 'This is the Address', 1, '2022-05-30 16:14:59', '2022-05-30 16:14:59');

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
  ADD UNIQUE KEY `customers_email_unique` (`email`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deadlines`
--
ALTER TABLE `deadlines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
