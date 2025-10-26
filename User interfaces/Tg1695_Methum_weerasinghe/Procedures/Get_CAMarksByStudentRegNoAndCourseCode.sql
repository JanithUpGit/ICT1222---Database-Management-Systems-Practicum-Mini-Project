DELIMITER $$

DROP PROCEDURE IF EXISTS Get_CAMarksByStudentRegNoAndCourseCode $$
CREATE PROCEDURE Get_CAMarksByStudentRegNoAndCourseCode(
    IN p_StudentRegNo VARCHAR(15),
    IN p_CourseCode VARCHAR(10)
)
BEGIN
    SELECT
        m.MarkID,
        m.StudentRegNo,
        m.CourseCode,
        m.CourseName,
        m.TopQuiz1,
        m.TopQuiz2,
        m.AvgTopTwoQuizzes,
        m.Assessment1,
        m.MidMark,
        m.CATotal
    FROM View_CATotalMarks AS m
    WHERE m.StudentRegNo = p_StudentRegNo
      AND m.CourseCode = p_CourseCode
    LIMIT 1;
END $$

DELIMITER ;

CALL Get_CAMarksByStudentRegNoAndCourseCode('TG2020-001', 'ICT1253');
