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