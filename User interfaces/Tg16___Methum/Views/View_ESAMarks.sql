-- ==========================================================
-- View Name        : View_ESAMarks
-- Description      : Creates a summary of End Semester Assessment (ESA) marks
--                    from the main 'View_Marks'. It calculates the final
--                    'ESAMark' by averaging the Theory and Practical marks
--                    if both exist, or by taking the single mark if only
--                    one exists.
--
-- Tables Used      : View_Marks (which joins Marks, Student, Users, Course, etc.)
--
-- Author           : [TG1695 Methum Weerasinghe]
-- ==========================================================









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
