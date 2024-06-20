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
    price decimal(10, 2) NOT NULL,
    discount decimal(10, 2),
    created_at datetime,
    updated_at datetime,
    categoryid int,
    thumbnail nvarchar(255),
    quantity int, 
    FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
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
(4, 'iPhone 8', 2),
(5, 'Galaxy S20', 3),
(6, 'Apple', 1),
(7, 'Samsung', 1),
(8, 'Laptop', NULL),
(9, 'Asus', 8),
(10, 'Lenovo', 8),
(11, 'Dell', 8);


INSERT INTO Product (productID, title, description, price, discount, created_at, updated_at, categoryID, thumbnail, quantity)
VALUES 
-- Điện thoại
(1, 'iPhone 8 Black', 'Apple iPhone 8 64GB Black', 799.99, 0, '2024-05-30', '2024-05-30', 4, 'iphone8_black.jpg', 50),
(2, 'Galaxy S20 Ultra', 'Samsung Galaxy S20 Ultra 128GB', 1099.99, 0, '2024-05-30', '2024-05-30', 5, 'galaxy_s20_ultra.jpg', 30),
(3, 'iPhone 13 Pro Max', 'Apple iPhone 13 Pro Max 256GB', 1199.99, 0, '2024-06-01', '2024-06-01', 6, 'iphone13_pro_max.jpg', 20),
(4, 'Samsung Galaxy S21', 'Samsung Galaxy S21 128GB', 799.99, 0, '2024-06-01', '2024-06-01', 7, 'galaxy_s21.jpg', 25),
-- Laptop
(5, 'Asus ZenBook 14', 'Asus ZenBook 14 UX425 512GB SSD', 999.99, 0, '2024-06-01', '2024-06-01', 9, 'asus_zenbook_14.jpg', 15),
(6, 'Asus ROG Strix G15', 'Asus ROG Strix G15 Gaming Laptop', 1499.99, 0, '2024-06-01', '2024-06-01', 9, 'asus_rog_strix_g15.jpg', 10),
(7, 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 9', 1299.99, 0, '2024-06-01', '2024-06-01', 10, 'lenovo_thinkpad_x1_carbon.jpg', 5),
(8, 'Lenovo Yoga 7i', 'Lenovo Yoga 7i 14" 2-in-1 Laptop', 899.99, 0, '2024-06-01', '2024-06-01', 10, 'lenovo_yoga_7i.jpg', 8),
(9, 'Dell XPS 13', 'Dell XPS 13 9310 512GB SSD', 1399.99, 0, '2024-06-01', '2024-06-01', 11, 'dell_xps_13.jpg', 12),
(10, 'Dell Inspiron 15', 'Dell Inspiron 15 5502 256GB SSD', 749.99, 0, '2024-06-01', '2024-06-01', 11, 'dell_inspiron_15.jpg', 20);

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


