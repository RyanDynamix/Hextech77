CREATE DATABASE BanHangOnline;
USE BanHangOnline;

CREATE TABLE Role (
    roleID int PRIMARY KEY,
    name nvarchar(50) NOT NULL
);

CREATE TABLE [User] (
    userID int PRIMARY KEY,
    fullName nvarchar(100) NOT NULL,
    email nvarchar(100) NOT NULL,
    phoneNumber nvarchar(20),
    address nvarchar(255),
    roleID int,
    password nvarchar(255),
    FOREIGN KEY (roleID) REFERENCES Role(roleID)
);

CREATE TABLE Category (
    categoryID int PRIMARY KEY,
    name nvarchar(50) NOT NULL,
    ParentCategoryID int NULL,
    FOREIGN KEY (ParentCategoryID) REFERENCES Category(categoryID)
);

CREATE TABLE Product (
    productID int PRIMARY KEY,
    title nvarchar(100) NOT NULL,
    description nvarchar(255),
    /*price decimal(20, 2) NOT NULL,*/
	price nvarchar(50),
    discount nvarchar(50),
    created_at datetime,
    updated_at datetime,
    categoryid int,
    thumbnail nvarchar(255),
    quantity int, 
    FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);
create table ProductDetail(
	productID int,
	cpu nvarchar(200),
	ram nvarchar(20),
	screen nvarchar(20),
	storage nvarchar(30),
	graphic_card nvarchar(100)
	FOREIGN KEY (productID) REFERENCES Product(productID)
);
CREATE TABLE [Order] (
    orderID int PRIMARY KEY,
    totalMoney decimal(10, 2) NOT NULL,
    status nvarchar(50),
    order_date datetime,
    note nvarchar(255),
    address nvarchar(255),
    phone nvarchar(20),
    email nvarchar(100),
    userid int,
    fullName nvarchar(100),
    FOREIGN KEY (userID) REFERENCES [User](userID)
);

CREATE TABLE orderDetail (
    orderdetailID int PRIMARY KEY,
    productID int,
    orderID int,
    numProductbuy int NOT NULL,
    price decimal(10, 2) NOT NULL,
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (orderID) REFERENCES [Order](orderID)
);


CREATE TABLE Feedback (
    id int PRIMARY KEY,
    productID int,
    userID int,
    note nvarchar(255),
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (userID) REFERENCES [User](userID)
);

CREATE TABLE Galleries (
    galleryID int PRIMARY KEY,
    productID int,
    thumbnail nvarchar(255),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);

INSERT INTO Role (roleID, name)
VALUES (1, 'Admin'),
       (2, 'User');

INSERT INTO [User] (userID, fullName, email, phoneNumber, address, roleID, password)
VALUES (1, 'Admin', 'admin@example.com', '123456789', '123 Admin Street', 1, 'admin123'),
       (2, 'User', 'user@example.com', '987654321', '456 User Avenue', 2, 'user123');

INSERT INTO Category (categoryID, name, ParentCategoryID)
VALUES 
(1, 'Điện thoại', NULL),
(2, 'Iphone', 1),
(3, 'Samsung', 1),
(4,'Oppo', 1),
(5, 'Xiaomi', 1),
(6, 'Tecno', 1),
(7, 'Honor', 1),
(8, 'Realme', 1),
(9, 'Oppo reno 11F', 4),
(10, 'Oppo A18', 4),
(11, 'SS Galaxy S24', 3),
(12, 'SS Galaxy S23 FE', 3),
(13, 'SS Galaxy S23 5G', 3),
(14, 'SS Galaxy A35', 3),
(15, 'SS Galaxy A05s', 3),
(16, 'SS Galaxy Z Flip4', 3),
(17, 'SS Galaxy Z Flod5', 3),
(18, 'Tecno SG2024', 5),
(19, 'Xiaomi Poco M6', 4),
(20, 'Xiaomi note13', 4),
(21, 'Iphone 15 prm', 2),
(22, 'Iphone 15 plus', 2),
(23, 'Iphone 13', 2),
(24, 'Iphone 11', 2),
(25, 'Honor x7b', 6),
(26, 'Honor x9b', 6),
(27,'Realme C60', 7),
(28,'Realme C51', 7),
(29,'Realme C55', 7),
--laptop
(30, 'Laptop', NULL),
(31, 'Macbook', 30),
(32, 'Lenovo', 30),
(33, 'Acer', 30),
(34, 'Asus', 30),
(35, 'MSI', 30),
(36, 'Dell', 30),
(37, 'HP', 30),
(38, 'Gigabyte', 30),
--tablet
(39, 'Tablet', Null),
(40, 'Ipad', 39),
(41, 'Samsung', 39),
(42, 'Xiaomi', 39),
(43, 'Masstel', 39),
(44, 'Lenovo', 39),
(45, 'Oppo', 39)
;


