USE BanHangOnlineNew;		--Xóa database cũ đi rồi thêm bản mới này vào

CREATE TABLE Roles (
  roleID	int IDENTITY PRIMARY KEY NOT NULL, 
  [name]    nvarchar(50) NOT NULL UNIQUE
);

CREATE TABLE Users (
  userID		int IDENTITY PRIMARY KEY NOT NULL, 
  fullName		nvarchar(100) NOT NULL, 
  email			nvarchar(100) NOT NULL UNIQUE, 
  [password]    nvarchar(255) NOT NULL, 
  phone			nvarchar(20) NULL, 
  [address]     nvarchar(255) NULL, 
  roleID		int NOT NULL, 
  FOREIGN KEY (roleID) REFERENCES Roles (roleID)
);

CREATE TABLE Categories (
  categoryID          int IDENTITY PRIMARY KEY NOT NULL, 
  [name]              nvarchar(100) NOT NULL, 
  parentCategoryID    int NULL, 
  FOREIGN KEY (parentCategoryID) REFERENCES Categories (categoryID)
);

CREATE TABLE Products (
  productID		int IDENTITY PRIMARY KEY NOT NULL, 
  [name]		nvarchar(100) NOT NULL, 
  price			decimal(20, 2) NOT NULL, 
  discount		decimal(20, 2) NULL, 
  quantity		int NULL, 
  created_at    datetime NULL, 
  updated_at    datetime NULL, 
  [description] nvarchar(2000) NULL, 
  thumbnail		nvarchar(255) NULL, 
  categoryID	int NOT NULL, 
  FOREIGN KEY (categoryID) REFERENCES Categories (categoryID)
);

CREATE TABLE Orders (
  orderID        int IDENTITY PRIMARY KEY NOT NULL, 
  userID         int NOT NULL,
  orderConfirmed bit NOT NULL,
  orderDate      datetime NULL, 
  totalMoney     decimal(20, 2) NOT NULL, 
  phone          nvarchar(20) NOT NULL, 
  paymentStatus  nvarchar(50) NULL, 
  deliveryStatus nvarchar(50) NULL, 
  paymentType    nvarchar(100) NULL,
  deliveryInfo   nvarchar(100) NULL,
  FOREIGN KEY (userID) REFERENCES Users (userID)
);

--drop table Orders;
--drop table OrderDetails;

