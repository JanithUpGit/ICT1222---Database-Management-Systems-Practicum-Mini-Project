
INSERT INTO Department (DeptCode, DeptName) VALUES
('ICT', 'Department of Information and Communication Technology'),
('ET', 'Department of Engineering Technology'),
('BST', 'Department of Bio System Technology'),
('MS', 'Department of Multidisciplinary Studies');



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
(4, 69, '2025-10-13', '14:00:00', 2.00, 'Theory')
(4, 69, '2025-10-20', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-10-20', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-10-27', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-10-27', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-11-03', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-11-03', '14:00:00', 2.00, 'Theory'),
(4, 69, '2025-11-10', '09:00:00', 2.00, 'Practical'),
(4, 69, '2025-11-10', '14:00:00', 2.00, 'Theory');

-- English II (CourseID = 1)
INSERT INTO Lecture (CourseID, LecturerID, LectureDate, StartTime, DurationHours, SessionType) VALUES
(1, 66, '2025-08-15', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-08-22', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-08-29', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-12', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-19', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-09-26', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-10-10', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-10-17', '09:00:00', 2.00, 'Theory')
(1, 66, '2025-10-24', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-10-31', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-11-07', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-11-14', '13:00:00', 2.00, 'Theory'),
(1, 66, '2025-11-21', '13:00:00', 2.00, 'Theory');

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
(2, 67, '2025-10-16', '09:00:00', 2.00, 'Theory')
(2, 67, '2025-10-23', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-10-30', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-11-06', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-11-13', '09:00:00', 2.00, 'Theory'),
(2, 67, '2025-11-20', '09:00:00', 2.00, 'Theory');

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
(3, 68, '2025-10-16', '14:00:00', 2.00, 'Practical')
(3, 68, '2025-10-23', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-23', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-30', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-10-30', '14:00:00', 2.00, 'Practical'),
(3, 68, '2025-11-06', '11:00:00', 2.00, 'Practical'),
(3, 68, '2025-11-06', '14:00:00', 2.00, 'Practical');

