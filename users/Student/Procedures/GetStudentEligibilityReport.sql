DROP PROCEDURE IF EXISTS GetStudentEligibilityReport;
DELIMITER $$
CREATE PROCEDURE GetStudentEligibilityReport(IN reg_no_param VARCHAR(15))
BEGIN
    SELECT
        RegNo,
        CourseCode,
        marks_of_best_two_quizes,
        Assesment_marks,
        mid_new,
        Final_CA,
        CA_Eligibility,
        end_new,
        END_Eligibility
    FROM
        Vw_FinalCA_Eligibility
    WHERE
        RegNo = reg_no_param
    ORDER BY
        CourseCode;
END$$
DELIMITER ;



CALL GetStudentEligibilityReport('TG2020-001');
-- To call the procedure, you can use: