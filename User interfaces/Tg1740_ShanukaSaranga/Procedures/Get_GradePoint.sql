DELIMITER $$

DROP PROCEDURE IF EXISTS Get_GradePoint $$
CREATE PROCEDURE Get_GradePoint(
    IN p_Grade VARCHAR(3)
)
BEGIN
    DECLARE gradePoint DECIMAL(2,1);

    CASE UPPER(p_Grade)
        WHEN 'A+' THEN SET gradePoint = 4.0;
        WHEN 'A'  THEN SET gradePoint = 4.0;
        WHEN 'A-' THEN SET gradePoint = 3.7;
        WHEN 'B+' THEN SET gradePoint = 3.3;
        WHEN 'B'  THEN SET gradePoint = 3.0;
        WHEN 'B-' THEN SET gradePoint = 2.7;
        WHEN 'C+' THEN SET gradePoint = 2.3;
        WHEN 'C'  THEN SET gradePoint = 2.0;
        WHEN 'C-' THEN SET gradePoint = 1.7;
        WHEN 'D'  THEN SET gradePoint = 1.3;
        WHEN 'E'  THEN SET gradePoint = 0.0;
        ELSE SET gradePoint = NULL;  
    END CASE;

    -- Print the GradePoint directly
    SELECT p_Grade AS Grade, gradePoint AS GradePoint;

END $$

DELIMITER ;



CALL Get_GradePoint('B+');
