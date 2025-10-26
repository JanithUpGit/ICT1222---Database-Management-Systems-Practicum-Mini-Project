DELIMITER $$

DROP PROCEDURE IF EXISTS Get_MarksByBatch $$
CREATE PROCEDURE Get_MarksByBatch(
    IN p_Batch INT
)
BEGIN
    SELECT
        *
    FROM View_CATotalMarks AS m
    WHERE m.Batch = p_Batch
    ORDER BY m.StudentRegNo, m.CourseCode;
END $$

DELIMITER ;
CALL Get_MarksByBatch(2020);
