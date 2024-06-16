create database BanHangOnline
use BanHangOnline

create table Role (
    roleID int primary key,
    name nvarchar(50) not null
)

create table [User] (
    userID int primary key,
    fullName nvarchar(100) not null,
    email nvarchar(100) not null,
    phoneNumber nvarchar(20),
    address nvarchar(255),
    roleID int,
    password nvarchar(255),
    foreign key (roleID) references Role(roleID)
)

create table Category (
    categoryID int primary key,
    name nvarchar(50) not null,
	ParentCategoryID int null,
	foreign key (ParentCategoryID) references Category(categoryID)
);

create table Product (
    productID int primary key,
    title nvarchar(100) not null,
    description nvarchar(255),
    price decimal(10, 2) not null,
    discount decimal(10, 2),
    created_at datetime,
    updated_at datetime,
    categoryid int,
    thumbnail nvarchar(255),
    foreign key (categoryID) references Category(categoryID)
);

create table [Order] (
    orderID int primary key,
    totalMoney decimal(10, 2) not null,
    status nvarchar(50),
    order_date datetime,
    note nvarchar(255),
    address nvarchar(255),
    phone nvarchar(20),
    email nvarchar(100),
    userid int,
    fullName nvarchar(100),
    foreign key (userID) references [User](userID)
);

create table orderDetail (
    orderdetailID int primary key,
    productID int,
    orderID int,
    numProductbuy int not null,
    price decimal(10, 2) not null,
    foreign key (productID) references Product(productID),
    foreign key (orderID) references [Order](orderID)
);

create table Feedback (
    id int primary key,
    productID int,
    userID int,
    note nvarchar(255),
    foreign key (productID) references Product(productID),
    foreign key (userID) references [User](userID)
);
create table Galleries (
    galleryID int primary key,
    productID int,
    thumbnail nvarchar(255),
    foreign key (productID) references product(productID)
);

-- Thêm dữ liệu mẫu vào bảng Role
INSERT INTO Role (roleID, name)
VALUES (1, 'Admin'),
       (2, 'User');

-- Thêm dữ liệu mẫu vào bảng User
INSERT INTO [User] (userID, fullName, email, phoneNumber, address, roleID, password)
VALUES (1, 'Admin User', 'admin@example.com', '123456789', '123 Admin Street', 1, 'adminpassword'),
       (2, 'Regular User', 'user@example.com', '987654321', '456 User Avenue', 2, 'userpassword');

-- Thêm dữ liệu mẫu vào bảng Category
INSERT INTO Category (categoryID, name, ParentCategoryID)
VALUES 
(1, 'Điện thoại', NULL),
(2, 'Iphone', 1),
(3, 'Samsung', 1),
(4, 'iPhone 8', 2),
(5, 'Galaxy S20', 3),
(6, 'Apple', 1),
(7, 'Samsung', 1),
(8, 'Laptop', NULL),
(9, 'Asus', 8),
(10, 'Lenovo', 8),
(11, 'Dell', 8);

-- Thêm dữ liệu mẫu vào bảng Product
INSERT INTO Product (productID, title, description, price, discount, created_at, updated_at, categoryID, thumbnail)
VALUES 
-- Điện thoại
(1, 'iPhone 8 Black', 'Apple iPhone 8 64GB Black', 799.99, 0, '2024-05-30', '2024-05-30', 4, 'iphone8_black.jpg'),
(2, 'Galaxy S20 Ultra', 'Samsung Galaxy S20 Ultra 128GB', 1099.99, 0, '2024-05-30', '2024-05-30', 5, 'galaxy_s20_ultra.jpg'),
(3, 'iPhone 13 Pro Max', 'Apple iPhone 13 Pro Max 256GB', 1199.99, 0, '2024-06-01', '2024-06-01', 6, 'iphone13_pro_max.jpg'),
(4, 'Samsung Galaxy S21', 'Samsung Galaxy S21 128GB', 799.99, 0, '2024-06-01', '2024-06-01', 7, 'galaxy_s21.jpg'),
-- Laptop
(5, 'Asus ZenBook 14', 'Asus ZenBook 14 UX425 512GB SSD', 999.99, 0, '2024-06-01', '2024-06-01', 9, 'asus_zenbook_14.jpg'),
(6, 'Asus ROG Strix G15', 'Asus ROG Strix G15 Gaming Laptop', 1499.99, 0, '2024-06-01', '2024-06-01', 9, 'asus_rog_strix_g15.jpg'),
(7, 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 9', 1299.99, 0, '2024-06-01', '2024-06-01', 10, 'lenovo_thinkpad_x1_carbon.jpg'),
(8, 'Lenovo Yoga 7i', 'Lenovo Yoga 7i 14" 2-in-1 Laptop', 899.99, 0, '2024-06-01', '2024-06-01', 10, 'lenovo_yoga_7i.jpg'),
(9, 'Dell XPS 13', 'Dell XPS 13 9310 512GB SSD', 1399.99, 0, '2024-06-01', '2024-06-01', 11, 'dell_xps_13.jpg'),
(10, 'Dell Inspiron 15', 'Dell Inspiron 15 5502 256GB SSD', 749.99, 0, '2024-06-01', '2024-06-01', 11, 'dell_inspiron_15.jpg');

-- Thêm dữ liệu mẫu vào bảng [Order]
INSERT INTO [Order] (orderID, totalMoney, status, order_date, note, address, phone, email, userID, fullName)
VALUES (1, 1899.98, 'Đã thanh toán', '2024-05-30', 'Giao hàng tận nhà', '123 User Street', '0987654321', 'user@example.com', 2, 'Regular User');

-- Thêm dữ liệu mẫu vào bảng orderDetail
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

-- Thêm dữ liệu mẫu vào bảng Feedback
INSERT INTO Feedback (id, productID, userID, note)
VALUES (1, 1, 2, 'Sản phẩm tuyệt vời!');

-- Thêm dữ liệu mẫu vào bảng Galleries
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

