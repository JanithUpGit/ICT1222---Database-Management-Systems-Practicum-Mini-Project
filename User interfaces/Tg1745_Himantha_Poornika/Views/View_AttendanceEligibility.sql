CREATE OR REPLACE VIEW View_AttendanceEligibility AS
SELECT
    a.StudentRegNo,
    a.StudentName,
    a.CourseCode,
    a.CourseName,

    -- Total number of lectures for each course
    COUNT(DISTINCT a.LectureID) AS TotalLectures,

    -- Count of lectures attended (Present or Medical)
    SUM(CASE 
        WHEN a.Status IN ('Present', 'Medical') THEN 1 
        ELSE 0 
    END) AS AttendedLectures,

    -- Attendance percentage
    ROUND(
        (SUM(CASE WHEN a.Status IN ('Present', 'Medical') THEN 1 ELSE 0 END) 
         / COUNT(DISTINCT a.LectureID)) * 100, 2
    ) AS AttendancePercent,

    -- Eligibility rule (80% or higher)
    CASE
        WHEN (SUM(CASE WHEN a.Status IN ('Present', 'Medical') THEN 1 ELSE 0 END) 
              / COUNT(DISTINCT a.LectureID)) * 100 >= 80 
        THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS AttendanceEligibility

FROM View_Attendance AS a
GROUP BY 
    a.StudentRegNo,
    a.StudentName,
    a.CourseCode,
    a.CourseName
ORDER BY 
    a.StudentRegNo,
    a.CourseCode;



SELECT * FROM View_AttendanceEligibility;