INSERT INTO Product (productID, title, description, price, discount, created_at, updated_at, categoryID, thumbnail, quantity)
VALUES 
-- Điện thoại
(1, 'OPPO Reno11 F 5G 8GB-256GB', 'OPPO Reno11 F 5G 8GB-256GB', '8.990.000', '8.490.000' , '2024-06-01', '2024-06-01', 4, './images/dien-thoai-oppo-reno-11-f-2.webp', 25),
(2, 'Samsung Galaxy S24 Ultra 5G 256GB', 'Samsung Galaxy S24 Ultra 5G 256GB', '33.990.000', '28.990.000', '2024-06-01', '2024-06-01', 3, './images/ss-s24-ultra-xam-222.webp', 25),
(3, 'Samsung Galaxy S23 FE 5G 128GB', 'Samsung Galaxy S23 FE 5G 128GB', '14.890.000', '12.390.000', '2024-06-01', '2024-06-01', 3, './images/638471599704474139_samsung-galaxy-s23--fe-den-dd-AI.webp', 25),
(4, 'Xiaomi Poco M6 Pro 8GB-256GB', 'Xiaomi Poco M6 Pro 8GB-256GB', '6.490.000', '5.990.000', '2024-06-01', '2024-06-01', 5, './images/638417729562660990_xiaomi-poco-m6-pro-dd-docquyen-bh.webp', 25),
(5, 'Samsung Galaxy S23 5G 256GB', 'Samsung Galaxy S23 5G 256GB', '24.990.000', '15.490.000', '2024-06-01', '2024-06-01', 3, './images/638518175414796345_samsung-galaxy-s23-5g-thumb-doc-quyen.webp', 25),
(6, 'IPhone 15 Pro Max 256GB', 'IPhone 15 Pro Max 256GB', '34.990.000', '29.690.000', '2024-06-01', '2024-06-01', 2, './images/638342502751589917_ip-15-pro-max-dd-bh-2-nam.webp', 25),
(7, 'Honor X7b 8GB-256GB', 'Honor X7b 8GB-256GB', '5.290.000', '4.990.000', '2024-06-01', '2024-06-01', 7, './images/638454261816142342_honor-x7b-xanh-6.webp', 25),
(8, 'OPPO A18 4GB-128GB', 'OPPO A18 4GB-128GB', '3.990.000', '3.690.000', '2024-06-01', '2024-06-01', 4, './images/638509283036082649_OPPO-A18-thumb.webp', 25),
(9, 'Honor X9B 5G 12GB-256GB', 'Honor X9B 5G 12GB-256GB', '8.990.000', '8.390.000', '2024-06-01', '2024-06-01', 7, './images/638509283036082649_OPPO-A18-thumb.webp', 25),
(10, 'Samsung Galaxy A35 5GB 128GB', 'Samsung Galaxy A35 5GB 128GB', '8.290.000', '7.990.000', '2024-06-01', '2024-06-01', 3, './images/638535792860352082_samsung-galaxy-a35-thucu.webp', 25),
(11, 'Samsung Galaxy Z Flip4 5G 128GB', 'Samsung Galaxy Z Flip4 5G 128GB', '23.990.000', '11.990.000', '2024-06-01', '2024-06-01', 3, './images/638131739579610504_samsung-galaxy-z-flip4-tim-dd-tragop.webp', 25),
(12, 'Tecno Spark Go 2024 4GB-64GB', 'Tecno Spark Go 2024 4GB-64GB', '2.190.000', '1.990.000', '2024-06-01', '2024-06-01', 6, './images/638495503532379537_tecno-spark-go-trang-4.webp', 25),
(13, 'Samsung Galaxy Z Fold5 5G 256GB', 'Samsung Galaxy Z Fold5 5G 256GB', '40.990.000', '28.990.000', '2024-06-01', '2024-06-01', 3, './images/638472349027667377_samsung-galaxy-zfold-5-dd-ai.webp', 25),
(14, 'Xiaomi Redmi Note 13 6GB-128GB', 'Xiaomi Redmi Note 13 6GB-128GB', '4.890.000', '4.690.000', '2024-06-01', '2024-06-01', 5, './images/638528385683685914_xiaomi-redmi-note-13-dd-bh-500k.webp', 25),
(15, 'Samsung Galaxy A05s 128GB', 'Samsung Galaxy A05s 128GB', '3.990.000', '3.590.000', '2024-06-01', '2024-06-01', 3, './images/638535778605131398_samsung-galaxy-a05s.webp', 25),
(16, 'Realme C60 4GB-64GB', 'Realme C60 4GB-64GB', '2.790.000', '2.590.000', '2024-06-01', '2024-06-01', 8, './images/638477398472108436_realme-c60-dd-bh.webp', 25),
(17, 'Realme C51 6GB-256GB', 'Realme C51 6GB-256GB', '4.490.000', '3.990.000', '2024-06-01', '2024-06-01', 8, './images/638542285834454283_realme-c51-thumb-thucu2g.webp', 25),
(18, 'Realme C55 6GB-128GB', 'Realme C55 6GB-128GB', '4.990.000', '3.590.000', '2024-06-01', '2024-06-01', 8, './images/638150119693895777_realme-c55-dd.webp', 25),
(19, 'iPhone 15 Plus 128GB', 'iPhone 15 Plus 128GB', '25.990.000', '22.390.000', '2024-06-01', '2024-06-01', 2, './images/iphone-15-plus_1__1.webp', 25),
(20, 'iPhone 11 64GB', 'iPhone 11 64GB', '11.990.000', '8.590.000', '2024-06-01', '2024-06-01', 2, './images/638440266267791271_iphone-11-dd-bh.webp', 25),
(21, 'iPhone 13 128GB', 'iPhone 13 128GB', '18.990.000', '13.990.000', '2024-06-01', '2024-06-01', 2, './images/iphone-13_2_.webp', 25),
-- Laptop

