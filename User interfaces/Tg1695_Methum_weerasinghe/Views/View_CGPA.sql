CREATE OR REPLACE VIEW View_CGPA AS
SELECT
    r.StudentRegNo,
    r.StudentName,
    r.Batch,
    ROUND(
        SUM(
            c.Credits *
            CASE 
                WHEN r.Grade = 'A+' THEN 4.0
                WHEN r.Grade = 'A'  THEN 4.0
                WHEN r.Grade = 'A-' THEN 3.7
                WHEN r.Grade = 'B+' THEN 3.3
                WHEN r.Grade = 'B'  THEN 3.0
                WHEN r.Grade = 'B-' THEN 2.7
                WHEN r.Grade = 'C+' THEN 2.3
                WHEN r.Grade = 'C'  THEN 2.0
                WHEN r.Grade = 'C-' THEN 1.7
                WHEN r.Grade = 'D'  THEN 1.3
                WHEN r.Grade = 'E'  THEN 0.0
                ELSE NULL
            END
        ) / SUM(c.Credits),
        2
    ) AS CGPA,
    SUM(c.Credits) AS TotalCredits,
    COUNT(*) AS TotalCourses
FROM View_Result AS r
JOIN Course AS c
  ON r.CourseCode = c.CourseCode
WHERE c.CourseCode != 'ENG1222'
  AND r.Grade NOT IN ('Not Eligible', 'Repeat')
  AND r.Grade IS NOT NULL
GROUP BY r.StudentRegNo, r.StudentName, r.Batch
ORDER BY r.StudentRegNo;


SELECT * FROM View_CGPA;
