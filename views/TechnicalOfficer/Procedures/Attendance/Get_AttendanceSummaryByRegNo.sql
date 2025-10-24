-- ==========================================================
-- Procedure Name : Get_AttendanceSummaryByRegNo
-- Description    : Returns a summarized attendance report for a 
--                  specific student, showing total course hours, 
--                  attended hours (Present/Medical), and overall 
--                  attendance percentage for each course.
-- Author         : [Your Name]
-- Date           : [Current Date]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceSummaryByRegNo;
DELIMITER //

CREATE PROCEDURE Get_AttendanceSummaryByRegNo(
    IN p_RegNo VARCHAR(15)
)
BEGIN
    SELECT
        CourseID,
        CourseCode,
        CourseName,
        SUM(DurationHours) AS TotalCourseHours,
        SUM(CASE WHEN Status IN ('Present','Medical') THEN DurationHours ELSE 0 END) AS AttendedHours,
        ROUND(
            CASE WHEN SUM(DurationHours) > 0
                 THEN SUM(CASE WHEN Status IN ('Present','Medical') THEN DurationHours ELSE 0 END)
                      / SUM(DurationHours) * 100
                 ELSE 0
            END, 2
        ) AS AttendancePercentage
    FROM View_CourseAttendance
    WHERE StudentID = p_RegNo
    GROUP BY CourseID, CourseCode, CourseName
    ORDER BY CourseID;
END //

DELIMITER ;

CALL Get_AttendanceSummaryByRegNo('TG2020-002');