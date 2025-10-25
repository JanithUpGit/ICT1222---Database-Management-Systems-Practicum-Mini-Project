CREATE OR REPLACE VIEW student_exam_marks_view AS
SELECT 
    s.StudentRegNo,
    s.Batch,
    c.CourseCode,
    c.CourseName,
    m.ExamName,
    m.MarksObtained,
    m.RecordedDate,
    m.Remarks
FROM marks m
JOIN student s ON m.RegNo = s.StudentRegNo
JOIN course c ON m.CourseID = c.CourseID;




-- MidExam marks
SELECT *
FROM student_exam_marks_view
WHERE ExamName = 'MidExam'
  AND StudentRegNo = 'TG2019-015'
  AND CourseCode = 'ICT1212';

  
-- Quiz marks
SELECT *
FROM student_exam_marks_view
WHERE ExamName = 'Quiz'
  AND StudentRegNo = 'TG2019-015'
  AND CourseCode = 'ICT1212';

  
-- Assessment marks
SELECT *
FROM student_exam_marks_view
WHERE ExamName = 'Assessment'
  AND StudentRegNo = 'TG2019-015'
  AND CourseCode = 'ICT1212';

  
-- FinalExam marks
SELECT *
FROM student_exam_marks_view
WHERE ExamName = 'FinalExam'
  AND StudentRegNo = 'TG2019-015'
  AND CourseCode = 'ICT1212';