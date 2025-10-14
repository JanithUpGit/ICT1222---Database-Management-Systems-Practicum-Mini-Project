CREATE DATABASE university;
USE university;

-- USERS TABLE
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Role ENUM('Admin', 'Dean', 'Lecturer', 'TO', 'Student') NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status ENUM('Active','Inactive') DEFAULT 'Active'
);

-- DEPARTMENT TABLE
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptCode VARCHAR(10) UNIQUE NOT NULL,
    DeptName VARCHAR(100) NOT NULL
);

-- STUDENT TABLE
CREATE TABLE Student (  
    RegNo VARCHAR(15) PRIMARY KEY,
    Dob DATE NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Status ENUM('Proper','Repeat') DEFAULT 'Proper',
    Gender CHAR(1),
    Batch VARCHAR(10),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- LECTURER TABLE
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
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- TECHNICAL OFFICER TABLE
CREATE TABLE TechnicalOfficer (
    TOID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DepartmentID INT NOT NULL,
    UserID INT NOT NULL,
    Role ENUM('TO') DEFAULT 'TO',
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- COURSE TABLE
CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    TotalHours INT NOT NULL,
    DepartmentID INT NOT NULL,
    LecturerID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID)
);

-- LECTURE TABLE
CREATE TABLE Lecture (
    LectureID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    LecturerID INT NOT NULL,
    LectureDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    DurationHours DECIMAL(4,2) NOT NULL,
    SessionType ENUM('Theory','Practical') NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (LecturerID) REFERENCES Lecturer(LecturerID)
);

-- ATTENDANCE TABLE
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    SessionDate DATE NOT NULL,
    SessionType ENUM('Theory','Practical') NOT NULL,
    Status ENUM('Present','Absent','Medical') NOT NULL,
    RecordedBy INT NOT NULL,
    FOREIGN KEY (RegNo) REFERENCES Student(RegNo),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- ENROLLMENT TABLE
CREATE TABLE Enrollment (
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    Semester INT NOT NULL,
    Year INT NOT NULL,
    PRIMARY KEY (RegNo, CourseID),
    FOREIGN KEY (RegNo) REFERENCES Student(RegNo),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- EXAM MARKS TABLE
CREATE TABLE ExamMarks (
    MarkID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    ExamType ENUM('Quiz','Assessment','MidTheory','MidPractical','FinalTheory','FinalPractical') NOT NULL,
    MarksObtained DECIMAL(5,2) NOT NULL,
    TotalMarks DECIMAL(5,2) NOT NULL,
    ExamDate DATE,
    RecordedBy INT NOT NULL,
    FOREIGN KEY (RegNo) REFERENCES Student(RegNo),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- GRADES TABLE
CREATE TABLE Grades (
    GradeID INT AUTO_INCREMENT PRIMARY KEY,
    Grade CHAR(2),
    MinMark INT,
    MaxMark INT,
    GPA_Value DECIMAL(2,1)
);

-- RESULTS TABLE
CREATE TABLE Results (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID VARCHAR(15),
    CourseCode VARCHAR(10),
    TotalMark DECIMAL(5,2),
    Grade CHAR(2),
    Eligibility BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (StudentID) REFERENCES Student(RegNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- MYSQL USER ACCOUNTS

CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON university.* TO 'Admin'@'%' WITH GRANT OPTION;

CREATE USER 'Dean'@'%' IDENTIFIED BY 'Dean@123';
GRANT ALL PRIVILEGES ON university.* TO 'Dean'@'%';

CREATE USER 'Lecturer'@'%' IDENTIFIED BY 'Lecturer@123';
GRANT ALL PRIVILEGES ON university.* TO 'Lecturer'@'%';
REVOKE CREATE USER ON *.* FROM 'Lecturer'@'%';

CREATE USER 'TechnicalOfficer'@'%' IDENTIFIED BY 'Tech@123';
GRANT SELECT, INSERT, UPDATE ON university.Attendance TO 'TechnicalOfficer'@'%';

CREATE USER 'Student'@'%' IDENTIFIED BY 'Student@123';

GRANT SELECT ON university.final_attendance_view TO 'Student'@'%';
GRANT SELECT ON university.final_grades_view TO 'Student'@'%';

FLUSH PRIVILEGES;
