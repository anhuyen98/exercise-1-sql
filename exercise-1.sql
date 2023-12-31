DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255) NOT NULL,
	image VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS rate_res;
CREATE TABLE rate_res(
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	amount INT NOT NULL,
	date_res DATETIME NOT NULL
);
DROP TABLE IF EXISTS like_res;
CREATE TABLE like_res(
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	date_like DATETIME NOT NULL
);
DROP TABLE IF EXISTS food_type;
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS foods;
CREATE TABLE foods(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255) NOT NULL,
	image VARCHAR(255) NOT NULL,
	price FLOAT NOT NULL,
	description VARCHAR(255) NOT NULL,
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES foods(food_id),
	amount INT NOT NULL,
	code VARCHAR(255) NOT NULL,
	arr_sub_id VARCHAR(255) NOT NULL
);
DROP TABLE IF EXISTS sub_food;
CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255) NOT NULL,
	sub_price VARCHAR(255) NOT NULL,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES foods(food_id)
);

INSERT INTO restaurants (res_name, image, description) VALUES
('Nhà hàng Ánh Dương', 'anhduong.jpg', 'Không gian sang trọng, phục vụ đa dạng các món ăn'),
('Nhà hàng Sài Gòn Xưa', 'saigonxua.jpg', 'Thực đơn phong phú, mang hương vị truyền thống'),
('Nhà hàng Hương Quê', 'huongque.jpg', 'Đặc sản từ các vùng miền, không gian ấm cúng'),
('Nhà hàng Cô Hà', 'coha.jpg', 'Buffet đa dạng, phục vụ tận tình'),
('Nhà hàng Biển Xanh', 'bienxanh.jpg', 'Những món hải sản tươi ngon, không gian biển mặn'),
('Nhà hàng Góc Phố', 'gocpho.jpg', 'Thực đơn đa dạng từ các loại đặc sản phố'),
('Nhà hàng Mộc Mạc', 'mocmac.jpg', 'Không gian đơn giản, thân thiện với gia đình'),
('Nhà hàng Đồng Quê', 'dongque.jpg', 'Những món ngon như ở quê, không gian xanh sạch'),
('Nhà hàng Phố Đêm', 'phodem.jpg', 'Mở cửa đến khuya, phục vụ ẩm thực phong phú'),
('Nhà hàng Bếp Trẻ', 'beptre.jpg', 'Thực đơn sáng tạo, không gian trẻ trung'),
('Nhà hàng Cung Đình', 'cungdinh.jpg', 'Nền văn hóa ẩm thực, món ăn truyền thống'),
('Nhà hàng Cầu Vồng', 'cauvong.jpg', 'Thực đơn đa dạng, không gian màu sắc'),
('Nhà hàng Hòa Bình', 'hoabinh.jpg', 'Những món ăn mang đến sự hòa bình và ngon miệng'),
('Nhà hàng Bản Năng', 'bannang.jpg', 'Không gian gần gũi với thiên nhiên, đồ ăn tự nhiên'),
('Nhà hàng Hồ Cá', 'hoca.jpg', 'Đặc sản từ hồ cá, thực đơn phong phú'),
('Nhà hàng Mặt Trời', 'mattroi.jpg', 'Phục vụ từ bữa sáng đến bữa tối, không gian thoải mái'),
('Nhà hàng Xôi Gà', 'xoiga.jpg', 'Nổi tiếng với món xôi gà truyền thống'),
('Nhà hàng Sông Nước', 'songnuoc.jpg', 'Nhìn ra sông, thực đơn đa dạng'),
('Nhà hàng Ngọt Ngào', 'ngotngao.jpg', 'Chuyên phục vụ đồ ăn ngọt, đặc biệt là các loại bánh'),
('Nhà hàng Sóng Biển', 'songbien.jpg', 'Cảm nhận hương vị biển cả trong từng món'),
('Nhà hàng Lá Xanh', 'laxanh.jpg', 'Món chay ngon miệng, không gian xanh tươi'),
('Nhà hàng Vườn Hoa', 'vuonhoa.jpg', 'Nhìn những bông hoa, thưởng thức thực đơn tinh tế'),
('Nhà hàng Sân Vườn', 'sanvuon.jpg', 'Được thiết kế như một sân vườn, không khí thoải mái'),
('Nhà hàng Mắt Biếc', 'matbiec.jpg', 'Mang đến không gian trữ tình, ẩm thực đặc sản'),
('Nhà hàng Cầu Kỳ', 'cauky.jpg', 'Chọn lựa độc đáo về trang trí và thực đơn'),
('Nhà hàng Cỏ May', 'comay.jpg', 'Không gian trẻ trung, thực đơn sáng tạo'),
('Nhà hàng Lửa Mắt', 'luamat.jpg', 'Thực đơn nổi tiếng với các món ăn cay'),
('Nhà hàng Biển Đảo', 'biendao.jpg', 'Hòa mình trong hương vị biển cả'),
('Nhà hàng Ngũ Hành', 'nguhanh.jpg', 'Đặc sắc với các món ăn sử dụng nhiều loại gia vị');

