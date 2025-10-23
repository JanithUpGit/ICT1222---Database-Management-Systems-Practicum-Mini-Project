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
(76, 'TG2020-001', '2020'),
(77, 'TG2020-002', '2020'),
(78, 'TG2020-003', '2020'),
(79, 'TG2020-004', '2020'),
(80, 'TG2020-005', '2020'),
(81, 'TG2020-006', '2020'),
(82, 'TG2020-007', '2020'),
(83, 'TG2020-008', '2020'),
(84, 'TG2020-009', '2020'),
(85, 'TG2020-010', '2020'),
-- Repeat students
(86, 'TG2019-011', '2019'),
(87, 'TG2019-012', '2019'),
(88, 'TG2019-013', '2019'),
(89, 'TG2019-014', '2019'),
(90, 'TG2019-015', '2019');


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







-- marks table data insert


-- ==================== ENGLISH II (CourseID = 1) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks) VALUES
('TG2020-001', 1, 'Quiz', 82.00, 66, 'Good vocabulary'),
('TG2020-001', 1, 'Assessment', 84.00, 66, 'Fluent writing'),
('TG2020-001', 1, 'Final Theory', 88.00, 66, 'Excellent grammar'),

('TG2020-002', 1, 'Quiz', 70.00, 66, 'Average listening'),
('TG2020-002', 1, 'Assessment', 74.00, 66, 'Improved writing'),
('TG2020-002', 1, 'Final Theory', 76.00, 66, 'Good progress'),

('TG2020-003', 1, 'Quiz', 78.00, 66, 'Good comprehension'),
('TG2020-003', 1, 'Assessment', 80.00, 66, 'Strong vocabulary'),
('TG2020-003', 1, 'Final Theory', 85.00, 66, 'Excellent performance'),

('TG2020-004', 1, 'Quiz', 68.00, 66, 'Needs improvement'),
('TG2020-004', 1, 'Assessment', 72.00, 66, 'Better effort'),
('TG2020-004', 1, 'Final Theory', 70.00, 66, 'Satisfactory'),

('TG2020-005', 1, 'Quiz', 90.00, 66, 'Excellent reading'),
('TG2020-005', 1, 'Assessment', 88.00, 66, 'Creative writing'),
('TG2020-005', 1, 'Final Theory', 92.00, 66, 'Top performer'),

('TG2020-006', 1, 'Quiz', 75.00, 66, 'Average vocabulary'),
('TG2020-006', 1, 'Assessment', 78.00, 66, 'Good comprehension'),
('TG2020-006', 1, 'Final Theory', 80.00, 66, 'Improved result'),

('TG2020-007', 1, 'Quiz', 64.00, 66, 'Weak listening'),
('TG2020-007', 1, 'Assessment', 68.00, 66, 'Improving writing'),
('TG2020-007', 1, 'Final Theory', 72.00, 66, 'Passable performance'),

('TG2020-008', 1, 'Quiz', 86.00, 66, 'Excellent grammar'),
('TG2020-008', 1, 'Assessment', 88.00, 66, 'Fluent writing'),
('TG2020-008', 1, 'Final Theory', 91.00, 66, 'Outstanding'),

('TG2020-009', 1, 'Quiz', 80.00, 66, 'Good improvement'),
('TG2020-009', 1, 'Assessment', 82.00, 66, 'Solid effort'),
('TG2020-009', 1, 'Final Theory', 85.00, 66, 'Very good'),

('TG2020-010', 1, 'Quiz', 60.00, 66, 'Basic grammar'),
('TG2020-010', 1, 'Assessment', 65.00, 66, 'Satisfactory'),
('TG2020-010', 1, 'Final Theory', 70.00, 66, 'Pass'),

('TG2019-011', 1, 'Quiz', 55.00, 66, 'Repeat student'),
('TG2019-011', 1, 'Assessment', 60.00, 66, 'Improved attempt'),
('TG2019-011', 1, 'Final Theory', 65.00, 66, 'Eligible (Repeat)'),

('TG2019-012', 1, 'Quiz', 62.00, 66, 'Repeat student'),
('TG2019-012', 1, 'Assessment', 66.00, 66, 'Better attempt'),
('TG2019-012', 1, 'Final Theory', 68.00, 66, 'Eligible'),

