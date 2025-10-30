DELIMITER $$

DROP PROCEDURE IF EXISTS Get_SGPA $$
CREATE PROCEDURE Get_SGPA(
    IN p_StudentRegNo VARCHAR(15),
    OUT p_SGPA DECIMAL(4,2)
)
BEGIN
    DECLARE total_weighted_points DECIMAL(10,4) DEFAULT 0.0;
    DECLARE total_credits DECIMAL(10,2) DEFAULT 0.0;

    SELECT
        SUM(c.Credits * 
            CASE 
                WHEN r.Grade = 'A+' THEN 4.0
                WHEN r.Grade = 'A'  THEN 4.0
                WHEN r.Grade = 'A-' THEN 3.7
                WHEN r.Grade = 'B+' THEN 3.3
                WHEN r.Grade = 'B'  THEN 3.0
                WHEN r.Grade = 'B-' THEN 2.7
                WHEN r.Grade = 'C+' THEN 2.3
                WHEN r.Grade = 'C'  THEN 2.0
                WHEN r.Grade = 'C-' THEN 1.7
                WHEN r.Grade = 'D'  THEN 1.3
                WHEN r.Grade = 'E'  THEN 0.0
                ELSE NULL
            END
        ),
        SUM(c.Credits)
    INTO total_weighted_points, total_credits
    FROM View_Result AS r
    JOIN Course AS c
      ON r.CourseCode = c.CourseCode
    WHERE r.StudentRegNo = p_StudentRegNo
      AND c.CourseCode != 'ENG1222'   
      AND r.Grade NOT IN ('Not Eligible', 'Repeat')
      AND r.Grade IS NOT NULL;

    -- Calculate SGPA
    IF total_credits > 0 THEN
        SET p_SGPA = ROUND(total_weighted_points / total_credits, 2);
    ELSE
        SET p_SGPA = NULL;
    END IF;
END $$

DELIMITER ;


CALL Get_SGPA('TG2020-001', @sgpa);
SELECT @sgpa AS SGPA;
