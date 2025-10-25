CREATE OR REPLACE VIEW Vw_FinalCA_Eligibility AS
WITH CombinedMarks AS (
    -- Step 1: Get the marks from the detailed view and create single 'mid' and 'end' marks
    SELECT
        RegNo,
        CourseCode,
        Quiz1,
        Quiz2,
        Quiz3,
        Assessment,
        -- This logic averages theory/practical if both exist, or just takes the one available
        (Mid_Theory + Mid_Practical) / (CASE WHEN Mid_Theory > 0 AND Mid_Practical > 0 THEN 2 ELSE 1 END) AS mid,
        (Final_Theory + Final_Practical) / (CASE WHEN Final_Theory > 0 AND Final_Practical > 0 THEN 2 ELSE 1 END) AS end
    FROM
        Vw_StudentMarkSheet -- This must be the view that uses 0.00 for NULLs
)
-- Step 2: Apply your weighting and eligibility formulas, now with formatting
SELECT
    RegNo,
    CourseCode,
    
    -- CA calculation logic, formatted to 2 decimal places
    CAST((((Quiz1 + Quiz2 + Quiz3) - LEAST(Quiz1, Quiz2, Quiz3)) * 0.10) AS DECIMAL(5, 2)) AS marks_of_best_two_quizes,
    CAST((Assessment * 0.05) AS DECIMAL(5, 2)) AS Assesment_marks,
    CAST((mid * 0.20) AS DECIMAL(5, 2)) AS mid_new,
    
    -- Final CA calculation, formatted
    CAST(( (((Quiz1 + Quiz2 + Quiz3) - LEAST(Quiz1, Quiz2, Quiz3)) * 0.10) + (Assessment * 0.05) + (mid * 0.20) ) AS DECIMAL(5, 2)) AS Final_CA,
    
    -- CA Eligibility rule
    CASE
        WHEN ( (((Quiz1 + Quiz2 + Quiz3) - LEAST(Quiz1, Quiz2, Quiz3)) * 0.10) + (Assessment * 0.05) + (mid * 0.20) ) >= 16 THEN 'EL'
        ELSE 'Not Eligible'
    END AS CA_Eligibility,
    
    -- Final Exam calculation, formatted
    CAST((end * 0.6) AS DECIMAL(5, 2)) AS end_new,
    
    -- Final Exam Eligibility rule
    CASE
        WHEN (end * 0.6) >= 21 THEN 'ESA PASS'
        ELSE 'ESA FAIL'
    END AS END_Eligibility
FROM
    CombinedMarks
ORDER BY
    RegNo ASC;