INSERT INTO users (full_name, email, password) VALUES
('Nguyễn Văn A', 'nguyenvana@gmail.com', 'password123'),
('Trần Thị B', 'tranthib@yahoo.com', 'securepass456'),
('Lê Hồng C', 'lehongc@hotmail.com', 'mypassword789'),
('Phạm Thị D', 'phamthid@gmail.com', 'strongpass123'),
('Hoàng Văn E', 'hoangve@gmail.com', 'password567'),
('Nguyễn Thị F', 'nguyenthif@gmail.com', 'securepass890'),
('Trần Văn G', 'tranvang@gmail.com', 'mypasswordabc'),
('Lê Thị H', 'lethih@gmail.com', 'strongpass456'),
('Phạm Văn I', 'phamvani@gmail.com', 'passwordxyz'),
('Nguyễn Thị K', 'nguyentk@gmail.com', 'securepass789'),
('Trần Văn L', 'tranvl@gmail.com', 'mypassword123'),
('Lê Thị M', 'lethim@gmail.com', 'strongpass890'),
('Phạm Văn N', 'phamvn@gmail.com', 'passwordabc'),
('Hoàng Thị P', 'hoangtp@gmail.com', 'securepass456'),
('Nguyễn Văn Q', 'nguyenvq@gmail.com', 'mypassword789'),
('Trần Thị R', 'tranthr@gmail.com', 'strongpass123'),
('Lê Hồng S', 'lehs@gmail.com', 'password567'),
('Phạm Thị T', 'phamthit@gmail.com', 'securepass890'),
('Hoàng Văn U', 'hoangvu@gmail.com', 'mypasswordabc'),
('Nguyễn Thị V', 'nguyentv@gmail.com', 'strongpass456'),
('Trần Văn X', 'tranvx@gmail.com', 'passwordxyz'),
('Lê Thị Y', 'lethy@gmail.com', 'securepass789'),
('Phạm Văn Z', 'phamvz@gmail.com', 'mypassword123'),
('Nguyễn Văn W', 'nguyenvw@gmail.com', 'strongpass890'),
('Trần Thị J', 'tranj@gmail.com', 'passwordabc'),
('Lê Hồng U', 'lehu@gmail.com', 'securepass456'),
('Phạm Thị H', 'phamthih@gmail.com', 'mypassword789'),
('Hoàng Văn E', 'hoangve@gmail.com', 'strongpass123'),
('Nguyễn Thị G', 'nguyentg@gmail.com', 'password567');

INSERT INTO rate_res (user_id, res_id, amount, date_res) VALUES
(1, 3, 5, '2023-01-05 12:30:00'),
(2, 7, 4, '2023-02-10 18:45:00'),
(3, 12, 3, '2023-03-15 20:00:00'),
(4, 5, 5, '2023-04-20 14:15:00'),
(5, 10, 4, '2023-05-25 17:30:00'),
(6, 15, 2, '2023-06-30 22:45:00'),
(7, 2, 5, '2023-07-05 11:30:00'),
(8, 9, 4, '2023-08-10 16:45:00'),
(9, 14, 3, '2023-09-15 19:00:00'),
(10, 19, 5, '2023-10-20 13:15:00'),
(11, 4, 4, '2023-11-25 18:30:00'),
(12, 8, 2, '2023-12-30 21:45:00'),
(13, 13, 5, '2024-01-05 11:30:00'),
(14, 18, 4, '2024-02-10 16:45:00'),
(15, 23, 3, '2024-03-15 20:00:00'),
(16, 26, 5, '2024-04-20 14:15:00'),
(17, 29, 4, '2024-05-25 17:30:00'),
(18, 1, 2, '2024-06-30 22:45:00'),
(19, 6, 5, '2024-07-05 11:30:00'),
(20, 11, 4, '2024-08-10 16:45:00'),
(21, 16, 3, '2024-09-15 19:00:00'),
(22, 21, 5, '2024-10-20 13:15:00'),
(23, 24, 4, '2024-11-25 18:30:00'),
(24, 27, 2, '2024-12-30 21:45:00'),
(25, 22, 5, '2025-01-05 11:30:00'),
(26, 17, 4, '2025-02-10 16:45:00'),
(27, 22, 3, '2025-03-15 20:00:00'),
(28, 28, 5, '2025-04-20 14:15:00'),
(29, 20, 4, '2025-05-25 17:30:00'),
(28, 25, 2, '2025-06-30 22:45:00');

INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 4, '2023-01-05 12:30:00'),
(2, 3, '2023-02-10 18:45:00'),
(3, 25, '2023-03-15 20:00:00'),
(1, 5, '2023-04-20 14:15:00'),
(5, 10, '2023-05-25 17:30:00'),
(6, 15, '2023-06-30 22:45:00'),
(7, 3, '2023-07-05 11:30:00'),
(19, 7, '2023-08-10 16:45:00'),
(9, 11, '2023-09-15 19:00:00'),
(10, 16, '2023-10-20 13:15:00'),
(2, 20, '2023-11-25 18:30:00'),
(12, 25, '2023-12-30 21:45:00'),
(13, 17, '2024-01-05 11:30:00'),
(7, 2, '2024-02-10 16:45:00'),
(15, 6, '2024-03-15 20:00:00'),
(16, 9, '2024-04-20 14:15:00'),
(5, 14, '2024-05-25 17:30:00'),
(18, 18, '2024-06-30 22:45:00'),
(19, 23, '2024-07-05 11:30:00'),
(20, 28, '2024-08-10 16:45:00'),
(21, 1, '2024-09-15 19:00:00'),
(22, 5, '2024-10-20 13:15:00'),
(23, 3, '2024-11-25 18:30:00'),
(24, 15, '2024-12-30 21:45:00'),
(25, 20, '2025-01-05 11:30:00'),
(26, 25, '2025-02-10 16:45:00'),
(27, 25, '2025-03-15 20:00:00'),
(28, 3, '2025-04-20 14:15:00'),
(29, 8, '2025-05-25 17:30:00'),
(19, 13, '2025-06-30 22:45:00');

INSERT INTO food_type (type_name) VALUES
('Món Việt Nam'),
('Món Trung Quốc'),
('Món Ý'),
('Món Hàn Quốc'),
('Món Nhật Bản'),
('Món Thái Lan'),
('Món Ấn Độ'),
('Món Pháp'),
('Món Đức'),
('Món Mỹ'),
('Món Brazil'),
('Món Mexico'),
('Món Địa Phương'),
('Món Hải Sản'),
('Món Chay'),
('Món Thịt Bò'),
('Món Gà'),
('Món Cá'),
('Món Hủ Tiếu'),
('Món Bún Riêu'),
('Món Cơm'),
('Món Nước Ép'),
('Món Tráng Miệng'),
('Món Ăn Vặt'),
('Món Lẩu'),
('Món Bánh Mì'),
('Món Pizza'),
('Món Sushi'),
('Món Kem');

