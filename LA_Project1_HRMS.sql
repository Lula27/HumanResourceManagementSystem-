# Loretta Agyemang - HRMS Project 

#create db Employee - LorettaAgyemang

CREATE DATABASE employeeLorettaAgyemang; 

# Find dbs 

SELECT * FROM sys.databases
ORDER BY create_date; 

# make country tbl 
#  

CREATE TABLE Country (
	Country_Id numeric(10,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Country_Name nvarchar(50) NOT NULL UNIQUE
);

CREATE TABLE State (
	State_Id numeric(10,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Country_Id numeric(10,0) NOT NULL,
	State_Name nvarchar(50) NOT NULL
);
