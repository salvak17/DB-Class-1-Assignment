-- CLASS 1 ASSIGNMENT--
	-- Creates database for assignment and uses database for assignment --
CREATE DATABASE class1TavernAssignment;
USE class1TavernAssignment;


	-- Creates all tables for tavern assignment --
DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
	userID INT IDENTITY(100,1) PRIMARY KEY,
	userName VARCHAR(150),
	birthday DATE
);



DROP TABLE IF EXISTS Locations;
CREATE TABLE Locations(
	locationID INT IDENTITY(300,1) PRIMARY KEY,
	locationName VARCHAR(150)
);



DROP TABLE IF EXISTS Taverns;
CREATE TABLE Taverns(
	tavernID INT IDENTITY(1,1) PRIMARY KEY,
	tavernName VARCHAR(150),
	floorCount INT,
	ownerID INT FOREIGN KEY REFERENCES Users(userID),
	locationID INT FOREIGN KEY REFERENCES Locations(locationID)
);



DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles(
	roleID INT IDENTITY(200,1) PRIMARY KEY,
	roleName VARCHAR(50)
);



DROP TABLE IF EXISTS UserRoles;
CREATE TABLE UserRoles(
	userID INT FOREIGN KEY REFERENCES Users(userID),
	roleID INT FOREIGN KEY REFERENCES Roles(roleID)
);



DROP TABLE IF EXISTS BasementRats;
CREATE TABLE BasementRats(
	ratID INT IDENTITY(400,1) PRIMARY KEY,
	ratName VARCHAR(75),
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID)
);



DROP TABLE IF EXISTS SupplyUnits;
CREATE TABLE SupplyUnits(
	supplyUnitID INT IDENTITY(500,1) PRIMARY KEY,
	unitName VARCHAR(50),
);



DROP TABLE IF EXISTS Supplies;
CREATE TABLE Supplies(
	supplyID INT IDENTITY(500,1) PRIMARY KEY,
	supplyName VARCHAR(100),
	unit VARCHAR(25),
);



DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory(
	supplyID INT FOREIGN KEY REFERENCES Supplies(supplyID),
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID),
	datePurchased DATE,
	quantity INT
);



DROP TABLE IF EXISTS TavernInventory;
DROP TABLE IF EXISTS InventoryReceived;
CREATE TABLE InventoryReceived(
	inventoryReceivedID INT IDENTITY(1100,1) PRIMARY KEY,
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID),
	supplyID INT FOREIGN KEY REFERENCES Supplies(supplyID),
	cost INT,
	quantity INT,
	dateRecieved DATE
);



DROP TABLE IF EXISTS ServiceStatus;
CREATE TABLE ServiceStatus(
	statusID INT IDENTITY(700,1) PRIMARY KEY,
	statusName VARCHAR(25)
);



DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServicesOffered;
CREATE TABLE ServicesOffered(
	serviceID INT IDENTITY(600,1) PRIMARY KEY,
	serviceName VARCHAR(75),
	price INT
	statusID INT FOREIGN KEY REFERENCES ServiceStatus(statusID)
);



DROP TABLE IF EXISTS TavernServices;
DROP TABLE IF EXISTS ServiceSales;
CREATE TABLE ServiceSales(
	servicesSalesID INT IDENTITY(1200,1) PRIMARY KEY,
	serviceID INT FOREIGN KEY REFERENCES ServicesOffered(serviceID),
	datePurchased DATE,
	quantity INT,
	userID INT FOREIGN KEY REFERENCES Users(userID),
	price INT,
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID)
);



	-- Seeds tables w/info --
	-- Seeds about 5-10 rows w/repeat data --
INSERT INTO Users (userName, birthday)
VALUES
	('Maria Calavera', '1820-10-31'),
	('Yang Xiao Long', '1882-05-25'),
	('Salem', '1873-08-06'),
	('Neon Katt', '1881-12-13'),
	('Sun Wukong', '1881-02-23')
;



INSERT INTO Locations (locationName)
VALUES
	('Vale'),
	('Mistral'),
	('Vacuo'),
	('Atlas'),
	('Dark Domain')
;



INSERT INTO Taverns (tavernName, floorCount, ownerID, locationID)
VALUES 
	('Beacon Pub', 65, 101, 300),
	('Haven Valley', 75, 100, 301),
	('Signal Pub', 49, 104, 302),
	('Atlas Inn', 100, 103, 303),
	('Dark Domain Inn', 80, 102, 304)
