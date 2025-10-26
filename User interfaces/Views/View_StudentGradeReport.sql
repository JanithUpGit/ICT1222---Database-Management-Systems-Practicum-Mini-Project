CREATE OR REPLACE VIEW View_StudentGradeReport AS
SELECT 
    f.RegNo,
    f.CourseCode,
    c.Credits,
    f.Final_Marks,
    
    g.Grade,
    g.GradePoint
    
FROM 
    View_FinalStudentMarks_WithEligibility AS f
JOIN 
    View_StudentGrades AS g ON f.RegNo = g.RegNo AND f.CourseCode = g.CourseCode 
JOIN 
    Course AS c ON f.CourseCode = c.CourseCode 
ORDER BY
    f.RegNo;

SELECT * FROM View_StudentGradeReport;


