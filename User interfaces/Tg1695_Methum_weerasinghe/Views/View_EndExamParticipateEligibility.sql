CREATE OR REPLACE VIEW View_EndExamParticipateEligibility AS
SELECT
    ca.StudentRegNo,
    ca.StudentName,
    ca.Batch,
    ca.CourseCode,
    ca.CourseName,
    
   
    ca.CATotal,
    ca.EligibilityStatus AS CAEligibility,

   
    att.AttendancePercent,
    att.AttendanceEligibility,


    CASE
        WHEN ca.EligibilityStatus = 'Eligible'
         AND att.AttendanceEligibility = 'Eligible'
        THEN 'Eligible to Sit End Exam'
        ELSE 'Not Eligible to Sit End Exam'
    END AS EndExamEligibility

FROM View_CAEligibility AS ca
JOIN View_AttendanceEligibility AS att
  ON ca.StudentRegNo = att.StudentRegNo
 AND ca.CourseCode = att.CourseCode

ORDER BY
    ca.StudentRegNo,
    ca.CourseCode;


SELECT * FROM View_EndExamParticipateEligibility;