CREATE TABLE OrderDetails (
  ID        int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  orderID   int NOT NULL, 
  quantity  int NOT NULL, 
  price     decimal(20, 2) NOT NULL, 
  FOREIGN KEY (orderID) REFERENCES Orders (orderID),
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

CREATE TABLE ProductDetails (
  ID           int IDENTITY PRIMARY KEY NOT NULL, 
  productID    int NOT NULL, 
  screen       nvarchar(200) NULL, 
  os           nvarchar(100) NULL, 
  mainCamera   nvarchar(200) NULL, 
  selfieCamera nvarchar(200) NULL, 
  chip         nvarchar(100) NULL, 
  ram          nvarchar(100) NULL, 
  storage      nvarchar(200) NULL, 
  sim          nvarchar(200) NULL, 
  battery      nvarchar(100) NULL, 
  charger      nvarchar(200) NULL, 
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

CREATE TABLE Feedbacks (
  ID        int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  userID    int NOT NULL, 
  note      nvarchar(255) NOT NULL, 
  FOREIGN KEY (userID) REFERENCES Users (userID),
  FOREIGN KEY (productID) REFERENCES Products (productID)
);

CREATE TABLE Galleries (
  galleryID int IDENTITY PRIMARY KEY NOT NULL, 
  productID int NOT NULL, 
  picLink   nvarchar(255) NULL, 
  FOREIGN KEY (productID) REFERENCES Products (productID)
);
--//////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////

--Dữ liệu mẫu

-- Insert dữ liệu vào bảng Roles
INSERT INTO Roles ([name]) VALUES ('admin');
INSERT INTO Roles ([name]) VALUES ('customer');

-- Insert dữ liệu vào bảng Users
INSERT INTO Users (fullName, email, [password], phone, [address], roleID) 
VALUES 
('admin', 'admin@gmail.com', '123', '0987654111', '123 Admin Street', 1),
('customer', 'customer@gmail.com', '123', '0987654222', '123 Customer Street', 2),
('Nguyen Van A', 'nguyen@example.com', 'password123', '0123456789', '123 ABC Street', 1),
('Tran Thi B', 'tran@example.com', 'password456', '0987654321', '456 DEF Street', 2);

-- Insert dữ liệu vào bảng Categories
INSERT INTO Categories ([name], parentCategoryID) VALUES ('Electronics', NULL);
INSERT INTO Categories ([name], parentCategoryID) VALUES ('Mobile Phones', 1);

-- Insert dữ liệu vào bảng Products
INSERT INTO Products ([name], price, discount, quantity, created_at, updated_at, [description], thumbnail, categoryID) 
VALUES 
('iPhone 13', 999.99, 50.00, 10, GETDATE(), GETDATE(), 'Latest iPhone model', 'iphone13.jpg', 2),
('iPhone 12', 799.99, 40.00, 20, GETDATE(), GETDATE(), 'Previous iPhone model', 'iphone12.jpg', 2),
('Samsung Galaxy S21', 899.99, 30.00, 15, GETDATE(), GETDATE(), 'Flagship Samsung phone', 'galaxys21.jpg', 2),
('Samsung Galaxy Note 20', 1199.99, 100.00, 8, GETDATE(), GETDATE(), 'Samsung Note series', 'note20.jpg', 2),
('Xiaomi Mi 11', 699.99, 20.00, 25, GETDATE(), GETDATE(), 'High-end Xiaomi phone', 'mi11.jpg', 2),
('Xiaomi Redmi Note 10', 199.99, 10.00, 30, GETDATE(), GETDATE(), 'Affordable Xiaomi phone', 'redminote10.jpg', 2),
('Oppo Find X3', 799.99, 50.00, 12, GETDATE(), GETDATE(), 'Flagship Oppo phone', 'findx3.jpg', 2),
('Oppo A53', 149.99, 10.00, 40, GETDATE(), GETDATE(), 'Budget Oppo phone', 'a53.jpg', 2),
('OnePlus 9', 729.99, 50.00, 18, GETDATE(), GETDATE(), 'Latest OnePlus phone', 'oneplus9.jpg', 2),
('OnePlus Nord', 399.99, 30.00, 22, GETDATE(), GETDATE(), 'Mid-range OnePlus phone', 'nord.jpg', 2);

-- Insert dữ liệu vào bảng ProductDetails
INSERT INTO ProductDetails (productID, screen, os, mainCamera, selfieCamera, chip, ram, storage, sim, battery, charger) 
VALUES 
(1, '6.1 inch', 'iOS', '12MP', '12MP', 'A15 Bionic', '4GB', '128GB', 'Nano SIM', '3110mAh', '20W'),
(2, '6.1 inch', 'iOS', '12MP', '12MP', 'A14 Bionic', '4GB', '128GB', 'Nano SIM', '2815mAh', '20W'),
(3, '6.2 inch', 'Android', '64MP', '10MP', 'Exynos 2100', '8GB', '128GB', 'Nano SIM', '4000mAh', '25W'),
(4, '6.7 inch', 'Android', '108MP', '10MP', 'Exynos 990', '8GB', '256GB', 'Nano SIM', '4500mAh', '25W'),
(5, '6.81 inch', 'Android', '108MP', '20MP', 'Snapdragon 888', '8GB', '128GB', 'Nano SIM', '4600mAh', '55W'),
(6, '6.43 inch', 'Android', '48MP', '13MP', 'Snapdragon 678', '4GB', '64GB', 'Nano SIM', '5000mAh', '33W'),
(7, '6.7 inch', 'Android', '50MP', '32MP', 'Snapdragon 870', '12GB', '256GB', 'Nano SIM', '4500mAh', '65W'),
(8, '6.5 inch', 'Android', '13MP', '8MP', 'Snapdragon 460', '4GB', '64GB', 'Nano SIM', '5000mAh', '18W'),
(9, '6.55 inch', 'Android', '48MP', '16MP', 'Snapdragon 888', '8GB', '128GB', 'Nano SIM', '4500mAh', '65W'),
(10, '6.44 inch', 'Android', '48MP', '32MP', 'Snapdragon 765G', '8GB', '128GB', 'Nano SIM', '4115mAh', '30W');

-- Insert dữ liệu vào bảng Orders
INSERT INTO Orders (userID, orderDate, orderConfirmed, totalMoney, phone, paymentStatus, deliveryStatus, paymentType, deliveryInfo) 
VALUES 
(2, '2024-06-30', 1, 1049.99, '0987654321', 'Paid', 'Delivered', 'Credit Card', N'Giao Hàng Tiết Kiệm'),
(2, '2024-07-01', 1, 799.99, '0987654321', 'Pending', 'Processing', 'PayPal', N'Giao Hàng Tiết Kiệm'),
(1, '2024-07-02', 1, 949.99, '0123456789', 'Paid', 'Shipped', 'Credit Card', N'Giao Hàng Tiết Kiệm'),
(1, '2024-07-03', 1, 199.99, '0123456789', 'Pending', 'Processing', 'Cash on Delivery', N'Giao Hàng Tiết Kiệm'),
(2, '2024-07-04', 1, 849.99, '0987654321', 'Paid', 'Delivered', 'Credit Card', N'Giao Hàng Tiết Kiệm'),
(2, '2024-07-05', 1, 1199.99, '0987654321', 'Pending', 'Processing', 'PayPal', N'Giao Hàng Tiết Kiệm'),
(1, '2024-07-06', 1, 729.99, '0123456789', 'Paid', 'Shipped', 'Credit Card', N'Giao Hàng Tiết Kiệm'),
(1, '2024-07-07', 1, 399.99, '0123456789', 'Pending', 'Processing', 'Cash on Delivery', N'Giao Hàng Tiết Kiệm'),
(2, '2024-07-08', 1, 149.99, '0987654321', 'Paid', 'Delivered', 'Credit Card', N'Giao Hàng Tiết Kiệm'),
(2, '2024-07-09', 1, 699.99, '0987654321', 'Pending', 'Processing', 'PayPal', N'Giao Hàng Tiết Kiệm');

-- Insert dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (productID, orderID, quantity, price) 
VALUES 
(1, 1, 1, 999.99),
(2, 2, 1, 799.99),
(3, 3, 1, 899.99),
(4, 4, 1, 199.99),
(5, 5, 1, 699.99),
(6, 6, 1, 199.99),
(7, 7, 1, 799.99),
(8, 8, 1, 149.99),
(9, 9, 1, 729.99),
(10, 10, 1, 399.99),
(1, 6, 1, 999.99),
(2, 5, 1, 799.99);

-- Insert dữ liệu vào bảng Feedbacks
INSERT INTO Feedbacks (productID, userID, note) 
VALUES 
(1, 2, 'Great phone!'),
(2, 2, 'Very satisfied with the performance.'),
(3, 1, 'Excellent camera quality.'),
(4, 1, 'A bit expensive but worth it.'),
(5, 2, 'Amazing battery life.'),
(6, 2, 'Great value for money.'),
(7, 1, 'Impressive design.'),
(8, 1, 'Good for basic use.'),
(9, 2, 'Fast and smooth performance.'),
(10, 2, 'Perfect for mid-range phone.'),
(1, 1, 'I love the iOS experience.'),
(2, 2, 'Battery could be better.');

-- Insert dữ liệu vào bảng Galleries
INSERT INTO Galleries (productID, picLink) 
VALUES 
(1, 'iphone13_1.jpg'),
(1, 'iphone13_2.jpg'),
(2, 'galaxys21_1.jpg');

-- test////////////////
select * from Orders

--Test
--EXEC GetProductsByCategory @targetCategoryName = 'Mobile Phones';
--DROP PROCEDURE IF EXISTS GetCategoryDescendants;
--DROP PROCEDURE IF EXISTS GetProductsByCategory;
--DROP FUNCTION dbo.GetDescendantCategories;
--////////////////////////////////////////////////

SELECT *
FROM Products
WHERE categoryID = 2
   OR categoryID IN (SELECT categoryID FROM Categories WHERE parentCategoryID = 2);
