CREATE OR REPLACE VIEW View_CATotalMarks AS
SELECT
    m.MarkID,
    m.StudentRegNo,
    m.StudentName,
    m.Batch,
    m.CourseCode,
    m.CourseName,
    m.Assessment1,
    
    
    q.TopQuiz1,
    q.TopQuiz2,

    ROUND((q.TopQuiz1 + q.TopQuiz2) / 2, 2) AS AvgTopTwoQuizzes,


    CASE
        WHEN m.Mid_Theory IS NOT NULL AND m.Mid_Practical IS NOT NULL THEN ROUND((m.Mid_Theory + m.Mid_Practical) / 2, 2)
        WHEN m.Mid_Theory IS NOT NULL THEN m.Mid_Theory
        WHEN m.Mid_Practical IS NOT NULL THEN m.Mid_Practical
        ELSE NULL
    END AS MidMark,

    ROUND((
        ((q.TopQuiz1 + q.TopQuiz2) / 2)
        + m.Assessment1
        + (
            CASE
                WHEN m.Mid_Theory IS NOT NULL AND m.Mid_Practical IS NOT NULL THEN ROUND((m.Mid_Theory + m.Mid_Practical) / 2, 2)
                WHEN m.Mid_Theory IS NOT NULL THEN m.Mid_Theory
                WHEN m.Mid_Practical IS NOT NULL THEN m.Mid_Practical
                ELSE 0
            END
        )
    ) / 3, 2) AS CATotal

FROM View_Marks m
JOIN View_TopTwoQuizMarks q
  ON m.MarkID = q.MarkID;



SELECT * FROM View_CATotalMarks;
