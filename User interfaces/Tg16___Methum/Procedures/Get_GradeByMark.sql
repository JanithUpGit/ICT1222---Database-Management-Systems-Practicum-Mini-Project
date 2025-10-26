DELIMITER $$

DROP PROCEDURE IF EXISTS Get_GradeByMark $$
CREATE PROCEDURE Get_GradeByMark(
    IN p_Mark DECIMAL(5,2),
    OUT p_Grade VARCHAR(2)
)
BEGIN
    IF p_Mark >= 85 THEN
        SET p_Grade = 'A';
    ELSEIF p_Mark >= 75 THEN
        SET p_Grade = 'B+';
    ELSEIF p_Mark >= 65 THEN
        SET p_Grade = 'B';
    ELSEIF p_Mark >= 55 THEN
        SET p_Grade = 'C';
    ELSEIF p_Mark >= 40 THEN
        SET p_Grade = 'D';
    ELSE
        SET p_Grade = 'F';
    END IF;
END $$

DELIMITER ;


CALL Get_GradeByMark(82, @Grade);
SELECT @Grade;  -- returns 'B+'
