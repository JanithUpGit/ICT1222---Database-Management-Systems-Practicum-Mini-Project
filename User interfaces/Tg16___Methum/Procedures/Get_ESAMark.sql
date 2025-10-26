DELIMITER $$

DROP PROCEDURE IF EXISTS Get_ESAMark $$
CREATE PROCEDURE Get_ESAMark(
    IN p_StudentRegNo VARCHAR(15),
    IN p_CourseCode VARCHAR(10),
    OUT p_ESAMark DECIMAL(5,2)
)
BEGIN
    DECLARE v_EndTheory DECIMAL(5,2);
    DECLARE v_EndPractical DECIMAL(5,2);

    -- Get end semester marks for the given student and course
    SELECT End_Theory, End_Practical
    INTO v_EndTheory, v_EndPractical
    FROM View_Marks
    WHERE StudentRegNo = p_StudentRegNo
      AND CourseCode = p_CourseCode
    LIMIT 1;

    -- Decide mark based on availability
    IF v_EndTheory IS NOT NULL AND v_EndPractical IS NOT NULL THEN
        SET p_ESAMark = ROUND((v_EndTheory + v_EndPractical) / 2, 2);
    ELSEIF v_EndTheory IS NOT NULL THEN
        SET p_ESAMark = v_EndTheory;
    ELSEIF v_EndPractical IS NOT NULL THEN
        SET p_ESAMark = v_EndPractical;
    ELSE
        SET p_ESAMark = NULL;
    END IF;
END $$

DELIMITER ;

CALL Get_ESAMark('TG2020-001', 'ICT1253', @ESAMark);
SELECT @ESAMark;
