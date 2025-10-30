DELIMITER $$

DROP PROCEDURE IF EXISTS Get_GPAByBatch $$
CREATE PROCEDURE Get_GPAByBatch(
    IN p_Batch INT
)
BEGIN
   
    SELECT
        s.StudentRegNo,
        s.StudentName,
        s.Batch,
        s.SGPA,
        c.CGPA,
        s.TotalCredits AS SGPA_Credits,
        c.TotalCredits AS CGPA_Credits,
        CASE
            WHEN c.CGPA >= 3.70 THEN 'First Class'
            WHEN c.CGPA >= 3.30 THEN 'Second Upper'
            WHEN c.CGPA >= 3.00 THEN 'Second Lower'
            WHEN c.CGPA >= 2.00 THEN 'Pass'
            ELSE 'Fail'
        END AS GPA_Class
    FROM View_SGPA AS s
    JOIN View_CGPA AS c
      ON s.StudentRegNo = c.StudentRegNo
    WHERE s.Batch = p_Batch
    ORDER BY s.StudentRegNo;
END $$

DELIMITER ;


CALL Get_GPAByBatch(2020);
