CREATE DATABASE Task2

use Task2 

CREATE TABLE Employees (
    Employees_Id int PRIMARY key,
    Name VARCHAR(50),
    Salary DECIMAL,

)

ALTER TABLE dbo.Employees
add Department VARCHAR(50);

ALTER TABLE dbo.Employees
DROP COLUMN Salary;

EXEC sp_rename 'Employees.Department', 'DeptName', 'column'

create TABLE Projects(
    ProjectID int,
    ProjectName VARCHAR(30),
)

ALTER TABLE dbo.Employees
add CONSTRAINT pk_Employees PRIMARY KEY (Employees_Id)


ALTER TABLE dbo.Employees
add CONSTRAINT UQ_Employees_name UNIQUE (Name)

CREATE TABLE Customers(
    CustomerID int,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(50),
    Status VARCHAR(50),
)

ALTER TABLE dbo.Customers
ADD CONSTRAINT UQ_Customers_FirstN_LastN UNIQUE (FirstName,LastName)


ALTER TABLE dbo.Customers
ADD CONSTRAINT DF_Status DEFAULT 'Active' FOR Status


CREATE TABLE Orders(
    OrderID int,
    CustomerID int,
    OrderDate DATETIME,
    TotalAmount DECIMAL,
)

ALTER TABLE dbo.projects
--ALTER COLUMN ProjectID int not NULL
ADD CONSTRAINT pk_project PRIMARY KEY (ProjectID)

ALTER TABLE dbo.Employees
--ADD ProjectID int;
ADD CONSTRAINT FK_project FOREIGN KEY (ProjectID)
 REFERENCES dbo.projects (ProjectID)

ALTER TABLE dbo.Employees
drop CONSTRAINT FK_project

ALTER TABLE ORDERs
ADD CONSTRAINT CHK_amo CHECK (TotalAmount > 0)

CREATE SCHEMA Sales
go

alter SCHEMA sales
transfer dbo.Orders


EXEC sp_rename 'sales.orders' , 'SalesOrders'