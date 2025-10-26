DELIMITER $$

DROP PROCEDURE IF EXISTS Get_GradePoint $$
CREATE PROCEDURE Get_GradePoint(
    IN p_Grade VARCHAR(3),
    OUT p_GradePoint DECIMAL(2,1)
)
BEGIN
    CASE UPPER(p_Grade)
        WHEN 'A+' THEN SET p_GradePoint = 4.0;
        WHEN 'A'  THEN SET p_GradePoint = 4.0;
        WHEN 'A-' THEN SET p_GradePoint = 3.7;
        WHEN 'B+' THEN SET p_GradePoint = 3.3;
        WHEN 'B'  THEN SET p_GradePoint = 3.0;
        WHEN 'B-' THEN SET p_GradePoint = 2.7;
        WHEN 'C+' THEN SET p_GradePoint = 2.3;
        WHEN 'C'  THEN SET p_GradePoint = 2.0;
        WHEN 'C-' THEN SET p_GradePoint = 1.7;
        WHEN 'D'  THEN SET p_GradePoint = 1.3;
        WHEN 'E'  THEN SET p_GradePoint = 0.0;
        ELSE SET p_GradePoint = NULL;  -- Invalid or missing grade
    END CASE;
END $$

DELIMITER ;

CALL Get_GradePoint('B+', @gp);
SELECT @gp;
