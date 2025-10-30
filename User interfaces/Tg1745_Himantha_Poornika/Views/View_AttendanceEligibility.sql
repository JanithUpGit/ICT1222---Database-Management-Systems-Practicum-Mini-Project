CREATE OR REPLACE VIEW View_AttendanceEligibility AS
SELECT
    s.StudentRegNo,
    CONCAT(u.FirstName, ' ', u.LastName) AS StudentName,
    s.Status AS StudentStatus,  
    c.CourseCode,
    c.CourseName,

    COUNT(DISTINCT a.LectureID) AS TotalLectures,

    SUM(
        CASE 
            WHEN a.Status IN ('Present', 'Medical') THEN 1 
            ELSE 0 
        END
    ) AS AttendedLectures,

    ROUND(
        CASE 
            WHEN COUNT(DISTINCT a.LectureID) = 0 THEN 0
            ELSE (
                SUM(CASE WHEN a.Status IN ('Present', 'Medical') THEN 1 ELSE 0 END)
                / COUNT(DISTINCT a.LectureID)
            ) * 100
        END, 2
    ) AS AttendancePercent,

    CASE
        WHEN s.Status = 'Repeat' THEN 'Eligible' 
        WHEN COUNT(DISTINCT a.LectureID) = 0 THEN 'Not Eligible'
        WHEN (
            SUM(CASE WHEN a.Status IN ('Present', 'Medical') THEN 1 ELSE 0 END)
            / COUNT(DISTINCT a.LectureID)
        ) * 100 >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS AttendanceEligibility

FROM Student s
JOIN Users u ON s.UserID = u.Id
CROSS JOIN Course c
LEFT JOIN View_Attendance a
  ON a.StudentRegNo = s.StudentRegNo
  AND a.CourseCode = c.CourseCode

GROUP BY 
    s.StudentRegNo,
    s.Status,
    u.FirstName,
    u.LastName,
    c.CourseCode,
    c.CourseName

ORDER BY 
    s.StudentRegNo,
    c.CourseCode;