INSERT INTO foods (food_name, image, price, description, type_id) VALUES
('Phở Bò', 'phobo.jpg', 7.99, 'Món ăn truyền thống của Việt Nam', 1),
('Hủ Tiếu Nam Vang', 'hutieunamvang.jpg', 8.99, 'Món ăn đặc sản của Sài Gòn', 19),
('Pizza Margherita', 'pizzamargherita.jpg', 12.99, 'Pizza với sốt cà chua, phô mai và rau mùi', 28),
('Sushi Sashimi Combo', 'sushisashimi.jpg', 18.99, 'Combo sushi và sashimi tươi ngon', 29),
('Bánh Mì Gà', 'banhmiga.jpg', 5.99, 'Bánh mì kết hợp với thịt gà và rau sống', 27),
('Cơm Niêu Xôi Gà', 'comnieuxoiga.jpg', 9.99, 'Cơm niêu thơm béo, xôi gà ngon miệng', 20),
('Bún Riêu Cua', 'bunrieucua.jpg', 7.99, 'Bún riêu cua với nước dùng đậm đà', 21),
('Lẩu Hải Sản', 'lauhaisan.jpg', 15.99, 'Lẩu hải sản tươi ngon', 14),
('Thịt Bò Nướng Mỡ Chài', 'thitbonuongmochai.jpg', 14.99, 'Thịt bò nướng mỡ chài thơm ngon', 16),
('Gà Kho Gừng', 'gakhogung.jpg', 10.99, 'Gà kho gừng thơm ngon', 17),
('Bánh Mì Pate Chảo', 'banhmipatechao.jpg', 6.99, 'Bánh mì pate chảo tại Việt Nam', 27),
('Cá Hồi Nước Phô Mai', 'cahoinuocphomai.jpg', 16.99, 'Cá hồi nước phô mai hấp dẫn', 18),
('Bún Bò Huế', 'bunbohue.jpg', 8.99, 'Bún bò Huế thơm ngon đặc trưng', 1),
('Mì Xào Hải Sản', 'mixaohaisan.jpg', 12.99, 'Mì xào hải sản đầy ắp biển cả', 14),
('Salad Rau Trộn', 'saladrautron.jpg', 6.99, 'Salad rau trộn tươi ngon', 13),
('Cơm Gà Xôi Mỡ', 'comgaxoimo.jpg', 9.99, 'Cơm gà xôi mỡ ngon lạ', 20),
('Bánh Xèo Miền Nam', 'banhxeomiennam.jpg', 7.99, 'Bánh xèo miền Nam Việt Nam', 1),
('Lẩu Thái Lan', 'lauthailan.jpg', 14.99, 'Lẩu Thái Lan đậm đà gia vị', 6),
('Bánh Mì ốp La', 'banhmiopla.jpg', 5.99, 'Bánh mì ốp la sáng tạo', 27),
('Mì Quảng', 'miquang.jpg', 9.99, 'Mì Quảng đặc trưng miền Trung', 1),
('Rau Củ Xào Thập Cẩm', 'raucuxaothapcam.jpg', 8.99, 'Rau củ xào thập cẩm', 13),
('Bánh Canh Cua', 'banhcanhcua.jpg', 7.99, 'Bánh canh cua truyền thống', 21),
('Lẩu Mắm', 'laumam.jpg', 15.99, 'Lẩu mắm đậm đà vị biển', 14),
('Bún Ốc', 'bunoc.jpg', 10.99, 'Bún ốc sành điệu', 1),
('Bánh Mì Sandwich', 'banhmisandwich.jpg', 6.99, 'Bánh mì sandwich thơm ngon', 27),
('Sushi California Roll', 'sushicaliforniaroll.jpg', 13.99, 'Sushi California Roll tại Nhật Bản', 29),
('Bánh Cam Đậu Xanh', 'banhcamdauxanh.jpg', 5.99, 'Bánh cam đậu xanh truyền thống', 25),
('Chè Sương Sa Hạt Lựu', 'chesuongsahatluu.jpg', 7.99, 'Chè sương sa hạt lựu mát lạnh', 25),
('Kem Sô Cô La', 'kemsocola.jpg', 4.99, 'Kem sô cô la thơm ngon', 15);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 3, 2, 'ORDER123', '1,2'),
(2, 8, 1, 'ORDER456', '3,4'),
(3, 12, 3, 'ORDER789', '5,6'),
(4, 5, 4, 'ORDERABC', '7,8'),
(5, 10, 2, 'ORDERXYZ', '9,10'),
(6, 15, 1, 'ORDERDEF', '11,12'),
(7, 2, 3, 'ORDERGHI', '13,14'),
(8, 7, 4, 'ORDERJKL', '15,16'),
(9, 11, 2, 'ORDERMNO', '17,18'),
(10, 16, 1, 'ORDERPQR', '19,20'),
(11, 20, 3, 'ORDERSUV', '21,22'),
(12, 25, 4, 'ORDER123', '23,24'),
(13, 27, 2, 'ORDER456', '25,26'),
(14, 2, 1, 'ORDER789', '27,28'),
(15, 6, 3, 'ORDERABC', '29,30'),
(12, 9, 4, 'ORDERXYZ', '31,32'),
(17, 14, 2, 'ORDERDEF', '33,34'),
(18, 18, 1, 'ORDERGHI', '35,36'),
(19, 23, 3, 'ORDERJKL', '37,38'),
(20, 28, 4, 'ORDERMNO', '39,40'),
(21, 1, 2, 'ORDERPQR', '41,42'),
(12, 5, 1, 'ORDERSUV', '43,44'),
(23, 10, 3, 'ORDER123', '45,46'),
(24, 15, 4, 'ORDER456', '47,48'),
(25, 20, 2, 'ORDER789', '49,50'),
(26, 25, 1, 'ORDERABC', '51,52'),
(27, 16, 3, 'ORDERXYZ', '53,54'),
(28, 3, 4, 'ORDERDEF', '55,56'),
(29, 8, 2, 'ORDERGHI', '57,58'),
(12, 13, 1, 'ORDERJKL', '59,60');

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Kem Dâu Tây', '1.20', 1),
('Nước Mắm Phú Quốc', '1.20', 2),
('Bơ Sốt Cà Chua', '1.80', 3),
('Cuộn Cá Ngừ', '2.00', 4),
('Pate Gà', '1.50', 5),
('Xôi Gấc', '1.20', 6),
('Giò Lụa', '1.80', 7),
('Măng Chua', '2.00', 8),
('Nấm Hương', '1.50', 9),
('Xôi Lá Chuối', '1.20', 10),
('Cà Tím Xào Tỏi', '1.80', 11),
('Rau Càng Cua', '2.00', 12),
('Nước Mắm Phan Thiết', '1.50', 13),
('Mực Nước Ngọt', '1.20', 14),
('Dưa Hấu', '1.80', 15),
('Bò Lúc Lắc', '2.00', 16),
('Cơm Chiên Nasi Goreng', '1.50', 17),
('Gà Rán', '1.20', 18),
('Cá Ngừ Cuộn Bún', '1.80', 19),
('Thịt Bò Nướng Nước Mắm', '2.00', 20),
('Bánh Mì Chảo Trứng Muối', '1.50', 21),
('Bún Chả Cá Lăng', '1.20', 22),
('Gỏi Cuốn', '1.80', 23),
('Sò Điệp Nước Cốt Dừa', '2.00', 24),
('Hải Sản Hấp Nước Dừa', '1.50', 25),
('Mì Quảng Ốc', '1.20', 26),
('Bánh Mì Xúc Xích', '1.80', 27),
('Sushi Cuộn Tứ Quý', '2.00', 28),
('Bánh Bò Nước Cốt Dừa', '1.50', 29);

