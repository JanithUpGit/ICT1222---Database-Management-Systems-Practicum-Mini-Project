-- ==========================================================
-- Procedure Name : Get_AttendanceByCourseCode
-- Description    : Retrieves detailed attendance records for a specific
--                  course, including student details, lecture information,
--                  duration, attendance status, and the staff member
--                  who recorded it.
--
-- Parameters     :
--      p_CourseCode - The course code to filter attendance records.
--
-- Notes           :
--      - Works directly with the existing View_Attendance (10 columns).
--      - Results are ordered by lecture date and student registration number.
--      - Throws an error if the provided course code does not exist.
--
-- Author          : [TG1702 Janith Uthpala]
-- Date Created    : [2025-10-26]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByCourseCode;

DELIMITER //

CREATE PROCEDURE Get_AttendanceByCourseCode(
    IN p_CourseCode VARCHAR(10)
)
BEGIN
   
    IF p_CourseCode IS NULL OR p_CourseCode = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Course code cannot be NULL or empty.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseCode = p_CourseCode) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid CourseCode: No matching course found.';
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
    WHERE CourseCode = p_CourseCode
    ORDER BY LectureDate, StudentRegNo;
END //
//

DELIMITER;

CALL Get_AttendanceByCourseCode ('ICT1212');

CALL Get_AttendanceByCourseCode ('ICT1222');