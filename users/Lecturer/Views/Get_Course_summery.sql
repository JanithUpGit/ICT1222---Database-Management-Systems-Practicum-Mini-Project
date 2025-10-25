CREATE OR REPLACE VIEW student_course_summary AS
SELECT 
    s.StudentRegNo AS RegNo,
    s.Batch,
    c.CourseID,
    c.CourseCode,
    c.CourseName,
    c.Credits,
    ROUND(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) / COUNT(a.AttendanceID) * 100, 2) AS AttendancePercentage,
    ROUND(AVG(m.MarksObtained), 2) AS AverageMarks,
    e.FinalEligibility AS EligibilityStatus
FROM student s
JOIN attendance a ON s.StudentRegNo = a.RegNo
JOIN lecture l ON a.LectureID = l.LectureID
JOIN course c ON l.CourseID = c.CourseID
LEFT JOIN marks m ON s.StudentRegNo = m.RegNo AND m.CourseID = c.CourseID
LEFT JOIN eligibility e ON s.StudentRegNo = e.RegNo AND e.CourseID = c.CourseID
GROUP BY s.StudentRegNo, s.Batch, c.CourseID, c.CourseCode, c.CourseName, c.Credits, e.FinalEligibility;


select * from student_course_summary;