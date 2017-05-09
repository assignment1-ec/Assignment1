

--BOOK_TYPE
UPDATE `book_types` SET `typename` = 'SGK-Toán', `description` = 'Sách giáo khoa môn toán, bao gồm sách giáo khoa tóan cấp 1, 2, 3, cao đẳng, đại học' WHERE `book_types`.`id` = 101;
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('1002', 'Truyện', 'Truyện các thể loại', '2', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('102', 'Âm Nhạc', 'Âm Nhạc', '3', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('103', 'Xã hội', 'Xã hội', '4', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('104', 'Kinh tế học', 'Kinh tế học', '4', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('105', 'Khoa học', 'Khoa học', '5', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
INSERT INTO `book_types` (`id`, `typename`, `description`, `order`, `created_at`, `updated_at`) VALUES ('106', 'Văn hóa', 'Văn hóa - Lịch sử', '5', '2017-04-30 00:00:00', '2017-04-30 00:00:00');



-- BOOKS
INSERT INTO `books` (`id`, `name`, `is_published`, `price`, `author`, `publisher`, `published_date`, `republished_date`, `weight`, `isbn`, `language`, `short_description`, `long_description`, `icon`, `book_type_id`, `created_at`, `updated_at`) VALUES ('102', 'Thám tử lừng danh Conan', '1', '40000', 'Hello world', 'NXB SwiftBook', '2017-04-30', '2017-04-30', '200', '1E390IHB848D', 'Tiếng việt', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'You may also access the raw, underlying PDO instance using the getPdo method on a connection instance', 'images/conan2.jpg', '107', '2017-04-30 00:00:00', '2017-04-30 00:00:00');
