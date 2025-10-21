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




-- insert users

INSERT INTO Users 
(FirstName, LastName, Role, Dob, Email, Phone, Address, DepartmentID, PasswordHash, Status)
VALUES
-- Admin
('Admin', 'User', 'Admin', '1990-05-05', 'admin@ruhuna.ac.lk', '0711000000', 'Faculty Office', 1, 'hash_admin', 'Active'),

-- Dean
('Nuwan', 'Laksiri', 'Dean', '1978-04-22', 'dean.tech@ruhuna.ac.lk', '0712000000', 'Faculty Office', 1, 'hash_dean', 'Active'),

-- Lecturers (5)
('Janith', 'Uthpala', 'Lecturer', '1985-02-10', 'janith@ruhuna.ac.lk', '0713000001', 'Colombo', 1, 'hash_lect1', 'Active'),
('Kasun', 'Perera', 'Lecturer', '1983-06-25', 'kasun@ruhuna.ac.lk', '0713000002', 'Galle', 1, 'hash_lect2', 'Active'),
('Samantha', 'Silva', 'Lecturer', '1979-09-12', 'samantha@ruhuna.ac.lk', '0713000003', 'Matara', 1, 'hash_lect3', 'Active'),
('Nadeesha', 'Fernando', 'Lecturer', '1987-03-03', 'nadeesha@ruhuna.ac.lk', '0713000004', 'Kandy', 1, 'hash_lect4', 'Active'),
('Ruwan', 'Jayasinghe', 'Lecturer', '1981-08-17', 'ruwan@ruhuna.ac.lk', '0713000005', 'Colombo', 1, 'hash_lect5', 'Active'),

-- Technical Officers (5)
('Chathura', 'Gamage', 'TO', '1990-01-15', 'chathura@ruhuna.ac.lk', '0714000001', 'Colombo', 1, 'hash_to1', 'Active'),
('Supun', 'Wijesinghe', 'TO', '1991-03-27', 'supun@ruhuna.ac.lk', '0714000002', 'Galle', 1, 'hash_to2', 'Active'),
('Kavindu', 'Bandara', 'TO', '1989-11-10', 'kavindu@ruhuna.ac.lk', '0714000003', 'Matara', 1, 'hash_to3', 'Active'),
('Rashmika', 'Fernando', 'TO', '1992-05-14', 'rashmika@ruhuna.ac.lk', '0714000004', 'Colombo', 1, 'hash_to4', 'Active'),
('Isuru', 'Jayawardena', 'TO', '1988-09-09', 'isuru@ruhuna.ac.lk', '0714000005', 'Kandy', 1, 'hash_to5', 'Active'),

-- Students (10 proper + 5 repeat)
('Sithija', 'Perera', 'Student', '2002-02-10', 'sithija@ruhuna.ac.lk', '0775000001', 'Matara', 1, 'hash_stu1', 'Active'),
('Anushka', 'Silva', 'Student', '2002-06-22', 'anushka@ruhuna.ac.lk', '0775000002', 'Galle', 1, 'hash_stu2', 'Active'),
('Thilina', 'Fernando', 'Student', '2002-03-30', 'thilina@ruhuna.ac.lk', '0775000003', 'Colombo', 1, 'hash_stu3', 'Active'),
('Dilini', 'Kumari', 'Student', '2002-05-14', 'dilini@ruhuna.ac.lk', '0775000004', 'Matara', 1, 'hash_stu4', 'Active'),
('Ravindu', 'Jayasekara', 'Student', '2002-04-08', 'ravindu@ruhuna.ac.lk', '0775000005', 'Colombo', 1, 'hash_stu5', 'Active'),
('Menaka', 'Madushani', 'Student', '2002-11-18', 'menaka@ruhuna.ac.lk', '0775000006', 'Kandy', 1, 'hash_stu6', 'Active'),
('Hasitha', 'Karunarathna', 'Student', '2002-09-01', 'hasitha@ruhuna.ac.lk', '0775000007', 'Galle', 1, 'hash_stu7', 'Active'),
('Nimali', 'Wijesinghe', 'Student', '2002-12-24', 'nimali@ruhuna.ac.lk', '0775000008', 'Colombo', 1, 'hash_stu8', 'Active'),
('Sandun', 'Peiris', 'Student', '2002-01-11', 'sandun@ruhuna.ac.lk', '0775000009', 'Matara', 1, 'hash_stu9', 'Active'),
('Tharushi', 'Ranasinghe', 'Student', '2002-07-05', 'tharushi@ruhuna.ac.lk', '0775000010', 'Colombo', 1, 'hash_stu10', 'Active'),

