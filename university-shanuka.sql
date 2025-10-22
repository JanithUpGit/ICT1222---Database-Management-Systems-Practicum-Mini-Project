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
