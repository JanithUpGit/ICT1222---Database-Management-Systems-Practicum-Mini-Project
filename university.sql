CREATE DATABASE university;

USE university


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

-- GRANT SELECT ON university.final_attendance_view TO 'Student'@'%';
-- GRANT SELECT ON university.final_grades_view TO 'Student'@'%';

FLUSH PRIVILEGES;



CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptCode VARCHAR(10) UNIQUE NOT NULL,
    DeptName VARCHAR(100) NOT NULL
)

CREATE TABLE Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
     Role ENUM('Admin', 'Dean', 'Lecturer', 'TO', 'Student') NOT NULL,
    Dob DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Address VARCHAR(100),
    DepartmentID INT NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status ENUM('Active', 'Inactive') DEFAULT 'Active',
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Student (
    UserID INT,
    StudentRegNo VARCHAR(15) UNIQUE,
    Batch VARCHAR(10),
    FOREIGN KEY (UserID) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Lecturer (
    UserID INT NOT NULL,
    StaffCode VARCHAR(10) UNIQUE NOT NULL,
    Role ENUM('Lecturer', 'Dean') DEFAULT 'Lecturer',
    FOREIGN KEY (UserID) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE TechnicalOfficer (
    UserID INT,
    TOID INT AUTO_INCREMENT PRIMARY KEY,
    Role ENUM('TO') DEFAULT 'TO',
    FOREIGN KEY (UserID) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    TotalHours INT NOT NULL,
    SessionType ENUM('Theory', 'Practical', 'Both') NOT NULL DEFAULT 'Theory',
    DepartmentID INT NOT NULL,
    LecturerInChargeID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LecturerInChargeID) REFERENCES Lecturer (UserID) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Lecture (
    LectureID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    LecturerID INT NOT NULL,
    LectureDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    DurationHours DECIMAL(4, 2) NOT NULL,
    SessionType ENUM('Theory', 'Practical') NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LecturerID) REFERENCES Lecturer (UserID) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    LectureID INT NOT NULL,
    SessionDate DATE NOT NULL,
    Status ENUM(
        'Present',
        'Absent',
        'Medical'
    ) NOT NULL,
    RecordedBy INT NOT NULL,
    FOREIGN KEY (RegNo) REFERENCES Student (StudentRegNo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LectureID) REFERENCES Lecture (LectureID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RecordedBy) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Marks (
    MarkID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    ExamType ENUM(
        'Quiz',
        'Assessment',
        'Mid Theory',
        'Mid Practical',
        'Final Theory',
        'Final Practical'
    ) NOT NULL,
    MarksObtained DECIMAL(5, 2) NOT NULL CHECK (
        MarksObtained >= 0
        AND MarksObtained <= 100
    ),
    RecordedBy INT NOT NULL,
    RecordedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Remarks VARCHAR(100) DEFAULT NULL,
    FOREIGN KEY (RegNo) REFERENCES Student (StudentRegNo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RecordedBy) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Result (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    TotalMarks DECIMAL(5, 2) NOT NULL CHECK (
        TotalMarks >= 0
        AND TotalMarks <= 100
    ),
    Grade CHAR(2) NOT NULL,
    GradePoint DECIMAL(3, 2) NOT NULL,
    Eligibility ENUM(
        'Eligible',
        'Not Eligible',
        'Medical',
        'Withheld'
    ) DEFAULT 'Eligible',
    Status ENUM(
        'Proper',
        'Repeat',
        'Suspended'
    ) DEFAULT 'Proper',
    Semester VARCHAR(10) NOT NULL,
    RecordedBy INT NOT NULL,
    RecordedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RegNo) REFERENCES Student (StudentRegNo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (RecordedBy) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE Eligibility (
    EligibilityID INT AUTO_INCREMENT PRIMARY KEY,
    RegNo VARCHAR(15) NOT NULL,
    CourseID INT NOT NULL,
    AttendancePercentage DECIMAL(5, 2) NOT NULL CHECK (
        AttendancePercentage >= 0
        AND AttendancePercentage <= 100
    ),
    CAMarks DECIMAL(5, 2) NOT NULL CHECK (
        CAMarks >= 0
        AND CAMarks <= 100
    ),
    FinalEligibility ENUM(
        'Eligible',
        'Not Eligible',
        'Medical',
        'Withheld'
    ) DEFAULT 'Eligible',
    EvaluatedBy INT NOT NULL,
    EvaluatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Remarks VARCHAR(100) DEFAULT NULL,
    FOREIGN KEY (RegNo) REFERENCES Student (StudentRegNo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EvaluatedBy) REFERENCES Users (Id) ON DELETE CASCADE ON UPDATE CASCADE
)




INSERT INTO Course 
(CourseCode, CourseName, Credits, TotalHours, SessionType, DepartmentID, LecturerInChargeID)
VALUES
('ENG1222', 'English II', 2, 30, 'Theory', 4, 66),
('ICT1212', 'Database Management Systems', 3, 45, 'Both', 1, 67),
('ICT1222', 'Database Management Systems Practicum', 2, 60, 'Practical', 1, 68),
('ICT1233', 'Server Side Web Development', 3, 45, 'Both', 1, 69),
('ICT1242', 'Computer Architecture', 3, 45, 'Both', 1, 70),
('ICT1253', 'Computer Networks', 3, 45, 'Both', 1, 67),
('TCS1212', 'Fundamentals of Management', 2, 30, 'Theory', 4, 69),
('TMS1233', 'Discrete Mathematics', 3, 45, 'Theory', 4, 70);

-- Server Side Web Development (CourseID = 4)
INSERT INTO Lecture (CourseID, LecturerID, LectureDate, StartTime, DurationHours, SessionType) VALUES
(4, 69, '2025-08-04', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-08-04', '13:00:00', 2.00, 'Theory'),
(4, 69, '2025-08-11', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-08-11', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-08-18', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-08-18', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-08-25', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-08-25', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-09-01', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-09-01', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-09-08', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-09-08', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-09-15', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-09-15', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-09-22', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-09-22', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-10-13', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-10-13', '14:00:00', 2.00, 'Theory');

-- English II (CourseID = 1)
INSERT INTO Lecture (CourseID, LecturerID, LectureDate, StartTime, DurationHours, SessionType) VALUES
(1, 66, '2025-08-15', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-08-22', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-08-29', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-12', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-19', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-26', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-10-10', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-10-17', '09:00:00', 2.00, 'Theory');

-- Database Management Systems (CourseID = 2)
INSERT INTO Lecture (CourseID, LecturerID, LectureDate, StartTime, DurationHours, SessionType) VALUES
(2, 67, '2025-08-07', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-08-14', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-08-21', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-08-28', '08:00:00', 2.00, 'Theory'),
(2, 67, '2025-09-04', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-09-11', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-09-18', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-09-25', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-10-09', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-10-16', '09:00:00', 2.00, 'Theory');

-- DBMS Practicum (CourseID = 3)
INSERT INTO Lecture (CourseID, LecturerID, LectureDate, StartTime, DurationHours, SessionType) VALUES
(3, 68, '2025-08-07', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-07', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-14', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-14', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-21', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-21', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-28', '10:00:00', 2.00, 'Practical'),
(3, 68, '2025-08-28', '13:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-04', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-04', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-11', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-11', '13:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-18', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-18', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-25', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-09-25', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-09', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-09', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-16', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-16', '14:00:00', 2.00, 'Practical');