(22, 'HP 245 G10 R5-7520U (9H8X8PT)', 'HP 245 G10 R5-7520U (9H8X8PT)', '13.290.000', '10.290.000' , '2024-06-01', '2024-06-01', 37, './images/638283012469903137_hp-245-g10-bac-dd.webp', 25),
(23, 'Asus TUF Gaming FX507ZC4-HN095W i5 12500H', 'Asus TUF Gaming FX507ZC4-HN095W i5 12500H', '24.990.000', '20.690.000', '2024-06-01', '2024-06-01', 34, './images/638240754748140607_asus-tuf-gaming-fx507-xam-dd.webp', 25),
(24, 'Lenovo IdeaPad 3 14IAH8 i5 12450H (83EQ0005VN)', 'Lenovo IdeaPad 3 14IAH8 i5 12450H (83EQ0005VN)', '15.990.000', '13.890.000', '2024-06-01', '2024-06-01', 32, './images/638276943814453136_lenovo-ideapad-3-14iah8-xam-dd.webp', 25),
(25, 'Laptop Dell Inspiron 15 N3520 i5 1235U', 'Laptop Dell Inspiron 15 N3520 i5 1235U', '17.290.000', '16.490.000', '2024-06-01', '2024-06-01', 36, './images/638010984081026772_dell-inspiron-15-n3520-den-dd.webp', 25),
(26, 'Acer Aspire 3 A315-44P-R5QG R7-5700U', 'Acer Aspire 3 A315-44P-R5QG R7-5700U', '14.990.000', '11.990.000', '2024-06-01', '2024-06-01', 33, './images/637822539982260044_acer-aspire-3-a315-58-bac-dd.webp', 25),
(27, 'MSI Modern 14 C7M-221VN R7 7730U', 'MSI Modern 14 C7M-221VN R7 7730U', '12.990.000', '11.290.000', '2024-06-01', '2024-06-01', 35, './images/638276090577696669_msiI-modern-14-c7m-221vn-r7-7730u-dd.webp', 25),
(28, 'Dell Vostro V3520 i5 1235U', 'Dell Vostro V3520 i5 1235U', '17.290.000', '16.490.000', '2024-06-01', '2024-06-01', 7, './images/638345294135271615_dell-vostro-v3520-xam-dd.webp', 25),
(29, 'Lenovo Gaming LOQ - 15IAX9 i5 12450HX (83GS000GVN)', 'Lenovo Gaming LOQ - 15IAX9 i5 12450HX (83GS000GVN)', '21.490.000', '18.990.000', '2024-06-01', '2024-06-01', 32, './images/638435905526202438_lenovo-gaming-loq-15iax-9-i5-12450hx-led-trang-dd.webp', 25),
(30, 'Asus Vivobook E1404FA-NK186W R5 7520U', 'Asus Vivobook E1404FA-NK186W R5 7520U', '14.990.000', '12.490.000', '2024-06-01', '2024-06-01', 34, './images/638175171985162982_asus-vivobook-e1404fa-nk186w-r5-7520u-den-dd-moi.webp', 25),
(31, 'Acer Nitro 5 Tiger Gaming AN515-58-52SP i5 12500H', 'Acer Nitro 5 Tiger Gaming AN515-58-52SP i5 12500H', '29.490.000', '20.990.000', '2024-06-01', '2024-06-01', 33, './images/638140612136202106_acer-nitro-gaming-an515-58-dd.webp', 25),
(32, 'MacBook Air M2 13 2022 8CPU 8GPU 8GB 256GB', 'MacBook Air M2 13 2022 8CPU 8GPU 8GB 256GB', '27.990.000', '24.090.000', '2024-06-01', '2024-06-01', 31, './images/637901915720184032_macbook-air-m2-2022-den-dd.webp', 25),
(33, 'MacBook Air 13 2020 M1/8GB/256GB SSD', 'MacBook Air 13 2020 M1/8GB/256GB SSD', '22.990.000', '18.990.000', '2024-06-01', '2024-06-01', 31, './images/637407970062806725_mba-2020-gold-dd.webp', 25),
(34, 'Gigabyte Gaming G5 MF-F2VN313SH i5 12450H', 'Gigabyte Gaming G5 MF-F2VN313SH i5 12450H', '21.490.000', '20.490.000', '2024-06-01', '2024-06-01', 38, './images/638188828261523251_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-dd.webp', 25),
(35, 'Gigabyte Gaming G5 KF-E3VN313SH i5 12500H', 'Gigabyte Gaming G5 KF-E3VN313SH i5 12500H', '22.990.000', '23.490.000', '2024-06-01', '2024-06-01', 38, './images/638188828261523251_gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-dd.webp', 25),
(36, 'Asus Vivobook Flip TN3402YA-LZ188W R5 7530U', 'Asus Vivobook Flip TN3402YA-LZ188W R5 7530U', '17.490.000', '15.290.000', '2024-06-01', '2024-06-01', 34, './images/638152764193595966_asus-vivobook-flip-tn3402y-bac-dd.webp', 25),
(37, 'HP Gaming Victus 16-e1104AX R7 6800H (7C0S9PA)', 'HP Gaming Victus 16-e1104AX R7 6800H (7C0S9PA)', '29.290.000', '20.990.000', '2024-06-01', '2024-06-01', 37, './images/638122294500233505_hp-gaming-victus-16-e1107ax-r5-6600h-den-dd.webp', 25),
(38, 'HP Gaming Victus 16-s0078AX R5 7640HS (8C5N7PA)', 'HP Gaming Victus 16-s0078AX R5 7640HS (8C5N7PA)', '27.390.000', '22.990.000', '2024-06-01', '2024-06-01', 37, './images/638288269292176880_hp-gaming-victus-16-s0078ax-r5-7640hs-dd.webp', 25),
(39, 'MSI Gaming Thin GF63 12VE-454VN i5 12450H', 'MSI Gaming Thin GF63 12VE-454VN i5 12450H', '22.990.000', '18.990.000', '2024-06-01', '2024-06-01', 35, './images/638137864184249502_msi-gaming-gf63-thin-11uc-den-dd.webp', 25),
--Tablet
(40, 'Samsung Galaxy Tab S6 Lite 2024 64GB', 'Samsung Galaxy Tab S6 Lite 2024 64GB', '8.990.000', '8.490.000' , '2024-06-01', '2024-06-01', 41, './images/638496343472450913_samsung-galaxy-tab-s6-lite-2024-dd-doimoi.webp', 25),
(41, 'Xiaomi Poco Pad 8GB 256GB', 'Xiaomi Poco Pad 8GB 256GB', '8.690.000', '7.990.000', '2024-06-01', '2024-06-01', 42, './images/638526554175292922_poco-pad-thumb-doc-quyen.webp', 25),
(42, 'Samsung Galaxy Tab A9 Wifi 8GB-128GB', 'Samsung Galaxy Tab A9 Wifi 8GB-128GB', '4.990.000', '3.790.000', '2024-06-01', '2024-06-01', 41, './images/638496356440408094_samsung-galaxy-tab-a9-wifi-dd-doimoi.webp', 25),
(43, 'iPad Gen 9 2021 10.2 inch WiFi 64GB', 'iPad Gen 9 2021 10.2 inch WiFi 64GB', '9.990.000', '7.090.000', '2024-06-01', '2024-06-01', 40, './images/638059452014421919_ipad-gen-9-wifi-dd.webp', 25),
(44, 'Xiaomi Redmi Pad SE 6GB-128GB', 'Xiaomi Redmi Pad SE 6GB-128GB', '4.790.000', '5.490.000', '2024-06-01', '2024-06-01', 42, './images/638533625660365568_xiaomi-redmi-pad-se-dd-bh.webp', 25),
(45, 'Masstel Tab 10M 4G', 'Masstel Tab 10M 4G', '3.490.000', '1.990.000', '2024-06-01', '2024-06-01', 43, './images/638006461102508767_may-tinh-bang-masstel-tab-10m-4g-docquyen-100ngay.webp', 25),
(46, 'iPad Gen 10 2022 10.9 inch WiFi 64GB', 'iPad Gen 10 2022 10.9 inch WiFi 64GB', '12.990.000', '9.990.000', '2024-06-01', '2024-06-01', 40, './images/638017355452124924_ipad-gen-10-wifi-dd.webp', 25),
(47, 'Masstel Tab 10.1 Pro Kidzone', 'Masstel Tab 10.1 Pro Kidzone', '2.490.000', '1.290.000', '2024-06-01', '2024-06-01', 43, './images/638417708263366921_masstel-tab-10-1-pro-kidzone-dd-docquyen.webp', 25),
(48, 'OPPO Pad Air 4GB-64GB', 'OPPO Pad Air 4GB-64GB', '5.490.000', '4.690.000', '2024-06-01', '2024-06-01', 45, './images/637953965094578434_oppo-pad-air-dd.webp', 25),
(49, 'Samsung Galaxy Tab S9 FE Wifi 128GB', 'Samsung Galaxy Tab S9 FE Wifi 128GB', '9.990.000', '8.990.000', '2024-06-01', '2024-06-01', 41, './images/638337419027895568_samsung-galaxy-tab-s9-fe-wifi-dd-moi.webp', 25),
(50, 'iPad Pro 13 inch M4 2024 Wifi + Cellular 256GB', 'iPad Pro 13 inch M4 2024 Wifi + Cellular 256GB', '43.490.000', '43.390.000', '2024-06-01', '2024-06-01', 40, './images/638509511714852916_ipad-pro-13-inch-m4-2024-wifi-cellular-dd.webp', 25),
(51, 'Lenovo Tab M10 32GB (Gen 2)', 'Lenovo Tab M10 32GB (Gen 2)', '5.190.000', '1.990.000', '2024-06-01', '2024-06-01', 44, './images/637892435591469037_lenovo-tab-m10-gen-2-xam-dd-bh2nam.webp', 25),
(52, 'Lenovo Tab M11 4GB 64GB', 'Lenovo Tab M11 4GB 64GB', '5.590.000', '5.790.000', '2024-06-01', '2024-06-01', 44, './images/638528460447139265_lenovo-tab-m11-xam-dd.webp', 25),
(53, 'Xiaomi Pad 6 8GB-256GB', 'Xiaomi Pad 6 8GB-256GB', '10.490.000', '9.290.000', '2024-06-01', '2024-06-01', 42, './images/638533623621858910_xiaomi-pad-6-dd-bh.webp', 25),
(54, 'iPad mini 6 2021 8.3 inch WiFi 64GB', 'iPad mini 6 2021 8.3 inch WiFi 64GB', '14.990.000', '12.790.000', '2024-06-01', '2024-06-01', 40, './images/637673371022722752_ipad-mini-8-3-2021-wi-fi-dd.webp', 25),
(55, 'iPad Pro 11 2022 M2 WiFi 5G 128GB', 'iPad Pro 11 2022 M2 WiFi 5G 128GB', '27.990.000', '24.690.000', '2024-06-01', '2024-06-01', 40, './images/638017392498973530_ipad-pro-11-m2-2022-wifi-5g-dd.webp', 25),
(56, 'Xiaomi Redmi Pad Pro 8GB 128GB', 'Xiaomi Redmi Pad Pro 8GB 128GB', '7.990.000', '7.490.000', '2024-06-01', '2024-06-01', 42, './images/638537990573286456_redmi-pad-pro-thumb-bh.webp', 25),
(57, 'iPad Pro 12.9 2022 M2 WiFi 5G 1TB', 'iPad Pro 12.9 2022 M2 WiFi 5G 1TB', '54.990.000', '50.990.000', '2024-06-01', '2024-06-01', 40, './images/638017392498973530_ipad-pro-11-m2-2022-wifi-5g-dd.webp', 25);

