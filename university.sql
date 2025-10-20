CREATE DATABASE university;

USE university

CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptCode VARCHAR(10) UNIQUE NOT NULL,
    DeptName VARCHAR(100) NOT NULL
)

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