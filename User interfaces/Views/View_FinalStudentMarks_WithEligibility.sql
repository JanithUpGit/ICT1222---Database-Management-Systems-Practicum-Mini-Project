CREATE OR REPLACE VIEW View_FinalStudentMarks_WithEligibility AS
SELECT
    RegNo,
    CourseCode,
    CA_Eligibility,
    END_Eligibility,
    -- Apply your final mark logic
    CASE
        WHEN CA_Eligibility = 'EL' THEN
            CASE
                WHEN END_Eligibility = 'ESA PASS' THEN 
    
                    CAST((Final_CA + end_new) AS CHAR(10))
                ELSE 'ESA Fail'
            END
        ELSE 'CA Fail'
    END AS Final_Marks
FROM 
    View_FinalCA_Eligibility;
