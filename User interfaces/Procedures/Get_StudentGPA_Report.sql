DROP PROCEDURE IF EXISTS GetStudentGPA_Report;
DELIMITER $$
CREATE PROCEDURE GetStudentGPA_Report(IN reg_no_param VARCHAR(15))
BEGIN
    SELECT 
        student_id AS RegNo,
        CGPA AS SGPA,  -- Aliasing CGPA as SGPA
        CGPA         -- Keeping CGPA
    FROM 
        CGPA_check     -- Using the CGPA view you created
    WHERE 
        student_id = reg_no_param;
END$$
DELIMITER ;





CALL GetStudentGPA_Report('TG2020-001');

-- To call the procedure, you can use: