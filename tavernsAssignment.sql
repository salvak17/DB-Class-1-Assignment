-- Creates database for assignment and uses database for assignment --
CREATE DATABASE class1TavernAssignment;
USE class1TavernAssignment;


-- Creates all tables for tavern assignment --
DROP TABLE IF EXISTS [Users];
CREATE TABLE[Users](
	userID INT IDENTITY(100,1) PRIMARY KEY,
	userName VARCHAR(150),
	birthday DATE
);



DROP TABLE IF EXISTS [Locations];
CREATE TABLE [Locations](
	locationID INT IDENTITY(300,1) PRIMARY KEY,
	locationName VARCHAR(150)
);



DROP TABLE IF EXISTS [Taverns];
CREATE TABLE[Taverns](
	tavID INT IDENTITY(1,1) PRIMARY KEY,
	tavName VARCHAR(150),
	floorCount INT,
	ownerID INT FOREIGN KEY REFERENCES Users(userID),
	locationID INT FOREIGN KEY REFERENCES Locations(locationID)
);



DROP TABLE IF EXISTS [Roles];
CREATE TABLE[Roles](
	roleID INT IDENTITY(200,1) PRIMARY KEY,
	roleName VARCHAR(50)
);



DROP TABLE IF EXISTS [UserRoles];
CREATE TABLE[UserRoles](
	userID INT FOREIGN KEY REFERENCES Users(userID),
	roleID INT FOREIGN KEY REFERENCES Roles(roleID)
);



DROP TABLE IF EXISTS [BasementRats];
CREATE TABLE [BasementRats](
	ratID INT IDENTITY(400,1) PRIMARY KEY,
	ratName VARCHAR(75),
	tavID INT FOREIGN KEY REFERENCES Taverns(tavID)
);



DROP TABLE IF EXISTS [Supplies];CREATE TABLE [Supplies](
	supplyID INT IDENTITY(500,1) PRIMARY KEY,
	supplyName VARCHAR(100),
	unit VARCHAR(25),
	cost INT
);



DROP TABLE IF EXISTS [TavernInventory];
CREATE TABLE [TavernInventory](
	tavID INT FOREIGN KEY REFERENCES Taverns(tavID),
	supplyID INT FOREIGN KEY REFERENCES Supplies(supplyID),
	cost INT,
	quantity INT,
	dateRecieved DATE
);



DROP TABLE IF EXISTS [ServicesOffered];
CREATE TABLE [ServicesOffered](
	serviceID INT IDENTITY(600,1) PRIMARY KEY,
	serviceName VARCHAR(75)
);



DROP TABLE IF EXISTS [ServiceStatus];
CREATE TABLE [ServiceStatus](
	statusID INT IDENTITY(700,1) PRIMARY KEY,
	statusName VARCHAR(25)
);



DROP TABLE IF EXISTS [TavernServices];
CREATE TABLE [TavernServices](
	tavID INT FOREIGN KEY REFERENCES Taverns(tavID),
	serviceID INT FOREIGN KEY REFERENCES ServicesOffered(serviceID),
	statusID INT FOREIGN KEY REFERENCES ServiceStatus(statusID)
);



-- Seeds table w/info --
-- Seeds about 5-10 rows w/repeat data --
INSERT INTO Users (userName, birthday)
VALUES
	('Maria Calavera', 1820-10-31),
	('Yang Xiao Long', 1882-05-25),
	('Salem', 1873-08-06),
	('Neon Katt', 1881-12-13),
	('Sun Wukong', 1881-02-23)
;



INSERT INTO Locations (locationName)
VALUES
	('Vale'),
	('Mistral'),
	('Vacuo'),
	('Atlas'),
	('Dark Domain')
;



INSERT INTO Taverns (tavName, floorCount, ownerID, locationID)
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



INSERT INTO BasementRats(ratName, tavID)
VALUES
	('Jaq', 1),
	('Gus', 1),
	('Suzy', 4),
	('Perla', 2),
	('Bert', 3)
;




INSERT INTO Supplies(supplyName, unit, cost)
VALUES
	('toilet paper', 'by case of 6', 3),
	('chicken whole', 'ounces', 5),
	('russet potatoes whole', 'pounds', 1),
	('carrots whole', 'pounds', 1),
	('borboun', 'ounces', 2)
;



INSERT INTO TavernInventory(tavID, supplyID, cost, quantity, dateRecieved)
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



INSERT INTO TavernServices(tavID, serviceID, statusID)
VALUES
	(1, 603, 701),
	(1, 604, 700),
	(5, 604, 700),
	(4, 603, 700),
	(4, 604, 701),
	(3, 601, 701),
	(3, 602, 701)
;