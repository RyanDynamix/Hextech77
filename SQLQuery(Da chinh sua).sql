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
VALUES (1, 'Điện thoại', NULL),
       (2, 'Iphone', 1),
       (3, 'Samsung', 1),
       (4, 'iPhone 8', 2),
       (5, 'Galaxy S20', 3);

-- Thêm dữ liệu mẫu vào bảng Product
INSERT INTO Product (productID, title, description, price, discount, created_at, updated_at, categoryID, thumbnail)
VALUES (1, 'iPhone 8 Black', 'Apple iPhone 8 64GB Black', 799.99, 0, '2024-05-30', '2024-05-30', 4, 'iphone8_black.jpg'),
       (2, 'Galaxy S20 Ultra', 'Samsung Galaxy S20 Ultra 128GB', 1099.99, 0, '2024-05-30', '2024-05-30', 5, 'galaxy_s20_ultra.jpg');

-- Thêm dữ liệu mẫu vào bảng [Order]
INSERT INTO [Order] (orderID, totalMoney, status, order_date, note, address, phone, email, userID, fullName)
VALUES (1, 1899.98, 'Đã thanh toán', '2024-05-30', 'Giao hàng tận nhà', '123 User Street', '0987654321', 'user@example.com', 2, 'Regular User');

-- Thêm dữ liệu mẫu vào bảng orderDetail
INSERT INTO orderDetail (orderdetailID, productID, orderID, numProductbuy, price)
VALUES (1, 1, 1, 1, 799.99),
       (2, 2, 1, 1, 1099.99);

-- Thêm dữ liệu mẫu vào bảng Feedback
INSERT INTO Feedback (id, productID, userID, note)
VALUES (1, 1, 2, 'Sản phẩm tuyệt vời!');

-- Thêm dữ liệu mẫu vào bảng Galleries
INSERT INTO Galleries (galleryID, productID, thumbnail)
VALUES (1, 1, 'iphone8_black.jpg'),
       (2, 2, 'galaxy_s20_ultra.jpg');


/* 
SELECT * FROM Product;

SELECT p.productID, p.title, p.description, p.price, p.discount, p.created_at, p.updated_at, p.thumbnail
FROM Product p
INNER JOIN Category c ON p.categoryID = c.categoryID
WHERE c.name IN ('Điện thoại', 'Iphone', 'iPhone 8')

SELECT * FROM [Order] WHERE userID = 2;
*/

