CREATE DATABASE SEDCACADEMYDB
USE SEDCACADEMYDB
CREATE TABLE Students(
Id INT IDENTITY(1,1),
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
DateOfBirth date NOT NULL,
EnrolledDate date NOT NULL,
Gender nchar NOT NULL,
NationalIDNumber int NOT NULL,
StudentCardNumber int NOT NULL
CONSTRAINT PK_Students PRIMARY KEY CLUSTERED (Id)

)
CREATE TABLE Teacher(
Id INT IDENTITY (1,1),
FirstName nvarchar(20) NOT NULL,
LastName nvarchar(20) NOT NULL,
DateOfBirth date NOT NULL,
AcademicRank nvarchar(50) NOT NULL,
HireDate date NOT NULL
CONSTRAINT PK_Teacher PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE Grade(
Id INT IDENTITY (1,1),
StudentId int NULL,
CourseId int NULL,
Grade int NULL,
Comment nvarchar(255) NULL,
CreatedDate datetime NULL
CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE Course(
Id INT IDENTITY (1,1),
Name nvarchar(50) NULL,
Credit int NULL,
AcademicYear date NULL,
Semester date NULL,
CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (Id)

)

CREATE TABLE AchievementType(
Id INT IDENTITY (1,1),
[Name] nvarchar(20) NULL,
Description nvarchar(255) NULL,
ParticipationRate INT NULL,
CONSTRAINT PK_AchievementType PRIMARY KEY CLUSTERED (Id)
)
CREATE TABLE GradeDetails(
Id INT IDENTITY (1,1),
GradeId INT NULL,
AchievementTypeId INT NULL,
AchievementPoints INT NULL,
AchievementMaxPoints INT NULL,
AchievementDate INT NULL
CONSTRAINT PK_GradeDetails PRIMARY KEY CLUSTERED (Id)
)