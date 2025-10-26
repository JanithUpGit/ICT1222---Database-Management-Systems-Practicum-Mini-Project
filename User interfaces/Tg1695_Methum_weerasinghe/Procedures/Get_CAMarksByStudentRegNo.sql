DELIMITER $$

DROP PROCEDURE IF EXISTS Get_CAMarksByStudentRegNo $$
CREATE PROCEDURE Get_CAMarksByStudentRegNo(
    IN p_StudentRegNo VARCHAR(15)
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
    ORDER BY m.CourseCode;
END $$

DELIMITER ;
