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

    -- If not eligible, show message instead of final mark
    CASE
        WHEN eep.EndExamEligibility != 'Eligible to Sit End Exam' THEN NULL
        ELSE ROUND((eep.CATotal * 0.4) + (esa.ESAMark * 0.6), 2)
    END AS FinalMark,

    -- Grade (only if eligible)
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

    -- Message column for clarity
    CASE
        WHEN eep.EndExamEligibility != 'Eligible to Sit End Exam'
            THEN 'Not Eligible to Sit for End Exam (Failed CA or Attendance)'
        WHEN esa.ESAMark < 35
            THEN 'Failed ESA - Minimum 35% required'
        ELSE 'Eligible for Final Result'
    END AS ResultStatus

FROM View_EndExamParticipateEligibility AS eep
JOIN View_ESAMarks AS esa
  ON eep.StudentRegNo = esa.StudentRegNo
 AND eep.CourseCode = esa.CourseCode
ORDER BY eep.StudentRegNo, eep.CourseCode;
