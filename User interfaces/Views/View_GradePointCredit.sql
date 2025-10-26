CREATE OR REPLACE VIEW View_GradePointCredit AS
SELECT 
    RegNo,
    CourseCode,
    Credits,
    GradePoint,
    (GradePoint * Credits) AS PointCreditValue
FROM 
    View_StudentGradeReport;


SELECT * FROM View_GradePointCredit WHERE RegNo = 'TG2020-001';
