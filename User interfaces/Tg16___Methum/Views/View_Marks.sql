-- ==========================================================
-- View Name   : View_Marks
-- Description  : Displays summarized marks per student and per course, 
--                pivoted so that each exam type (Quiz, Assessment, MidExam, 
--                FinalExam) appears as separate columns. 
--                Quiz and Assessment are always theory-based.
--
-- Author       : [TG1702 Janith Uthpala]
-- ==========================================================

DROP VIEW IF EXISTS View_Marks;

CREATE OR REPLACE VIEW View_Marks AS
SELECT
    /* --- Student & Course Details --- */
    S.StudentRegNo,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    C.CourseCode,
    C.CourseName,

    /* --- Aggregated Marks (Simplified Pivot) --- */
    MAX(CASE WHEN M.ExamName = 'Quiz'       THEN M.MarksObtained END) AS Quiz,
    MAX(CASE WHEN M.ExamName = 'Assessment' THEN M.MarksObtained END) AS Assessment,

    MAX(CASE WHEN M.ExamName = 'MidExam'   AND M.ExamType = 'Theory'    THEN M.MarksObtained END) AS MidExam_Theory,
    MAX(CASE WHEN M.ExamName = 'MidExam'   AND M.ExamType = 'Practical' THEN M.MarksObtained END) AS MidExam_Practical,

    MAX(CASE WHEN M.ExamName = 'FinalExam' AND M.ExamType = 'Theory'    THEN M.MarksObtained END) AS FinalExam_Theory,
    MAX(CASE WHEN M.ExamName = 'FinalExam' AND M.ExamType = 'Practical' THEN M.MarksObtained END) AS FinalExam_Practical,

    /* --- Optional: Average or total marks --- */
    ROUND(AVG(M.MarksObtained), 2) AS AverageMark

FROM Marks M
JOIN Student S ON S.StudentRegNo = M.RegNo
JOIN Users U ON U.Id = S.UserID
JOIN Course C ON C.CourseID = M.CourseID
GROUP BY S.StudentRegNo, StudentName, C.CourseCode, C.CourseName
ORDER BY C.CourseCode, S.StudentRegNo;