('TG2019-013', 1, 'Quiz', 58.00, 66, 'Repeat'),
('TG2019-013', 1, 'Assessment', 60.00, 66, 'Fair'),
('TG2019-013', 1, 'Final Theory', 62.00, 66, 'Eligible'),

('TG2019-014', 1, 'Quiz', 65.00, 66, 'Repeat improved'),
('TG2019-014', 1, 'Assessment', 68.00, 66, 'Good repeat'),
('TG2019-014', 1, 'Final Theory', 70.00, 66, 'Eligible'),

('TG2019-015', 1, 'Quiz', 60.00, 66, 'Repeat'),
('TG2019-015', 1, 'Assessment', 65.00, 66, 'Good effort'),
('TG2019-015', 1, 'Final Theory', 68.00, 66, 'Eligible');


-- ==================== DATABASE MANAGEMENT SYSTEMS (CourseID = 2) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks) VALUES
('TG2020-001', 2, 'Quiz', 85.00, 67, 'Strong SQL knowledge'),
('TG2020-001', 2, 'Assessment', 80.00, 67, 'Good normalization'),
('TG2020-001', 2, 'Mid Theory', 82.00, 67, 'Solid ERD understanding'),
('TG2020-001', 2, 'Final Theory', 88.00, 67, 'Excellent conceptual clarity'),

('TG2020-002', 2, 'Quiz', 65.00, 67, 'Fair joins'),
('TG2020-002', 2, 'Assessment', 70.00, 67, 'Improved understanding'),
('TG2020-002', 2, 'Mid Theory', 72.00, 67, 'Acceptable'),
('TG2020-002', 2, 'Final Theory', 75.00, 67, 'Good progress'),

('TG2020-003', 2, 'Quiz', 92.00, 67, 'Excellent performance'),
('TG2020-003', 2, 'Assessment', 90.00, 67, 'Outstanding normalization'),
('TG2020-003', 2, 'Mid Theory', 88.00, 67, 'Strong ERD'),
('TG2020-003', 2, 'Final Theory', 94.00, 67, 'Brilliant'),

('TG2020-004', 2, 'Quiz', 70.00, 67, 'Average SQL'),
('TG2020-004', 2, 'Assessment', 74.00, 67, 'Improving'),
('TG2020-004', 2, 'Mid Theory', 78.00, 67, 'Better normalization'),
('TG2020-004', 2, 'Final Theory', 80.00, 67, 'Good effort'),

('TG2020-005', 2, 'Quiz', 95.00, 67, 'Excellent performance'),
('TG2020-005', 2, 'Assessment', 90.00, 67, 'Brilliant design'),
('TG2020-005', 2, 'Mid Theory', 92.00, 67, 'Exceptional ERD'),
('TG2020-005', 2, 'Final Theory', 96.00, 67, 'Top student'),

('TG2020-006', 2, 'Quiz', 78.00, 67, 'Good SQL'),
('TG2020-006', 2, 'Assessment', 80.00, 67, 'Solid'),
('TG2020-006', 2, 'Mid Theory', 82.00, 67, 'Strong logic'),
('TG2020-006', 2, 'Final Theory', 86.00, 67, 'Great result'),

('TG2020-007', 2, 'Quiz', 64.00, 67, 'Weak understanding'),
('TG2020-007', 2, 'Assessment', 68.00, 67, 'Improving'),
('TG2020-007', 2, 'Mid Theory', 70.00, 67, 'Fair'),
('TG2020-007', 2, 'Final Theory', 74.00, 67, 'Satisfactory'),

('TG2020-008', 2, 'Quiz', 88.00, 67, 'Excellent'),
('TG2020-008', 2, 'Assessment', 86.00, 67, 'Very good'),
('TG2020-008', 2, 'Mid Theory', 89.00, 67, 'Well structured'),
('TG2020-008', 2, 'Final Theory', 92.00, 67, 'Top marks'),

('TG2020-009', 2, 'Quiz', 82.00, 67, 'Consistent'),
('TG2020-009', 2, 'Assessment', 80.00, 67, 'Good progress'),
('TG2020-009', 2, 'Mid Theory', 85.00, 67, 'Strong conceptual'),
('TG2020-009', 2, 'Final Theory', 87.00, 67, 'Excellent'),

('TG2020-010', 2, 'Quiz', 70.00, 67, 'Average performance'),
('TG2020-010', 2, 'Assessment', 72.00, 67, 'Improved'),
('TG2020-010', 2, 'Mid Theory', 75.00, 67, 'Good'),
('TG2020-010', 2, 'Final Theory', 78.00, 67, 'Better'),

