CREATE OR REPLACE VIEW SGPA_check AS
SELECT 
    RegNo,
    CAST((SUM(PointCreditValue) / SUM(Credits)) AS DECIMAL(4, 2)) AS SGPA
FROM 
    Vw_GradePointCredit  -- Using the view we created earlier
GROUP BY 
    RegNo;



SELECT * FROM SGPA_check;

