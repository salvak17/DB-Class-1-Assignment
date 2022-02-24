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
	quantity INT,
	tavID INT FOREIGN KEY REFERENCES Taverns(tavID)
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