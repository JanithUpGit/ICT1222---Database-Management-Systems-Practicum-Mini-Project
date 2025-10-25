DELIMITER $$

CREATE PROCEDURE get_student_details(IN p_RegNo VARCHAR(15))
BEGIN
    SELECT 
        s.StudentRegNo AS RegNo,
        s.Batch,
        c.CourseCode,
        c.CourseName,
        c.Credits,
        l.LectureDate,
        m.ExamName,
        m.MarksObtained,
        m.ExamType,
        e.AttendancePercentage,
        e.CAMarks,
        e.FinalEligibility AS EligibilityStatus
    FROM student s
    JOIN marks m ON s.StudentRegNo = m.RegNo
    JOIN course c ON m.CourseID = c.CourseID
    LEFT JOIN lecture l ON c.CourseID = l.CourseID
    LEFT JOIN eligibility e ON s.StudentRegNo = e.RegNo AND e.CourseID = c.CourseID
    WHERE s.StudentRegNo = p_RegNo
    ORDER BY c.CourseCode, m.ExamName;
END$$

DELIMITER ;


CALL get_student_details('TG2020-002');
CALL get_student_details('TG2020-003');

