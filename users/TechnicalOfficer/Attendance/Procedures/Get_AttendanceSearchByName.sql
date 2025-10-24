-- ==========================================================
-- Procedure Name : Get_AttendanceSearchByName
-- Description    : Allows searching attendance records by 
--                  student name (case-insensitive partial match). 
--                  Returns all related course and lecture details.
-- Author         : [Your Name]
-- Date           : [Current Date]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceSearchByName;
DELIMITER //

CREATE PROCEDURE Get_AttendanceSearchByName(
    IN p_Name VARCHAR(100)
)
BEGIN
    SELECT *
    FROM View_Attendance
    WHERE LOWER(StudentName) LIKE CONCAT('%', LOWER(p_Name), '%')
    ORDER BY CourseID, LectureDate, StudentID;
END //

DELIMITER ;
CALL Get_AttendanceSearchByName('anushka');