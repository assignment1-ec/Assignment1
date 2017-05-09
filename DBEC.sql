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
`shpping_day` datetime,
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

-- -----------------------------------------------------------------------------------
-- II. Insert into tables

-- --insert inton table book
INSERT INTO `ecdb`.`books`
(`id`, `name`, `is_published`, `price`, `author`, `publisher`, `published_date`, `republished_date`, `weight`, `isbn`, `language`, `book_type_id`, `short_description`, `long_description`, `icon`, `created_date`, `updated_date`)
VALUES
(101, 'Đường Đua Của Những Giấc Mơ', 1, 90000, 'Wendelin Van Draanen', 'NXB Văn Học', '2017-03-01', null, 0.5, '978-123-456-789-0', 'Tiếng Việt', 1, 'Bìa mềm', 'Các nhân vật trong cuốn tiểu thuyết này nhắc nhở chúng ta rằng: Biến cố trong cuộc đời xảy ra với Jessica hoàn toàn có thể ập đến với bất cứ ai trong chúng ta, nhưng quan trọng là thái độ đối mặt với của mỗi người ra sao. Đọc cuốn sách này để bạn biết nâng niu và trân trọng hiện tại. Hãy ngừng than vãn hay nghĩ rằng bản thân mình kém may mắn.Đây là cuốn tiểu thuyết đã làm lay động hàng triệu độc giả bởi trái tim dũng cảm và thông điệp của nhân vật: Sau tất cả, đừng đánh giá những gì bạn thấy bởi bạn đâu hiểu hết về những gì họ đã phải trải qua. Một cuốn sách đã đạt giải giải thưởng danh giá Ala’s Schneider Family Award, Van Draanen được đánh giá là  tác giả có tác phẩm hay nhất trong bảng xếp hạng 100 cuốn sách dành cho thanh thiếu niên trên thế giới!', null, '2017-04-01', null
),
(103, 'Con Mơ Điều Giản Dị', 1, 79000, 'Nhiều Tác Giả', 'NXB Thanh Niên', '2017-02-01', null, 0.42, '978-3-16-148410-0', 'Tiếng Việt', 1, 'Bìa cứng', 'Cuốn sách nhỏ mang tên Con mơ điều giản dị là một phần quan trọng khép lại chiến dịch cộng đồng lớn nhất năm 2016 - We Are Family - Con Mơ Điều Giản Dị. Cuốn sách tranh "Con mơ điều giản dị" ra đời không chỉ lưu giữ, truyền tải 30 định nghĩa giản đơn về hạnh phúc gia đình qua những nét vẽ tình cảm đầy màu sắc, mà còn có cả series những bài viết do các blogger và tác giả nổi tiếng dành tặng độc giả. Cuộc sống hiện đại gấp gáp và bận rộn cuốn chúng ta vào những mục tiêu và ước mơ to tát, khiến chúng ta để vụt qua hoặc quên đi những niềm vui nhỏ bé, những niềm hạnh phúc giản dị ở xung quanh mình.', null, '2017-03-05', null
),
(107, 'Chạm Một Miền Xuân', 1, 69000, 'Nhiều tác giả', 'NXB Hội Nhà Văn', '2017-02-01', null, 0.35, '987-1-234-56789-7', 'Tiếng Việt', 1, null, 'Cuộc thi thơ Lục bát Tết, lần đầu tiên do Saigon Books tổ chức, đặc biệt đáng nhớ vì diễn ra vào những ngày tháng Chạp, giáp Tết Đinh Dậu (2017). Khi những dòng người ngược xuôi, náo nhiệt trở lại quê nhà vui Tết thì Lục bát Tết cũng lần lượt đổ về hộp thư điện tử của chúng tôi. Lục bát, đương nhiên là phải có quy định niêm luật, nhưng vượt lên những niêm luật mang tính kỹ thuật, đó chính là QUY LUẬT TÌNH CẢM, là nhịp điệu thương nhớ gieo mầm, nảy nở theo mùa màng. Chọn 158 tác phẩm của 50 tác giả vào Chung khảo cuộc thi Lục bát Tết để in trong tập sách này, chúng tôi xem đây như là món quà nhỏ gửi đến những bạn đọc, bạn viết yêu thơ. Và, cao hơn là yêu quê hương mình còn lận đận một nắng hai sương, còn trĩu nặng toan lo trên những bờ vai gầy guộc. Chạm một miền Xuân là chạm vào một miền cảm xúc mênh mang của bao người.', null, '2017-04-10', null
),
(110, 'Khúc Tình Ca Ban Mai (Tập 7)', 1, 18000, 'Michiyo Akaishi', 'NXB Tp.HCM', '2016-05-01', null, 0.2, '987-4-141-75897-2', 'Tiếng Việt', 2, 'Bìa mềm', 'Câu chuyện tình thời Taisho. Cô thiếu nữ Kaibara Aria đã thi vào nhạc viện Tokyo với ước mơ trở thành nghệ sĩ dương cầm. Trong lúc đó, cô đã gặp Natsuo, thiếu gia của gia tộc Nishimikado và biết được sự thật về thân thế mình ... Bộ truyện là khúc tình ca của người con gái được mệnh danh là ái nữ của thần âm nhạc.', null, '2017-02-08', null
),
(117, 'Hành Trình U Linh Giới - Tập 8', 1, 18000, 'Yoshihiro Togashi', 'NXB Kim Đồng', '2016-05-08', null, 0.18, '987-2-417-75794-3', 'Tiếng Việt', 2, 'Bìa mềm', 'Chuyện kể về Urameshi Yusuke, một anh chàng mang trong mình số phận lạ kì… Vì cứu một đứa trẻ khỏi bị xe cán, Yusuke đã chết và thành một hồn ma lang thang. Cái chết của cậu nằm ngoài dự liệu của Linh giới nên Tiểu Diêm Vương đã quyết định cho cậu cơ hội để được sống lại. Nhìn nỗi đau mất con của người mẹ trẻ và những giọt nước mắt của người bạn gái thân thiết nhất, cậu chấp nhận những thử thách của Diêm Vương để được hồi sinh. Cùng với Botan, người dẫn đường của Linh giới, cậu đã trở lại dương thế trong vai trò mới: Thám tử Linh giới - giúp đỡ Linh giới giải quyết các vấn đề tại Nhân gian...', null, '2017-04-02', null
),
(250, 'Haikyu - Chàng Khổng Lồ Tí Hon (Tập 3)', 1, 20000, 'Haruichi Furudate', 'NXB Kim Đồng', '2016-08-09', null, 0.24, '987-241-5256', 'Tiếng Việt', 2, 'Bìa mềm', 'Libero Nishinoya lớp 11 đã trở về sau thời gian bị cấm hoạt động câu lạc bộ. Nhưng cậu chỉ đồng ý quay lại nếu chủ công Asahi cũng tái xuất. Vì lòng ngưỡng mộ nên Hinata đã cùng Kageyama đến gặp Ashahi, thế nhưng... Trong lúc đó, trận đấu tập với đội đối thủ định mệnh đã được quyết định...!?', null, '2017-02-25', null
),
(118, 'Freakonomics: A Rogue Economist Explores the Hidden Side of Everything (P.S.)', 1, 261000, 'HarperCollins US', 'HarperCollins US', '2009-09-01', null, 0.25, '123-1-34123', 'Tiếng Anh', 3, 'Đứng thứ 2 trong Top 10 Economics bán chạy tháng này', 'These may not sound like typical questions for an economist to ask. But Steven D. Levitt is not a typical economist. He studies the riddles of everyday life—from cheating and crime to parenting and sports—and reaches conclusions that turn conventional wisdom on its head. Freakonomics is a groundbreaking collaboration between Levitt and Stephen J. Dubner, an award-winning author and journalist. They set out to explore the inner workings of a crack gang, the truth about real estate agents, the secrets of the Ku Klux Klan, and much more. Through forceful storytelling and wry insight, they show that economics is, at root, the study of incentives—how people get what they want or need, especially when other people want or need the same thing.', null, '2017-03-24', null
);

