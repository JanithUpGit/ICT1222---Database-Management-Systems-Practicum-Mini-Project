DROP PROCEDURE IF EXISTS GetStudentMarkSheetFormatted;
DELIMITER $$
CREATE PROCEDURE GetStudentMarkSheetFormatted(IN reg_no_param VARCHAR(15))
BEGIN
    SELECT
        CourseCode,
        Quiz1,
        Quiz2,
        Quiz3,
        Assessment,
        Mid_Theory,
        Mid_Practical,
        Final_Theory,
        Final_Practical
    FROM
        Vw_StudentMarkSheet -- This queries the specific view you provided
    WHERE
        RegNo = reg_no_param
    ORDER BY
        CourseCode;
END$$
DELIMITER ;

-- To call the procedure, you can use:
 CALL GetStudentMarkSheetFormatted('TG2020-001');