('TG2019-011', 2, 'Quiz', 62.00, 67, 'Repeat'),
('TG2019-011', 2, 'Assessment', 65.00, 67, 'Fair'),
('TG2019-011', 2, 'Mid Theory', 68.00, 67, 'Improved'),
('TG2019-011', 2, 'Final Theory', 70.00, 67, 'Eligible');

-- (Similar data can continue for CourseID 3, 4, 5…)

-- ==================== DBMS PRACTICUM (CourseID = 3) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks) VALUES
('TG2020-001', 3, 'Assessment', 85.00, 68, 'Excellent design'),
('TG2020-001', 3, 'Mid Practical', 83.00, 68, 'Clean queries'),
('TG2020-001', 3, 'Final Practical', 90.00, 68, 'Project well executed'),

('TG2020-002', 3, 'Assessment', 72.00, 68, 'Good effort'),
('TG2020-002', 3, 'Mid Practical', 70.00, 68, 'Functional'),
('TG2020-002', 3, 'Final Practical', 75.00, 68, 'Satisfactory'),

('TG2020-003', 3, 'Assessment', 92.00, 68, 'Excellent documentation'),
('TG2020-003', 3, 'Mid Practical', 94.00, 68, 'Perfect logic'),
('TG2020-003', 3, 'Final Practical', 96.00, 68, 'Outstanding project'),

('TG2020-004', 3, 'Assessment', 74.00, 68, 'Fair structure'),
('TG2020-004', 3, 'Mid Practical', 76.00, 68, 'Improved logic'),
('TG2020-004', 3, 'Final Practical', 80.00, 68, 'Good execution'),

('TG2020-005', 3, 'Assessment', 95.00, 68, 'Excellent database design'),
('TG2020-005', 3, 'Mid Practical', 96.00, 68, 'Strong coding'),
('TG2020-005', 3, 'Final Practical', 98.00, 68, 'Brilliant project'),

('TG2020-006', 3, 'Assessment', 78.00, 68, 'Good attempt'),
('TG2020-006', 3, 'Mid Practical', 80.00, 68, 'Clean code'),
('TG2020-006', 3, 'Final Practical', 84.00, 68, 'Well done'),

('TG2020-007', 3, 'Assessment', 68.00, 68, 'Basic work'),
('TG2020-007', 3, 'Mid Practical', 70.00, 68, 'Improving'),
('TG2020-007', 3, 'Final Practical', 72.00, 68, 'Satisfactory'),

('TG2020-008', 3, 'Assessment', 90.00, 68, 'Excellent performance'),
('TG2020-008', 3, 'Mid Practical', 92.00, 68, 'Very good'),
('TG2020-008', 3, 'Final Practical', 94.00, 68, 'Outstanding'),

('TG2020-009', 3, 'Assessment', 84.00, 68, 'Good design'),
('TG2020-009', 3, 'Mid Practical', 86.00, 68, 'Solid logic'),
('TG2020-009', 3, 'Final Practical', 88.00, 68, 'Consistent work'),

('TG2020-010', 3, 'Assessment', 70.00, 68, 'Fair structure'),
('TG2020-010', 3, 'Mid Practical', 72.00, 68, 'Functional'),
('TG2020-010', 3, 'Final Practical', 74.00, 68, 'Good attempt'),

('TG2019-011', 3, 'Assessment', 65.00, 68, 'Repeat attempt'),
('TG2019-011', 3, 'Mid Practical', 68.00, 68, 'Improved'),
('TG2019-011', 3, 'Final Practical', 72.00, 68, 'Eligible'),

('TG2019-012', 3, 'Assessment', 60.00, 68, 'Basic repeat'),
('TG2019-012', 3, 'Mid Practical', 64.00, 68, 'Improving'),
('TG2019-012', 3, 'Final Practical', 68.00, 68, 'Eligible'),

('TG2019-013', 3, 'Assessment', 62.00, 68, 'Repeat student'),
('TG2019-013', 3, 'Mid Practical', 65.00, 68, 'Better logic'),
('TG2019-013', 3, 'Final Practical', 70.00, 68, 'Eligible'),