-- --insert into table book_type
INSERT INTO `ecdb`.`book_types`
(`id`,
`typename`,
`description`,
`order`,
`created_date`,
`updated_date`)
VALUES
(1, 'Sách văn học', 'Gồm: tiểu thuyết, truyện ngắn, truyện dài...', 1, '2017-04-01', null
),
(2, 'Truyện tranh', 'Gồm: truyện tranh Nhật, truyện tranh trinh thám...', 2, '2017-04-01', '2017-04-15'
),
(3, 'Sách kinh tế', 'Sách kinh tế tiếng Việt, tiếng Anh...', 3, '2017-01-01', null
)
;

-- --insert into table discount_book
INSERT INTO `ecdb`.`discount_books`
(`id`,
`book_id`,
`discount_percent`,
`discount_price`,
`start_date`,
`end_date`,
`count`)
VALUES
(1, 101, 20, 72000, '2017-04-01', '2017-04-10', -1
),
(2, 117, 15, 15300, '2017-04-01', '2017-04-15', -1
);

-- --insert into table book_image

INSERT INTO `ecdb`.`book_images`
(`id`,
`book_id`,
`image_url`,
`created_at`,
`updated_at`)
VALUES
(1, 101, 'C:\\Users\\nhutt\\Desktop\\images\\101.jpg', '2017-01-01', null
),
(2, 103, 'C:\\Users\\nhutt\\Desktop\\images\\103.jpg', '2017-01-01', null
),
(3, 107, 'C:\\Users\\nhutt\\Desktop\\images\\107.jpg', '2017-01-01', null
),
(4, 110, 'C:\\Users\\nhutt\\Desktop\\images\\110.jpg', '2017-01-01', null
),
(5, 117, 'C:\\Users\\nhutt\\Desktop\\images\\117.jpg', '2017-01-01', null
),
(6, 250, 'C:\\Users\\nhutt\\Desktop\\images\\250.jpg', '2017-01-01', null
),
(7, 118, 'C:\\Users\\nhutt\\Desktop\\images\\118.jpg', '2017-01-01', null
);

