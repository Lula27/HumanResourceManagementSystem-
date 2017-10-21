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

USE Employee_Details, Salary;
GO 
BULK INSERT EmployeeDetails
	FROM 'C:\Users\loret\Desktop\DataSciencePrep\ItlizeGlobal\Orientation\HumanResourceManagementSystem-EmployeeDetails');
GO


Emp_Id	Emp_First_Name	Emp_Middle_Name	Emp_Last_Name	Emp_Address1	Emp_Address2	Emp_Country_Id	Emp_State_Id	Emp_City_Id	Emp_Zip	Emp_Mobile	Emp_Gender	Desig_Id	Emp_DOB	Emp_JoinDate	Emp_Active
1	Ronaldo	Rome	Fabrizzio	75 Calle Suerte	NULL	2	7	4	10034	1317778395	1	4	1978-05-12 00:00:00.000	2012-03-22 00:00:00.000	1
2	Joshua	NULL	Kan	533 Kosher Drive	NULL	11	34	54	3115	8553432022	1	2	1986-08-01 00:00:00.000	2010-01-27 00:00:00.000	1
3	Yuriana	NULL	Hagasawa	122 Kobeya Ave	NULL	9	21	27	84430	6644227722	0	1	1988-12-13 00:00:00.000	2013-09-01 00:00:00.000	0
4	Venessa	Cameron	Katarina	1001 Michigan Ave Apt3201	NULL	11	28	38	1101	8572222210	0	6	1987-11-01 00:00:00.000	2009-02-01 00:00:00.000	1
5	Sahi	NULL	King	15 Gibbs Street Apt1	NULL	11	29	39	2215	6173338992	1	5	1977-10-19 00:00:00.000	1999-03-01 00:00:00.000	1
6	Chen	NULL	Chen	55 Beijing Road Apt1501	230 Sanjiangkou Road Apt202	4	9	8	20033	1988883321	0	1	1982-08-20 00:00:00.000	2006-10-01 00:00:00.000	1
10002	Ricky	Russel	Riverland	1019 Commonwealth Ave Apt301	NULL	11	29	39	2215	8572223333	1	3	1993-01-01 00:00:00.000	2014-05-01 00:00:00.000	1


Salary_Id	Emp_Id	Emp_Salary_Change_Year	Emp_Salary
2	1	2000-01-10 00:00:00.000	65000.00
3	1	2005-02-20 00:00:00.000	75000.00
4	1	2010-01-03 00:00:00.000	85000.00
5	2	2005-01-01 00:00:00.000	35000.00
6	2	2006-01-01 00:00:00.000	40000.00
7	2	2011-01-01 00:00:00.000	90000.00
8	3	2005-10-10 00:00:00.000	28000.00
9	3	2008-09-10 00:00:00.000	56000.00
10	4	2000-06-09 00:00:00.000	105000.00
11	4	2002-07-01 00:00:00.000	185000.00
12	5	2001-01-01 00:00:00.000	78500.00
13	5	2002-01-01 00:00:00.000	89200.00
14	5	2003-01-01 00:00:00.000	115500.00
15	5	2005-01-01 00:00:00.000	156000.00
16	6	2006-01-01 00:00:00.000	67000.00
17	6	2009-01-01 00:00:00.000	76000.00