-- Repeat Students
('Kaveesha', 'Lakshan', 'Student', '2001-05-11', 'kaveesha@ruhuna.ac.lk', '0776000001', 'Galle', 1, 'hash_rep1', 'Active'),
('Dinusha', 'Fernando', 'Student', '2001-09-03', 'dinusha@ruhuna.ac.lk', '0776000002', 'Kandy', 1, 'hash_rep2', 'Active'),
('Isuri', 'Perera', 'Student', '2001-10-19', 'isuri@ruhuna.ac.lk', '0776000003', 'Colombo', 1, 'hash_rep3', 'Active'),
('Sahan', 'Jayawardena', 'Student', '2001-12-30', 'sahan@ruhuna.ac.lk', '0776000004', 'Matara', 1, 'hash_rep4', 'Active'),
('Yasiru', 'Bandara', 'Student', '2001-08-15', 'yasiru@ruhuna.ac.lk', '0776000005', 'Galle', 1, 'hash_rep5', 'Active');



INSERT INTO Student (UserID, StudentRegNo, Batch)
VALUES
(76, 'ICT2020-001', '2020'),
(77, 'ICT2020-002', '2020'),
(78, 'ICT2020-003', '2020'),
(79, 'ICT2020-004', '2020'),
(80, 'ICT2020-005', '2020'),
(81, 'ICT2020-006', '2020'),
(82, 'ICT2020-007', '2020'),
(83, 'ICT2020-008', '2020'),
(84, 'ICT2020-009', '2020'),
(85, 'ICT2020-010', '2020'),
-- Repeat students
(86, 'ICT2019-011', '2019'),
(87, 'ICT2019-012', '2019'),
(88, 'ICT2019-013', '2019'),
(89, 'ICT2019-014', '2019'),
(90, 'ICT2019-015', '2019');



INSERT INTO Lecturer (UserID, StaffCode, Role)
VALUES
(66, 'L001', 'Lecturer'),
(67, 'L002', 'Lecturer'),
(68, 'L003', 'Lecturer'),
(69, 'L004', 'Lecturer'),
(70, 'L005', 'Lecturer'),
(65, 'D001', 'Dean'); -- Dean also acts as Lecturer



INSERT INTO TechnicalOfficer (UserID)
VALUES
(71),
(72),
(73),
(74),
(75);



-- ==================== ENGLISH II (CourseID = 1) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks)
VALUES
('ICT2020-001', 1, 'Quiz', 80.00, 66, 'Good vocabulary'),
('ICT2020-001', 1, 'Assessment', 85.00, 66, 'Fluent writing'),
('ICT2020-001', 1, 'Final Theory', 88.00, 66, 'Excellent grammar'),

('ICT2020-002', 1, 'Quiz', 70.00, 66, 'Average listening'),
('ICT2020-002', 1, 'Assessment', 68.00, 66, 'Needs improvement'),
('ICT2020-002', 1, 'Final Theory', 72.00, 66, 'Good progress'),

('ICT2019-011', 1, 'Quiz', 60.00, 66, 'Repeat student'),
('ICT2019-011', 1, 'Assessment', 65.00, 66, 'Improved'),
('ICT2019-011', 1, 'Final Theory', 70.00, 66, 'Satisfactory');

-- ==================== DATABASE MANAGEMENT SYSTEMS (CourseID = 2) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks)
VALUES
('ICT2020-001', 2, 'Quiz', 85.00, 67, 'Strong SQL knowledge'),
('ICT2020-001', 2, 'Assessment', 80.00, 67, 'Good normalization'),
('ICT2020-001', 2, 'Mid Theory', 82.00, 67, 'Solid ERD understanding'),
('ICT2020-001', 2, 'Final Theory', 88.00, 67, 'Excellent conceptual clarity'),

('ICT2020-002', 2, 'Quiz', 60.00, 67, 'Weak joins'),
('ICT2020-002', 2, 'Assessment', 65.00, 67, 'Improved query skills'),
('ICT2020-002', 2, 'Mid Theory', 70.00, 67, 'Fair attempt'),
('ICT2020-002', 2, 'Final Theory', 74.00, 67, 'Satisfactory'),

('ICT2020-003', 2, 'Quiz', 92.00, 67, 'Excellent performance'),
('ICT2020-003', 2, 'Assessment', 90.00, 67, 'Outstanding normalization'),
('ICT2020-003', 2, 'Mid Theory', 88.00, 67, 'Strong ERD'),
('ICT2020-003', 2, 'Final Theory', 94.00, 67, 'Brilliant'),

('ICT2019-012', 2, 'Quiz', 68.00, 67, 'Repeat attempt'),
('ICT2019-012', 2, 'Assessment', 65.00, 67, 'Average repeat'),
('ICT2019-012', 2, 'Mid Theory', 72.00, 67, 'Improved'),
('ICT2019-012', 2, 'Final Theory', 75.00, 67, 'Eligible');

