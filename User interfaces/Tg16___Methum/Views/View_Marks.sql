CREATE OR REPLACE VIEW View_Marks AS
SELECT 
    m.MarkID,
    s.StudentRegNo,
    CONCAT(u.FirstName, ' ', u.LastName) AS StudentName,  
    s.Batch,
    c.CourseCode,
    c.CourseName,
    m.Quiz1,
    m.Quiz2,
    m.Quiz3,
    m.Assessment1,
    
    MAX(CASE WHEN mid.ExamType = 'Theory' THEN mid.MidExamMark END) AS Mid_Theory,
    MAX(CASE WHEN mid.ExamType = 'Practical' THEN mid.MidExamMark END) AS Mid_Practical,
  
    MAX(CASE WHEN endx.ExamType = 'Theory' THEN endx.EndExamMark END) AS End_Theory,
    MAX(CASE WHEN endx.ExamType = 'Practical' THEN endx.EndExamMark END) AS End_Practical,
  
    ROUND((
        (IFNULL(m.Quiz1,0) + IFNULL(m.Quiz2,0) + IFNULL(m.Quiz3,0) + IFNULL(m.Assessment1,0)) / 4 +
        IFNULL(MAX(CASE WHEN mid.ExamType = 'Theory' THEN mid.MidExamMark END),0) +
        IFNULL(MAX(CASE WHEN endx.ExamType = 'Theory' THEN endx.EndExamMark END),0)
    ) / 3, 2) AS TotalAverage
FROM Marks m
JOIN Student s ON m.StudentRegNo = s.StudentRegNo
JOIN Users u ON s.UserID = u.Id                         
JOIN Course c ON m.CourseCode = c.CourseCode
LEFT JOIN MidExam mid ON m.MarkID = mid.MarkID
LEFT JOIN EndExam endx ON m.MarkID = endx.MarkID
GROUP BY 
    m.MarkID, s.StudentRegNo, u.FirstName, u.LastName, s.Batch,
    c.CourseCode, c.CourseName,
    m.Quiz1, m.Quiz2, m.Quiz3, m.Assessment1;
