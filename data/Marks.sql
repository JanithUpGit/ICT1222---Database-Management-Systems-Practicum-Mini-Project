DELETE FROM Marks;
ALTER TABLE Marks AUTO_INCREMENT = 1;

DELETE FROM MidExam;
ALTER TABLE MidExam AUTO_INCREMENT = 1;

DELETE FROM EndExam;
ALTER TABLE EndExam AUTO_INCREMENT = 1;


-- --- STUDENT: TG2020-001 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (1, 'TG2020-001', 'ENG1222', 75.00, 80.00, 78.00, 82.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (1, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (1, 'Theory', 85.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (2, 'TG2020-001', 'ICT1212', 82.00, 85.00, 79.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (2, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (2, 'Theory', 90.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (3, 'TG2020-001', 'ICT1222', 90.00, 88.00, 92.00, 95.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (3, 'Practical', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (3, 'Practical', 94.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (4, 'TG2020-001', 'ICT1233', 78.00, 82.00, 80.00, 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (4, 'Theory', 81.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (4, 'Practical', 86.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (4, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (4, 'Practical', 88.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (5, 'TG2020-001', 'ICT1242', 72.00, 75.00, 70.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (5, 'Theory', 76.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (5, 'Theory', 80.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (6, 'TG2020-001', 'ICT1253', 85.00, 88.00, 82.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (6, 'Theory', 87.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (6, 'Practical', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (6, 'Theory', 88.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (6, 'Practical', 92.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (7, 'TG2020-001', 'TCS1212', 68.00, 72.00, 70.00, 75.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (7, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (7, 'Theory', 78.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (8, 'TG2020-001', 'TMS1233', 80.00, 84.00, 81.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (8, 'Theory', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (8, 'Theory', 88.00);

-- --- STUDENT: TG2020-002 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (9, 'TG2020-002', 'ENG1222', 65.00, 70.00, 68.00, 72.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (9, 'Theory', 70.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (9, 'Theory', 75.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (10, 'TG2020-002', 'ICT1212', 72.00, 75.00, 69.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (10, 'Theory', 74.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (10, 'Theory', 80.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (11, 'TG2020-002', 'ICT1222', 80.00, 78.00, 82.00, 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (11, 'Practical', 81.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (11, 'Practical', 84.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (12, 'TG2020-002', 'ICT1233', 68.00, 72.00, 70.00, 75.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (12, 'Theory', 71.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (12, 'Practical', 76.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (12, 'Theory', 74.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (12, 'Practical', 78.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (13, 'TG2020-002', 'ICT1242', 62.00, 65.00, 60.00, 68.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (13, 'Theory', 66.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (13, 'Theory', 70.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (14, 'TG2020-002', 'ICT1253', 75.00, 78.00, 72.00, 80.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (14, 'Theory', 77.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (14, 'Practical', 81.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (14, 'Theory', 78.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (14, 'Practical', 82.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (15, 'TG2020-002', 'TCS1212', 58.00, 62.00, 60.00, 65.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (15, 'Theory', 63.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (15, 'Theory', 68.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (16, 'TG2020-002', 'TMS1233', 70.00, 74.00, 71.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (16, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (16, 'Theory', 78.00);

-- --- STUDENT: TG2020-003 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (17, 'TG2020-003', 'ENG1222', 85.00, 80.00, 82.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (17, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (17, 'Theory', 90.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (18, 'TG2020-003', 'ICT1212', 92.00, 88.00, 90.00, 95.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (18, 'Theory', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (18, 'Theory', 94.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (19, 'TG2020-003', 'ICT1222', 78.00, 82.00, 80.00, 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (19, 'Practical', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (19, 'Practical', 86.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (20, 'TG2020-003', 'ICT1233', 88.00, 90.00, 85.00, 92.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (20, 'Theory', 89.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (20, 'Practical', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (20, 'Theory', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (20, 'Practical', 94.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (21, 'TG2020-003', 'ICT1242', 76.00, 80.00, 78.00, 82.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (21, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (21, 'Theory', 85.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (22, 'TG2020-003', 'ICT1253', 82.00, 85.00, 79.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (22, 'Theory', 84.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (22, 'Practical', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (22, 'Theory', 86.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (22, 'Practical', 90.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (23, 'TG2020-003', 'TCS1212', 79.00, 83.00, 81.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (23, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (23, 'Theory', 88.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (24, 'TG2020-003', 'TMS1233', 81.00, 85.00, 82.00, 87.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (24, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (24, 'Theory', 89.00);

-- --- STUDENT: TG2020-004 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (25, 'TG2020-004', 'ENG1222', 60.00, 65.00, 62.00, 68.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (25, 'Theory', 64.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (25, 'Theory', 70.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (26, 'TG2020-004', 'ICT1212', 55.00, 60.00, 58.00, 62.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (26, 'Theory', 60.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (26, 'Theory', 65.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (27, 'TG2020-004', 'ICT1222', 70.00, 75.00, 72.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (27, 'Practical', 74.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (27, 'Practical', 79.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (28, 'TG2020-004', 'ICT1233', 63.00, 68.00, 65.00, 70.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (28, 'Theory', 66.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (28, 'Practical', 72.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (28, 'Theory', 69.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (28, 'Practical', 74.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (29, 'TG2020-004', 'ICT1242', 40.00, 45.00, 42.00, 50.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (29, 'Theory', 48.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (29, 'Theory', 55.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (30, 'TG2020-004', 'ICT1253', 68.00, 71.00, 69.00, 73.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (30, 'Theory', 70.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (30, 'Practical', 75.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (30, 'Theory', 72.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (30, 'Practical', 77.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (31, 'TG2020-004', 'TCS1212', 70.00, 73.00, 71.00, 75.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (31, 'Theory', 72.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (31, 'Theory', 76.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (32, 'TG2020-004', 'TMS1233', 50.00, 55.00, 52.00, 58.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (32, 'Theory', 54.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (32, 'Theory', 60.00);

-- --- STUDENT: TG2020-005 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (33, 'TG2020-005', 'ENG1222', 90.00, 92.00, 88.00, 95.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (33, 'Theory', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (33, 'Theory', 96.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (34, 'TG2020-005', 'ICT1212', 92.00, 94.00, 90.00, 96.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (34, 'Theory', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (34, 'Theory', 97.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (35, 'TG2020-005', 'ICT1222', 94.00, 96.00, 92.00, 98.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (35, 'Practical', 95.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (35, 'Practical', 99.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (36, 'TG2020-005', 'ICT1233', 88.00, 90.00, 86.00, 92.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (36, 'Theory', 89.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (36, 'Practical', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (36, 'Theory', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (36, 'Practical', 95.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (37, 'TG2020-005', 'ICT1242', 85.00, 88.00, 82.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (37, 'Theory', 87.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (37, 'Theory', 92.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (38, 'TG2020-005', 'ICT1253', 90.00, 93.00, 88.00, 95.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (38, 'Theory', 91.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (38, 'Practical', 94.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (38, 'Theory', 92.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (38, 'Practical', 96.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (39, 'TG2020-005', 'TCS1212', 86.00, 89.00, 84.00, 91.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (39, 'Theory', 88.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (39, 'Theory', 93.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (40, 'TG2020-005', 'TMS1233', 89.00, 91.00, 87.00, 94.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (40, 'Theory', 90.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (40, 'Theory', 95.00);

-- --- STUDENT: TG2020-006 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (41, 'TG2020-006', 'ENG1222', 45.00, 50.00, 48.00, 52.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (41, 'Theory', 50.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (41, 'Theory', 55.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (42, 'TG2020-006', 'ICT1212', 52.00, 55.00, 49.00, 58.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (42, 'Theory', 54.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (42, 'Theory', 60.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (43, 'TG2020-006', 'ICT1222', 60.00, 58.00, 62.00, 65.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (43, 'Practical', 61.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (43, 'Practical', 64.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (44, 'TG2020-006', 'ICT1233', 48.00, 52.00, 50.00, 55.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (44, 'Theory', 51.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (44, 'Practical', 56.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (44, 'Theory', 54.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (44, 'Practical', 58.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (45, 'TG2020-006', 'ICT1242', 32.00, 35.00, 30.00, 38.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (45, 'Theory', 36.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (45, 'Theory', 40.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (46, 'TG2020-006', 'ICT1253', 55.00, 58.00, 52.00, 60.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (46, 'Theory', 57.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (46, 'Practical', 61.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (46, 'Theory', 58.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (46, 'Practical', 62.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (47, 'TG2020-006', 'TCS1212', 48.00, 52.00, 50.00, 55.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (47, 'Theory', 53.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (47, 'Theory', 58.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (48, 'TG2020-006', 'TMS1233', 51.00, 55.00, 52.00, 57.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (48, 'Theory', 54.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (48, 'Theory', 59.00);

-- --- STUDENT: TG2020-007 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (49, 'TG2020-007', 'ENG1222', 77.00, 80.00, 78.00, 81.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (49, 'Theory', 79.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (49, 'Theory', 83.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (50, 'TG2020-007', 'ICT1212', 83.00, 86.00, 80.00, 89.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (50, 'Theory', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (50, 'Theory', 91.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (51, 'TG2020-007', 'ICT1222', 88.00, 86.00, 90.00, 93.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (51, 'Practical', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (51, 'Practical', 92.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (52, 'TG2020-007', 'ICT1233', 76.00, 80.00, 78.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (52, 'Theory', 79.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (52, 'Practical', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (52, 'Theory', 82.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (52, 'Practical', 86.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (53, 'TG2020-007', 'ICT1242', 70.00, 73.00, 68.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (53, 'Theory', 74.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (53, 'Theory', 79.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (54, 'TG2020-007', 'ICT1253', 81.00, 84.00, 79.00, 87.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (54, 'Theory', 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (54, 'Practical', 88.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (54, 'Theory', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (54, 'Practical', 89.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (55, 'TG2020-007', 'TCS1212', 73.00, 76.00, 71.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (55, 'Theory', 75.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (55, 'Theory', 80.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (56, 'TG2020-007', 'TMS1233', 78.00, 81.00, 76.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (56, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (56, 'Theory', 85.00);

-- --- STUDENT: TG2020-008 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (57, 'TG2020-008', 'ENG1222', 88.00, 90.00, 86.00, 92.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (57, 'Theory', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (57, 'Theory', 94.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (58, 'TG2020-008', 'ICT1212', 91.00, 94.00, 89.00, 96.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (58, 'Theory', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (58, 'Theory', 97.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (59, 'TG2020-008', 'ICT1222', 93.00, 95.00, 91.00, 97.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (59, 'Practical', 94.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (59, 'Practical', 98.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (60, 'TG2020-008', 'ICT1233', 86.00, 89.00, 84.00, 91.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (60, 'Theory', 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (60, 'Practical', 92.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (60, 'Theory', 90.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (60, 'Practical', 94.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (61, 'TG2020-008', 'ICT1242', 83.00, 86.00, 80.00, 89.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (61, 'Theory', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (61, 'Theory', 90.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (62, 'TG2020-008', 'ICT1253', 89.00, 92.00, 87.00, 94.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (62, 'Theory', 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (62, 'Practical', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (62, 'Theory', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (62, 'Practical', 95.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (63, 'TG2020-008', 'TCS1212', 84.00, 87.00, 82.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (63, 'Theory', 86.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (63, 'Theory', 91.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (64, 'TG2020-008', 'TMS1233', 87.00, 90.00, 85.00, 93.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (64, 'Theory', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (64, 'Theory', 94.00);

-- --- STUDENT: TG2020-009 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (65, 'TG2020-009', 'ENG1222', 62.00, 66.00, 64.00, 68.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (65, 'Theory', 65.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (65, 'Theory', 70.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (66, 'TG2020-009', 'ICT1212', 57.00, 61.00, 59.00, 63.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (66, 'Theory', 60.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (66, 'Theory', 66.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (67, 'TG2020-009', 'ICT1222', 72.00, 76.00, 74.00, 79.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (67, 'Practical', 75.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (67, 'Practical', 80.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (68, 'TG2020-009', 'ICT1233', 64.00, 69.00, 66.00, 71.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (68, 'Theory', 67.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (68, 'Practical', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (68, 'Theory', 70.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (68, 'Practical', 75.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (69, 'TG2020-009', 'ICT1242', 43.00, 47.00, 45.00, 51.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (69, 'Theory', 49.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (69, 'Theory', 56.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (70, 'TG2020-009', 'ICT1253', 69.00, 72.00, 70.00, 74.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (70, 'Theory', 71.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (70, 'Practical', 76.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (70, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (70, 'Practical', 78.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (71, 'TG2020-009', 'TCS1212', 71.00, 74.00, 72.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (71, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (71, 'Theory', 77.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (72, 'TG2020-009', 'TMS1233', 53.00, 57.00, 55.00, 59.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (72, 'Theory', 56.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (72, 'Theory', 61.00);

-- --- STUDENT: TG2020-010 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (73, 'TG2020-010', 'ENG1222', 78.00, 81.00, 79.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (73, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (73, 'Theory', 85.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (74, 'TG2020-010', 'ICT1212', 84.00, 87.00, 82.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (74, 'Theory', 86.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (74, 'Theory', 92.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (75, 'TG2020-010', 'ICT1222', 89.00, 87.00, 91.00, 94.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (75, 'Practical', 90.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (75, 'Practical', 93.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (76, 'TG2020-010', 'ICT1233', 79.00, 83.00, 81.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (76, 'Theory', 82.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (76, 'Practical', 87.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (76, 'Theory', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (76, 'Practical', 89.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (77, 'TG2020-010', 'ICT1242', 73.00, 76.00, 71.00, 79.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (77, 'Theory', 77.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (77, 'Theory', 81.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (78, 'TG2020-010', 'ICT1253', 83.00, 86.00, 80.00, 89.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (78, 'Theory', 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (78, 'Practical', 90.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (78, 'Theory', 87.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (78, 'Practical', 91.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (79, 'TG2020-010', 'TCS1212', 76.00, 79.00, 74.00, 81.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (79, 'Theory', 78.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (79, 'Theory', 82.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (80, 'TG2020-010', 'TMS1233', 81.00, 84.00, 79.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (80, 'Theory', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (80, 'Theory', 87.00);

-- --- STUDENT: TG2019-011 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (81, 'TG2019-011', 'ENG1222', 70.00, 72.00, 68.00, 75.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (81, 'Theory', 71.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (81, 'Theory', 76.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (82, 'TG2019-011', 'ICT1212', 76.00, 78.00, 74.00, 80.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (82, 'Theory', 77.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (82, 'Theory', 82.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (83, 'TG2019-011', 'ICT1222', 82.00, 80.00, 84.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (83, 'Practical', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (83, 'Practical', 87.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (84, 'TG2019-011', 'ICT1233', 73.00, 76.00, 71.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (84, 'Theory', 74.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (84, 'Practical', 79.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (84, 'Theory', 77.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (84, 'Practical', 81.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (85, 'TG2019-011', 'ICT1242', 67.00, 70.00, 65.00, 72.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (85, 'Theory', 69.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (85, 'Theory', 74.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (86, 'TG2019-011', 'ICT1253', 78.00, 81.00, 76.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (86, 'Theory', 80.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (86, 'Practical', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (86, 'Theory', 82.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (86, 'Practical', 86.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (87, 'TG2019-011', 'TCS1212', 71.00, 74.00, 69.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (87, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (87, 'Theory', 78.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (88, 'TG2019-011', 'TMS1233', 74.00, 77.00, 72.00, 79.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (88, 'Theory', 76.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (88, 'Theory', 81.00);

-- --- STUDENT: TG2019-012 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (89, 'TG2019-012', 'ENG1222', 82.00, 85.00, 80.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (89, 'Theory', 84.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (89, 'Theory', 90.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (90, 'TG2019-012', 'ICT1212', 88.00, 90.00, 86.00, 92.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (90, 'Theory', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (90, 'Theory', 94.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (91, 'TG2019-012', 'ICT1222', 91.00, 89.00, 93.00, 96.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (91, 'Practical', 92.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (91, 'Practical', 95.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (92, 'TG2019-012', 'ICT1233', 84.00, 87.00, 82.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (92, 'Theory', 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (92, 'Practical', 91.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (92, 'Theory', 88.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (92, 'Practical', 92.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (93, 'TG2019-012', 'ICT1242', 80.00, 83.00, 78.00, 86.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (93, 'Theory', 82.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (93, 'Theory', 87.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (94, 'TG2019-012', 'ICT1253', 87.00, 90.00, 85.00, 92.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (94, 'Theory', 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (94, 'Practical', 93.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (94, 'Theory', 90.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (94, 'Practical', 94.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (95, 'TG2019-012', 'TCS1212', 83.00, 86.00, 81.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (95, 'Theory', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (95, 'Theory', 89.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (96, 'TG2019-012', 'TMS1233', 86.00, 89.00, 84.00, 91.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (96, 'Theory', 88.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (96, 'Theory', 92.00);

-- --- STUDENT: TG2019-013 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (97, 'TG2019-013', 'ENG1222', 55.00, 58.00, 56.00, 60.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (97, 'Theory', 57.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (97, 'Theory', 62.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (98, 'TG2019-013', 'ICT1212', 61.00, 64.00, 59.00, 66.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (98, 'Theory', 63.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (98, 'Theory', 68.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (99, 'TG2019-013', 'ICT1222', 68.00, 66.00, 70.00, 72.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (99, 'Practical', 69.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (99, 'Practical', 73.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (100, 'TG2019-013', 'ICT1233', 59.00, 63.00, 61.00, 65.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (100, 'Theory', 62.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (100, 'Practical', 67.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (100, 'Theory', 64.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (100, 'Practical', 69.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (101, 'TG2019-013', 'ICT1242', 50.00, 53.00, 48.00, 56.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (101, 'Theory', 52.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (101, 'Theory', 57.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (102, 'TG2019-013', 'ICT1253', 63.00, 66.00, 61.00, 68.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (102, 'Theory', 64.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (102, 'Practical', 69.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (102, 'Theory', 66.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (102, 'Practical', 70.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (103, 'TG2019-013', 'TCS1212', 58.00, 61.00, 56.00, 63.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (103, 'Theory', 60.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (103, 'Theory', 64.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (104, 'TG2019-013', 'TMS1233', 60.00, 63.00, 58.00, 65.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (104, 'Theory', 62.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (104, 'Theory', 66.00);

-- --- STUDENT: TG2019-014 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (105, 'TG2019-014', 'ENG1222', 76.00, 79.00, 77.00, 81.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (105, 'Theory', 78.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (105, 'Theory', 83.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (106, 'TG2019-014', 'ICT1212', 81.00, 84.00, 79.00, 87.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (106, 'Theory', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (106, 'Theory', 89.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (107, 'TG2019-014', 'ICT1222', 86.00, 84.00, 88.00, 90.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (107, 'Practical', 87.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (107, 'Practical', 91.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (108, 'TG2019-014', 'ICT1233', 77.00, 81.00, 79.00, 84.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (108, 'Theory', 80.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (108, 'Practical', 85.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (108, 'Theory', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (108, 'Practical', 87.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (109, 'TG2019-014', 'ICT1242', 74.00, 77.00, 72.00, 80.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (109, 'Theory', 76.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (109, 'Theory', 82.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (110, 'TG2019-014', 'ICT1253', 83.00, 86.00, 81.00, 88.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (110, 'Theory', 84.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (110, 'Practical', 89.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (110, 'Theory', 87.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (110, 'Practical', 90.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (111, 'TG2019-014', 'TCS1212', 78.00, 81.00, 76.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (111, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (111, 'Theory', 85.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (112, 'TG2019-014', 'TMS1233', 79.00, 82.00, 77.00, 85.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (112, 'Theory', 81.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (112, 'Theory', 86.00);

-- --- STUDENT: TG2019-015 ---
-- Course: ENG1222 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (113, 'TG2019-015', 'ENG1222', 67.00, 70.00, 68.00, 72.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (113, 'Theory', 69.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (113, 'Theory', 73.00);

-- Course: ICT1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (114, 'TG2019-015', 'ICT1212', 73.00, 76.00, 71.00, 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (114, 'Theory', 75.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (114, 'Theory', 79.00);

-- Course: ICT1222 (Practical)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (115, 'TG2019-015', 'ICT1222', 79.00, 77.00, 81.00, 83.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (115, 'Practical', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (115, 'Practical', 84.00);

-- Course: ICT1233 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (116, 'TG2019-015', 'ICT1233', 70.00, 74.00, 72.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (116, 'Theory', 73.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (116, 'Practical', 78.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (116, 'Theory', 75.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (116, 'Practical', 80.00);

-- Course: ICT1242 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (117, 'TG2019-015', 'ICT1242', 64.00, 67.00, 62.00, 70.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (117, 'Theory', 66.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (117, 'Theory', 71.00);

-- Course: ICT1253 (Both)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (118, 'TG2019-015', 'ICT1253', 76.00, 79.00, 74.00, 81.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (118, 'Theory', 78.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (118, 'Practical', 83.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (118, 'Theory', 80.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (118, 'Practical', 85.00);

-- Course: TCS1212 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (119, 'TG2019-015', 'TCS1212', 72.00, 75.00, 70.00, 77.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (119, 'Theory', 74.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (119, 'Theory', 79.00);

-- Course: TMS1233 (Theory)
INSERT INTO Marks (MarkID, StudentRegNo, CourseCode, Quiz1, Quiz2, Quiz3, Assessment1) VALUES (120, 'TG2019-015', 'TMS1233', 71.00, 74.00, 69.00, 76.00);
INSERT INTO MidExam (MarkID, ExamType, MidExamMark) VALUES (120, 'Theory', 73.00);
INSERT INTO EndExam (MarkID, ExamType, EndExamMark) VALUES (120, 'Theory', 78.00);



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
