-- ==========================================================
-- Procedure Name : Get_AttendanceByCourseCodeAndSessionType
-- Description    : Retrieves detailed attendance records for a specific 
--                  course filtered by session type (Theory, Practical, or Both).
--                  Displays each student's attendance status with lecture 
--                  details such as date, duration, and session type.
--
-- Parameters     :
--      p_CourseCode - The course code to retrieve attendance for.
--      p_Type       - The session type filter ('Theory', 'Practical', or 'Both').
--
-- Author          : [TG1702 Janith Uthpala]
-- Date Created    : [2025-10-26]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByCourseCodeAndSessionType;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByCourseCodeAndSessionType(
    IN p_CourseCode VARCHAR(10),
    IN p_Type       VARCHAR(10)
)


BEGIN

    IF p_Type NOT IN ('Theory','Practical','Both') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Type must be Theory, Practical, or Both';
    END IF;

    SELECT
        VA.StudentRegNo,
        VA.StudentName,
        VA.CourseID,
        VA.CourseCode,
        VA.CourseName,
        L.LectureID,
        L.LectureDate,
        L.StartTime,
        L.SessionType,
        L.DurationHours,
        VA.Status
    FROM View_Attendance AS VA
    INNER JOIN Lecture AS L
        ON L.LectureID = VA.LectureID
    WHERE VA.CourseCode = p_CourseCode
      AND (
            p_Type = 'Both'
         OR (p_Type = 'Practical' AND L.SessionType = 'Practical')
         OR (p_Type = 'Theory'    AND L.SessionType = 'Theory')
      )
    ORDER BY VA.StudentRegNo, L.LectureDate, L.StartTime;
END //
DELIMITER ;

CALL Get_AttendanceByCourseCodeAndSessionType('ICT1233', 'Theory');
CALL Get_AttendanceByCourseCodeAndSessionType('ICT1233', 'Practical');
CALL Get_AttendanceByCourseCodeAndSessionType('ICT1233', 'Both');