insert into ProductDetail(productID, cpu, ram, screen, storage, graphic_card)
values
--điện thoại
(1, 'MediaTek Dimensity 7050 5G', '8GB', '6.67 inch', '512GB', null),
(2, 'Snapdragon 8 Gen 3', '12GB', '6.8 inch', '256GB', null),
(3, 'Exynos 2200', '8GB', '6.4 inch', '128GB', null),
(4, 'MediaTek Helio G99-Ultra', '8GB', '6.67 inch', '256GB', null),
(5, 'Snapdragon 8 Gen 2', '8GB', '6.1 inch', '256GB', null),
(6, 'Apple A17 Pro', '8GB', '6.7 inch', '256GB', null),
(7, 'Snapdragon 680', '8GB', '6.8 inch', '256GB', null),
(8, 'Helio G85', '4GB', '6.56 inch', '128GB', null),
(9, 'Snapdragon 6 Gen 1', '12GB', '6.78 inch', '256GB', null),
(10, 'Exynos 1380', '8GB', '6.6 inch', '128GB', null),
(11, 'Snapdragon 8+ Gen 1', '8GB', '6.7 inch', '128GB', null),
(12, 'Unisoc T606', '4GB', '6.6 inch', '64GB', null),
(13, 'Snapdragon 8 Gen 2', '12GB', '7.6 inch', '256GB', null),
(14, 'Snapdragon 685', '6GB', '6.67 inch', '128GB', null),
(15, 'Snapdragon 680', '4GB', '6.7 inch', '128GB', null),
(16, 'Unisoc T612', '4GB', '6.74 inch', '64GB', null),
(17, 'Unisoc T612', '6GB', '6.74 inch', '256GB', null),
(18, 'MediaTek Helio G88', '6GB', '6.7 inch', '128GB', null),
(19, 'Apple A16 Bionic', '6GB', '6.7 inch', '128GB', null),
(20, 'Apple A13 Bionic', '4GB', '6.1 inch', '64GB', null),
(21, 'Apple A15 Bionic', '4GB', '6.1 inch', '128GB', null),
--laptop
(22, 'Ryzen 5', '8GB', '14.0 inch', '256GB', 'AMD Radeon Graphics'),
(23, 'Ryzen 5', '8GB', '15.6 inch', '256GB', 'NVIDIA RTX 3050 4GB'),
(24, 'Core i5', '16GB', '14.0 inch', '512GB', 'Intel UHD Graphics'),
(25, 'Core i5', '16GB', '15.6 inch', '512GB', 'Intel Iris Xe Graphics'),
(26, 'Ryzen 7', '16GB', '15.6 inch', '512GB', 'AMD Radeon Graphics'),
(27, 'Ryzen 7', '8GB', '14.0 inch', '512GB', 'AMD Radeon Graphics'),
(28, 'Core i5', '16GB', '15.6 inch', '512GB', 'Intel Iris Xe Graphics'),
(29, 'Core i5', '16GB', '15.6 inch', '512GB', 'NVIDIA RTX 2050 4GB'),
(30, 'Ryzen 5', '16GB', '14.0 inch', '512GB', 'AMD Radeon Graphics'),
(31, 'Core i5', '8GB', '15.6 inch', '512GB', 'NVIDIA RTX 3050'),
(32, 'M2', '8GB', '13.6 inch', '256GB', 'Apple M2'),
(33, 'M1', '8GB', '13.3 inch', '256GB', 'Apple M1'),
(34, 'Core i5', '16GB', '15.6 inch', '512GB', 'NVIDIA RTX 4050 6GB'),
(35, 'Core i5', '16GB', '15.6 inch', '512GB', 'NVIDIA RTX 4060 8GB'),
(36, 'Ryzen 5', '16GB', '14.0 inch', '512GB', 'AMD Radeon Graphics'),
(37, 'Ryzen 7', '8GB', '16.1 inch', '512GB', 'NVIDIA RTX 3050 4GB'),
(38, 'Ryzen 5', '16GB', '14.0 inch', '512GB', 'AMD Radeon Graphics'),
(39, 'Ryzen 5', '16GB', '14.0 inch', '512GB', 'AMD Radeon Graphics'),
--tablet
(40, 'Exynos 1280', '4GB', '10.4 inch', '64GB', null),
(41, 'Snapdragon 7s Gen 2', '8GB', '12.1 inch', '256GB', null),
(42, 'MediaTek Helio G99', '8GB', '8.7 inch', '128GB', null),
(43, 'Apple A13 Bionic', '3GB', '10.2 inch', '64GB', null),
(44, 'Snapdragon 680', '6GB', '11 inch', '128GB', null),
(45, 'SCT310', '3GB', '10.1 inch', '32GB', null),
(46, 'Apple A14 Bionic', '4GB', '10.9 inch', '64GB', null),
(47, 'SCT310', '4GB', '10.1 inch', '64GB', null),
(48, 'Snapdragon 680', '4GB', '10.36 inch', '64GB', null),
(49, 'Exynos 1380', '6GB', '10.9 inch', '128GB', null),
(50, 'Apple M4', '8GB', '13 inch', '256GB', null),
(51, 'MediaTek Helio P22 (MT6762R)', '2GB', '10.1 inch', '32GB', null),
(52, 'MediaTek Helio G88', '4GB', '11 inch', '64GB', null),
(53, 'Snapdragon 870', '8GB', '11.0 inch', '256GB', null),
(54, 'Apple A15 Bionic', '4GB', '8.3 inch', '64GB', null),
(55, 'Apple M2', '8GB', '11.0 inch', '128GB', null),
(56, 'Snapdragon 7s Gen 2', '8GB', '12.1 inch', '128GB', null),
(57, 'Apple M2', '16GB', '12.9 inch', '1TB', null);

