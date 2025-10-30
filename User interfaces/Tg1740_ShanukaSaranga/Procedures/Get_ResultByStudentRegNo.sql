DELIMITER $$

DROP PROCEDURE IF EXISTS Get_ResultByStudentRegNo $$
CREATE PROCEDURE Get_ResultByStudentRegNo(
    IN p_StudentRegNo VARCHAR(15)
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
    WHERE r.StudentRegNo = p_StudentRegNo
    ORDER BY r.CourseCode;
END $$

DELIMITER ;
CALL Get_ResultByStudentRegNo('TG2020-001');