;



INSERT INTO Roles (roleName)
VALUES
	('Chef'),
	('Bartender'),
	('Janitor'),
	('Laundry'),
	('Accountant')
;



INSERT INTO UserRoles (userID, roleID)
VALUES
	(102, 204),
	(104, 201),
	(101, 201),
	(103, 200),
	(100, 204)
;



INSERT INTO BasementRats(ratName, tavernID)
VALUES
	('Jaq', 1),
	('Gus', 1),
	('Suzy', 4),
	('Perla', 2),
	('Bert', 3)
;




INSERT INTO Supplies(supplyName, unit)
VALUES
	('toilet paper', 'by case of 6'),
	('chicken whole', 'ounces'),
	('russet potatoes whole', 'pounds',
	('carrots whole', 'pounds'),
	('borboun', 'ounces')
;



INSERT INTO TavernInventory(tavernID, supplyID, cost, quantity, dateRecieved)
VALUES
	(1, 501, 225, 75, 1900-10-21),
	(1, 502, 50, 50, 1900-10-25),
	(1, 503, 50, 50, 1900-10-25),
	(3, 500, 10, 30, 1900-10-06),
	(4, 504, 400, 200, 1900-10-21)
;



INSERT INTO ServicesOffered(serviceName)
VALUES
	('laundry'),
	('mopping'),
	('sweeping'),
	('cooking'),
	('bartending'),
	('accounting')
;



INSERT INTO ServiceStatus(statusName)
VALUES
	('active'),
	('inactive')
;



INSERT INTO TavernServices(tavernID, serviceID, statusID)
VALUES
	(1, 603, 701),
	(1, 604, 700),
	(5, 604, 700),
	(4, 603, 700),
	(4, 604, 701),
	(3, 601, 701),
	(3, 602, 701)
;



-- CLASS 2 ASSIGNMENT --
	-- Complete the User story --
	-- Track guests, guests should have classes and levels, and stop tracking rats
DROP TABLE IF EXISTS BasementRats; -- stops tracking rats --



DROP TABLE IF EXISTS GuestStats;
CREATE TABLE GuestStats(
	guestStatID INT IDENTITY(900, 1) PRIMARY KEY,
	statName VARCHAR(50)
);



DROP TABLE IF EXISTS GuestClasses;
CREATE TABLE GuestClasses(
	guestClassID INT IDENTITY(1000,1) PRIMARY KEY,
	guestClassName VARCHAR(50),
);



DROP TABLE IF EXISTS Guests;
CREATE TABLE Guests(
	guestID INT IDENTITY (800,1) PRIMARY KEY,
	guestName VARCHAR(150),
	guestNotes VARCHAR(MAX),
	guestBirthday DATE,
	guestCakeDay DATE,
	guestStatID INT FOREIGN KEY REFERENCES GuestStats(guestStatID)
);



DROP TABLE IF EXISTS GuestLevels;
CREATE TABLE GuestLevels(
	guestLevelID INT IDENTITY(1300,1) PRIMARY KEY,
	guestID INT FOREIGN KEY REFERENCES Guests(guestID),
	guestClassID INT FOREIGN KEY REFERENCES GuestClasses(guestClassID),
	guestLevel INT
);



	-- Link Supplies table and have them be used in sales --
DROP TABLE IF EXISTS SupplySales;
CREATE TABLE SupplySales(
	supplySalesID INT IDENTITY(1400,1) PRIMARY KEY,
	supplyID INT FOREIGN KEY REFERENCES Supplies(supplyID),
	guestID INT FOREIGN KEY REFERENCES Guests(guestID),
	quantity INT,
	cost INT,
	dateBought DATE
);



	-- Use Alter Table command to modify Taverns and Users Table and add Foreign and Primary keys --
		-- will be commented so script runs as designed, but can turn in for assignment --
	--DROP TABLE IF EXISTS Users;
	--CREATE TABLE Users(
	--	userID INT IDENTITY(100,1),
	--	userName VARCHAR(150),
	--	birthday DATE
	--);


	--DROP TABLE IF EXISTS Taverns;
	--CREATE TABLE Taverns(
	--	tavernID INT IDENTITY(1,1),
	--	tavernName VARCHAR(150),
	--	floorCount INT,
	--	ownerID INT, -- FOREIGN KEY REFERENCES Users(userID), --
	--	locationID INT -- FOREIGN KEY REFERENCES Locations(locationID) --
	--);


	--ALTER TABLE Users
	--ADD PRIMARY KEY (userID);


	--ALTER TABLE Taverns
	--ADD PRIMARY KEY (tavernID);


	--ALTER TABLE Taverns
	--ADD FOREIGN KEY (ownerID) REFERENCES Users(userID);


	--ALTER TABLE Taverns
	--ADD FOREIGN KEY (locationID) REFERENCES Locations(locationID);



	-- Show that there are constraints by making insertions or queries that will fail due to foreign key constraints --
		-- will be commented so script can still run --
	--INSERT INTO GuestLevels (guestID)
	--VALUES
	--	('1300'),
	--	(one thousand three hundred)
	--;
	-- first value inserted will fail because guestID is a foreign key to an integer and has been entered as string --
	-- second value inserted will fail because guestID is a foreign key to an integer and "one thousand three hundred" is not an integer --



-- CLASS 3 ASSIGNMENT --
	-- Track Rooms; which should have a status and associated tavern. --
	-- Way to track Room Stays, which will contain a sale, guest, room, the date it was stayed in, and the rate --
DROP TABLE IF EXISTS RoomStatus;
CREATE TABLE RoomStatus(
	roomStatusID INT IDENTITY(1,1) PRIMARY KEY,
	roomStatusName VARCHAR (25)
);



DROP TABLE IF EXISTS Rooms;
CREATE TABLE Rooms(
	roomID INT IDENTITY(1,1) PRIMARY KEY,
	roomName VARCHAR(25),
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID),
	roomStatusID INT FOREIGN KEY REFERENCES RoomStatus(roomStatusID)
);