-- ==================== DBMS PRACTICUM (CourseID = 3) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks)
VALUES
('ICT2020-001', 3, 'Assessment', 84.00, 68, 'Excellent design'),
('ICT2020-001', 3, 'Mid Practical', 82.00, 68, 'Clean queries'),
('ICT2020-001', 3, 'Final Practical', 90.00, 68, 'Project well executed'),

('ICT2020-002', 3, 'Assessment', 68.00, 68, 'Basic structure'),
('ICT2020-002', 3, 'Mid Practical', 65.00, 68, 'Needs optimization'),
('ICT2020-002', 3, 'Final Practical', 70.00, 68, 'Average performance'),

('ICT2020-003', 3, 'Assessment', 88.00, 68, 'Well documented'),
('ICT2020-003', 3, 'Mid Practical', 90.00, 68, 'Flawless execution'),
('ICT2020-003', 3, 'Final Practical', 95.00, 68, 'Excellent database'),

('ICT2019-013', 3, 'Assessment', 65.00, 68, 'Repeat attempt'),
('ICT2019-013', 3, 'Mid Practical', 68.00, 68, 'Improved'),
('ICT2019-013', 3, 'Final Practical', 72.00, 68, 'Eligible');

-- ==================== SERVER SIDE WEB DEVELOPMENT (CourseID = 4) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks)
VALUES
('ICT2020-001', 4, 'Quiz', 78.00, 69, 'Good understanding of PHP'),
('ICT2020-001', 4, 'Assessment', 82.00, 69, 'Clean server logic'),
('ICT2020-001', 4, 'Mid Practical', 85.00, 69, 'Functional project'),
('ICT2020-001', 4, 'Final Practical', 90.00, 69, 'Excellent full-stack'),

('ICT2020-002', 4, 'Quiz', 65.00, 69, 'Fair logic understanding'),
('ICT2020-002', 4, 'Assessment', 70.00, 69, 'Satisfactory'),
('ICT2020-002', 4, 'Mid Practical', 72.00, 69, 'Needs improvement'),
('ICT2020-002', 4, 'Final Practical', 75.00, 69, 'Good completion'),

('ICT2020-003', 4, 'Quiz', 90.00, 69, 'Excellent web skills'),
('ICT2020-003', 4, 'Assessment', 92.00, 69, 'Outstanding backend'),
('ICT2020-003', 4, 'Mid Practical', 94.00, 69, 'Well structured'),
('ICT2020-003', 4, 'Final Practical', 96.00, 69, 'Top project'),

('ICT2019-014', 4, 'Quiz', 70.00, 69, 'Repeat student'),
('ICT2019-014', 4, 'Assessment', 68.00, 69, 'Improved'),
('ICT2019-014', 4, 'Mid Practical', 72.00, 69, 'Good attempt'),
('ICT2019-014', 4, 'Final Practical', 74.00, 69, 'Eligible');

-- ==================== COMPUTER ARCHITECTURE (CourseID = 5) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks)
VALUES
('ICT2020-001', 5, 'Quiz', 75.00, 70, 'Understands fundamentals'),
('ICT2020-001', 5, 'Assessment', 80.00, 70, 'Good CPU concepts'),
('ICT2020-001', 5, 'Mid Theory', 78.00, 70, 'Solid performance'),
('ICT2020-001', 5, 'Final Theory', 85.00, 70, 'Excellent grasp'),

('ICT2020-002', 5, 'Quiz', 60.00, 70, 'Basic logic circuits'),
('ICT2020-002', 5, 'Assessment', 65.00, 70, 'Average work'),
('ICT2020-002', 5, 'Mid Theory', 68.00, 70, 'Acceptable'),
('ICT2020-002', 5, 'Final Theory', 72.00, 70, 'Improved'),

('ICT2020-003', 5, 'Quiz', 88.00, 70, 'Very good'),
('ICT2020-003', 5, 'Assessment', 92.00, 70, 'Excellent understanding'),
('ICT2020-003', 5, 'Mid Theory', 90.00, 70, 'Strong knowledge'),
('ICT2020-003', 5, 'Final Theory', 94.00, 70, 'Top performer'),

('ICT2019-015', 5, 'Quiz', 72.00, 70, 'Repeat attempt'),
('ICT2019-015', 5, 'Assessment', 70.00, 70, 'Fair'),
('ICT2019-015', 5, 'Mid Theory', 74.00, 70, 'Good repeat'),
('ICT2019-015', 5, 'Final Theory', 76.00, 70, 'Eligible');


