CREATE OR REPLACE VIEW Vw_GradePointCredit AS
SELECT 
    RegNo,
    CourseCode,
    Credits,
    GradePoint,
    (GradePoint * Credits) AS PointCreditValue
FROM 
    Vw_StudentGradeReport;




SELECT * FROM Vw_GradePointCredit WHERE RegNo = 'TG2020-001';
