-- ==========================================================
-- View Name  : View_StudentCourseAttendance
-- Description: Per-student summary per course (uses View_Attendance,
--              which already marks sessions as 'Medical' when applicable).
--              Includes TotalCourseHours, AttendedHours, %
--              and Eligibility (>= 80% -> 'Eligible').
-- Author     : [janith Uthpala]
-- Date       : [2025/10/24]
-- ==========================================================

DROP VIEW IF EXISTS View_StudentCourseAttendance;

CREATE VIEW View_StudentCourseAttendance AS
SELECT
    T.StudentID,
    T.StudentName,
    T.CourseID,
    T.CourseCode,
    T.CourseName,
    T.TotalCourseHours,
    T.AttendedHours,
    T.AttendancePercentage,
    CASE
        WHEN T.TotalCourseHours > 0
             AND (100.0 * T.AttendedHours / T.TotalCourseHours) >= 80
        THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility
FROM (
    SELECT
        VA.StudentID,
        VA.StudentName,
        VA.CourseID,
        VA.CourseCode,
        VA.CourseName,
        IFNULL(SUM(VA.DurationHours), 0) AS TotalCourseHours,
        IFNULL(SUM(CASE WHEN VA.Status IN ('Present','Medical')
                        THEN VA.DurationHours ELSE 0 END), 0) AS AttendedHours,
        CASE 
            WHEN IFNULL(SUM(VA.DurationHours),0) > 0 THEN
                ROUND(
                    100 * SUM(CASE WHEN VA.Status IN ('Present','Medical')
                                   THEN VA.DurationHours ELSE 0 END)
                        / SUM(VA.DurationHours)
                , 2)
            ELSE 0
        END AS AttendancePercentage
    FROM View_Attendance VA
    GROUP BY
        VA.StudentID, VA.StudentName,
        VA.CourseID, VA.CourseCode, VA.CourseName
) AS T
ORDER BY T.StudentID, T.CourseID;

-- Quick sanity check
SELECT * FROM View_StudentCourseAttendance
ORDER BY StudentID, CourseID
LIMIT 50;
