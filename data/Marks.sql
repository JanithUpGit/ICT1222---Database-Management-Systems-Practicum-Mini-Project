DELETE FROM Marks;
ALTER TABLE Marks AUTO_INCREMENT = 1;

DELETE FROM MidExam;
ALTER TABLE MidExam AUTO_INCREMENT = 1;

DELETE FROM EndExam;
ALTER TABLE EndExam AUTO_INCREMENT = 1;


INSERT INTO Marks (StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES
-- === 2020 Batch ===
('TG2020-001','ENG1222',75,78,82,85),
('TG2020-001','ICT1212',72,75,77,80),
('TG2020-001','ICT1222',88,90,92,94),
('TG2020-001','ICT1233',80,82,85,87),
('TG2020-001','ICT1242',83,85,87,90),
('TG2020-001','ICT1253',86,88,90,92),
('TG2020-001','TCS1212',78,80,82,84),
('TG2020-001','TMS1233',85,87,89,91),

('TG2020-002','ENG1222',70,72,75,77),
('TG2020-002','ICT1212',73,75,77,79),
('TG2020-002','ICT1222',82,85,87,89),
('TG2020-002','ICT1233',77,79,81,83),
('TG2020-002','ICT1242',76,78,80,82),
('TG2020-002','ICT1253',81,83,85,88),
('TG2020-002','TCS1212',70,73,75,78),
('TG2020-002','TMS1233',74,76,79,81),

('TG2020-003','ENG1222',78,80,83,85),
('TG2020-003','ICT1212',75,77,80,82),
('TG2020-003','ICT1222',84,86,88,90),
('TG2020-003','ICT1233',79,82,84,86),
('TG2020-003','ICT1242',80,82,85,87),
('TG2020-003','ICT1253',85,87,89,91),
('TG2020-003','TCS1212',77,79,82,84),
('TG2020-003','TMS1233',80,83,85,87),

('TG2020-004','ENG1222',72,75,78,80),
('TG2020-004','ICT1212',70,73,76,78),
('TG2020-004','ICT1222',83,85,87,89),
('TG2020-004','ICT1233',78,80,82,84),
('TG2020-004','ICT1242',79,82,84,86),
('TG2020-004','ICT1253',83,85,87,89),
('TG2020-004','TCS1212',75,78,80,82),
('TG2020-004','TMS1233',77,80,83,85),

('TG2020-005','ENG1222',80,82,85,88),
('TG2020-005','ICT1212',82,84,86,88),
('TG2020-005','ICT1222',88,90,92,94),
('TG2020-005','ICT1233',84,86,88,90),
('TG2020-005','ICT1242',86,88,90,92),
('TG2020-005','ICT1253',89,91,93,95),
('TG2020-005','TCS1212',83,85,87,89),
('TG2020-005','TMS1233',85,87,89,91),

-- === 2019 Batch ===
('TG2019-011','ENG1222',68,70,73,75),
('TG2019-011','ICT1212',70,72,74,76),
('TG2019-011','ICT1222',80,82,85,87),
('TG2019-011','ICT1233',78,80,82,85),
('TG2019-011','ICT1242',75,77,80,82),
('TG2019-011','ICT1253',82,85,87,89),
('TG2019-011','TCS1212',70,72,74,76),
('TG2019-011','TMS1233',74,76,78,80),

('TG2019-012','ENG1222',70,73,76,78),
('TG2019-012','ICT1212',73,76,79,81),
('TG2019-012','ICT1222',82,84,87,89),
('TG2019-012','ICT1233',79,81,84,86),
('TG2019-012','ICT1242',80,83,85,87),
('TG2019-012','ICT1253',85,87,89,91),
('TG2019-012','TCS1212',77,79,81,83),
('TG2019-012','TMS1233',80,83,85,87);



INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES
-- Theory only
(1,'Theory',80),(2,'Theory',79),(5,'Theory',84),(7,'Theory',81),(8,'Theory',85),
(9,'Theory',76),(10,'Theory',78),(13,'Theory',80),(15,'Theory',79),(16,'Theory',83),
(17,'Theory',75),(18,'Theory',77),(21,'Theory',79),(23,'Theory',78),(24,'Theory',81),
-- Practical only
(3,'Practical',85),(11,'Practical',82),(19,'Practical',84),
-- Both (Theory + Practical)
(4,'Theory',82),(4,'Practical',88),
(6,'Theory',84),(6,'Practical',90),
(12,'Theory',80),(12,'Practical',86),
(14,'Theory',82),(14,'Practical',89),
(20,'Theory',78),(20,'Practical',85),
(22,'Theory',82),(22,'Practical',88);



INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES
-- Theory only
(1,'Theory',86),(2,'Theory',84),(5,'Theory',88),(7,'Theory',83),(8,'Theory',86),
(9,'Theory',80),(10,'Theory',78),(13,'Theory',82),(15,'Theory',81),(16,'Theory',84),
(17,'Theory',78),(18,'Theory',80),(21,'Theory',83),(23,'Theory',82),(24,'Theory',85),
-- Practical only
(3,'Practical',88),(11,'Practical',85),(19,'Practical',88),
-- Both (Theory + Practical)
(4,'Theory',88),(4,'Practical',92),
(6,'Theory',88),(6,'Practical',93),
(12,'Theory',85),(12,'Practical',90),
(14,'Theory',85),(14,'Practical',91),
(20,'Theory',82),(20,'Practical',88),
(22,'Theory',86),(22,'Practical',92);
