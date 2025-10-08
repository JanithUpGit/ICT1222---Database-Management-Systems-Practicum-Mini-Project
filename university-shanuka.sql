CREATE DATABASE university;

USE university;

CREATE TABLE Student (  
    RegNo VARCHAR(15) 
    PRIMARY KEY,   
    Dob DATE NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,  
    Gender CHAR(1),  
    Batch VARCHAR(10),    
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
    UserID INT NOT NULL,
    Role ENUM('Lecturer', 'Dean') DEFAULT 'Lecturer',
);

CREATE TABLE TechnicalOfficer (
    TOID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DepartmentID INT NOT NULL,
    UserID INT NOT NULL,
    Role ENUM('TO') DEFAULT 'TO',
);


CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL, 
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Active','Inactive') DEFAULT 'Active'
);

CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptCode VARCHAR(10) UNIQUE NOT NULL,
    DeptName VARCHAR(100) NOT NULL,
);

CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    TotalHours INT NOT NULL,
    DepartmentID INT NOT NULL,
    LecturerID INT NOT NULL,
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


/* Create user accounts*/


/*Admin*/

CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON university_db.* TO 'Admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

/*Dean*/

CREATE USER 'Dean'@'%' IDENTIFIED BY 'Dean@123';
GRANT ALL PRIVILEGES ON university_db.* TO 'Dean'@'%';
FLUSH PRIVILEGES;

/*Lecture*/

CREATE USER 'Lecturer'@'%' IDENTIFIED BY 'Lecturer@123';
GRANT ALL PRIVILEGES ON university_db.* TO 'Lecturer'@'%';

REVOKE CREATE USER ON *.* FROM 'Lecturer'@'%';
FLUSH PRIVILEGES;


/*technical officer*/

CREATE USER 'TechnicalOfficer'@'%' IDENTIFIED BY 'Tech@123';
GRANT SELECT, INSERT, UPDATE ON university_db.attendance TO 'TechnicalOfficer'@'%';
GRANT SELECT, INSERT, UPDATE ON university_db.attendance_view TO 'TechnicalOfficer'@'%';
FLUSH PRIVILEGES;


/*Student*/

CREATE USER 'Student'@'%' IDENTIFIED BY 'Student@123';
GRANT SELECT ON university_db.final_attendance_view TO 'Student'@'%';
GRANT SELECT ON university_db.final_grades_view TO 'Student'@'%';
FLUSH PRIVILEGES;
