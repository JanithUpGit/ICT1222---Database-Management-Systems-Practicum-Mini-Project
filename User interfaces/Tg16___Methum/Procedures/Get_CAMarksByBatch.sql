DELIMITER $$

DROP PROCEDURE IF EXISTS Get_CAMarksByBatch $$
CREATE PROCEDURE Get_CAMarksByBatch(
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
CALL Get_CAMarksByBatch(2020);
