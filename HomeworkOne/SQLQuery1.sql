CREATE DATABASE SEDC
CREATE TABLE BusinessEntity(
Id int NOT NULL,
Name nvarchar(100) NULL,
Region nvarchar(1000) NULL,
Zipcode nvarchar(10) NULL,
Size nvarchar(10) NULL,
CONSTRAINT BusinessEntity PRIMARY KEY CLUSTERED (Id)
)
CREATE TABLE Employee(
Id int NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth Date NULL,
Gender nchar(1) NULL,
HireDate date NULL,
NationalIdNumber nvarchar(20) NULL,
CONSTRAINT Employee PRIMARY KEY CLUSTERED (Id)
)
CREATE TABLE Product(
Id int NOT NULL,
Code nvarchar(50) NULL,
Name nvarchar(100) NULL,
Description nvarchar(MAX) NULL,
Weight decimal(18,2) NULL,
Price decimal(18,2) NULL,
Cost decimal(18,2) NULL,
CONSTRAINT Product PRIMARY KEY CLUSTERED (Id)
)
CREATE TABLE Customer(
Id INT NOT NULL,
Name nvarchar(100) NOT NULL,
AccountNumber nvarchar(50) NULL,
City nvarchar(100) NULL,
RegionName nvarchar(100) NULL,
CustomerSize nvarchar(10) NULL,
PhoneNumber nvarchar(20) NULL,
isActive bit NOT NULL,
CONSTRAINT Customer PRIMARY KEY CLUSTERED (Id)
)
CREATE TABLE Order(
Id INT NOT NULL,
OrderDate
)