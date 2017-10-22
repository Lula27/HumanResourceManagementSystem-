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

DROP TABLE Country; 

CREATE TABLE State (
	State_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Country_Id numeric(10),
	State_Name nvarchar(50) NOT NULL
);

SELECT * FROM State; 

CREATE TABLE City (
	City_Id numeric(10) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	City_Name nvarchar(50) NOT NULL,
	State_Id numeric(10) 
	FOREIGN KEY (State_Id)
	REFERENCES State(State_Id) 
);

DROP TABLE City; 

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
	Emp_Id numeric(10) 
	FOREIGN KEY (Emp_Id) 
	REFERENCES Employee_Details(Emp_Id) 
);

SELECT * FROM Salary; 

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

#See tbls 
SELECT * FROM Country; 

SELECT * FROM State;


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


INSERT INTO City (City_Name)  
VALUES 
	('Jurm'), 
	('Abbakhsh'), 
	('Baglan'), 
	('Berat'), 
	('Burrel'), 
	('Durres'), 
	('Algiers'), 
	('Amsthas'), 
	('Aboucha'),
	('Canillo'),
	('Ordino'),
	('Hobart'),
	('Melbourne'),
	('Eisenstadt'),
	('Anchorage'),
	('Fairbanks'),
	('College'),
	('Kodiak'),
	('Meadow Lakes'), 
	('Houston'),
	('Dallas'),
	('Austin'),
	('Fort Worth'),
	('New York'),
	('Buffalo'),
	('Rochester'),
	('Syracuse'),
	('Albany'),
	('Los Angeles'),
	('San Diego'),
	('San Francisco'),
	('Oakland'),
	('Sacremento'),
	('Newark'); 

SELECT * FROM City; 
	
INSERT INTO Designation(Desig_Name, Desig_Description) 
VALUES ('Project Manager', 'plan, budget, oversee and document all aspects of the specific project'),
		('Software Developer','design, installation, testing and maintenance of software systems'), 
		('Team Leader','provides direction, instructions and guidance to a group'), 
		('Business Analyst','develop technical solutions to business problems, or to advance sales efforts'), 
		('Design Engineer','study, research and develop ideas for new products and the systems used to make them'), 
		('Tech Lead','responsible for leading a development team');  

SELECT * FROM Designation;

SELECT * FROM Employee_Details;

SELECT * FROM Salary;

#1 Stored Procedures...later  

CREATE PROCEDURE collectnationalinfo 
AS 
SELECT Employee_Details.Emp_First_Name, Employee_Details.Emp_Last_Name, Employee_Details.Emp_Address1, Country.Country_Name 
FROM Employee_Details 
INNER JOIN Country ON Country.Country_ID = 
Employee_Details.Emp_Country_Id; 


DROP PROCEDURE collectnationalinfo; 


CREATE PROCEDURE orderstcountnames
AS 
SELECT State_Name, Country_Name 
FROM State, Country 
ORDER BY State_Name ASC; 

EXEC orderstcountnames; 


CREATE PROCEDURE firstcountryname
AS  
SELECT Country_Name 
FROM Country 
WHERE Country_Id <= 3 
ORDER BY Country_Name ASC; 


CREATE PROCEDURE frnamea
AS 
SELECT Emp_First_Name FROM Employee_Details
WHERE Emp_First_Name LIKE 'a%'; 

CREATE PROCEDURE lsnamea
AS 
SELECT Emp_First_Name FROM Employee_Details
WHERE Emp_First_Name LIKE '%a'; 


CREATE PROCEDURE inactive
AS 
SELECT * FROM Employee_Details
WHERE Emp_Active=0; 


CREATE PROCEDURE rename 
AS 
SELECT Emp_First_Name, Emp_Last_Name, Emp_Middle_Name
FROM Employee_Details
sp_RENAME 'Employee_Details.[Emp_First_Name]','[FirstName]', 'COLUMN'
sp_RENAME 'Employee_Details.[Emp_Last_Name]','[LastName]', 'COLUMN'
sp_RENAME 'Employee_Details.[Emp_Middle_Name]','[MiddleName]', 'COLUMN';  


CREATE PROCEDURE totalEmp
AS 
SELECT COUNT (Emp_Active)
FROM Employee_Details; 


CREATE PROCEDURE totalEmp
AS 
SELECT COUNT (Emp_Active)
FROM Employee_Details
WHERE MiddleName IS NOT NULL; 



CREATE PROCEDURE changna
AS 
SELECT FirstName, LastName, MiddleName 
FROM Employee_Details
UPDATE Employee_Details
SET MiddleName = 'Not Applicable'
WHERE
MiddleName IS NULL; 


CREATE PROCEDURE combine
AS 
SELECT FirstName, MiddleName, LastName 
CONCAT(FirstName, ' ', MiddleName, ' ', LastName, ' ')
FROM Employee_Details
PRINT CONCAT(FirstName, ' ', MiddleName, ' ', LastName, ' '); 


CREATE PROCEDURE alfcountryname
AS 
SELECT *
FROM Employee_Details 
INNER JOIN Country ON Employee_Details.Emp_Country_Id = Country_Id
ORDER BY Country_Name ASC;


CREATE PROCEDURE ascfirstname 
AS 
SELECT FirstName
FROM Employee_Details 
WHERE Emp_Id <= 10 
ORDER BY FirstName ASC; 



CREATE PROCEDURE adcity
AS 
SELECT * 
FROM Employee_Details  
INNER JOIN City ON Employee_Details.Emp_City_Id = City_Id
WHERE City_Name LIKE 'A%s%D'; 



CREATE PROCEDURE empdob 
AS 
SELECT FirstName, LastName, MiddleName, Country_Name, Emp_DOB
FROM Employee_Details
WHERE Emp_DOB BETWEEN '1978-05-12' AND '1986-08-01'; 


CREATE PROCEDURE highestpay
AS 
SELECT FirstName, LastName, Country_Name 
FROM Employee_Details
WHERE Emp_Salary = 105000.00; 


CREATE PROCEDURE individual  
AS 
SELECT FirstName, LastName, MiddleName, Country_Name 
FROM Employee_Details
WHERE Desig_Id IS 0 AND Emp_Salary = 105000.00;


CREATE PROCEDURE payrange  
AS 
SELECT FirstName, LastName, MiddleName, Country_Name, Desig_Id 
FROM Employee_Details
WHERE Emp_DOB BETWEEN '35000.00' AND '89200.00'; 


CREATE PROCEDURE thrcharacters  
AS 
SELECT SUBSTRING(Employee_Details, 1,3); 



CREATE PROCEDURE thrcharacters showmoney 
AS 
SELECT REPLACE('a', '$'); 
FROM Emp_First_Name; 


WITH 
	cteEmpDetails (First Name, Year, Month, Day)
	AS
	(
	SELECT Emp_First_Name, Emp_JoinDate
	FROM Employee_Details
	);

CREATE PROCEDURE employeedetails
AS 
SELECT cteEmpDetails 
WHERE Year = '2014'; 


CREATE PROCEDURE employeedetails
AS 
SELECT cteEmpDetails 
WHERE Year > '01-01-2014'; 