
-- ==========================================================
-- View Name  : View_StudentCourseAttendance
-- Description: Displays each student's attendance summary 
--              for every course, including total lecture hours, 
--              attended hours (Present/Medical), and attendance percentage.
-- Author     : [janith Uthpala]
-- Date       : [2023/10/24]
-- ==========================================================

DROP VIEW IF EXISTS View_StudentCourseAttendance;

CREATE VIEW View_StudentCourseAttendance AS
SELECT
    ST.StudentRegNo AS StudentID,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    IFNULL(SUM(L.DurationHours), 0) AS TotalCourseHours,
    IFNULL(SUM(CASE WHEN A.Status IN ('Present','Medical') THEN L.DurationHours ELSE 0 END), 0) AS AttendedHours,
    CASE 
        WHEN IFNULL(SUM(L.DurationHours),0) > 0 THEN
            ROUND(SUM(CASE WHEN A.Status IN ('Present','Medical') THEN L.DurationHours ELSE 0 END)/SUM(L.DurationHours)*100, 2)
        ELSE 0
    END AS AttendancePercentage
FROM Student ST
JOIN Users U ON ST.UserID = U.Id
JOIN Attendance A ON A.RegNo = ST.StudentRegNo
JOIN Lecture L ON A.LectureID = L.LectureID
JOIN Course C ON L.CourseID = C.CourseID
GROUP BY ST.StudentRegNo, StudentName, C.CourseID, C.CourseCode, C.CourseName
ORDER BY ST.StudentRegNo, C.CourseID;

SELECT * FROM View_StudentCourseAttendance;
