-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 01, 2023 lúc 02:15 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `we3014.01`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `cate_name`, `slug`, `desc`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 't-shirt', NULL, NULL, NULL, NULL, -1),
(2, 'Skinny Jean', NULL, NULL, NULL, NULL, -1),
(3, 'pleated skirt', NULL, NULL, NULL, NULL, -1),
(4, 'blazer', NULL, NULL, NULL, NULL, -1),
(5, 'sweatshirt', NULL, NULL, NULL, NULL, -1),
(6, 'Dress', NULL, NULL, NULL, NULL, -1),
(7, 'backpack', NULL, NULL, NULL, NULL, -1),
(15, 'Iphone', NULL, NULL, '2022-07-22 20:35:15', '2022-07-22 20:35:15', -1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `payment_method` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `short_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `cate_id`, `price`, `short_desc`, `detail`, `star`, `created_at`, `updated_at`, `views`) VALUES
(143, 'Samsung galaxy ultra', 'samsung-galaxy-s22-ultra-do-1.jpg', 15, 123, '123', '123 3123', 0.00, NULL, NULL, 1),
(144, 'iphone 13', '48e374e9587b005fe947d932ff3e12f9.png', 4, 12, 'ưqeqw', 'qưe', 0.00, NULL, NULL, 1),
(145, 'iphone 13', '637941780379041876_samsung-galaxy-s22-bora-purple-dd.jpg', 2, 12, '', '', 0.00, NULL, NULL, 1),
(146, 'abc', '48e374e9587b005fe947d932ff3e12f9.png', 3, 123, 'n,fasd', 'mfasdmf', 0.00, NULL, NULL, 1),
(147, 'abc', 'Huami-Amazfit-Stratos-3.png', 2, 3, 'ád', 'ád', 0.00, NULL, NULL, 1),
(148, 'sản phẩm mới', '637858719099660683_samsung-galaxy-z-fold3-xanh-dd-1.jpg', 4, 1000, 'Điện thoại samsung galaxy fold xanh dương', 'Điện thoại samsung galaxy fold xanh dương', 0.00, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_galleries`
--

CREATE TABLE `product_galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `img_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `product_id`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://lorempixel.com/640/480/cats/?10546', NULL, NULL),
(2, 1, 'https://lorempixel.com/640/480/cats/?23905', NULL, NULL),
(3, 1, 'https://lorempixel.com/640/480/cats/?66813', NULL, NULL),
(4, 2, 'https://lorempixel.com/640/480/cats/?67185', NULL, NULL),
(5, 2, 'https://lorempixel.com/640/480/cats/?24575', NULL, NULL),
(6, 2, 'https://lorempixel.com/640/480/cats/?15621', NULL, NULL),
(7, 2, 'https://lorempixel.com/640/480/cats/?69292', NULL, NULL),
(8, 3, 'https://lorempixel.com/640/480/cats/?25547', NULL, NULL),
(9, 3, 'https://lorempixel.com/640/480/cats/?71965', NULL, NULL),
(10, 3, 'https://lorempixel.com/640/480/cats/?31612', NULL, NULL),
(11, 4, 'https://lorempixel.com/640/480/cats/?10227', NULL, NULL),
(12, 4, 'https://lorempixel.com/640/480/cats/?87389', NULL, NULL),
(13, 4, 'https://lorempixel.com/640/480/cats/?33849', NULL, NULL),
(14, 4, 'https://lorempixel.com/640/480/cats/?98511', NULL, NULL),
(15, 5, 'https://lorempixel.com/640/480/cats/?44170', NULL, NULL),
(16, 5, 'https://lorempixel.com/640/480/cats/?26460', NULL, NULL),
(17, 5, 'https://lorempixel.com/640/480/cats/?41734', NULL, NULL),
(18, 6, 'https://lorempixel.com/640/480/cats/?86850', NULL, NULL),
(19, 6, 'https://lorempixel.com/640/480/cats/?29948', NULL, NULL),
(20, 6, 'https://lorempixel.com/640/480/cats/?52631', NULL, NULL),
(21, 7, 'https://lorempixel.com/640/480/cats/?16016', NULL, NULL),
(22, 7, 'https://lorempixel.com/640/480/cats/?80666', NULL, NULL),
(23, 7, 'https://lorempixel.com/640/480/cats/?71484', NULL, NULL),
(24, 7, 'https://lorempixel.com/640/480/cats/?37459', NULL, NULL),
(25, 7, 'https://lorempixel.com/640/480/cats/?25810', NULL, NULL),
(26, 8, 'https://lorempixel.com/640/480/cats/?63687', NULL, NULL),
(27, 8, 'https://lorempixel.com/640/480/cats/?41774', NULL, NULL),
(28, 8, 'https://lorempixel.com/640/480/cats/?53737', NULL, NULL),
(29, 8, 'https://lorempixel.com/640/480/cats/?19013', NULL, NULL),
(30, 8, 'https://lorempixel.com/640/480/cats/?77785', NULL, NULL),
(31, 9, 'https://lorempixel.com/640/480/cats/?44243', NULL, NULL),
(32, 9, 'https://lorempixel.com/640/480/cats/?47469', NULL, NULL),
(33, 9, 'https://lorempixel.com/640/480/cats/?47198', NULL, NULL),
(34, 9, 'https://lorempixel.com/640/480/cats/?51295', NULL, NULL),
(35, 9, 'https://lorempixel.com/640/480/cats/?15267', NULL, NULL),
(36, 10, 'https://lorempixel.com/640/480/cats/?55076', NULL, NULL),
(37, 10, 'https://lorempixel.com/640/480/cats/?56526', NULL, NULL),
(38, 10, 'https://lorempixel.com/640/480/cats/?47395', NULL, NULL),
(39, 10, 'https://lorempixel.com/640/480/cats/?28764', NULL, NULL),
(40, 11, 'https://lorempixel.com/640/480/cats/?37310', NULL, NULL),
(41, 11, 'https://lorempixel.com/640/480/cats/?30736', NULL, NULL),
(42, 11, 'https://lorempixel.com/640/480/cats/?25207', NULL, NULL),
(43, 11, 'https://lorempixel.com/640/480/cats/?51950', NULL, NULL),
(44, 11, 'https://lorempixel.com/640/480/cats/?12853', NULL, NULL),
(45, 12, 'https://lorempixel.com/640/480/cats/?30453', NULL, NULL),
(46, 12, 'https://lorempixel.com/640/480/cats/?58005', NULL, NULL),
(47, 12, 'https://lorempixel.com/640/480/cats/?56907', NULL, NULL),
(48, 13, 'https://lorempixel.com/640/480/cats/?75762', NULL, NULL),
(49, 13, 'https://lorempixel.com/640/480/cats/?18853', NULL, NULL),
(50, 13, 'https://lorempixel.com/640/480/cats/?46606', NULL, NULL),
(51, 14, 'https://lorempixel.com/640/480/cats/?28151', NULL, NULL),
(52, 14, 'https://lorempixel.com/640/480/cats/?12919', NULL, NULL),
(53, 14, 'https://lorempixel.com/640/480/cats/?46318', NULL, NULL),
(54, 15, 'https://lorempixel.com/640/480/cats/?96128', NULL, NULL),
(55, 15, 'https://lorempixel.com/640/480/cats/?29842', NULL, NULL),
(56, 15, 'https://lorempixel.com/640/480/cats/?17676', NULL, NULL),
(57, 15, 'https://lorempixel.com/640/480/cats/?41467', NULL, NULL),
(58, 16, 'https://lorempixel.com/640/480/cats/?23140', NULL, NULL),
(59, 16, 'https://lorempixel.com/640/480/cats/?84316', NULL, NULL),
(60, 16, 'https://lorempixel.com/640/480/cats/?55984', NULL, NULL),
(61, 17, 'https://lorempixel.com/640/480/cats/?46900', NULL, NULL),
(62, 17, 'https://lorempixel.com/640/480/cats/?49131', NULL, NULL),
(63, 17, 'https://lorempixel.com/640/480/cats/?57927', NULL, NULL),
(64, 18, 'https://lorempixel.com/640/480/cats/?16479', NULL, NULL),
(65, 18, 'https://lorempixel.com/640/480/cats/?32847', NULL, NULL),
(66, 18, 'https://lorempixel.com/640/480/cats/?57846', NULL, NULL),
(67, 18, 'https://lorempixel.com/640/480/cats/?77881', NULL, NULL),
(68, 19, 'https://lorempixel.com/640/480/cats/?10022', NULL, NULL),
(69, 19, 'https://lorempixel.com/640/480/cats/?43867', NULL, NULL),
(70, 19, 'https://lorempixel.com/640/480/cats/?38764', NULL, NULL),
(71, 19, 'https://lorempixel.com/640/480/cats/?39340', NULL, NULL),
(72, 19, 'https://lorempixel.com/640/480/cats/?18785', NULL, NULL),
(73, 20, 'https://lorempixel.com/640/480/cats/?32524', NULL, NULL),
(74, 20, 'https://lorempixel.com/640/480/cats/?72784', NULL, NULL),
(75, 20, 'https://lorempixel.com/640/480/cats/?88463', NULL, NULL),
(76, 20, 'https://lorempixel.com/640/480/cats/?96818', NULL, NULL),
(77, 21, 'https://lorempixel.com/640/480/cats/?82362', NULL, NULL),
(78, 21, 'https://lorempixel.com/640/480/cats/?36685', NULL, NULL),
(79, 21, 'https://lorempixel.com/640/480/cats/?31232', NULL, NULL),
(80, 21, 'https://lorempixel.com/640/480/cats/?67896', NULL, NULL),
(81, 22, 'https://lorempixel.com/640/480/cats/?96932', NULL, NULL),
(82, 22, 'https://lorempixel.com/640/480/cats/?57154', NULL, NULL),
(83, 22, 'https://lorempixel.com/640/480/cats/?97056', NULL, NULL),
(84, 22, 'https://lorempixel.com/640/480/cats/?41302', NULL, NULL),
(85, 22, 'https://lorempixel.com/640/480/cats/?37458', NULL, NULL),
(86, 23, 'https://lorempixel.com/640/480/cats/?85766', NULL, NULL),
(87, 23, 'https://lorempixel.com/640/480/cats/?58748', NULL, NULL),
(88, 23, 'https://lorempixel.com/640/480/cats/?35805', NULL, NULL),
(89, 24, 'https://lorempixel.com/640/480/cats/?53471', NULL, NULL),
(90, 24, 'https://lorempixel.com/640/480/cats/?23126', NULL, NULL),
(91, 24, 'https://lorempixel.com/640/480/cats/?11787', NULL, NULL),
(92, 24, 'https://lorempixel.com/640/480/cats/?60390', NULL, NULL),
(93, 24, 'https://lorempixel.com/640/480/cats/?19663', NULL, NULL),
(94, 25, 'https://lorempixel.com/640/480/cats/?33367', NULL, NULL),
(95, 25, 'https://lorempixel.com/640/480/cats/?98762', NULL, NULL),
(96, 25, 'https://lorempixel.com/640/480/cats/?87512', NULL, NULL),
(97, 25, 'https://lorempixel.com/640/480/cats/?61615', NULL, NULL),
(98, 26, 'https://lorempixel.com/640/480/cats/?11866', NULL, NULL),
(99, 26, 'https://lorempixel.com/640/480/cats/?53197', NULL, NULL),
(100, 26, 'https://lorempixel.com/640/480/cats/?28940', NULL, NULL),
(101, 26, 'https://lorempixel.com/640/480/cats/?24319', NULL, NULL),
(102, 26, 'https://lorempixel.com/640/480/cats/?96222', NULL, NULL),
(103, 27, 'https://lorempixel.com/640/480/cats/?51850', NULL, NULL),
(104, 27, 'https://lorempixel.com/640/480/cats/?76288', NULL, NULL),
(105, 27, 'https://lorempixel.com/640/480/cats/?61211', NULL, NULL),
(106, 27, 'https://lorempixel.com/640/480/cats/?27911', NULL, NULL),
(107, 28, 'https://lorempixel.com/640/480/cats/?20731', NULL, NULL),
(108, 28, 'https://lorempixel.com/640/480/cats/?51063', NULL, NULL),
(109, 28, 'https://lorempixel.com/640/480/cats/?82564', NULL, NULL),
(110, 29, 'https://lorempixel.com/640/480/cats/?89182', NULL, NULL),
(111, 29, 'https://lorempixel.com/640/480/cats/?59597', NULL, NULL),
(112, 29, 'https://lorempixel.com/640/480/cats/?97357', NULL, NULL),
(113, 30, 'https://lorempixel.com/640/480/cats/?23119', NULL, NULL),
(114, 30, 'https://lorempixel.com/640/480/cats/?47740', NULL, NULL),
(115, 30, 'https://lorempixel.com/640/480/cats/?35375', NULL, NULL),
(116, 31, 'https://lorempixel.com/640/480/cats/?85442', NULL, NULL),
(117, 31, 'https://lorempixel.com/640/480/cats/?75400', NULL, NULL),
(118, 31, 'https://lorempixel.com/640/480/cats/?92437', NULL, NULL),
(119, 32, 'https://lorempixel.com/640/480/cats/?51217', NULL, NULL),
(120, 32, 'https://lorempixel.com/640/480/cats/?84632', NULL, NULL),
(121, 32, 'https://lorempixel.com/640/480/cats/?19840', NULL, NULL),
(122, 33, 'https://lorempixel.com/640/480/cats/?66297', NULL, NULL),
(123, 33, 'https://lorempixel.com/640/480/cats/?76125', NULL, NULL),
(124, 33, 'https://lorempixel.com/640/480/cats/?48280', NULL, NULL),
(125, 34, 'https://lorempixel.com/640/480/cats/?10008', NULL, NULL),
(126, 34, 'https://lorempixel.com/640/480/cats/?56069', NULL, NULL),
(127, 34, 'https://lorempixel.com/640/480/cats/?33208', NULL, NULL),
(128, 34, 'https://lorempixel.com/640/480/cats/?50674', NULL, NULL),
(129, 35, 'https://lorempixel.com/640/480/cats/?30989', NULL, NULL),
(130, 35, 'https://lorempixel.com/640/480/cats/?67180', NULL, NULL),
(131, 35, 'https://lorempixel.com/640/480/cats/?62204', NULL, NULL),
(132, 35, 'https://lorempixel.com/640/480/cats/?94888', NULL, NULL),
(133, 35, 'https://lorempixel.com/640/480/cats/?40690', NULL, NULL),
(134, 36, 'https://lorempixel.com/640/480/cats/?72384', NULL, NULL),
(135, 36, 'https://lorempixel.com/640/480/cats/?47333', NULL, NULL),
(136, 36, 'https://lorempixel.com/640/480/cats/?34049', NULL, NULL),
(137, 36, 'https://lorempixel.com/640/480/cats/?23086', NULL, NULL),
(138, 36, 'https://lorempixel.com/640/480/cats/?53368', NULL, NULL),
(139, 37, 'https://lorempixel.com/640/480/cats/?97320', NULL, NULL),
(140, 37, 'https://lorempixel.com/640/480/cats/?15688', NULL, NULL),
(141, 37, 'https://lorempixel.com/640/480/cats/?19290', NULL, NULL),
(142, 37, 'https://lorempixel.com/640/480/cats/?14295', NULL, NULL),
(143, 37, 'https://lorempixel.com/640/480/cats/?90872', NULL, NULL),
(144, 38, 'https://lorempixel.com/640/480/cats/?96203', NULL, NULL),
(145, 38, 'https://lorempixel.com/640/480/cats/?59453', NULL, NULL),
(146, 38, 'https://lorempixel.com/640/480/cats/?66525', NULL, NULL),
(147, 38, 'https://lorempixel.com/640/480/cats/?77968', NULL, NULL),
(148, 39, 'https://lorempixel.com/640/480/cats/?42720', NULL, NULL),
(149, 39, 'https://lorempixel.com/640/480/cats/?61860', NULL, NULL),
(150, 39, 'https://lorempixel.com/640/480/cats/?56031', NULL, NULL),
(151, 40, 'https://lorempixel.com/640/480/cats/?43305', NULL, NULL),
(152, 40, 'https://lorempixel.com/640/480/cats/?77715', NULL, NULL),
(153, 40, 'https://lorempixel.com/640/480/cats/?96875', NULL, NULL),
(154, 40, 'https://lorempixel.com/640/480/cats/?79975', NULL, NULL),
(155, 41, 'https://lorempixel.com/640/480/cats/?65481', NULL, NULL),
(156, 41, 'https://lorempixel.com/640/480/cats/?77041', NULL, NULL),
(157, 41, 'https://lorempixel.com/640/480/cats/?79734', NULL, NULL),
(158, 42, 'https://lorempixel.com/640/480/cats/?42028', NULL, NULL),
(159, 42, 'https://lorempixel.com/640/480/cats/?97900', NULL, NULL),
(160, 42, 'https://lorempixel.com/640/480/cats/?32792', NULL, NULL),
(161, 42, 'https://lorempixel.com/640/480/cats/?96427', NULL, NULL),
(162, 43, 'https://lorempixel.com/640/480/cats/?18404', NULL, NULL),
(163, 43, 'https://lorempixel.com/640/480/cats/?30561', NULL, NULL),
(164, 43, 'https://lorempixel.com/640/480/cats/?82719', NULL, NULL),
(165, 43, 'https://lorempixel.com/640/480/cats/?54915', NULL, NULL),
(166, 43, 'https://lorempixel.com/640/480/cats/?59557', NULL, NULL),
(167, 44, 'https://lorempixel.com/640/480/cats/?13149', NULL, NULL),
(168, 44, 'https://lorempixel.com/640/480/cats/?62382', NULL, NULL),
(169, 44, 'https://lorempixel.com/640/480/cats/?65684', NULL, NULL),
(170, 44, 'https://lorempixel.com/640/480/cats/?63440', NULL, NULL),
(171, 45, 'https://lorempixel.com/640/480/cats/?70977', NULL, NULL),
(172, 45, 'https://lorempixel.com/640/480/cats/?64695', NULL, NULL),
(173, 45, 'https://lorempixel.com/640/480/cats/?98096', NULL, NULL),
(174, 45, 'https://lorempixel.com/640/480/cats/?99658', NULL, NULL),
(175, 45, 'https://lorempixel.com/640/480/cats/?28580', NULL, NULL),
(176, 46, 'https://lorempixel.com/640/480/cats/?41240', NULL, NULL),
(177, 46, 'https://lorempixel.com/640/480/cats/?26337', NULL, NULL),
(178, 46, 'https://lorempixel.com/640/480/cats/?93630', NULL, NULL),
(179, 46, 'https://lorempixel.com/640/480/cats/?84024', NULL, NULL),
(180, 47, 'https://lorempixel.com/640/480/cats/?99428', NULL, NULL),
(181, 47, 'https://lorempixel.com/640/480/cats/?26891', NULL, NULL),
(182, 47, 'https://lorempixel.com/640/480/cats/?81523', NULL, NULL),
(183, 47, 'https://lorempixel.com/640/480/cats/?85579', NULL, NULL),
(184, 47, 'https://lorempixel.com/640/480/cats/?91038', NULL, NULL),
(185, 48, 'https://lorempixel.com/640/480/cats/?82464', NULL, NULL),
(186, 48, 'https://lorempixel.com/640/480/cats/?89880', NULL, NULL),
(187, 48, 'https://lorempixel.com/640/480/cats/?96576', NULL, NULL),
(188, 49, 'https://lorempixel.com/640/480/cats/?57634', NULL, NULL),
(189, 49, 'https://lorempixel.com/640/480/cats/?56556', NULL, NULL),
(190, 49, 'https://lorempixel.com/640/480/cats/?93115', NULL, NULL),
(191, 49, 'https://lorempixel.com/640/480/cats/?13609', NULL, NULL),
(192, 50, 'https://lorempixel.com/640/480/cats/?98587', NULL, NULL),
(193, 50, 'https://lorempixel.com/640/480/cats/?52770', NULL, NULL),
(194, 50, 'https://lorempixel.com/640/480/cats/?66402', NULL, NULL),
(195, 51, 'https://lorempixel.com/640/480/cats/?85831', NULL, NULL),
(196, 51, 'https://lorempixel.com/640/480/cats/?76195', NULL, NULL),
(197, 51, 'https://lorempixel.com/640/480/cats/?72317', NULL, NULL),
(198, 52, 'https://lorempixel.com/640/480/cats/?19033', NULL, NULL),
(199, 52, 'https://lorempixel.com/640/480/cats/?87591', NULL, NULL),
(200, 52, 'https://lorempixel.com/640/480/cats/?60897', NULL, NULL),
(201, 52, 'https://lorempixel.com/640/480/cats/?54972', NULL, NULL),
(202, 53, 'https://lorempixel.com/640/480/cats/?69178', NULL, NULL),
(203, 53, 'https://lorempixel.com/640/480/cats/?29671', NULL, NULL),
(204, 53, 'https://lorempixel.com/640/480/cats/?91658', NULL, NULL),
(205, 54, 'https://lorempixel.com/640/480/cats/?76412', NULL, NULL),
(206, 54, 'https://lorempixel.com/640/480/cats/?24867', NULL, NULL),
(207, 54, 'https://lorempixel.com/640/480/cats/?54658', NULL, NULL),
(208, 55, 'https://lorempixel.com/640/480/cats/?54009', NULL, NULL),
(209, 55, 'https://lorempixel.com/640/480/cats/?41465', NULL, NULL),
(210, 55, 'https://lorempixel.com/640/480/cats/?51223', NULL, NULL),
(211, 55, 'https://lorempixel.com/640/480/cats/?90484', NULL, NULL),
(212, 56, 'https://lorempixel.com/640/480/cats/?67326', NULL, NULL),
(213, 56, 'https://lorempixel.com/640/480/cats/?61444', NULL, NULL),
(214, 56, 'https://lorempixel.com/640/480/cats/?69381', NULL, NULL),
(215, 57, 'https://lorempixel.com/640/480/cats/?59653', NULL, NULL),
(216, 57, 'https://lorempixel.com/640/480/cats/?77492', NULL, NULL),
(217, 57, 'https://lorempixel.com/640/480/cats/?29601', NULL, NULL),
(218, 57, 'https://lorempixel.com/640/480/cats/?33522', NULL, NULL),
(219, 57, 'https://lorempixel.com/640/480/cats/?96833', NULL, NULL),
(220, 58, 'https://lorempixel.com/640/480/cats/?31175', NULL, NULL),
(221, 58, 'https://lorempixel.com/640/480/cats/?87020', NULL, NULL),
(222, 58, 'https://lorempixel.com/640/480/cats/?29338', NULL, NULL),
(223, 58, 'https://lorempixel.com/640/480/cats/?97502', NULL, NULL),
(224, 58, 'https://lorempixel.com/640/480/cats/?17065', NULL, NULL),
(225, 59, 'https://lorempixel.com/640/480/cats/?36711', NULL, NULL),
(226, 59, 'https://lorempixel.com/640/480/cats/?23487', NULL, NULL),
(227, 59, 'https://lorempixel.com/640/480/cats/?52090', NULL, NULL),
(228, 59, 'https://lorempixel.com/640/480/cats/?25114', NULL, NULL),
(229, 60, 'https://lorempixel.com/640/480/cats/?94806', NULL, NULL),
(230, 60, 'https://lorempixel.com/640/480/cats/?65979', NULL, NULL),
(231, 60, 'https://lorempixel.com/640/480/cats/?16462', NULL, NULL),
(232, 60, 'https://lorempixel.com/640/480/cats/?58719', NULL, NULL),
(233, 60, 'https://lorempixel.com/640/480/cats/?38888', NULL, NULL),
(234, 61, 'https://lorempixel.com/640/480/cats/?43706', NULL, NULL),
(235, 61, 'https://lorempixel.com/640/480/cats/?49139', NULL, NULL),
(236, 61, 'https://lorempixel.com/640/480/cats/?72622', NULL, NULL),
(237, 62, 'https://lorempixel.com/640/480/cats/?91536', NULL, NULL),
(238, 62, 'https://lorempixel.com/640/480/cats/?27182', NULL, NULL),
(239, 62, 'https://lorempixel.com/640/480/cats/?39972', NULL, NULL),
(240, 62, 'https://lorempixel.com/640/480/cats/?97179', NULL, NULL),
(241, 63, 'https://lorempixel.com/640/480/cats/?95300', NULL, NULL),
(242, 63, 'https://lorempixel.com/640/480/cats/?73870', NULL, NULL),
(243, 63, 'https://lorempixel.com/640/480/cats/?76734', NULL, NULL),
(244, 63, 'https://lorempixel.com/640/480/cats/?52520', NULL, NULL),
(245, 63, 'https://lorempixel.com/640/480/cats/?71973', NULL, NULL),
(246, 64, 'https://lorempixel.com/640/480/cats/?71530', NULL, NULL),
(247, 64, 'https://lorempixel.com/640/480/cats/?64561', NULL, NULL),
(248, 64, 'https://lorempixel.com/640/480/cats/?13452', NULL, NULL),
(249, 65, 'https://lorempixel.com/640/480/cats/?15601', NULL, NULL),
(250, 65, 'https://lorempixel.com/640/480/cats/?87968', NULL, NULL),
(251, 65, 'https://lorempixel.com/640/480/cats/?88828', NULL, NULL),
(252, 65, 'https://lorempixel.com/640/480/cats/?89200', NULL, NULL),
(253, 66, 'https://lorempixel.com/640/480/cats/?51062', NULL, NULL),
(254, 66, 'https://lorempixel.com/640/480/cats/?92177', NULL, NULL),
(255, 66, 'https://lorempixel.com/640/480/cats/?48145', NULL, NULL),
(256, 67, 'https://lorempixel.com/640/480/cats/?29025', NULL, NULL),
(257, 67, 'https://lorempixel.com/640/480/cats/?37588', NULL, NULL),
(258, 67, 'https://lorempixel.com/640/480/cats/?47573', NULL, NULL),
(259, 68, 'https://lorempixel.com/640/480/cats/?62921', NULL, NULL),
(260, 68, 'https://lorempixel.com/640/480/cats/?42596', NULL, NULL),
(261, 68, 'https://lorempixel.com/640/480/cats/?24186', NULL, NULL),
(262, 68, 'https://lorempixel.com/640/480/cats/?15940', NULL, NULL),
(263, 69, 'https://lorempixel.com/640/480/cats/?17788', NULL, NULL),
(264, 69, 'https://lorempixel.com/640/480/cats/?10763', NULL, NULL),
(265, 69, 'https://lorempixel.com/640/480/cats/?83058', NULL, NULL),
(266, 69, 'https://lorempixel.com/640/480/cats/?95174', NULL, NULL),
(267, 69, 'https://lorempixel.com/640/480/cats/?86660', NULL, NULL),
(268, 70, 'https://lorempixel.com/640/480/cats/?91763', NULL, NULL),
(269, 70, 'https://lorempixel.com/640/480/cats/?94007', NULL, NULL),
(270, 70, 'https://lorempixel.com/640/480/cats/?28914', NULL, NULL),
(271, 71, 'https://lorempixel.com/640/480/cats/?56913', NULL, NULL),
(272, 71, 'https://lorempixel.com/640/480/cats/?83906', NULL, NULL),
(273, 71, 'https://lorempixel.com/640/480/cats/?67868', NULL, NULL),
(274, 72, 'https://lorempixel.com/640/480/cats/?22942', NULL, NULL),
(275, 72, 'https://lorempixel.com/640/480/cats/?72215', NULL, NULL),
(276, 72, 'https://lorempixel.com/640/480/cats/?17840', NULL, NULL),
(277, 73, 'https://lorempixel.com/640/480/cats/?49262', NULL, NULL),
(278, 73, 'https://lorempixel.com/640/480/cats/?83690', NULL, NULL),
(279, 73, 'https://lorempixel.com/640/480/cats/?80454', NULL, NULL),
(280, 73, 'https://lorempixel.com/640/480/cats/?93506', NULL, NULL),
(281, 74, 'https://lorempixel.com/640/480/cats/?60060', NULL, NULL),
(282, 74, 'https://lorempixel.com/640/480/cats/?76305', NULL, NULL),
(283, 74, 'https://lorempixel.com/640/480/cats/?26573', NULL, NULL),
(284, 74, 'https://lorempixel.com/640/480/cats/?41199', NULL, NULL),
(285, 74, 'https://lorempixel.com/640/480/cats/?92334', NULL, NULL),
(286, 75, 'https://lorempixel.com/640/480/cats/?50670', NULL, NULL),
(287, 75, 'https://lorempixel.com/640/480/cats/?64812', NULL, NULL),
(288, 75, 'https://lorempixel.com/640/480/cats/?78308', NULL, NULL),
(289, 76, 'https://lorempixel.com/640/480/cats/?62819', NULL, NULL),
(290, 76, 'https://lorempixel.com/640/480/cats/?83129', NULL, NULL),
(291, 76, 'https://lorempixel.com/640/480/cats/?32736', NULL, NULL),
(292, 76, 'https://lorempixel.com/640/480/cats/?55558', NULL, NULL),
(293, 77, 'https://lorempixel.com/640/480/cats/?70344', NULL, NULL),
(294, 77, 'https://lorempixel.com/640/480/cats/?89445', NULL, NULL),
(295, 77, 'https://lorempixel.com/640/480/cats/?77880', NULL, NULL),
(296, 77, 'https://lorempixel.com/640/480/cats/?28495', NULL, NULL),
(297, 78, 'https://lorempixel.com/640/480/cats/?49993', NULL, NULL),
(298, 78, 'https://lorempixel.com/640/480/cats/?88527', NULL, NULL),
(299, 78, 'https://lorempixel.com/640/480/cats/?26314', NULL, NULL),
(300, 79, 'https://lorempixel.com/640/480/cats/?32978', NULL, NULL),
(301, 79, 'https://lorempixel.com/640/480/cats/?28861', NULL, NULL),
(302, 79, 'https://lorempixel.com/640/480/cats/?22483', NULL, NULL),
(303, 79, 'https://lorempixel.com/640/480/cats/?22837', NULL, NULL),
(304, 80, 'https://lorempixel.com/640/480/cats/?36945', NULL, NULL),
(305, 80, 'https://lorempixel.com/640/480/cats/?78182', NULL, NULL),
(306, 80, 'https://lorempixel.com/640/480/cats/?35643', NULL, NULL),
(307, 80, 'https://lorempixel.com/640/480/cats/?56801', NULL, NULL),
(308, 81, 'https://lorempixel.com/640/480/cats/?35066', NULL, NULL),
(309, 81, 'https://lorempixel.com/640/480/cats/?56994', NULL, NULL),
(310, 81, 'https://lorempixel.com/640/480/cats/?72359', NULL, NULL),
(311, 81, 'https://lorempixel.com/640/480/cats/?75484', NULL, NULL),
(312, 81, 'https://lorempixel.com/640/480/cats/?36072', NULL, NULL),
(313, 82, 'https://lorempixel.com/640/480/cats/?69415', NULL, NULL),
(314, 82, 'https://lorempixel.com/640/480/cats/?32684', NULL, NULL),
(315, 82, 'https://lorempixel.com/640/480/cats/?83509', NULL, NULL),
(316, 82, 'https://lorempixel.com/640/480/cats/?68163', NULL, NULL),
(317, 83, 'https://lorempixel.com/640/480/cats/?34439', NULL, NULL),
(318, 83, 'https://lorempixel.com/640/480/cats/?12321', NULL, NULL),
(319, 83, 'https://lorempixel.com/640/480/cats/?99543', NULL, NULL),
(320, 84, 'https://lorempixel.com/640/480/cats/?83179', NULL, NULL),
(321, 84, 'https://lorempixel.com/640/480/cats/?37380', NULL, NULL),
(322, 84, 'https://lorempixel.com/640/480/cats/?84763', NULL, NULL),
(323, 85, 'https://lorempixel.com/640/480/cats/?61238', NULL, NULL),
(324, 85, 'https://lorempixel.com/640/480/cats/?63909', NULL, NULL),
(325, 85, 'https://lorempixel.com/640/480/cats/?77036', NULL, NULL),
(326, 85, 'https://lorempixel.com/640/480/cats/?33796', NULL, NULL),
(327, 85, 'https://lorempixel.com/640/480/cats/?58483', NULL, NULL),
(328, 86, 'https://lorempixel.com/640/480/cats/?10900', NULL, NULL),
(329, 86, 'https://lorempixel.com/640/480/cats/?98306', NULL, NULL),
(330, 86, 'https://lorempixel.com/640/480/cats/?52197', NULL, NULL),
(331, 86, 'https://lorempixel.com/640/480/cats/?95751', NULL, NULL),
(332, 87, 'https://lorempixel.com/640/480/cats/?41875', NULL, NULL),
(333, 87, 'https://lorempixel.com/640/480/cats/?41472', NULL, NULL),
(334, 87, 'https://lorempixel.com/640/480/cats/?84127', NULL, NULL),
(335, 87, 'https://lorempixel.com/640/480/cats/?34285', NULL, NULL),
(336, 88, 'https://lorempixel.com/640/480/cats/?39336', NULL, NULL),
(337, 88, 'https://lorempixel.com/640/480/cats/?64044', NULL, NULL),
(338, 88, 'https://lorempixel.com/640/480/cats/?22783', NULL, NULL),
(339, 89, 'https://lorempixel.com/640/480/cats/?29636', NULL, NULL),
(340, 89, 'https://lorempixel.com/640/480/cats/?43731', NULL, NULL),
(341, 89, 'https://lorempixel.com/640/480/cats/?19978', NULL, NULL),
(342, 89, 'https://lorempixel.com/640/480/cats/?88288', NULL, NULL),
(343, 89, 'https://lorempixel.com/640/480/cats/?83141', NULL, NULL),
(344, 90, 'https://lorempixel.com/640/480/cats/?73346', NULL, NULL),
(345, 90, 'https://lorempixel.com/640/480/cats/?96721', NULL, NULL),
(346, 90, 'https://lorempixel.com/640/480/cats/?76491', NULL, NULL),
(347, 90, 'https://lorempixel.com/640/480/cats/?41459', NULL, NULL),
(348, 90, 'https://lorempixel.com/640/480/cats/?21570', NULL, NULL),
(349, 91, 'https://lorempixel.com/640/480/cats/?28548', NULL, NULL),
(350, 91, 'https://lorempixel.com/640/480/cats/?67578', NULL, NULL),
(351, 91, 'https://lorempixel.com/640/480/cats/?28660', NULL, NULL),
(352, 91, 'https://lorempixel.com/640/480/cats/?63472', NULL, NULL),
(353, 92, 'https://lorempixel.com/640/480/cats/?30587', NULL, NULL),
(354, 92, 'https://lorempixel.com/640/480/cats/?79295', NULL, NULL),
(355, 92, 'https://lorempixel.com/640/480/cats/?75003', NULL, NULL),
(356, 92, 'https://lorempixel.com/640/480/cats/?84365', NULL, NULL),
(357, 93, 'https://lorempixel.com/640/480/cats/?69509', NULL, NULL),
(358, 93, 'https://lorempixel.com/640/480/cats/?83933', NULL, NULL),
(359, 93, 'https://lorempixel.com/640/480/cats/?19892', NULL, NULL),
(360, 93, 'https://lorempixel.com/640/480/cats/?41532', NULL, NULL),
(361, 94, 'https://lorempixel.com/640/480/cats/?67116', NULL, NULL),
(362, 94, 'https://lorempixel.com/640/480/cats/?36441', NULL, NULL),
(363, 94, 'https://lorempixel.com/640/480/cats/?16388', NULL, NULL),
(364, 94, 'https://lorempixel.com/640/480/cats/?30963', NULL, NULL),
(365, 95, 'https://lorempixel.com/640/480/cats/?85888', NULL, NULL),
(366, 95, 'https://lorempixel.com/640/480/cats/?22352', NULL, NULL),
(367, 95, 'https://lorempixel.com/640/480/cats/?42291', NULL, NULL),
(368, 95, 'https://lorempixel.com/640/480/cats/?91372', NULL, NULL),
(369, 96, 'https://lorempixel.com/640/480/cats/?59349', NULL, NULL),
(370, 96, 'https://lorempixel.com/640/480/cats/?83747', NULL, NULL),
(371, 96, 'https://lorempixel.com/640/480/cats/?32735', NULL, NULL),
(372, 97, 'https://lorempixel.com/640/480/cats/?87529', NULL, NULL),
(373, 97, 'https://lorempixel.com/640/480/cats/?42776', NULL, NULL),
(374, 97, 'https://lorempixel.com/640/480/cats/?24658', NULL, NULL),
(375, 97, 'https://lorempixel.com/640/480/cats/?36707', NULL, NULL),
(376, 97, 'https://lorempixel.com/640/480/cats/?74194', NULL, NULL),
(377, 98, 'https://lorempixel.com/640/480/cats/?77399', NULL, NULL),
(378, 98, 'https://lorempixel.com/640/480/cats/?61915', NULL, NULL),
(379, 98, 'https://lorempixel.com/640/480/cats/?50838', NULL, NULL),
(380, 98, 'https://lorempixel.com/640/480/cats/?23918', NULL, NULL),
(381, 98, 'https://lorempixel.com/640/480/cats/?25714', NULL, NULL),
(382, 99, 'https://lorempixel.com/640/480/cats/?92140', NULL, NULL),
(383, 99, 'https://lorempixel.com/640/480/cats/?82045', NULL, NULL),
(384, 99, 'https://lorempixel.com/640/480/cats/?35338', NULL, NULL),
(385, 99, 'https://lorempixel.com/640/480/cats/?10732', NULL, NULL),
(386, 99, 'https://lorempixel.com/640/480/cats/?28363', NULL, NULL),
(387, 100, 'https://lorempixel.com/640/480/cats/?70770', NULL, NULL),
(388, 100, 'https://lorempixel.com/640/480/cats/?38965', NULL, NULL),
(389, 100, 'https://lorempixel.com/640/480/cats/?15945', NULL, NULL),
(392, 104, 'images/galleries/pro_104/5c3ab409d5c66.png', '2019-01-12 20:44:09', '2019-01-12 20:44:09'),
(395, 104, 'images/galleries/pro_104/5c3adfaf21275.png', '2019-01-12 23:50:23', '2019-01-12 23:50:23'),
(397, 104, 'images/galleries/pro_104/5c3ae29f408fa.png', '2019-01-13 00:02:55', '2019-01-13 00:02:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'thienth', '', 'admin@gmail.com', NULL, 900, '$2y$10$nqckGqzjiEP7BP59WM5oJO6R16EanVVG561vJqxOb6X8WiMo4PJ7K', 'itISWu9O0Y0DxIiYU7t9W4ARsgpkrqrJ2FTGtDEVPMZuW9ChLciMtohAHNXQ', NULL, NULL),
(2, 'chungcc', '', 'moderator@gmail.com', NULL, 700, '$2y$10$r3Mp1VwBhp/HsxpB3VK8yOtw8FwpGskT4vcpPOf4jiv52xcJfVjwe', 'pASVtJ9LtlAX6f6uFgRL9AEgI3p7KkiqVv6eWJekpRKMlULsUkAgG93E1zuQ', NULL, NULL),
(3, 'member', '', 'member@gmail.com', NULL, 1, '$2y$10$uy21.IAUibmlW1l68bVqxOoNiIrqECbTkdXufUqihT8LMNoe3GIqa', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`cate_name`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`invoice_id`,`product_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_cate_id_foreign` (`cate_id`);

--
-- Chỉ mục cho bảng `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT cho bảng `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=398;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
