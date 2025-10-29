-- ==========================================================
-- Procedure Name : Get_AttendanceByRegNo
-- Description    : Retrieves all attendance records for a specific student 
--                  based on their registration number. Displays complete 
--                  lecture attendance history across all enrolled courses.
--
-- Parameters     : p_RegNo - The student's registration number to filter attendance records.
--
--
-- Author          : [TG1745 Himantha Poornika]
-- ==========================================================


DROP PROCEDURE IF EXISTS Get_AttendanceByRegNo;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByRegNo(
    IN p_RegNo VARCHAR(15)
)
BEGIN
    SELECT *
    FROM View_Attendance
    WHERE StudentRegNo = p_RegNo
    ORDER BY CourseID, LectureDate;
END //

DELIMITER ;

CALL Get_AttendanceByRegNo('TG2020-002');