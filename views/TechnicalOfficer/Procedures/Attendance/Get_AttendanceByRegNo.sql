-- ==========================================================
-- Procedure Name : Get_AttendanceByRegNo
-- Description    : Displays detailed attendance records for a 
--                  specific student across all courses, including 
--                  lecture date, duration, status, and recorded staff.
-- Author         : [Your Name]
-- Date           : [Current Date]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByRegNo;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByRegNo(
    IN p_RegNo VARCHAR(15)
)
BEGIN
    SELECT *
    FROM View_CourseAttendance
    WHERE StudentID = p_RegNo
    ORDER BY CourseID, LectureDate;
END //

DELIMITER ;

CALL Get_AttendanceByRegNo('TG2020-002');