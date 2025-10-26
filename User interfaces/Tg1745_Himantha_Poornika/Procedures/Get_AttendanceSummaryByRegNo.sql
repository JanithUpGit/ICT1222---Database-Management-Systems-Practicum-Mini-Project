-- ==========================================================
-- Procedure Name : Get_AttendanceSummaryByRegNo
-- Description    : Returns attendance summary for a given student
--                  using View_StudentCourseAttendance:
--                  (1) Per-course breakdown with eligibility
--                  (2) Overall weighted totals across courses
-- Author         : [Himantha Poornika]
-- Date           : [2025/10/24]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceSummaryByRegNo;
DELIMITER //

CREATE PROCEDURE Get_AttendanceSummaryByRegNo(
    IN p_RegNo VARCHAR(15)
)
BEGIN

    SELECT
        StudentID,
        StudentName,
        CourseID,
        CourseCode,
        CourseName,
        TotalCourseHours,
        AttendedHours,
        AttendancePercentage,
        Eligibility
    FROM View_StudentCourseAttendance
    WHERE StudentID = p_RegNo
    ORDER BY CourseCode, CourseID;

    SELECT
        p_RegNo AS StudentID,
        MAX(StudentName) AS StudentName,
        IFNULL(SUM(TotalCourseHours), 0)  AS TotalHoursAllCourses,
        IFNULL(SUM(AttendedHours), 0)     AS AttendedHoursAllCourses,
        CASE 
            WHEN IFNULL(SUM(TotalCourseHours), 0) > 0 THEN
                ROUND(100 * SUM(AttendedHours) / SUM(TotalCourseHours), 2)
            ELSE 0
        END AS OverallAttendancePercentage,
        SUM(CASE WHEN Eligibility = 'Eligible' THEN 1 ELSE 0 END) AS EligibleCourseCount,
        COUNT(*) AS CourseCount
    FROM View_StudentCourseAttendance
    WHERE StudentID = p_RegNo;
END //
//
DELIMITER ;


CALL Get_AttendanceSummaryByRegNo('TG2020-002');