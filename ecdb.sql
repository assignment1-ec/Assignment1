-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 08, 2017 lúc 05:20 CH
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Không rõ',
  `is_published` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `republished_date` date DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `isbn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8_unicode_ci,
  `vat` float DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `book_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `name`, `is_published`, `price`, `author`, `publisher`, `published_date`, `republished_date`, `weight`, `isbn`, `language`, `short_description`, `long_description`, `vat`, `icon`, `book_type_id`, `created_at`, `updated_at`) VALUES
(101, 'Thám tử lừng danh Conan', 1, 50000, 'Ram Điểu', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 200, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'Sự thật nào sẽ được làm sáng tỏ đằng sau mối bất hòa giữa hai con người phục vụ công lí ở hai vị thế khác nhau - mật vụ FBI Akai và cảnh sát Amuro!?\r\n\r\nCuộc phiêu lưu mới sẽ đưa độc giả đến gần hơn với Tổ chức Áo Đen, tiết lộ mối quan hệ giữa Sera và “em gái ngoài lãnh địa”!!\r\n\r\nCuối cùng, chuyện tình cảm giữa Heiji và Kazuha cũng có nhiều chuyển biến…!! Tóm lại là sau một thời gian gây bão, thám tử Conan tập 90 đã ấn định ngày phát hành: 24.02 trên toàn quốc!! Chúc các bạn một năm mới tưng bừng và hào hứng nhé…!!', 0.05, 'images/conan1.jpg', 107, '2017-04-29 17:00:00', '2017-04-29 17:00:00'),
(102, 'Thám tử lừng danh Conan', 1, 40000, 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 200, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'Sự thật nào sẽ được làm sáng tỏ đằng sau mối bất hòa giữa hai con người phục vụ công lí ở hai vị thế khác nhau - mật vụ FBI Akai và cảnh sát Amuro!?\r\n\r\nCuộc phiêu lưu mới sẽ đưa độc giả đến gần hơn với Tổ chức Áo Đen, tiết lộ mối quan hệ giữa Sera và “em gái ngoài lãnh địa”!!\r\n\r\nCuối cùng, chuyện tình cảm giữa Heiji và Kazuha cũng có nhiều chuyển biến…!! Tóm lại là sau một thời gian gây bão, thám tử Conan tập 90 đã ấn định ngày phát hành: 24.02 trên toàn quốc!! Chúc các bạn một năm mới tưng bừng và hào hứng nhé…!!', 0.05, 'images/conan2.jpg', 107, '2017-04-29 17:00:00', '2017-04-29 17:00:00'),
(103, 'Thám tử lừng danh Conan 2', 1, 60000, 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 300, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 0.05, 'images/conan3.jpg', 107, '2017-04-29 17:00:00', '2017-04-29 17:00:00'),
(104, 'Thám tử lừng danh Conan 3', 1, 40000, 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 200, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 0.05, 'images/conan3.jpg', 107, '2017-04-29 17:00:00', '2017-04-29 17:00:00'),
(105, 'Giải tích 1', 1, 40000, 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 200, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 0.05, 'images/conan4.jpg', 101, '2017-04-29 17:00:00', '2017-04-29 17:00:00'),
(106, 'Kinh tế đại cương', 1, 40000, 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', 200, '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 0.05, 'images/conan2.jpg', 104, '2017-04-29 17:00:00', '2017-04-29 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_images`
--

CREATE TABLE `book_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book_images`
--

INSERT INTO `book_images` (`id`, `book_id`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 101, 'images/conan1.jpg', NULL, NULL),
(2, 101, 'images/conan2.jpg', NULL, NULL),
(3, 101, 'images/conan3.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_managements`
--

CREATE TABLE `book_managements` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `sold_count_week` int(11) NOT NULL,
  `sold_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_types`
--

CREATE TABLE `book_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `typename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book_types`
--

INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES
(101, 'SGK-Toán', 'SGK-Toán', 1, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(102, 'Âm nhạc', 'Âm nhạc', 2, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(103, 'Xã hội', 'Xã hội', 3, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(104, 'Kinh tế học', 'Kinh tế học', 4, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(105, 'Khoa học', 'Khoa học', 5, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(106, 'Văn hóa', 'Văn hóa', 6, '2017-05-30 17:00:00', '2017-05-30 17:00:00'),
(107, 'Truyện', 'Truyện', 7, '2017-05-30 17:00:00', '2017-05-30 17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `book_id`, `user_id`, `number`, `created_at`, `updated_at`) VALUES
(23, 102, 1, 3, '2017-05-07 19:34:25', '2017-05-07 23:41:39'),
(24, 103, 1, 1, '2017-05-07 19:34:57', '2017-05-07 19:34:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_books`
--

CREATE TABLE `discount_books` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `district_regions`
--

CREATE TABLE `district_regions` (
  `id` int(2) NOT NULL,
  `province_region_id` int(3) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `district_regions`
--

INSERT INTO `district_regions` (`id`, `province_region_id`, `name`, `description`) VALUES
(1, 1, 'Quận 1', NULL),
(2, 1, 'Quận 2', NULL),
(3, 1, 'Quận 3', NULL),
(4, 1, 'Quận 4', NULL),
(5, 1, 'Quận 5', NULL),
(6, 1, 'Quận 6', NULL),
(7, 1, 'Quận 7', NULL),
(8, 1, 'Quận 8', NULL),
(9, 1, 'Quận 9', NULL),
(10, 1, 'Quận 10', NULL),
(11, 1, 'Quận 11', NULL),
(12, 1, 'Quận 12', NULL),
(13, 1, 'Quận Bình Tân', NULL),
(14, 1, 'Huyện Bình Chánh', NULL),
(15, 1, 'Huyện Nhà Bè', NULL),
(16, 2, 'TP Thủ Dầu Một', NULL),
(17, 2, 'TX Bến Cát', NULL),
(18, 2, 'TX Dĩ An', NULL),
(19, 2, 'TX Thuận An', NULL),
(20, 2, 'Huyện Dầu Tiếng', NULL),
(21, 2, 'Huyện Phú Giao', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(23, '2014_10_12_000000_create_users_table', 1),
(24, '2014_10_12_100000_create_password_resets_table', 1),
(25, '2017_04_28_043403_create_book_types_table', 1),
(26, '2017_04_28_043444_create_books_table', 1),
(27, '2017_04_28_043531_discount_books_table', 1),
(28, '2017_04_28_043730_create_carts_table', 1),
(29, '2017_04_28_043858_create_book_images_table', 1),
(30, '2017_04_28_043953_create_book_managements_table', 1),
(31, '2017_04_28_044025_create_orders_table', 1),
(32, '2017_04_28_044235_create_old_books_table', 1),
(33, '2017_04_28_044253_create_ordered_books_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `old_books`
--

CREATE TABLE `old_books` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordered_books`
--

CREATE TABLE `ordered_books` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ordered_books`
--

INSERT INTO `ordered_books` (`id`, `order_id`, `book_id`, `count`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 2, 102, 2, 40000, NULL, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(2, 2, 103, 3, 60000, NULL, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(3, 2, 105, 1, 40000, NULL, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(4, 2, 101, 3, 50000, NULL, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(5, 2, 104, 1, 40000, NULL, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(6, 3, 102, 1, 40000, NULL, '2017-05-06 08:11:21', '2017-05-06 08:11:21'),
(7, 4, 102, 1, 40000, NULL, '2017-05-06 08:15:13', '2017-05-06 08:15:13'),
(8, 5, 102, 1, 40000, NULL, '2017-05-06 08:22:05', '2017-05-06 08:22:05'),
(9, 6, 102, 2, 40000, NULL, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(10, 6, 103, 3, 60000, NULL, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(11, 6, 105, 1, 40000, NULL, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(12, 6, 101, 4, 50000, NULL, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(13, 6, 104, 1, 40000, NULL, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(14, 7, 102, 2, 40000, NULL, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(15, 7, 103, 3, 60000, NULL, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(16, 7, 105, 1, 40000, NULL, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(17, 7, 101, 4, 50000, NULL, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(18, 7, 104, 1, 40000, NULL, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(19, 8, 102, 2, 40000, NULL, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(20, 8, 103, 3, 60000, NULL, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(21, 8, 105, 1, 40000, NULL, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(22, 8, 101, 4, 50000, NULL, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(23, 8, 104, 1, 40000, NULL, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(24, 9, 102, 2, 40000, NULL, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(25, 9, 103, 3, 60000, NULL, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(26, 9, 105, 1, 40000, NULL, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(27, 9, 101, 4, 50000, NULL, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(28, 9, 104, 1, 40000, NULL, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(29, 10, 102, 2, 40000, NULL, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(30, 10, 103, 3, 60000, NULL, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(31, 10, 105, 1, 40000, NULL, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(32, 10, 101, 4, 50000, NULL, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(33, 10, 104, 1, 40000, NULL, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(34, 11, 102, 2, 40000, NULL, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(35, 11, 103, 3, 60000, NULL, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(36, 11, 105, 1, 40000, NULL, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(37, 11, 101, 4, 50000, NULL, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(38, 11, 104, 1, 40000, NULL, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(39, 12, 102, 2, 40000, NULL, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(40, 12, 103, 3, 60000, NULL, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(41, 12, 105, 1, 40000, NULL, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(42, 12, 101, 4, 50000, NULL, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(43, 12, 104, 1, 40000, NULL, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(44, 13, 102, 2, 40000, NULL, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(45, 13, 103, 3, 60000, NULL, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(46, 13, 105, 1, 40000, NULL, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(47, 13, 101, 4, 50000, NULL, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(48, 13, 104, 1, 40000, NULL, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(49, 14, 102, 2, 40000, NULL, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(50, 14, 103, 3, 60000, NULL, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(51, 14, 105, 1, 40000, NULL, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(52, 14, 101, 4, 50000, NULL, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(53, 14, 104, 1, 40000, NULL, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(54, 15, 102, 2, 40000, NULL, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(55, 15, 103, 3, 60000, NULL, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(56, 15, 105, 1, 40000, NULL, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(57, 15, 101, 4, 50000, NULL, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(58, 15, 104, 1, 40000, NULL, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(59, 16, 102, 2, 40000, NULL, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(60, 16, 103, 3, 60000, NULL, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(61, 16, 105, 1, 40000, NULL, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(62, 16, 101, 4, 50000, NULL, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(63, 16, 104, 1, 40000, NULL, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(64, 17, 102, 2, 40000, NULL, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(65, 17, 103, 3, 60000, NULL, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(66, 17, 105, 1, 40000, NULL, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(67, 17, 101, 4, 50000, NULL, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(68, 17, 104, 1, 40000, NULL, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(69, 18, 102, 2, 40000, NULL, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(70, 18, 103, 3, 60000, NULL, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(71, 18, 105, 1, 40000, NULL, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(72, 18, 101, 4, 50000, NULL, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(73, 18, 104, 1, 40000, NULL, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(74, 19, 102, 2, 40000, NULL, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(75, 19, 103, 3, 60000, NULL, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(76, 19, 105, 1, 40000, NULL, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(77, 19, 101, 4, 50000, NULL, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(78, 19, 104, 1, 40000, NULL, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(79, 20, 102, 2, 40000, NULL, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(80, 20, 103, 3, 60000, NULL, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(81, 20, 105, 1, 40000, NULL, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(82, 20, 101, 4, 50000, NULL, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(83, 20, 104, 1, 40000, NULL, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(84, 21, 102, 16, 40000, NULL, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(85, 21, 103, 6, 60000, NULL, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(86, 21, 105, 1, 40000, NULL, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(87, 21, 101, 4, 50000, NULL, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(88, 21, 104, 1, 40000, NULL, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(89, 22, 102, 16, 40000, NULL, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(90, 22, 103, 6, 60000, NULL, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(91, 22, 105, 1, 40000, NULL, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(92, 22, 101, 4, 50000, NULL, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(93, 22, 104, 1, 40000, NULL, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(94, 23, 102, 16, 40000, NULL, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(95, 23, 103, 6, 60000, NULL, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(96, 23, 105, 1, 40000, NULL, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(97, 23, 101, 4, 50000, NULL, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(98, 23, 104, 1, 40000, NULL, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(99, 24, 104, 1, 40000, NULL, '2017-05-06 09:59:12', '2017-05-06 09:59:12'),
(100, 25, 102, 6, 40000, NULL, '2017-05-06 20:26:01', '2017-05-06 20:26:01'),
(101, 25, 103, 10, 60000, NULL, '2017-05-06 20:26:01', '2017-05-06 20:26:01'),
(102, 25, 105, 8, 40000, NULL, '2017-05-06 20:26:01', '2017-05-06 20:26:01'),
(103, 25, 101, 20, 50000, NULL, '2017-05-06 20:26:01', '2017-05-06 20:26:01'),
(104, 25, 104, 3, 40000, NULL, '2017-05-06 20:26:01', '2017-05-06 20:26:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `trans_status` int(11) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_province` int(11) NOT NULL,
  `shipping_district` int(11) NOT NULL,
  `shipping_ward` int(11) NOT NULL,
  `shipping_phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `vat` int(11) NOT NULL,
  `ship_fee` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `email`, `full_name`, `is_paid`, `order_date`, `trans_status`, `shipping_date`, `shipping_address`, `shipping_province`, `shipping_district`, `shipping_ward`, `shipping_phone_number`, `total_price`, `vat`, `ship_fee`, `created_at`, `updated_at`) VALUES
(2, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 17:58:00', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 514500, 24500, 0, '2017-05-06 03:58:00', '2017-05-06 03:58:00'),
(3, 0, '51303392@hcmut.edu.vn.com', 'Ram', 0, '2017-05-06 22:11:21', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 42000, 2000, 0, '2017-05-06 08:11:21', '2017-05-06 08:11:21'),
(4, 0, '51303392@hcmut.edu.vn.com', 'Ram', 0, '2017-05-06 22:15:13', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 42000, 2000, 0, '2017-05-06 08:15:13', '2017-05-06 08:15:13'),
(5, 0, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:22:05', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 42000, 2000, 0, '2017-05-06 08:22:05', '2017-05-06 08:22:05'),
(6, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:40:53', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:40:53', '2017-05-06 08:40:53'),
(7, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:42:28', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:42:28', '2017-05-06 08:42:28'),
(8, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:46:10', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:46:10', '2017-05-06 08:46:10'),
(9, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:55:42', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:55:42', '2017-05-06 08:55:42'),
(10, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:56:41', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:56:41', '2017-05-06 08:56:41'),
(11, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:57:29', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:57:29', '2017-05-06 08:57:29'),
(12, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:57:54', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:57:54', '2017-05-06 08:57:54'),
(13, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 22:59:10', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 08:59:10', '2017-05-06 08:59:10'),
(14, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 23:00:26', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 09:00:26', '2017-05-06 09:00:26'),
(15, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 23:01:32', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 09:01:32', '2017-05-06 09:01:32'),
(16, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 23:02:49', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 09:02:49', '2017-05-06 09:02:49'),
(17, 1, 'vramsngrai@gmail.com', 'Ram', 0, '2017-05-06 23:03:54', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 09:03:54', '2017-05-06 09:03:54'),
(18, 1, 'phuocsang.cse@gmail.com', 'Sang Phước Hồ', 0, '2017-05-06 23:10:28', NULL, NULL, '2004, Tầng 20, 278 Lý thường Kiệt, Củ Chi', 1, 1, 1, '986315698', 567000, 27000, 20000, '2017-05-06 09:10:28', '2017-05-06 09:10:28'),
(19, 1, '51303514@hcmut.edu.vn', 'Nguyễn Hữu Tâm', 0, '2017-05-06 23:14:15', NULL, NULL, '2004, Tầng 20, 278 Lý thường Kiệt', 2, 16, 9, '986315698', 567000, 27000, 0, '2017-05-06 09:14:15', '2017-05-06 09:14:15'),
(20, 1, '51303567@hcmut.edu.vn', 'Văn Ngọc Tân', 0, '2017-05-06 23:15:09', NULL, NULL, '2004, Tầng 20, 278 Lý thường Kiệt - Troll', 1, 1, 1, '986315698', 567000, 27000, 0, '2017-05-06 09:15:09', '2017-05-06 09:15:09'),
(21, 1, 'vramsngrai@gmail.com', 'Văn Ngọc Tân', 0, '2017-05-06 23:46:13', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 2, 16, 10, '986315698', 1344000, 64000, 20000, '2017-05-06 09:46:13', '2017-05-06 09:46:13'),
(22, 1, 'vramsngrai@gmail.com', 'Văn Ngọc Tân', 0, '2017-05-06 23:50:48', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 1344000, 64000, 20000, '2017-05-06 09:50:48', '2017-05-06 09:50:48'),
(23, 1, 'vramsngrai@gmail.com', 'Văn Ngọc Tân', 0, '2017-05-06 23:54:14', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 1344000, 64000, 0, '2017-05-06 09:54:14', '2017-05-06 09:54:14'),
(24, 1, 'vramsngrai@gmail.com', 'Văn Ngọc Tân', 0, '2017-05-06 23:59:12', NULL, NULL, 'Xã Tân Hưng - Huyện Hớn Quản-Tỉnh Bình Phước', 1, 1, 1, '986315698', 42000, 2000, 0, '2017-05-06 09:59:12', '2017-05-06 09:59:12'),
(25, 1, '51302751@hcmut.edu.vn', 'Cao Khánh Nhật', 0, '2017-05-07 10:26:01', NULL, NULL, '278 Lý thường Kiệt', 2, 16, 9, '0986666333', 2394000, 114000, 20000, '2017-05-06 20:26:01', '2017-05-06 20:26:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province_regions`
--

CREATE TABLE `province_regions` (
  `id` int(2) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `province_regions`
--

INSERT INTO `province_regions` (`id`, `name`, `description`) VALUES
(1, 'TP Hồ Chí Minh', NULL),
(2, 'Bình Dương', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `address`, `phone_number`, `status`, `avatar`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(0, 'Customer', NULL, NULL, 0, NULL, 'null', 'null@gmail.com', '$2y$10$mcvso3VHjxcHIpByP5Nyqejm4vxm04fuG4Qhg0zl6T8x0.Hs6QtZ.', 'Xu1Ci3OICA3t46oPROEpOMRpf2QKRx7Ud2JsGmjK1wOd8uufyWx0cIXAq8nW', '2017-05-01 04:58:34', '2017-05-05 03:35:10'),
(1, 'Iron Man', NULL, NULL, 0, NULL, 'vramsngrai', 'vramsngrai@gmail.com', '$2y$10$mcvso3VHjxcHIpByP5Nyqejm4vxm04fuG4Qhg0zl6T8x0.Hs6QtZ.', '8lTomcqRlQYRSnFh5RoRQnWQb6YfUDjZ8zM2lxffV1IssZaSzWY3P6izocdS', '2017-05-01 04:58:34', '2017-05-05 03:35:10'),
(2, 'Ram Điểu A', NULL, NULL, 0, NULL, 'admin1234', 'admin@gmail.com', '$2y$10$MZs.ifKO0pPPImuZvLG9J.i3N5ae.UdAMJjKoqWiUakc2u3lvx0e.', NULL, '2017-05-04 02:19:00', '2017-05-04 02:19:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ward_regions`
--

CREATE TABLE `ward_regions` (
  `id` int(2) NOT NULL,
  `district_region_id` int(2) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ward_regions`
--

INSERT INTO `ward_regions` (`id`, `district_region_id`, `name`, `description`) VALUES
(1, 1, 'Phường Bến Nghé', NULL),
(2, 1, 'Phường Bến Thành', NULL),
(3, 2, 'Phường 1', NULL),
(4, 2, 'Phường 2', NULL),
(5, 3, 'Phường 12', NULL),
(6, 3, 'Phường 6', NULL),
(7, 4, 'Phường 5', NULL),
(8, 4, 'Phường 9', NULL),
(9, 16, 'Phường Chánh Mỹ', NULL),
(10, 16, 'Định Hòa', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_images`
--
ALTER TABLE `book_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_managements`
--
ALTER TABLE `book_managements`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `book_types`
--
ALTER TABLE `book_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount_books`
--
ALTER TABLE `discount_books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `district_regions`
--
ALTER TABLE `district_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_region_id_idx` (`province_region_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `old_books`
--
ALTER TABLE `old_books`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ordered_books`
--
ALTER TABLE `ordered_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_id` (`order_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_province_regions_id` (`shipping_province`),
  ADD KEY `fk_district_regions_id` (`shipping_district`),
  ADD KEY `fk_ward_regions_id` (`shipping_ward`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `province_regions`
--
ALTER TABLE `province_regions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `ward_regions`
--
ALTER TABLE `ward_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district_region_id_idx` (`district_region_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT cho bảng `book_images`
--
ALTER TABLE `book_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `book_managements`
--
ALTER TABLE `book_managements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `book_types`
--
ALTER TABLE `book_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT cho bảng `discount_books`
--
ALTER TABLE `discount_books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT cho bảng `old_books`
--
ALTER TABLE `old_books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `ordered_books`
--
ALTER TABLE `ordered_books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `district_regions`
--
ALTER TABLE `district_regions`
  ADD CONSTRAINT `province_region_id` FOREIGN KEY (`province_region_id`) REFERENCES `province_regions` (`id`);

--
-- Các ràng buộc cho bảng `ordered_books`
--
ALTER TABLE `ordered_books`
  ADD CONSTRAINT `fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_district_regions_id` FOREIGN KEY (`shipping_district`) REFERENCES `district_regions` (`id`),
  ADD CONSTRAINT `fk_province_regions_id` FOREIGN KEY (`shipping_province`) REFERENCES `province_regions` (`id`),
  ADD CONSTRAINT `fk_ward_regions_id` FOREIGN KEY (`shipping_ward`) REFERENCES `ward_regions` (`id`);

--
-- Các ràng buộc cho bảng `ward_regions`
--
ALTER TABLE `ward_regions`
  ADD CONSTRAINT `district_region_id` FOREIGN KEY (`district_region_id`) REFERENCES `district_regions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
