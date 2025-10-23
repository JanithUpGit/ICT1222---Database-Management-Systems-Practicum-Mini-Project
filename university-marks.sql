CREATE OR REPLACE VIEW vw_ca_by_course_student AS
SELECT
  m.RegNo,
  c.CourseID,
  c.CourseCode,
  c.CourseName,
  MAX(CASE WHEN m.ExamType='Quiz'           THEN m.MarksObtained END) AS Quiz,
  MAX(CASE WHEN m.ExamType='Assessment'     THEN m.MarksObtained END) AS Assessment,
  MAX(CASE WHEN m.ExamType='Mid Theory'     THEN m.MarksObtained END) AS MidTheory,
  MAX(CASE WHEN m.ExamType='Mid Practical'  THEN m.MarksObtained END) AS MidPractical,
  ROUND((
      COALESCE(MAX(CASE WHEN m.ExamType='Quiz'          THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Assessment'    THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Mid Theory'    THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Mid Practical' THEN m.MarksObtained END), 0)
  ) /
  NULLIF(
      (CASE WHEN MAX(CASE WHEN m.ExamType='Quiz'          THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Assessment'    THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Mid Theory'    THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Mid Practical' THEN 1 END) IS NULL THEN 0 ELSE 1 END)
  ,0), 2) AS CA_Marks,
  CASE 
    WHEN ROUND((
      COALESCE(MAX(CASE WHEN m.ExamType='Quiz'          THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Assessment'    THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Mid Theory'    THEN m.MarksObtained END), 0) +
      COALESCE(MAX(CASE WHEN m.ExamType='Mid Practical' THEN m.MarksObtained END), 0)
    ) /
    NULLIF(
      (CASE WHEN MAX(CASE WHEN m.ExamType='Quiz'          THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Assessment'    THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Mid Theory'    THEN 1 END) IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN MAX(CASE WHEN m.ExamType='Mid Practical' THEN 1 END) IS NULL THEN 0 ELSE 1 END)
    ,0), 2) >= 40 THEN 'Eligible'
    ELSE 'Not Eligible'
  END AS CA_Eligibility
FROM Marks m
JOIN Course c ON c.CourseID = m.CourseID
GROUP BY m.RegNo, c.CourseID, c.CourseCode, c.CourseName;