#cau1: Tìm 5 người đã like nhà hàng nhiều nhất ?
SELECT full_name, COUNT(*) AS luot_like FROM users 
INNER JOIN like_res ON users.user_id = like_res.user_id
GROUP BY full_name
ORDER BY luot_like DESC
LIMIT 5

#cau2: Tìm 2 nhà hàng có lượt like nhiều nhất ?
SELECT res_name, COUNT(*) AS duoc_like FROM restaurants
INNER JOIN like_res ON like_res.res_id = restaurants.res_id
GROUP BY res_name
ORDER BY duoc_like DESC
LIMIT 2

#cau3: Tìm người đã đặt hàng nhiều nhất ?
SELECT full_name, COUNT(*) AS tong_don_dat_hang FROM users
INNER JOIN orders ON users.user_id = orders.user_id
GROUP BY full_name
ORDER BY tong_don_dat_hang DESC
LIMIT 1

INSERT INTO users (full_name, email, password) VALUES
('Nguyễn Thị F', 'nguyenthif@gmail.com', 'pass111'),
('Trần Văn G', 'tranvang@gmail.com', 'pass222'),
('Lê Thị H', 'lethih@gmail.com', 'pass333'),
('Phạm Văn I', 'phamvani@gmail.com', 'pass444'),
('Hoàng Thị K', 'hoangthik@gmail.com', 'pass555');

#cau4: Tìm người dùng không hoạt động trong hệ thống ?
SELECT full_name AS nguoi_dung_khong_hoat_dong FROM users
LEFT JOIN like_res ON users.user_id = like_res.user_id
LEFT JOIN rate_res ON users.user_id = rate_res.user_id
LEFT JOIN orders ON users.user_id = orders.user_id
WHERE date_res IS NULL && date_like IS NULL && code IS NULL;
