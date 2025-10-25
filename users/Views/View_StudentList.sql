CREATE OR REPLACE VIEW course_student_list_view AS
SELECT 
    c.CourseID,
    c.CourseCode,
    c.CourseName,
    s.StudentRegNo,
    s.Batch
FROM course c
JOIN marks m ON m.CourseID = c.CourseID
JOIN student s ON s.StudentRegNo = m.RegNo
GROUP BY c.CourseID, s.StudentRegNo;





SELECT *
FROM course_student_list_view
WHERE CourseCode = 'ICT1212';