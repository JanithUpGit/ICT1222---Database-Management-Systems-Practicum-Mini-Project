-- 🎯 Marks Table (only once)
INSERT INTO Marks (StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES
-- 2020 Batch
('TG2020-001','ENG1222',75,78,82,85),
('TG2020-001','ICT1212',72,75,77,80),
('TG2020-001','ICT1222',88,90,92,94),
('TG2020-001','ICT1233',80,82,85,87),
('TG2020-001','ICT1242',83,85,87,90),
('TG2020-001','ICT1253',86,88,90,92),
('TG2020-001','TCS1212',78,80,82,84),
('TG2020-001','TMS1233',85,87,89,91),

('TG2020-002','ENG1222',68,70,73,75),
('TG2020-002','ICT1212',70,72,74,76),
('TG2020-002','ICT1222',80,82,85,87),
('TG2020-002','ICT1233',78,80,82,85),
('TG2020-002','ICT1242',75,77,80,82),
('TG2020-002','ICT1253',82,85,87,89),
('TG2020-002','TCS1212',70,72,74,76),
('TG2020-002','TMS1233',74,76,78,80),

-- 2019 Batch
('TG2019-011','ENG1222',65,68,70,72),
('TG2019-011','ICT1212',68,70,72,74),
('TG2019-011','ICT1222',84,86,88,90),
('TG2019-011','ICT1233',74,76,79,81),
('TG2019-011','ICT1242',78,80,82,84),
('TG2019-011','ICT1253',80,82,84,86),
('TG2019-011','TCS1212',72,74,77,79),
('TG2019-011','TMS1233',75,77,79,81);


-- 🧠 Mid Exam Marks
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES
-- ENG1222 (Theory)
(1,'Theory',80.00),
-- ICT1212 (Theory)
(2,'Theory',78.00),
-- ICT1222 (Practical)
(3,'Practical',85.00),
-- ICT1233 (Both)
(4,'Theory',82.00),(4,'Practical',88.00),
-- ICT1242 (Theory)
(5,'Theory',85.00),
-- ICT1253 (Both)
(6,'Theory',84.00),(6,'Practical',90.00),
-- TCS1212 (Theory)
(7,'Theory',79.00),
-- TMS1233 (Theory)
(8,'Theory',83.00),

-- TG2020-002
(9,'Theory',75.00),
(10,'Theory',74.00),
(11,'Practical',82.00),
(12,'Theory',80.00),(12,'Practical',86.00),
(13,'Theory',78.00),
(14,'Theory',82.00),(14,'Practical',89.00),
(15,'Theory',76.00),
(16,'Theory',79.00),

-- TG2019-011
(17,'Theory',72.00),
(18,'Theory',75.00),
(19,'Practical',84.00),
(20,'Theory',78.00),(20,'Practical',85.00),
(21,'Theory',76.00),
(22,'Theory',82.00),(22,'Practical',88.00),
(23,'Theory',74.00),
(24,'Theory',78.00);


-- 🧾 End Exam Marks
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES
-- TG2020-001
(1,'Theory',86.00),
(2,'Theory',84.00),
(3,'Practical',88.00),
(4,'Theory',88.00),(4,'Practical',92.00),
(5,'Theory',89.00),
(6,'Theory',88.00),(6,'Practical',93.00),
(7,'Theory',84.00),
(8,'Theory',87.00),

-- TG2020-002
(9,'Theory',80.00),
(10,'Theory',79.00),
(11,'Practical',85.00),
(12,'Theory',85.00),(12,'Practical',90.00),
(13,'Theory',83.00),
(14,'Theory',85.00),(14,'Practical',91.00),
(15,'Theory',81.00),
(16,'Theory',84.00),

-- TG2019-011
(17,'Theory',78.00),
(18,'Theory',80.00),
(19,'Practical',88.00),
(20,'Theory',82.00),(20,'Practical',88.00),
(21,'Theory',81.00),
(22,'Theory',86.00),(22,'Practical',92.00),
(23,'Theory',80.00),
(24,'Theory',83.00);
