# Loretta Agyemang - HRMS Project 

#create db Employee - LorettaAgyemang

CREATE DATABASE employeeLorettaAgyemang; 

# Find dbs 

SELECT * FROM sys.databases
ORDER BY create_date; 

# see tables 
USE employeeLorettaAgyemang 
GO
SELECT * FROM INFORMATION_SCHEMA.TABLES; 

# make country tbl 
# make _state tbl 

CREATE TABLE Country (
	Country_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Country_Name nvarchar(50) NOT NULL UNIQUE
);

CREATE TABLE State (
	State_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Country_Id numeric(10) NOT NULL,
	State_Name nvarchar(50) NOT NULL
);


CREATE TABLE City (
	City_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	City_Name nvarchar(50) NOT NULL,
	State_Id numeric(10) NOT NULL 
	FOREIGN KEY (State_Id)
	REFERENCES State(State_Id) 
);


CREATE TABLE Designation (
	Desig_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Desig_Description nvarchar(300) NOT NULL, 
	Desig_Name nvarchar(50) NOT NULL UNIQUE 	
);

CREATE TABLE Employee_Details (
	Emp_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Emp_First_Name nvarchar(50) NOT NULL,
	Emp_Middle_Name nvarchar(50) NULL,
	Emp_Last_Name nvarchar(50) NOT NULL,
	Emp_Address1 nvarchar(100) NULL,
	Emp_Address2 nvarchar(100) NOT NULL,
	Emp_Country_Id numeric(10) 
	 


);