('TG2019-014', 3, 'Assessment', 68.00, 68, 'Improved'),
('TG2019-014', 3, 'Mid Practical', 70.00, 68, 'Fair'),
('TG2019-014', 3, 'Final Practical', 72.00, 68, 'Eligible'),

('TG2019-015', 3, 'Assessment', 65.00, 68, 'Repeat'),
('TG2019-015', 3, 'Mid Practical', 68.00, 68, 'Satisfactory'),
('TG2019-015', 3, 'Final Practical', 70.00, 68, 'Eligible');



-- ==================== SERVER SIDE WEB DEVELOPMENT (CourseID = 4) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks) VALUES
('TG2020-001', 4, 'Quiz', 78.00, 69, 'Good understanding of PHP'),
('TG2020-001', 4, 'Assessment', 82.00, 69, 'Clean logic'),
('TG2020-001', 4, 'Mid Practical', 85.00, 69, 'Functional project'),
('TG2020-001', 4, 'Final Practical', 90.00, 69, 'Excellent full-stack'),

('TG2020-002', 4, 'Quiz', 70.00, 69, 'Fair logic'),
('TG2020-002', 4, 'Assessment', 72.00, 69, 'Improved'),
('TG2020-002', 4, 'Mid Practical', 74.00, 69, 'Needs polishing'),
('TG2020-002', 4, 'Final Practical', 78.00, 69, 'Good completion'),

('TG2020-003', 4, 'Quiz', 90.00, 69, 'Excellent backend skills'),
('TG2020-003', 4, 'Assessment', 92.00, 69, 'Brilliant logic'),
('TG2020-003', 4, 'Mid Practical', 94.00, 69, 'Well structured'),
('TG2020-003', 4, 'Final Practical', 96.00, 69, 'Top performer'),

('TG2020-004', 4, 'Quiz', 74.00, 69, 'Good effort'),
('TG2020-004', 4, 'Assessment', 76.00, 69, 'Solid code'),
('TG2020-004', 4, 'Mid Practical', 78.00, 69, 'Improving'),
('TG2020-004', 4, 'Final Practical', 80.00, 69, 'Good result'),

('TG2020-005', 4, 'Quiz', 96.00, 69, 'Outstanding'),
('TG2020-005', 4, 'Assessment', 94.00, 69, 'Exceptional coding'),
('TG2020-005', 4, 'Mid Practical', 96.00, 69, 'Excellent logic'),
('TG2020-005', 4, 'Final Practical', 98.00, 69, 'Brilliant project'),

('TG2020-006', 4, 'Quiz', 80.00, 69, 'Good logic'),
('TG2020-006', 4, 'Assessment', 82.00, 69, 'Solid understanding'),
('TG2020-006', 4, 'Mid Practical', 84.00, 69, 'Functional'),
('TG2020-006', 4, 'Final Practical', 88.00, 69, 'Excellent'),

('TG2020-007', 4, 'Quiz', 68.00, 69, 'Basic understanding'),
('TG2020-007', 4, 'Assessment', 70.00, 69, 'Improving'),
('TG2020-007', 4, 'Mid Practical', 72.00, 69, 'Good try'),
('TG2020-007', 4, 'Final Practical', 74.00, 69, 'Fair result'),

('TG2020-008', 4, 'Quiz', 92.00, 69, 'Outstanding logic'),
('TG2020-008', 4, 'Assessment', 90.00, 69, 'Excellent structure'),
('TG2020-008', 4, 'Mid Practical', 92.00, 69, 'Great design'),
('TG2020-008', 4, 'Final Practical', 94.00, 69, 'Outstanding'),

('TG2020-009', 4, 'Quiz', 85.00, 69, 'Very good'),
('TG2020-009', 4, 'Assessment', 88.00, 69, 'Solid performance'),
('TG2020-009', 4, 'Mid Practical', 90.00, 69, 'Well written'),
('TG2020-009', 4, 'Final Practical', 92.00, 69, 'Excellent'),

('TG2020-010', 4, 'Quiz', 72.00, 69, 'Average code'),
('TG2020-010', 4, 'Assessment', 74.00, 69, 'Satisfactory'),
('TG2020-010', 4, 'Mid Practical', 76.00, 69, 'Improving'),
('TG2020-010', 4, 'Final Practical', 78.00, 69, 'Good'),

('TG2019-011', 4, 'Quiz', 65.00, 69, 'Repeat'),
('TG2019-011', 4, 'Assessment', 68.00, 69, 'Improved'),
('TG2019-011', 4, 'Mid Practical', 70.00, 69, 'Good'),
('TG2019-011', 4, 'Final Practical', 72.00, 69, 'Eligible');




