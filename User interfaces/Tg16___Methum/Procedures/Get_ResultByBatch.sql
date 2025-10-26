DELIMITER $$

DROP PROCEDURE IF EXISTS Get_ResultByBatch $$
CREATE PROCEDURE Get_ResultByBatch(
    IN p_Batch INT
)
BEGIN
    SELECT
        r.StudentRegNo,
        r.StudentName,
        r.Batch,
        r.CourseCode,
        r.CourseName,
        r.CATotal,
        r.ESAMark,
        r.FinalMark,
        r.Grade,
        r.ResultStatus
    FROM View_Result AS r
    WHERE r.Batch = p_Batch
    ORDER BY r.StudentRegNo, r.CourseCode;
END $$

DELIMITER ;
CALL Get_ResultByBatch(2020);
