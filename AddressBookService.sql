--what is sql - sql is structure query language
--SQL is standared language forstoring and retriveing data from database.
--Database - Organized data in structural part.

--Creating Database UC1
CREATE DATABASE AddressBook_Service
USE AddressBook_Service

--Creating Table UC2
--Primary key is uniquely identify each record table. It can't contain null value.In a table we have only one key.
CREATE TABLE AddressBook_DB(
PersonID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Address VARCHAR(150) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL,
Zip INT NOT NULL,
PhoneNumber BIGINT NOT NULL,
Email VARCHAR(50) NOT NULL
);

--Select Query
SELECT * FROM AddressBook_DB

--Abiltity to insert new data UC3
INSERT INTO AddressBook_DB(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) VALUES('Shivani','Divekar','Dange Chauk','Pune','Maharastra',1234,8983922703,'Shivani@gmail.com'),
('Malhar','Divekar','Pune','Pune','Maharastra',4008,8983922753,'Malhar@gmail.com'),
('Shiva','Divekar','Dange Chauk','Pune','Maharastra',1124,8983922703,'Shiva@gmail.com');

--Ability to Update contact using person name UC4
UPDATE AddressBook_DB SET LastName='Mane' WHERE FirstName='Shiva';
UPDATE AddressBook_DB SET PhoneNumber=8983922706 WHERE FirstName='Malhar';
UPDATE AddressBook_DB SET Address='Karve Nagar' WHERE FirstName='Shivani';

--Ability to delete contact using person name UC5
DELETE FROM AddressBook_DB WHERE FirstName='Shiva';

--Ability to retrieve data using city or state UC6
SELECT * FROM AddressBook_DB WHERE City='Pune'OR State='Maharastra';

--Ability to count addressBook by city and state UC7
SELECT COUNT(FirstName) FROM AddressBook_DB WHERE City='Pune' AND State='Maharastra';

--Ability sort alphabatically person's name for given City UC8
SELECT * FROM AddressBook_DB AS CityCount ORDER BY City ASC;

--Ability to alter table to addressbook name and type UC9
ALTER TABLE AddressBook_DB ADD Name VARCHAR(30);
ALTER TABLE AddressBook_DB ADD Family VARCHAR(30);
ALTER TABLE AddressBook_DB ADD Friends VARCHAR(30);
ALTER TABLE AddressBook_DB ADD Profession VARCHAR(30);

--Ability to get count of Person's contcat by city UC10
SELECT COUNT(FirstName) FROM AddressBook_DB AS CountByCity WHERE City='Pune';

--Ability to upadate friends and family UC11
INSERT INTO AddressBook_DB(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,AddressBookType,AddressBookName) VALUES('Shraddha','Divekar','Budhagav','Sangli','Maharastra',4003,4563218790,'shraddha@gmail.com','Family','Shri'),('Monika','Shetty','Karad','Satara','Maharastra',4008,8983922605,'Monika@gamil.com','Friends,Family','Moni'),('Siddhi','Reelkar','Chipalun','Ratnagiri','Maharastra',4023,7875842360,'Siddhi@gmail.com','Family','Sid');

--Draw ER daigram for AddressBook UC12
CREATE TABLE AddressBook_Table(
PersonID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Address VARCHAR(150) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL,
Zip INT NOT NULL,
PhoneNumber BIGINT NOT NULL,
Email VARCHAR(50) NOT NULL
);
SELECT * FROM AddressBook_DB_TABLE;

--FOREIGN KEY - It will establish two connections between two table, it will point primary key in another table.
CREATE TABLE Address_Book_Join(
AddressBookID INT PRIMARY KEY IDENTITY(1,1),
PersonID INT,
FOREIGN KEY (PersonID) REFERENCES AddressBook_DB(PersonID)
);
SELECT * FROM Address_Book_Join;

INSERT INTO Address_Book_Join (PersonID) VALUES(1),(3),(2),(5),(6);
--Inner join
--Select TableName1.Column1,...From TableName1 Inner Join TableName2 on 
--TableName1.macthingColumn = TableName2.MatchingColumn

SELECT AddressBook_DB.PersonID, AddressBook_DB.FirstName FROM AddressBook_DB INNER JOIN Address_Book_Join ON AddressBook_DB.PersonID=Address_Book_Join.AddressBookID;

--Left join
--Select TableName1.Column1,...From TableName1 Left Join TableName2 on 
--TableName1.macthingColumn = TableName2.MatchingColumn
SELECT AddressBook_DB.PersonID, AddressBook_DB.AddressBookName FROM AddressBook_DB LEFT JOIN Address_Book_Join ON AddressBook_DB.PersonID=Address_Book_Join.AddressBookID;

--Right join
--Select TableName1.Column1,...From TableName1 Right Join TableName2 on 
--TableName1.macthingColumn = TableName2.MatchingColumn
SELECT AddressBook_DB.PersonID, AddressBook_DB.AddressBookName FROM AddressBook_DB RIGHT JOIN Address_Book_Join ON AddressBook_DB.PersonID=Address_Book_Join.AddressBookID;

--Full join
--Select TableName1.Column1,...From TableName1 Full Join TableName2 on 
--TableName1.macthingColumn = TableName2.MatchingColumn
SELECT AddressBook_DB.PersonID, AddressBook_DB.AddressBookName FROM AddressBook_DB FULL JOIN Address_Book_Join ON AddressBook_DB.PersonID=Address_Book_Join.AddressBookID;

