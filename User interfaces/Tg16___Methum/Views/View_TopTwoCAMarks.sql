CREATE OR REPLACE VIEW View_TopTwoQuizMarks AS
SELECT
    m.MarkID,
    m.StudentRegNo,
    m.CourseCode,

    -- Highest quiz mark
    GREATEST(m.Quiz1, m.Quiz2, m.Quiz3) AS TopQuiz1,

    -- Second highest quiz mark
    GREATEST(
        LEAST(m.Quiz1, GREATEST(m.Quiz2, m.Quiz3)),
        LEAST(m.Quiz2, GREATEST(m.Quiz1, m.Quiz3)),
        LEAST(m.Quiz3, GREATEST(m.Quiz1, m.Quiz2))
    ) AS TopQuiz2

FROM Marks m;
 SELECT * FROM View_TopTwoCAMarks ;