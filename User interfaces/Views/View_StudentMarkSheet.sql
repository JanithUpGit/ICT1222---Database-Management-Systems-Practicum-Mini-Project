CREATE OR REPLACE VIEW Vw_StudentMarkSheet AS
SELECT
    M.RegNo,
    C.CourseCode,
    -- Pivot each quiz, replacing NULL with 'N/A' (Not Applicable)
    COALESCE(CAST(MAX(CASE WHEN M.Remarks = 'Quiz 1' THEN M.MarksObtained END) AS CHAR), 'N/A') AS Quiz1,
    COALESCE(CAST(MAX(CASE WHEN M.Remarks = 'Quiz 2' THEN M.MarksObtained END) AS CHAR), 'N/A') AS Quiz2,
    COALESCE(CAST(MAX(CASE WHEN M.Remarks = 'Quiz 3' THEN M.MarksObtained END) AS CHAR), 'N/A') AS Quiz3,
    
    -- Pivot the single assessment
    COALESCE(CAST(MAX(CASE WHEN M.ExamName = 'Assessment' THEN M.MarksObtained END) AS CHAR), 'N/A') AS Assessment,
    
    -- Pivot Mid and Final exams, replacing NULL with a specific message
    COALESCE(CAST(MAX(CASE WHEN M.ExamName = 'MidExam' AND M.ExamType = 'Theory' THEN M.MarksObtained END) AS CHAR), 'No Theory') AS Mid_Theory,
    COALESCE(CAST(MAX(CASE WHEN M.ExamName = 'MidExam' AND M.ExamType = 'Practical' THEN M.MarksObtained END) AS CHAR), 'No Practical') AS Mid_Practical,
    COALESCE(CAST(MAX(CASE WHEN M.ExamName = 'FinalExam' AND M.ExamType = 'Theory' THEN M.MarksObtained END) AS CHAR), 'No Theory') AS Final_Theory,
    COALESCE(CAST(MAX(CASE WHEN M.ExamName = 'FinalExam' AND M.ExamType = 'Practical' THEN M.MarksObtained END) AS CHAR), 'No Practical') AS Final_Practical
FROM
    Marks AS M
JOIN
    Course AS C ON M.CourseID = C.CourseID
GROUP BY
    M.RegNo,
    C.CourseID;

