CREATE OR REPLACE VIEW CGPA_check AS
SELECT 
    RegNo AS student_id,
    CAST((SUM(PointCreditValue) / SUM(Credits)) AS DECIMAL(4, 2)) AS CGPA
FROM 
    Vw_GradePointCredit
GROUP BY 
    RegNo
ORDER BY
    RegNo;



SELECT * FROM CGPA_check;

-- To check CGPA for a specific student, you can use:
 SELECT * FROM CGPA_check WHERE student_id = 'TG2020-001';