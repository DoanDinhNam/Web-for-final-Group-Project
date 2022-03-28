-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 15, 2022 lúc 05:06 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `inventory_system`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'beer '),
(3, 'cake'),
(4, 'candy'),
(5, 'Jelly'),
(1, 'Milk'),
(9, 'Noodles'),
(2, 'Sparkling Water'),
(6, 'Wine');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_type`) VALUES
(3, 'property-1.jpg', 'image/jpeg'),
(4, 'property-2.jpg', 'image/jpeg'),
(5, 'property-4.jpg', 'image/jpeg'),
(6, 'property-7.jpg', 'image/jpeg'),
(7, 'property-8.jpg', 'image/jpeg'),
(8, 'property-9.jpg', 'image/jpeg'),
(9, 'property-10.jpg', 'image/jpeg'),
(11, 'property-5.jpg', 'image/jpeg'),
(12, 'property-6.jpg', 'image/png'),
(13, 'property-11.jpg', 'image/png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,3) DEFAULT NULL,
  `sale_price` decimal(25,3) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(1, 'Fresh Milk', '90', '46.000', '51.000', 1, 3, '2022-02-10 16:45:51'),
(14, 'Fresh Milk 2', '92', '40.000', '45.000', 1, 4, '2022-02-10 10:35:33'),
(15, 'Danisa cake', '96', '170.000', '185.000', 3, 5, '2022-02-10 10:37:08'),
(16, 'coca ', '76', '100.000', '110.000', 2, 6, '2022-02-10 10:46:53'),
(17, 'chocolate', '100', '140.000', '150.000', 4, 7, '2022-02-10 10:47:57'),
(18, ' Long Hai Jelly', '111', '27.000', '30.000', 5, 8, '2022-02-10 10:49:04'),
(19, '1 box of 30 packs hao hao', '221', '95.000', '100.000', 9, 9, '2022-02-10 10:52:47'),
(20, 'Handy Hao Hao', '114', '7.000', '8.000', 9, 11, '2022-02-10 10:57:56'),
(21, 'Wine Da Lat', '29', '85.000', '90.000', 6, 12, '2022-02-10 11:00:27'),
(22, 'Beer Ha Noi', '512', '30.000', '35.000', 8, 13, '2022-02-10 11:02:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,3) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(9, 14, 4, '180.000', '2022-02-01'),
(10, 22, 22, '770.000', '2022-02-01'),
(11, 16, 12, '1320.000', '2022-02-01'),
(13, 20, 10, '80.000', '2022-01-13'),
(14, 19, 5, '500.000', '2022-02-05'),
(15, 21, 3, '270.000', '2022-02-01'),
(16, 15, 4, '740.000', '2022-01-14'),
(17, 17, 1, '150.000', '2022-01-15'),
(18, 17, 3, '450.000', '2022-01-17'),
(19, 17, 1, '150.000', '2022-01-16'),
(20, 17, 1, '150.000', '2022-01-16'),
(21, 17, 1, '150.000', '2022-01-16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Dang Phuc', 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'kko63f051.jpg', 1, '2022-01-03 10:08:06'),
(2, 'Nam', 'nam-Special', 'ce4004f150ebf406d62405f54e26e18fba13ffff', 2, 'zjp1rp62.jpg', 1, '2022-01-03 08:15:45'),
(3, 'Phuc', 'phuc', '9229ec79a248d8810d401bdf4febed623264819d', 3, 'no_image.png', 1, '2022-01-03 08:16:44'),
(4, 'Nam', 'Nam', 'ce4004f150ebf406d62405f54e26e18fba13ffff', 3, 'g69178qx4.jpg', 1, '2022-01-03 08:20:04'),
(5, 'Nhan', 'nhan', 'eb55956d8112420229dcc31b0020ae52709a90fe', 3, 'awvf7ax5.jpg', 1, '2022-01-03 08:22:22'),
(6, 'Nhan', 'nhan-Special', 'eb55956d8112420229dcc31b0020ae52709a90fe', 2, 'kg03k5yg6.jpg', 1, '2022-01-03 08:24:03'),
(7, 'aaa', 'aaa', '7e240de74fb1ed08fa08d38063f6a6a91462a815', 3, 'no_image.jpg', 1, '2022-01-03 09:04:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'special', 2, 1),
(3, 'User', 3, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

--
-- Chỉ mục cho bảng `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
