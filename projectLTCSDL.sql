
create table users 
(
	userID int primary key identity,
	username varchar(50) not null,
	upass varchar(10) not null,
	uName varchar(50) not null,
	uphone varchar(10) not null
)
ALTER TABLE users
ADD isDisabled BIT DEFAULT 0, 
    failedAttempts INT DEFAULT 0;

create table category(
	catID int primary key identity,
	catName nvarchar(50)
)



create table tables(
	tID int primary key identity,
	tName nvarchar(15)
)
ALTER TABLE tables ADD isAvailable BIT DEFAULT 1;

create table staff (
	staffID int primary key identity,
	sName nvarchar(50),
	sPhone varchar(50),
	sRole nvarchar(50)

)
ALTER TABLE staff
ADD sAddress NVARCHAR(255);

create table products (
	pID int primary key identity,
	pName nvarchar(50),
	pPrice float,
	CategoryID int,
	pImage image
)
ALTER TABLE products
ADD pStock INT DEFAULT 0;

select pID,pName,pPrice,CategoryID, c.catName 
from products p inner join category c on c.catID = p.CategoryID

create table tblMain(
	MainID int primary key identity,
	aDate date,
	aTime varchar(15),
	TableName varchar(10),
	WaiterName varchar(20),
	status varchar(20),
	orderType varchar(20),
	total float,
	received float,
	change float
)
create table tblDetails(
	DetailID int primary key identity,
	MainID int,
	proID int,
	qty int,
	price float,	
	amount float
)

truncate table tblDetails;
truncate table tblMain;

select* from tblMain m 
inner join tblDetails d on m.MainID = d.MainID


SELECT p.CategoryID
FROM products p
LEFT JOIN category c ON p.CategoryID = c.catID
WHERE c.catID IS NULL;



ALTER TABLE products
ADD CONSTRAINT FK_Products_Category
FOREIGN KEY (CategoryID) REFERENCES category(catID)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE tblDetails
ADD CONSTRAINT FK_Details_Main
FOREIGN KEY (MainID) REFERENCES tblMain(MainID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE tblDetails
ADD CONSTRAINT FK_Details_Products
FOREIGN KEY (proID) REFERENCES products(pID)
ON DELETE CASCADE
ON UPDATE CASCADE;


SELECT td.proID
FROM tblDetails td
LEFT JOIN products p ON td.proID = p.pID
WHERE p.pID IS NULL;


