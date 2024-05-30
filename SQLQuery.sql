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
    name nvarchar(50) not null
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

