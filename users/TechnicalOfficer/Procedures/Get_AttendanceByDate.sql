-- ==========================================================
-- Procedure Name : Get_AttendanceByDate
-- Description    : Displays attendance records for lectures 
--                  conducted between two given dates. Optionally 
--                  filters by a specific course ID.
-- Author         : [Your Name]
-- Date           : [Current Date]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByDate;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByDate(
    IN p_DateFrom DATE,
    IN p_DateTo   DATE,
    IN p_CourseID INT
)
BEGIN
    SELECT *
    FROM View_CourseAttendance
    WHERE LectureDate BETWEEN p_DateFrom AND p_DateTo
      AND (p_CourseID IS NULL OR CourseID = p_CourseID)
    ORDER BY CourseID, LectureDate, StudentID;
END //

DELIMITER ;

CALL Get_AttendanceByDate('2025-09-01','2025-10-31', NULL);   
CALL Get_AttendanceByDate('2025-09-01','2025-10-31', 2);