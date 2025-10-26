-- ==========================================================
-- Procedure Name : Search_AttendanceByName
-- Description    : Searches and retrieves attendance records for students 
--                  whose names partially or fully match the given search term. 
--                  The search is case-insensitive and returns attendance 
--                  details across all courses.
--
-- Parameters     :
--      p_Name - The full or partial student name to search for (case-insensitive).
--
-- Author          : [TG1702 Janith Uthpala]
-- ==========================================================

DROP PROCEDURE IF EXISTS Search_AttendanceByName;
DELIMITER //

CREATE PROCEDURE Search_AttendanceByName(
    IN p_Name VARCHAR(100)
)
BEGIN
    SELECT *
    FROM View_Attendance
    WHERE LOWER(StudentName) LIKE CONCAT('%', LOWER(p_Name), '%')
    ORDER BY CourseID, LectureDate, StudentRegNo;
END //

DELIMITER ;
CALL Search_AttendanceByName('anushka');