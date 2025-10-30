DELIMITER $$

DROP PROCEDURE IF EXISTS Get_GPAByStudentRegNo $$
CREATE PROCEDURE Get_GPAByStudentRegNo(
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


    SELECT 
        s.StudentRegNo,
        s.SGPA,
        s.TotalCredits,
        s.TotalCourses
    FROM View_SGPA AS s
    WHERE s.StudentRegNo = p_StudentRegNo;

  
    SELECT 
        c.StudentRegNo,
        c.CGPA,
        c.TotalCredits,
        c.TotalCourses
    FROM View_CGPA AS c
    WHERE c.StudentRegNo = p_StudentRegNo;
END $$

DELIMITER ;


CALL Get_GPAByStudentRegNo('TG2020-001');