-- ==================== COMPUTER ARCHITECTURE (CourseID = 5) ====================
INSERT INTO Marks (RegNo, CourseID, ExamType, MarksObtained, RecordedBy, Remarks) VALUES
('TG2020-001', 5, 'Quiz', 78.00, 70, 'Understands fundamentals'),
('TG2020-001', 5, 'Assessment', 82.00, 70, 'Good CPU concepts'),
('TG2020-001', 5, 'Mid Theory', 80.00, 70, 'Solid performance'),
('TG2020-001', 5, 'Final Theory', 86.00, 70, 'Excellent grasp'),

('TG2020-002', 5, 'Quiz', 70.00, 70, 'Average circuits'),
('TG2020-002', 5, 'Assessment', 74.00, 70, 'Fair logic'),
('TG2020-002', 5, 'Mid Theory', 76.00, 70, 'Acceptable'),
('TG2020-002', 5, 'Final Theory', 78.00, 70, 'Improved'),

('TG2020-003', 5, 'Quiz', 92.00, 70, 'Very good'),
('TG2020-003', 5, 'Assessment', 94.00, 70, 'Excellent'),
('TG2020-003', 5, 'Mid Theory', 90.00, 70, 'Strong logic'),
('TG2020-003', 5, 'Final Theory', 96.00, 70, 'Top performer'),

('TG2020-004', 5, 'Quiz', 74.00, 70, 'Good base'),
('TG2020-004', 5, 'Assessment', 76.00, 70, 'Improving'),
('TG2020-004', 5, 'Mid Theory', 78.00, 70, 'Decent'),
('TG2020-004', 5, 'Final Theory', 82.00, 70, 'Good'),

('TG2020-005', 5, 'Quiz', 96.00, 70, 'Outstanding'),
('TG2020-005', 5, 'Assessment', 94.00, 70, 'Excellent understanding'),
('TG2020-005', 5, 'Mid Theory', 95.00, 70, 'Strong logic'),
('TG2020-005', 5, 'Final Theory', 98.00, 70, 'Brilliant'),

('TG2020-006', 5, 'Quiz', 80.00, 70, 'Solid fundamentals'),
('TG2020-006', 5, 'Assessment', 82.00, 70, 'Consistent'),
('TG2020-006', 5, 'Mid Theory', 84.00, 70, 'Good result'),
('TG2020-006', 5, 'Final Theory', 88.00, 70, 'Excellent'),

('TG2020-007', 5, 'Quiz', 68.00, 70, 'Fair logic'),
('TG2020-007', 5, 'Assessment', 70.00, 70, 'Improved'),
('TG2020-007', 5, 'Mid Theory', 72.00, 70, 'Better'),
('TG2020-007', 5, 'Final Theory', 74.00, 70, 'Satisfactory'),

('TG2020-008', 5, 'Quiz', 88.00, 70, 'Very good'),
('TG2020-008', 5, 'Assessment', 90.00, 70, 'Excellent'),
('TG2020-008', 5, 'Mid Theory', 92.00, 70, 'Strong concepts'),
('TG2020-008', 5, 'Final Theory', 94.00, 70, 'Top result'),

('TG2020-009', 5, 'Quiz', 80.00, 70, 'Consistent'),
('TG2020-009', 5, 'Assessment', 82.00, 70, 'Good improvement'),
('TG2020-009', 5, 'Mid Theory', 84.00, 70, 'Strong'),
('TG2020-009', 5, 'Final Theory', 86.00, 70, 'Excellent'),

('TG2020-010', 5, 'Quiz', 72.00, 70, 'Average'),
('TG2020-010', 5, 'Assessment', 74.00, 70, 'Acceptable'),
('TG2020-010', 5, 'Mid Theory', 76.00, 70, 'Improved'),
('TG2020-010', 5, 'Final Theory', 78.00, 70, 'Good'),

('TG2019-011', 5, 'Quiz', 65.00, 70, 'Repeat'),
('TG2019-011', 5, 'Assessment', 68.00, 70, 'Improved'),
('TG2019-011', 5, 'Mid Theory', 70.00, 70, 'Fair'),
('TG2019-011', 5, 'Final Theory', 72.00, 70, 'Eligible');
