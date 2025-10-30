DELIMITER $$

DROP PROCEDURE IF EXISTS Get_EligibilityByStudentRegNo $$
CREATE PROCEDURE Get_EligibilityByStudentRegNo(
    IN p_StudentRegNo VARCHAR(15)
)
BEGIN
    SELECT
        e.StudentRegNo,
        e.StudentName,
        e.Batch,
        e.CourseCode,
        e.CourseName,
        e.CATotal,
        e.EligibilityStatus
    FROM View_Eligibility AS e
    WHERE e.StudentRegNo = p_StudentRegNo
    ORDER BY e.CourseCode;
END $$

DELIMITER ;


CALL Get_EligibilityByStudentRegNo('TG2020-001');
