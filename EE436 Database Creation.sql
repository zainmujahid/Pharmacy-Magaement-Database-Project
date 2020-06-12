/*
EE-436 Database Engineering - Pharmacy Management System
Zain Mujahid 		(2016-EE-304)
Samiullah Arshad 	(2016-EE-276)
Fatimah Lyba Khan 	(2016-EE-342)
Annas Bin Malik		(2016-EE-337)
*/

DROP DATABASE IF EXISTS Pharmacy;
CREATE DATABASE IF NOT EXISTS Pharmacy;
USE Pharmacy;

CREATE TABLE `Customer` (
    SSN INT(10) NOT NULL,
    `First Name` CHAR(255) NOT NULL,
    `Last Name` CHAR(255) NOT NULL,
    Phone INT(10) NOT NULL UNIQUE,
    Gender CHAR(1) NOT NULL,
    Address CHAR(255) NOT NULL,
    `Date of Birth` DATE NOT NULL,
    `Insurance ID` INT(10) NULL UNIQUE,
    PRIMARY KEY (SSN)
)  ENGINE=INNODB;

CREATE TABLE `Prescription` (
    `Prescription ID` INT(10) NOT NULL,
    SSN INT(10) NOT NULL,
    `Doctor ID` INT(10) NOT NULL,
    `Prescribed Date` DATE NOT NULL,
    PRIMARY KEY (`Prescription ID`)
)  ENGINE=INNODB;

CREATE TABLE `Prescribed Drugs` (
    `Prescription ID` INT(10) NOT NULL,
    `Drug Name` CHAR(255) NOT NULL,
    `Prescribed Quantity` INT(10) NOT NULL,
    `Refill Limit` INT(10) NOT NULL,
    PRIMARY KEY (`Prescription ID` , `Drug Name`)
)  ENGINE=INNODB;

CREATE TABLE `Order` (
    `Order ID` INT(10) NOT NULL,
    `Prescription ID` INT(10) NOT NULL,
    EmployeeID INT(5) NOT NULL,
    `Order Date` DATE NOT NULL,
    PRIMARY KEY (`Order ID`)
)  ENGINE=INNODB;

CREATE TABLE `Ordered Drugs` (
    `Order ID` INT(10) NOT NULL,
    `Drug Name` CHAR(255) NOT NULL,
    `Batch Number` INT(10) NOT NULL,
    `Ordered Quantity` INT(10) NOT NULL,
    Price INT(2) NOT NULL,
    PRIMARY KEY (`Order ID` , `Drug Name` , `Batch Number`)
)  ENGINE=INNODB;

CREATE TABLE `Insurance` (
    `Insurance ID` INT(10) NOT NULL,
    `Company Name` CHAR(255) NOT NULL,
    `Start Date` DATE NOT NULL,
    `End Date` DATE NOT NULL,
    `Co Insurance` INT(4) NOT NULL,
    PRIMARY KEY (`Insurance ID`)
)  ENGINE=INNODB;

CREATE INDEX `Insurance Company Name` 
    ON `Insurance` (`Company Name`);
    
CREATE TABLE `Employee` (
    ID INT(5) NOT NULL,
    SSN INT(10) NOT NULL UNIQUE,
    License INT(10) UNIQUE,
    `First Name` CHAR(255) NOT NULL,
    `Last Name` CHAR(255) NOT NULL,
    `Start Date` DATE NOT NULL,
    `End Date` DATE,
    Role CHAR(255) NOT NULL,
    Salary INT(4) NOT NULL,
    `Phone Number` INT(10) NOT NULL,
    `Date of Birth` DATE NOT NULL,
    PRIMARY KEY (ID)
)  ENGINE=INNODB;

CREATE TABLE `Medicine` (
    `Drug Name` CHAR(255) NOT NULL,
    `Batch Number` INT(10) NOT NULL,
    MedicineType CHAR(255) NOT NULL,
    Manufacturer CHAR(255) NOT NULL,
    `Stock Quantity` INT(10) NOT NULL,
    `Expiry Date` DATE NOT NULL,
    Price INT(4) NOT NULL,
    PRIMARY KEY (`Drug Name` , `Batch Number`)
)  ENGINE=INNODB;

CREATE TABLE `Bill` (
    `Order ID` INT(10) NOT NULL,
    CustomerSSN INT(10) NOT NULL,
    `Total Amount` INT(4) NOT NULL,
    `Customer Payment` INT(4) NOT NULL,
    `Insurance Payment` INT(4) NOT NULL,
    PRIMARY KEY (`Order ID` , CustomerSSN)
)  ENGINE=INNODB;

CREATE TABLE `Disposed Drugs` (
    `Drug Name` CHAR(255) NOT NULL,
    `Batch Number` INT(10) NOT NULL,
    Quantity INT(10) NOT NULL,
    Company CHAR(255) NOT NULL,
    PRIMARY KEY (`Drug Name` , `Batch Number`)
)  ENGINE=INNODB;