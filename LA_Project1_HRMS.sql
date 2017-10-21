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
	Emp_Address1 nvarchar(100) NOT NULL,
	Emp_Address2 nvarchar(100) NULL,
	Emp_Zip numeric(5) NOT NULL, 
	Emp_Mobile numeric(10) NOT NULL,
	Emp_Gender bit NOT NULL DEFAULT 0, 
	Emp_Active bit NOT NULL DEFAULT 0, 
	Desig_Id numeric(10) NOT NULL,
	Emp_DOB datetime NOT NULL,
	Emp_JoinDate datetime NOT NULL,
	Emp_Country_Id numeric(10) NOT NULL 
	FOREIGN KEY (Emp_Country_Id)
	REFERENCES Country(Country_Id), 
	Emp_State_Id numeric(10) NOT NULL 
	FOREIGN KEY (Emp_State_Id)
	REFERENCES State(State_Id),
	Emp_City_Id numeric(10) NOT NULL
	FOREIGN KEY (Emp_City_Id)
	REFERENCES City(City_Id)
);

CREATE TABLE Salary (
	Salary_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Emp_Salary_Change_Year datetime NOT NULL,
	Emp_Salary decimal(10,2) NOT NULL,  
	Emp_Id numeric(10) NOT NULL
	FOREIGN KEY (Emp_Id) 
	REFERENCES Employee_Details(Emp_Id) 
);

CREATE TABLE Employee_Documents (
	Emp_Doc_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	Emp_Doc_Name nvarchar(30) NOT NULL,
	Emp_Doc_Desc nvarchar(150) NULL,
	Emp_Id numeric(10) NOT NULL  
	FOREIGN KEY(Emp_Id)
	REFERENCES Employee_Details(Emp_Id)
); 


INSERT INTO Country (Country_Name)
VALUES 
	('Afghanistan'), 
	('Albania'),
	('Algeria'),
	('Andorra'),
	('Australia'),
	('Austria'),
	('Brazil'),
	('Bangladesh'),
	('China'),
	('Chile'),
	('Denmark'),
	('Egypt'),
	('Ethiopia'),
	('France'),
	('Finland'),
	('Germany'),
	('Georgia'),
	('Greece'),
	('Hong Kong'),
	('Hungary'),
	('India'),
	('Ireland'),
	('Japan'),
	('Kuwait'),
	('Kenya'),
	('Luxembourg'),
	('Mexico'),
	('Nepal'),
	('Oman'),
	('Poland'),
	('Qatar'),
	('Russia'),
	('South Africa'),
	('Switzerland'),
	('Syria'),
	('Thailand'),
	('United States'),
	('Uganda'),
	('Vietnam'),
	('Yemen'),
	('Zimbabwe'); 


INSERT INTO State (State_Name) 
VALUES 
	('Badakhshan'),
	('Badghis'),
	('Baghlan'),
	('Berat'),
	('Diber'),
	('Durres'),
	('Adrar'),
	('Blida'),
	('Tipaza'),
	('Canillo'),
	('Ordino'),
	('Tasmania'),
	('Victoria'),
	('Burgenland'), 
	('Tirol'),
	('Bahia'),
	('Roraima'),
	('Dhaka'),
	('Jilin'),
	('Atacama'),
	('Capital'),
	('Suhaj'),
	('Tigray'),
	('Auvergne'),
	('South Savo'),
	('Bremen'),
	('Ajaria'),
	('Crete'),
	('Eastern District'),
	('Baranya Megye'),
	('Kerala'),
	('Cavan'),
	('Akita'),
	('Hawalli'),
	('Central'),
	('Diekirch'),
	('Colima'),
	('Eastern'),
	('Dhofar'),
	('Lodzkie'), 
	('Al Khawr'), 
	('Altay'), 
	('Free State'), 
	('Bern'), 
	('Idlib'), 
	('Chai Nat'),
	('Alaska'),
	('Texas'),
	('New York'),
	('California'),
	('Abim'),
	('Bac Can'),
	('Ataq'),
	('Bulawayo'),
	('New Jersey'); 
