CREATE OR REPLACE VIEW Vw_StudentGradeReport AS
SELECT 
    f.RegNo,
    f.CourseCode,
    c.Credits,
    f.Final_Marks,  -- This is the column with '86.65', 'CA Fail', etc.
    
    -- Get the Grade and GradePoint from Vw_StudentGrades,
    -- which already has the correct UGC pass/fail logic applied.
    g.Grade,
    g.GradePoint
    
FROM 
    Vw_FinalStudentMarks_WithEligibility AS f
JOIN 
    Vw_StudentGrades AS g ON f.RegNo = g.RegNo AND f.CourseCode = g.CourseCode
JOIN 
    Course AS c ON f.CourseCode = c.CourseCode
ORDER BY
    f.RegNo;






SELECT * FROM Vw_StudentGradeReport;