DROP TABLE IF EXISTS RoomSales;
CREATE TABLE RoomSales(
	roomSaleID INT IDENTITY(1,1) PRIMARY KEY,
	serviceID INT FOREIGN KEY REFERENCES ServicesOffered(serviceID),
	guestID INT FOREIGN KEY REFERENCES Guests(guestID),
	price DECIMAL(18,2),
	roomSaleDate DATE,
	amount INT,
	tavernID INT FOREIGN KEY REFERENCES Taverns(tavernID)
);



DROP TABLE IF EXISTS RoomStays;
CREATE TABLE RoomStays(
	roomStayID INT IDENTITY(1,1) PRIMARY KEY,
	roomRate DECIMAL(18,2),
	roomSaleID INT FOREIGN KEY REFERENCES RoomSales(roomSaleID),
	guestID INT FOREIGN KEY REFERENCES Guests(guestID),
	roomID INT FOREIGN KEY REFERENCES Rooms(roomID),
	stayDate DATE
); 



	-- Write a query that returns guests w/a birthday before 2000 --
SELECT guestID
FROM Guests
WHERE guestBirthday < 2000;
	-- Write a query to return rooms that cost more than 100 gold a night --
SELECT roomID
FROM Rooms
WHERE roomRate > 100;
	-- Write a query that returns UNIQUE guest names --
SELECT DISTINCT guestName
FROM Guests;
	-- Write a query that retuns all guests ordered by name (ascending), use ASC or DESC after your ORDER BY [col] --
SELECT * FROM Guests
ORDER BY guestName ASC;
	-- Write a query that returns the top 10 highest price sales --
SELECT TOP 10 * FROM
	(
		SELECT * FROM RoomSales
		ORDER BY price DESC
	);
	-- Write a query to return all the values stored in all Lookup Tables --
	-- NOT VERY CONFIDENT I GOT THIS ONE --
 SELECT * FROM Roles
 UNION ALL
 SELECT * FROM Locations
 UNION ALL
 SELECT * FROM ServicesOffered
 UNION ALL
 SELECT * FROM ServiceStatus
 UNION ALL
 SELECT * FROM SupplyUnits
 UNION ALL
 SELECT * FROM GuestClasses
 UNION ALL
 SELECT * FROM GuestStats
 UNION ALL
 SELECT * FROM RoomStatus;
	-- Write a query that returns Guest Classes w/Levels and Generate a new column w/a label for their level grouping--
SELECT * FROM GuestClasses a
INNER JOIN GuestLevels b ON a.guestClassID = b.guestLevelID; 
-- Not sure how to generate new column in select query, how would I go about this? --
-- I was thinking when I figured out how to add a column I would use the WHEN statement and write:
--WHEN GuestLevels.guestLevel BETWEEN 1 AND 10 THEN levelGrouping = 'level 1-10' (and so forth?) --