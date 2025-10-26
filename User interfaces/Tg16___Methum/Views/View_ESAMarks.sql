CREATE OR REPLACE VIEW View_ESAMarks AS
SELECT
    v.MarkID,
    v.StudentRegNo,
    v.StudentName,
    v.Batch,
    v.CourseCode,
    v.CourseName,
    v.End_Theory,
    v.End_Practical,

    -- ESA Mark logic (same as Get_ESAMark)
    CASE
        WHEN v.End_Theory IS NOT NULL AND v.End_Practical IS NOT NULL
            THEN ROUND((v.End_Theory + v.End_Practical) / 2, 2)
        WHEN v.End_Theory IS NOT NULL
            THEN v.End_Theory
        WHEN v.End_Practical IS NOT NULL
            THEN v.End_Practical
        ELSE NULL
    END AS ESAMark

FROM View_Marks AS v;


SELECT * FROM View_ESAMarks;
