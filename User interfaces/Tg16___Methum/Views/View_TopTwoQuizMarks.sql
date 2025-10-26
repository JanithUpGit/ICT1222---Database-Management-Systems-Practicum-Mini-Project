



-- ==========================================================
-- View Name        : View_TopTwoQuizMarks
-- Description      : Calculates the highest (TopQuiz1) and second highest
--                    (TopQuiz2) quiz marks for each student in each
--                    course from the Marks table.
--
-- Tables Used      : Marks
--
-- Author           : [TG1695 Methum Weerasinghe]
-- ==========================================================


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

-- ✅ Correct view name here:
SELECT * FROM View_TopTwoQuizMarks;
