CREATE OR REPLACE VIEW View_CAEligibility AS
SELECT
    c.StudentRegNo,
    c.StudentName,
    c.Batch,
    c.CourseCode,
    c.CourseName,
    c.CATotal,

    CASE
        WHEN c.CATotal >= 40 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS EligibilityStatus

FROM View_CATotalMarks AS c
ORDER BY c.StudentRegNo, c.CourseCode;
