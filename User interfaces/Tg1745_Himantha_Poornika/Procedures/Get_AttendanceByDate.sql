-- ==========================================================
-- Procedure Name : Get_AttendanceByDate
-- Description    : Displays attendance records for lectures conducted
--                  between two given dates. Optionally filters by a
--                  specific course code if provided.
--
-- Parameters     :
--      p_DateFrom   - Start date for filtering lecture attendance.
--      p_DateTo     - End date for filtering lecture attendance.
--      p_CourseCode - (Optional) Course code to limit the result set.
--
-- Author          : [TG1745 Himantha Poornika]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByDate;

DELIMITER //

CREATE PROCEDURE Get_AttendanceByDate(
    IN p_DateFrom   DATE,
    IN p_DateTo     DATE,
    IN p_CourseCode VARCHAR(10)
)
BEGIN

    IF p_DateFrom IS NULL OR p_DateTo IS NULL OR p_DateFrom > p_DateTo THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid date range: DateFrom must be before or equal to DateTo.';
    END IF;

    SELECT
        StudentRegNo,
        StudentName,
        CourseID,
        CourseCode,
        CourseName,
        LectureID,
        LectureDate,
        DurationHours,
        Status,
        RecordedByName
    FROM View_Attendance
    WHERE LectureDate BETWEEN p_DateFrom AND p_DateTo
      AND (p_CourseCode IS NULL OR CourseCode = p_CourseCode)
    ORDER BY CourseCode, LectureDate, StudentRegNo;
END //
//
DELIMITER;

CALL Get_AttendanceByDate ( '2025-09-01', '2025-10-31', NULL );

CALL Get_AttendanceByDate ( '2025-09-01', '2025-10-31', 'ICT1212' );