-- -- insert into table Book Management

INSERT INTO `ecdb`.`book_managements`
(`id`,
`book_id`,
`count`,
`sold_count_week`,
`sold_count`)
VALUES
('1', 101, 50, 3, 20
),
('2', 103, 80, 10, 57
),
('3', 107, 20, 1, 8
),
('4', 110, 100, 12, 67
),
('5', 117, 87, 16, 20
),
('6', 250, 45, 8, 18
),
('7', 118, 10, 0, 2
)
;

-- --insert onto table Cart Book

INSERT INTO `ecdb`.`carts`
(`book_id`,
`user_id`,
`added_date`,
`number`)
VALUES
(101, 12345, '2017-04-01', 1),
(103, 12345, '2017-04-01', 1),
(117, 12345, '2017-04-01', 2),
(250, 00000, '2017-04-05', 1),
(118, 00000, '2017-04-05', 2)
;

-- -- insert into table Orders

INSERT INTO `ecdb`.`orders`
(`id`,
`user_id`,
`is_paid`,
`order_date`,
`trans_status`,
`shpping_day`,
`shipping_address`,
`shipping_phone_number`,
`total_price`)
VALUES
(1, 12345, 1, '2017-04-06', 2, '2017-04-08', '268 Lý Thường Kiệt, quận 10', '0909123456', 150000),
(2, 00000, 0, '2017-04-05', 1, '2017-04-09', '436 đường 3/2 quận 10', '0919111222', 69000),
(3, 12345, 1, '2017-03-01', 2, '2017-03-03', '268 Lý Thường Kiệt, quận 10', '0909123456', 215000),
(4, 11122, 1, '2017-04-15', 0, '2017-04-20', '123 đường 10, quận 12', '0941258963', 200000),
(5, 12345, 0, '2017-04-18', 0, '2017-04-20', '268 Lý Thường Kiệt, quận 10', '0909123456', 16000)
;

-- --insert into table Order Books

INSERT INTO `ecdb`.`order_books`
(`order_id`,
`book_id`,
`count`,
`price`,
`discount`)
VALUES
(1, 101, 1, 90000, 20 ),
(1, 103, 1, 79000, 0),
(1, 117, 2, 18000, 15),
(2, 250, 1, 20000, 0),
(2, 118, 2, 261000, 0)
;

-- --insert into table user

INSERT INTO `ecdb`.`users`
(`id`,
`full_name`,
`username`,
`email`,
`password`,
`address`,
`phone_number`,
`status`,
`remember_token`,
`created_at`,
`updated_at`,
`avatar`)
VALUES
(12345, 'Nguyễn Văn A', 'nguyenvana', 'anguyen@gmail.com', '123', '268 Lý Thường Kiệt, quận 10', '0909123456', 1, '2017-01-01', null, null),
(11122, 'Lê Thị B', 'lethib', 'bthi@gmail.com', '123', '123 đường 10, quận 12', '0941258963', 1, '2017-01-01', null, null),
(33333, 'Trần Văn C', 'tvc', 'ctranvan@gmail.com', '123', '456 đường 12, quận 1', '0910125121', 1, '2017-02-01', null, null);

-- --insert into table old book

INSERT INTO `ecdb`.`old_books`
(`id`,
`book_id`,
`user_id`,
`count`,
`address`,
`phone_number`,
`created_date`,
`updated_date`)
VALUES
(1, 101, 33333, 1, '456 đường 12, quận 1', '0910125121', '2017-03-01', null),
(2, 103, 33333, 1, '456 đường 12, quận 1', '0910125121', '2017-03-01', null),
(3, 118, 12345, 1, '268 Lý Thường Kiệt, quận 10', '0909123456', '2017-03-8', null)
;

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
