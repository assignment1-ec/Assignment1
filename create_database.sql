-- Lưu ý: database t đặt tên là ecdb, lúc insert cẩn thận cái tên bảng.
-- Cái folder image chứ hình t để ngoài desktop, lúc ông insert dữ liệu cần sửa lại tí.
-- Lưu ý mới: mấy cái bảng như cart, order thì cái user_id là 0 tức là đang chọn hàng và mua hàng mà k cần đăng nhập. Vì vậy sẽ k có khóa ngoại cho nó.
-- I. Create table

-- -- 1. Create table book_type
create table `book_types` (
`id` int(2) primary key,
`typename` varchar(50) collate utf8_unicode_ci not null,
`description` varchar(500) collate utf8_unicode_ci not null,
`order` int(2) not null,
`created_date` date not null,
`updated_date` date
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 2. Create table books
create table `books` (
`id` int(6) primary key,
`name` varchar(100) collate utf8_unicode_ci not null,
`is_published` bool not null,
`price` int(9) not null,
`author` varchar(50) collate utf8_unicode_ci not null,
`publisher` varchar(100) collate utf8_unicode_ci not null,
`published_date` date not null,
`republished_date` date,
`weight` float(3),
`isbn` varchar(20) not null,
`language` varchar(30) collate utf8_unicode_ci,
`book_type_id` int(2) not null,
`short_description` varchar(500) collate utf8_unicode_ci,
`long_description` varchar(5000) collate utf8_unicode_ci,
`icon` varchar(100),
`created_date` date not null,
`updated_date` date
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 3. Create table discount_book
create table `discount_books` (
`id` int(6) primary key,
`book_id` int(6) not null,
`discount_percent` int(3) not null,
`discount_price` int(9) not null,
`start_date` date not null,
`end_date` date not null,
`count` int(3) not null
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 4. Create table Book Images
create table `book_images` (
`id` int(6) primary key,
`book_id` int(6) not null,
`image_url` varchar(200) collate utf8_unicode_ci not null,
`created_at` date not null,
`updated_at` date
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 5. Create table Book Management
create table `book_managements` (
`id` int(6) primary key,
`book_id` int(6) not null,
`count` int(4) not null,
`sold_count_week` int(4) not null, -- số sách đã bán được trong tuần
`sold_count` int(4) not null -- số sách đã bán được
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 6. Create table Cart Book
create table `carts` (
-- `id` int(9),
`book_id` int(6) not null,
`user_id` int(9) not null,
`added_date` date not null,
`number` int(2) not null
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 7. Create table Orders
create table `orders` (
`id` int(9) primary key,
`user_id` int(9) not null,
`is_paid` bool not null,
`order_date` datetime not null,
`trans_status` int(1) not null,
`shipping_day` datetime,
`shipping_address` varchar(500) collate utf8_unicode_ci not null,
`shipping_phone_number` varchar(15) not null,
`total_price` int(9) not null
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 8. Create table Order Books
create table `order_books` (
`order_id` int(9) not null,
`book_id` int(6) not null,
`count` int(3) not null,
`price` int(9) not null,
`discount` int(3) default 0
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 9. Create table User
create table `users` (
`id` int(9) primary key,
`full_name` varchar(50) collate utf8_unicode_ci not null,
`username` varchar(20) collate utf8_unicode_ci not null unique,
`email` varchar(30) not null unique,
`password` varchar(15) not null,
`address` varchar(500) collate utf8_unicode_ci,
`phone_number` varchar(15),
`status` int(2) not null,
  `remember_token` varchar(100) collate utf8_unicode_ci,
`created_at` date not null,
`updated_at` date,
`avatar` varchar(200) collate utf8_unicode_ci
)
engine=innodb default charset=utf8 collate=utf8_unicode_ci;

-- -- 10. Create table old book
create table `old_books` (
`id` int(6) primary key,
`book_id` int(6) not null,
`user_id` int(9) not null,
`count` int(2),
`address` varchar(500) collate utf8_unicode_ci,
`phone_number` varchar(15) not null,
`created_date` date not null,
`updated_date` date
)
engine= innodb default charset=utf8 collate=utf8_unicode_ci;


----------------------------------


-- foreigh key contraint
ALTER TABLE `ecdb`.`books`
ADD INDEX `book_type_id_idx` (`book_type_id` ASC);
ALTER TABLE `ecdb`.`books`
ADD CONSTRAINT `book_type_id`
  FOREIGN KEY (`book_type_id`)
  REFERENCES `ecdb`.`book_types` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `ecdb`.`discount_books`
ADD INDEX `discount_book_id_idx` (`book_id` ASC);
ALTER TABLE `ecdb`.`discount_books`
ADD CONSTRAINT `discount_book_id`
  FOREIGN KEY (`book_id`)
  REFERENCES `ecdb`.`books` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `ecdb`.`book_images`
ADD INDEX `image_book_id_idx` (`book_id` ASC);
ALTER TABLE `ecdb`.`book_images`
ADD CONSTRAINT `image_book_id`
  FOREIGN KEY (`book_id`)
  REFERENCES `ecdb`.`books` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `ecdb`.`carts`
ADD CONSTRAINT `cart_book_id`
  FOREIGN KEY (`book_id`)
  REFERENCES `ecdb`.`books` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `ecdb`.`order_books`
ADD INDEX `orders_book_id_idx` (`order_id` ASC);
ALTER TABLE `ecdb`.`order_books`
ADD CONSTRAINT `orders_book_id`
  FOREIGN KEY (`order_id`)
  REFERENCES `ecdb`.`orders` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;


ALTER TABLE `ecdb`.`old_books`
ADD INDEX `old_book_id_idx` (`book_id` ASC),
ADD INDEX `old_book_user_id_idx` (`user_id` ASC);
ALTER TABLE `ecdb`.`old_books`
ADD CONSTRAINT `old_book_id`
  FOREIGN KEY (`book_id`)
  REFERENCES `ecdb`.`books` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
ADD CONSTRAINT `old_book_user_id`
  FOREIGN KEY (`user_id`)
  REFERENCES `ecdb`.`users` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;



