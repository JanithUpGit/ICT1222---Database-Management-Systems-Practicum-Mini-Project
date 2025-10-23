CREATE DATABASE university;

USE university

CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptCode VARCHAR(10) UNIQUE NOT NULL,
    DeptName VARCHAR(100) NOT NULL
);

CREATE TABLE Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,  
    Dob DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(100),
    DepartmentID INT NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL, 
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('M','F','Other') DEFAULT 'Other',
    Status ENUM('Active','Inactive') DEFAULT 'Active',
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Student (  
    UserID INT,
    StudentRegNo VARCHAR(15),
    Batch VARCHAR(10),
    Status ENUM('proper','repeat','suspended') DEFAULT 'proper',
    FOREIGN KEY (UserID) REFERENCES Users(Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lecturer (
    UserID INT,
    StaffCode VARCHAR(10) UNIQUE NOT NULL,
    Role ENUM('Lecturer', 'Dean') DEFAULT 'Lecturer',
    FOREIGN KEY (UserID) REFERENCES Users(Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TechnicalOfficer (
    UserID INT,
    TOID INT AUTO_INCREMENT PRIMARY KEY,
    Role ENUM('TO') DEFAULT 'TO',
    FOREIGN KEY (UserID) REFERENCES Users(Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    TotalHours INT NOT NULL,
    DepartmentID INT NOT NULL,
    LecturerID INT NOT NULL
);


CREATE TABLE Lecture (
    LectureID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    LecturerID INT NOT NULL,
    LectureDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    DurationHours DECIMAL(4,2) NOT NULL,
    SessionType ENUM('Theory','Practical') NOT NULL,
);

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    SessionDate DATE NOT NULL,
    SessionType ENUM('Theory','Practical') NOT NULL,
    Status ENUM('Present','Absent','Medical') NOT NULL,
    RecordedBy INT NOT NULL,
);

INSERT INTO Users 
(FirstName, LastName, Dob, Email, Phone, Address, DepartmentID, PasswordHash, Status)
VALUES
('John', 'Doe', '1995-04-15', 'john.doe@example.com', '0712345678', '123 Main Street, City', 1, SHA2('Password123', 256), 'Active'),
('Jane', 'Smith', '1998-09-21', 'jane.smith@example.com', '0723456789', '45 Park Avenue, City', 2, SHA2('JanePass456', 256), 'Active'),
('Michael', 'Perera', '1990-12-01', 'michael.perera@example.com', '0774567890', '78 Lake Road, Colombo', 1, SHA2('Mikey789', 256), 'Inactive');


