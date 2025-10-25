-- ==========================================================
-- Procedure Name : Get_AttendanceByCourseID
-- Description    : Retrieves detailed attendance data for all 
--                  students in a given course, showing each 
--                  lecture’s attendance records.
-- Author         : [Your Name]
-- Date           : [Current Date]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByCourseID;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByCourseID(
    IN p_CourseID INT
)
BEGIN
    SELECT *
    FROM View_Attendance
    WHERE CourseID = p_CourseID
    ORDER BY LectureDate, StudentID;
END //

DELIMITER ;

CALL Get_AttendanceByCourseID(2);