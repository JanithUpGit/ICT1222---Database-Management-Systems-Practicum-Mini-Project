DROP PROCEDURE IF EXISTS GetAttendance;
DELIMITER //

CREATE PROCEDURE GetAttendance(
    IN p_StudentID VARCHAR(15),
    IN p_CourseID INT
)
BEGIN


    /* ----- 2. Summary from the view ----- */
    SELECT
        StudentID,
        StudentName,
        CourseID,
        CourseName,
        TotalCourseHours AS TotalHours,
        AttendedHours,
        AttendancePercentage
    FROM View_StudentCourseParticipation
    WHERE StudentID = p_StudentID
      AND CourseID = p_CourseID;

    /* ----- 1. Detailed attendance breakdown ----- */
    SELECT 
        L.LectureID,
        L.LectureDate,
        L.DurationHours,
        A.SessionDate,
        A.Status,
        CONCAT(U.FirstName, ' ', U.LastName) AS RecordedBy
    FROM Attendance A
    JOIN Lecture L ON A.LectureID = L.LectureID
    JOIN Course C ON L.CourseID = C.CourseID
    JOIN Users U ON A.RecordedBy = U.Id
    WHERE A.RegNo = p_StudentID
      AND L.CourseID = p_CourseID
    ORDER BY L.LectureDate;

    

END //

DELIMITER ;

CALL GetAttendance('TG2020-002', 2);