INSERT INTO [Order] (orderID, totalMoney, status, order_date, note, address, phone, email, userID, fullName)
VALUES (1, 1899.98, 'Đã thanh toán', '2024-05-30', 'Giao hàng tận nhà', '123 User Street', '0987654321', 'user@example.com', 2, 'Regular User');

INSERT INTO orderDetail (orderdetailID, productID, orderID, numProductbuy, price)
VALUES 
(1, 1, 1, 1, 799.99),
(2, 2, 1, 1, 1099.99),
(3, 3, 1, 1, 1199.99),
(4, 4, 1, 1, 799.99),
(5, 5, 1, 1, 999.99),
(6, 6, 1, 1, 1499.99),
(7, 7, 1, 1, 1299.99),
(8, 8, 1, 1, 899.99),
(9, 9, 1, 1, 1399.99),
(10, 10, 1, 1, 749.99);

INSERT INTO Feedback (id, productID, userID, note)
VALUES (1, 1, 2, 'Sản phẩm tuyệt vời!');

INSERT INTO Galleries (galleryID, productID, thumbnail)
VALUES 
(1, 1, 'iphone8_black.jpg'),
(2, 2, 'galaxy_s20_ultra.jpg'),
(3, 3, 'iphone13_pro_max.jpg'),
(4, 4, 'galaxy_s21.jpg'),
(5, 5, 'asus_zenbook_14.jpg'),
(6, 6, 'asus_rog_strix_g15.jpg'),
(7, 7, 'lenovo_thinkpad_x1_carbon.jpg'),
(8, 8, 'lenovo_yoga_7i.jpg'),
(9, 9, 'dell_xps_13.jpg'),
(10, 10, 'dell_inspiron_15.jpg');

