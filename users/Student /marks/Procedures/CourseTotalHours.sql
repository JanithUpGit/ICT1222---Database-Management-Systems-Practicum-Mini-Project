DROP VIEW IF EXISTS View_CourseTotalHours;

CREATE VIEW View_CourseTotalHours AS
SELECT
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    IFNULL(SUM(L.DurationHours), 0) AS TotalDurationHours
FROM Course C
LEFT JOIN Lecture L ON C.CourseID = L.CourseID
GROUP BY C.CourseID, C.CourseCode, C.CourseName;
