DELIMITER $$

DROP PROCEDURE IF EXISTS Get_MidMark $$
CREATE PROCEDURE Get_MidMark(
    IN p_StudentRegNo VARCHAR(15),
    IN p_CourseCode VARCHAR(10)
)
BEGIN
    DECLARE v_MidTheory DECIMAL(5,2);
    DECLARE v_MidPractical DECIMAL(5,2);
    DECLARE v_MidMark DECIMAL(5,2);

    -- Get MidTheory and MidPractical from the view
    SELECT Mid_Theory, Mid_Practical
    INTO v_MidTheory, v_MidPractical
    FROM View_Marks
    WHERE StudentRegNo = p_StudentRegNo
      AND CourseCode = p_CourseCode
    LIMIT 1;

    -- Calculate average or single mark
    IF v_MidTheory IS NOT NULL AND v_MidPractical IS NOT NULL THEN
        SET v_MidMark = ROUND((v_MidTheory + v_MidPractical) / 2, 2);
    ELSEIF v_MidTheory IS NOT NULL THEN
        SET v_MidMark = v_MidTheory;
    ELSEIF v_MidPractical IS NOT NULL THEN
        SET v_MidMark = v_MidPractical;
    ELSE
        SET v_MidMark = NULL;
    END IF;

    -- Print the result
    SELECT p_StudentRegNo AS StudentRegNo, 
           p_CourseCode AS CourseCode, 
           v_MidMark AS MidMark;

END $$

DELIMITER ;

CALL Get_MidMark('TG2020-001', 'ICT1253');
