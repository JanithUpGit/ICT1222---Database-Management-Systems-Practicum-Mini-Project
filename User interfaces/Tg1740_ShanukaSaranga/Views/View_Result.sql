CREATE OR REPLACE VIEW View_Result AS
SELECT
    eep.StudentRegNo,
    eep.StudentName,
    eep.Batch,
    eep.CourseCode,
    eep.CourseName,
    eep.CATotal,
    eep.AttendancePercent,
    eep.EndExamEligibility,
    esa.ESAMark,

    CASE
        WHEN eep.EndExamEligibility != 'Eligible to Sit End Exam' THEN NULL
        ELSE ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2)
    END AS FinalMark,

    CASE
        WHEN eep.EndExamEligibility != 'Eligible to Sit End Exam' THEN 'Not Eligible'
        WHEN esa.ESAMark < 35 THEN 'F'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) >= 85 THEN 'A'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) >= 75 THEN 'B+'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) >= 65 THEN 'B'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) >= 55 THEN 'C'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) >= 40 THEN 'D'
        ELSE 'F'
    END AS Grade,

    CASE
        WHEN eep.EndExamEligibility != 'Eligible to Sit End Exam'
            THEN 'Repeat (Failed CA or Attendance Eligibility)'
        WHEN esa.ESAMark < 35
            THEN 'Repeat (Failed ESA - Minimum 35% Required)'
        WHEN ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2) IS NULL
            THEN 'Repeat (No Result Available)'
        ELSE 'Eligible for Final Result'
    END AS ResultStatus

FROM View_EndExamParticipateEligibility AS eep
JOIN View_ESAMarks AS esa
  ON eep.StudentRegNo = esa.StudentRegNo
 AND eep.CourseCode = esa.CourseCode
ORDER BY eep.StudentRegNo, eep.CourseCode;

select * from View_Result;