USE [master]
GO

/****** Object:  Database [LanesOnlineStore]    Script Date: 4/5/2019 8:19:57 PM ******/
CREATE DATABASE [LanesOnlineStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LanesOnlineStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER02\MSSQL\DATA\LanesOnlineStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LanesOnlineStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER02\MSSQL\DATA\LanesOnlineStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [LanesOnlineStore] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LanesOnlineStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [LanesOnlineStore] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET ARITHABORT OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [LanesOnlineStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [LanesOnlineStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET  DISABLE_BROKER 
GO

ALTER DATABASE [LanesOnlineStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [LanesOnlineStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET RECOVERY FULL 
GO

ALTER DATABASE [LanesOnlineStore] SET  MULTI_USER 
GO

ALTER DATABASE [LanesOnlineStore] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [LanesOnlineStore] SET DB_CHAINING OFF 
GO

ALTER DATABASE [LanesOnlineStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [LanesOnlineStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [LanesOnlineStore] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [LanesOnlineStore] SET QUERY_STORE = OFF
GO

ALTER DATABASE [LanesOnlineStore] SET  READ_WRITE 
GO

use LanesOnlineStore
--Create Tables------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table CustomerData (CustomerIDNumber int NOT NULL, FirstName varchar(255) NOT NULL, LastName varchar(255) NOT NULL, SSN varchar(9) NOT NULL, 
PhoneNumber varchar(10) NOT NULL, Address varchar(255) NOT NULL, City varchar(255) NOT NULL, State varchar(2) NOT NULL, Country varchar(30) NOT NULL,
 PostalCode int NOT NULL, DateOfBirth date NOT NULL, EmailAddress varchar(255) NOT NULL, PRIMARY KEY (CustomerIDNumber));

create table CustomerOrders (CustomerIDNumber int NOT NULL, OrderNumber int NOT NULL, ItemName varchar(255) NOT NULL, ItemNumber varchar(255) NOT NULL,
 UnitQTY int NOT NULL, UnitPrice money NOT NULL, TotalOrderCost money NOT NULL, OrderDate date NOT NULL, ShipDate date NOT NULL, 
 ReceiveDate date NOT NULL, PaymentType varchar(255) NOT NULL, InStock varchar(3) NOT NULL, PRIMARY KEY (CustomerIDNumber));

create table CustomerPaymentType (CustomerIDNumber int NOT NULL, NameOnCard varchar(255) NOT NULL, CardName varchar(255)NOT NULL, 
CardNumber varchar(255) NOT NULL, CardExpirationDate date NOT NULL, CVCNumber int NOT NULL, BankName varchar(255), BankAccountNumber varchar(255),
 BankRoutingNumber varchar(255), BillingAddress varchar(255) NOT NULL, PRIMARY KEY (CustomerIDNumber));

create table CustomerReturns (CustomerIDNumber int NOT NULL, ReturnOrderNumber int NOT NULL, ReturnItemName varchar(255) NOT NULL, ReturnItemNumber int NOT NULL,
ReturnUnitQTY int NOT NULL, ReturnUnitPrice money NOT NULL, ReturnTotalCost money NOT NULL, OrderDate date NOT NULL, ReturnShipDate date NOT NULL, 
ReturnReceiveDate date NOT NULL, ReturnPaymentType varchar(255) NOT NULL, ReasonForReturn varchar(255) NOT NULL, PRIMARY KEY (CustomerIDNumber));

create table CustomerLoginInfo (CustomerIDNumber int NOT NULL, UserName varchar(255) NOT NULL, Password varchar(255) NOT NULL, SecurityQuestionOne varchar(255)
NOT NULL, SecurityQuestionTwo varchar(255) NOT NULL, SecurityQuestionThree varchar(255) NOT NULL, PasswordHint varchar (255) NOT NULL,ForgotUN_PWEmail varchar 
(255) NOT NULL, PRIMARY KEY (CustomerIDNumber));

create table Products (ProductID int NOT NULL, ProductName nvarchar(255) NOT NULL, QTYPerUnit int, UnitPrice money, UnitInStock int, 
PRIMARY KEY (ProductID));

--Populate Tables----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Insert Into CustomerData (CustomerIDNumber, FirstName, LastName, SSN, PhoneNumber, Address, City, State, Country, PostalCode, DateOfBirth, EmailAddress)
Values (1, 'Samuel', 'Lane', '999887777', '4504392811', '2601 Fort Bragg BLVD', 'Fort Bragg', 'NC', 'US', 28310, '24 December 1976', 'samuel.lane.sa@outlook.com');
Insert Into CustomerData (CustomerIDNumber, FirstName, LastName, SSN, PhoneNumber, Address, City, State, Country, PostalCode, DateOfBirth, EmailAddress)
Values (2, 'Tammy', 'Lawson', '123456789', '4501234567', '5501 North Bolla Ave', 'Denver', 'CO', 'US', 38207, '14 January 1991', 'tammy.lawson@outlook.com');
Insert Into CustomerData (CustomerIDNumber, FirstName, LastName, SSN, PhoneNumber, Address, City, State, Country, PostalCode, DateOfBirth, EmailAddress)
Values (3, 'Sonya', 'Teal', '987654321', '4502345678', '9813 St Johns Cir', 'Alexandria', 'VA', 'US', 77651, '7 September 1963', 'sonya.teal@outlook.com');
Insert Into CustomerData (CustomerIDNumber, FirstName, LastName, SSN, PhoneNumber, Address, City, State, Country, PostalCode, DateOfBirth, EmailAddress)
Values (4, 'Justin', 'Vogt', '111234444', '4503456789', '3033 Turning Leaf Road', 'Lawton', 'OK', 'US', 90834, '26 August 1977', 'justin.vogt@outlook.com');

select * 
from CustomerData;

Insert Into CustomerOrders (CustomerIDNumber, OrderNumber, ItemName, ItemNumber, UnitQTY, UnitPrice, TotalOrderCost, OrderDate, ShipDate, ReceiveDate, PaymentType, InStock)
Values (1, 00001, 'Intel Processor I7', 1234, 1, 700, 700, '8 September 2018', '9 September 2018', '16 September 2018', 'VISA', 'Yes');
Insert Into CustomerOrders (CustomerIDNumber, OrderNumber, ItemName, ItemNumber, UnitQTY, UnitPrice, TotalOrderCost, OrderDate, ShipDate, ReceiveDate, PaymentType, InStock)
Values (2, 00002, 'Sony Galaxy S10', 3456, 3, 1000, 3000, '16 December 2018', '16 December 2018', '24 December 2018', 'MASTER CARD', 'Yes');
Insert Into CustomerOrders (CustomerIDNumber, OrderNumber, ItemName, ItemNumber, UnitQTY, UnitPrice, TotalOrderCost, OrderDate, ShipDate, ReceiveDate, PaymentType, InStock)
Values (3, 00003, 'Tonka Truck', 2345, 2, 24, 48, '23 January 2019', '23 January 2019', '27 January 2019', 'MASTER CARD', 'No');
Insert Into CustomerOrders (CustomerIDNumber, OrderNumber, ItemName, ItemNumber, UnitQTY, UnitPrice, TotalOrderCost, OrderDate, ShipDate, ReceiveDate, PaymentType, InStock)
Values (4, 00004, 'Sony PS4', 1357, 1, 150, 150, '3 March 2019', '3 March 2019', '6 March 2019', 'PAYPAL', 'Yes');

select * 
from CustomerOrders;

Insert Into CustomerPaymentType (CustomerIDNumber, NameOnCard, CardName, CardNumber, CardExpirationDate, CVCNumber, BankName, BankAccountNumber, BankRoutingNumber, BillingAddress)
Values (1, 'Samuel Lane', 'USAA VISA Platinum', '123456789', '31 July 2020', 404, 'USAA', '876543210', '246813579', '2601 Fort Bragg BLVD, Fort Bragg, North Carolina, 28310');
Insert Into CustomerPaymentType (CustomerIDNumber, NameOnCard, CardName, CardNumber, CardExpirationDate, CVCNumber, BankName, BankAccountNumber, BankRoutingNumber, BillingAddress)
Values (2, 'Tammy Lawson', 'Bank Of America Mastercard', '999888777', '31 August 2019', 404, 'Bank Of America', '192837465', '778855994', '5501 North Bolla Ave, Denver Colorado, 38207');
Insert Into CustomerPaymentType (CustomerIDNumber, NameOnCard, CardName, CardNumber, CardExpirationDate, CVCNumber, BankName, BankAccountNumber, BankRoutingNumber, BillingAddress)
Values (3, 'Sonya Teal', 'Capital One', '111222333', '22 April 2023', 404, 'Capital One', '564738291', '162534987', '9813 St Johns Cir, Alexandria Virginia, 77651');
Insert Into CustomerPaymentType (CustomerIDNumber, NameOnCard, CardName, CardNumber, CardExpirationDate, CVCNumber, BankName, BankAccountNumber, BankRoutingNumber, BillingAddress)
Values (4, 'Justin Vogt', 'PayPal Merchant Account', '444555333', '14 November 2021', 404, 'PayPal', '182736450', '079584732', '3033 Turning Leaf Road, Lawton Oklahoma, 90834');

select * 
from CustomerPaymentType;

Insert Into Products (ProductID, ProductName, QTYPerUnit, UnitPrice, UnitInStock)
Values (60, 'Intel Processor I7', 1, 700, 23)
Insert Into Products (ProductID, ProductName, QTYPerUnit, UnitPrice, UnitInStock)
Values (177, 'Sony Galaxy S10', 1, 1000, 89)
Insert Into Products (ProductID, ProductName, QTYPerUnit, UnitPrice, UnitInStock)
Values (17, 'Tonka Truck', 1, 24, 0)
Insert Into Products (ProductID, ProductName, QTYPerUnit, UnitPrice, UnitInStock)
Values (242, 'Sony PS4', 1, 150, 23)

select * 
from Products;

Insert Into CustomerLoginInfo (CustomerIDNumber, UserName, Password, SecurityQuestionOne, SecurityQuestionTwo, SecurityQuestionThree, PasswordHint, ForgotUN_PWEmail)
Values (1, 'SamThaGod42', '24DogAhtMas', 'Mr_T', 'Sandy', 'PurpleDiamonds', 'YouAlreadyKnow', 'samuel.lane.sa@outlook.com');
Insert Into CustomerLoginInfo (CustomerIDNumber, UserName, Password, SecurityQuestionOne, SecurityQuestionTwo, SecurityQuestionThree, PasswordHint, ForgotUN_PWEmail)
Values (2, 'TamThaGoddess24', '42SseddogAhtMat', 'Benson', 'Richard', 'BlueDiamonds', 'YouAlreadyKnow', 'tammy.lawson@outlook.com');
Insert Into CustomerLoginInfo (CustomerIDNumber, UserName, Password, SecurityQuestionOne, SecurityQuestionTwo, SecurityQuestionThree, PasswordHint, ForgotUN_PWEmail)
Values (3, 'SonyaThePrincess89', '98SsecnirpEhtAynos', 'Gary_Coleman', 'Andy', 'OrangeDiamonds', 'YouAlreadyKnow', 'sonya.teal@outlook.com');
Insert Into CustomerLoginInfo (CustomerIDNumber, UserName, Password, SecurityQuestionOne, SecurityQuestionTwo, SecurityQuestionThree, PasswordHint, ForgotUN_PWEmail)
Values (4, 'JustinThePrince98', '89EcnirpEhtNitsuj', 'Red_Fox', 'Tracy', 'RedDiamonds', 'YouAlreadyKnow', 'justin.vogt@outlook.com');

select *
from CustomerLoginInfo;

Insert Into CustomerReturns (CustomerIDNumber, ReturnOrderNumber, ReturnItemName, ReturnItemNumber, ReturnUnitQTY, ReturnUnitPrice, ReturnTotalCost, OrderDate, 
ReturnShipDate, ReturnReceiveDate, ReturnPaymentType, ReasonForReturn)
Values (1, 2478, 'Patio Set', 12, 1, 942, 942, '8 December 2018', '13 December 2018', '14 December 2018', 'VISA', 'Wrong color');
Insert Into CustomerReturns (CustomerIDNumber, ReturnOrderNumber, ReturnItemName, ReturnItemNumber, ReturnUnitQTY, ReturnUnitPrice, ReturnTotalCost, OrderDate, 
ReturnShipDate, ReturnReceiveDate, ReturnPaymentType, ReasonForReturn)
Values (2, 1901, 'Womens Loose Fit Jeans', 88, 3, 45, 135, '13 May 2018', '17 May 2018', '18 May 2018', 'VISA', 'Does not fit');
Insert Into CustomerReturns (CustomerIDNumber, ReturnOrderNumber, ReturnItemName, ReturnItemNumber, ReturnUnitQTY, ReturnUnitPrice, ReturnTotalCost, OrderDate, 
ReturnShipDate, ReturnReceiveDate, ReturnPaymentType, ReasonForReturn)
Values (3, 157, 'Atari 2600', 26, 1, 100, 100, '2 October 2018', '9 October 2018', '13 October 2018', 'VISA', 'Was not new');
Insert Into CustomerReturns (CustomerIDNumber, ReturnOrderNumber, ReturnItemName, ReturnItemNumber, ReturnUnitQTY, ReturnUnitPrice, ReturnTotalCost, OrderDate, 
ReturnShipDate, ReturnReceiveDate, ReturnPaymentType, ReasonForReturn)
Values (4, 931, '7 Piece Bed Set', 98, 1, 198, 198, '1 April 2019', '6 April 2019', '7 April 2019', 'VISA', 'Did not fit bed');

select * 
from CustomerReturns;
--Query Database-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
select *
from Products
where UnitInStock = 0;

select * 
from CustomerOrders
where TotalOrderCost >= 150;

select * 
from CustomerData 
where Country = 'US'
order by lastname; 

select FirstName, LastName, ItemName, UnitQTY, UnitPrice, TotalOrderCost
from CustomerData as CD
join CustomerOrders as CO
on CD.CustomerIDNumber = CO.CustomerIDNumber






