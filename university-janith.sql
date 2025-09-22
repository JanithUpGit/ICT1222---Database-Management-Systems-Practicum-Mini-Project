CREATE DATABASE university;

USE university;

CREATE TABLE Student (  
    RegNo VARCHAR(15) 
    PRIMARY KEY,   
    Name VARCHAR(100),   
    Gender CHAR(1),  
    Batch VARCHAR(10),   
    Status ENUM('Proper','Repeat','Suspended'),  
    Contact VARCHAR(15),   
    Email VARCHAR(100) 
);

CREATE TABLE Lecturer (
    LecturerID INT AUTO_INCREMENT PRIMARY KEY,
    StaffCode VARCHAR(10) UNIQUE NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DepartmentID INT NOT NULL,
    UserID INT NOT NULL, -- FK to Users table
    Role ENUM('Lecturer', 'Dean') DEFAULT 'Lecturer',
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
);