/* 
SELECT * FROM Product;

SELECT p.productID, p.title, p.description, p.price, p.discount, p.created_at, p.updated_at, p.thumbnail
FROM Product p
INNER JOIN Category c ON p.categoryID = c.categoryID
WHERE c.name IN ('Điện thoại', 'Iphone', 'iPhone 8')

SELECT * FROM [Order] WHERE userID = 2;

SELECT * 
FROM [Order] 
WHERE userID = 2;
Retrieve all order details for a specific order:


SELECT od.orderdetailID, od.productID, p.title, od.numProductbuy, od.price
FROM orderDetail od
INNER JOIN Product p ON od.productID = p.productID
WHERE od.orderID = 1;
Retrieve all feedback for a specific product:


SELECT f.id, f.note, u.fullName, u.email
FROM Feedback f
INNER JOIN [User] u ON f.userID = u.userID
WHERE f.productID = 1;
Retrieve all products under a specific category (e.g., 'Laptop'):


SELECT p.productID, p.title, p.description, p.price, p.discount, p.created_at, p.updated_at, p.thumbnail
FROM Product p
INNER JOIN Category c ON p.categoryID = c.categoryID
WHERE c.name = 'Laptop';
Retrieve all subcategories under a specific parent category (e.g., 'Điện thoại'):


SELECT c.categoryID, c.name
FROM Category c
WHERE c.ParentCategoryID = 1;
Retrieve all galleries for a specific product:


SELECT g.galleryID, g.thumbnail
FROM Galleries g
WHERE g.productID = 1;
Retrieve the user information for all orders:


SELECT o.orderID, o.totalMoney, o.status, o.order_date, o.note, o.address, o.phone, o.email, u.fullName
FROM [Order] o
INNER JOIN [User] u ON o.userID = u.userID;
Retrieve all products that have a discount:


SELECT p.productID, p.title, p.description, p.price, p.discount, p.created_at, p.updated_at, p.thumbnail
FROM Product p
WHERE p.discount > 0;
Retrieve all users with their roles:


SELECT u.userID, u.fullName, u.email, u.phoneNumber, u.address, r.name AS roleName
FROM [User] u
INNER JOIN Role r ON u.roleID = r.roleID;
*/

