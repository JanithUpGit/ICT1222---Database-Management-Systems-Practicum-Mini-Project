CREATE OR REPLACE VIEW Vw_FinalStudentMarks_WithEligibility AS
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
                    -- Cast the numeric sum to a CHAR to match the text fields
                    CAST((Final_CA + end_new) AS CHAR(10))
                ELSE 'ESA Fail'
            END
        ELSE 'CA Fail'
    END AS Final_Marks
FROM 
    Vw_FinalCA_Eligibility;