--Tong doanh thu theo tung san pham
SELECT 
    p.productID, 
    p.title, 
    SUM(od.price * od.numProductbuy) AS TotalRevenue
FROM orderDetail od
INNER JOIN Product p ON od.productID = p.productID
GROUP BY p.productID, p.title
ORDER BY TotalRevenue DESC;

--Don dat hang
SELECT 
    o.orderID AS 'Order ID', 
    o.order_date AS 'Date',
    o.status AS 'Payment Status',  
    o.totalMoney as Total, 
	o.phone as 'Số Điện Thoại',
    o.note as 'Ghi chú' 
    /*
	o.address as 'Địa Chỉ', 
    o.email as Email, 
    u.fullName as 'Họ và tên' 
	*/
FROM [Order] o
INNER JOIN [User] u ON o.userID = u.userID
ORDER BY o.order_date DESC;

---San pham
SELECT 
    p.productID as ProductID,
    p.title as Product,
	c.name AS Category,
    p.description as Description,
    p.price as Price,
	p.quantity as Quantity,
	o.status,
    p.created_at,
    p.updated_at,
    p.thumbnail
FROM Product p
LEFT JOIN Category c ON p.categoryID = c.categoryID
LEFT JOIN orderDetail od on p.productID = od.productID
LEFT JOIN [Order] o on o.orderID = od.orderID
GROUP BY p.productID, p.title, c.name, p.description, p.price,p.quantity, o.status, p.created_at, p.updated_at, p.thumbnail
ORDER BY p.created_at DESC;

---
alter table Product
add quantity int;


select title, description, price, discount, created_at, updated_at, categoryid, thumbnail, quantity
from Product 