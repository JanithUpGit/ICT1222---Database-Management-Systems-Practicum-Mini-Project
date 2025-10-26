-- ==========================================================
-- Procedure Name : Get_medicalsByDate
-- Description    : Retrieves all medical records submitted within 
--                  a given date range (based on StartDate and EndDate)
--                  using the View_Medicals view for simplified access 
--                  to student, course, and lecture information.
--
-- Parameters     :
--      p_Start - Start date of the range.
--      p_End   - End date of the range.
--
-- Author         : [TG1702 Janith Uthpala]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByDate;
DELIMITER //

CREATE PROCEDURE Get_medicalsByDate(
    IN p_Start DATE,
    IN p_End   DATE
)
BEGIN

    IF p_Start IS NULL OR p_End IS NULL OR p_Start > p_End THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid date range: Start must be before or equal to End date.';
    END IF;

    SELECT 
        MedicalID,
        StudentRegNo,
        StudentName,
        CourseCode,
        CourseName,
        LectureID,
        LectureDate,
        DurationHours,
        LectureSessionType,
        StartDate,
        EndDate,
        SubmittedDate,
        DocumentPath,
        ApprovalStatus
    FROM View_Medicals
    WHERE (StartDate BETWEEN p_Start AND p_End)
       OR (EndDate BETWEEN p_Start AND p_End)
    ORDER BY StartDate DESC, StudentRegNo;
END //
DELIMITER ;

CALL Get_medicalsByDate('2025-09-01', '2025-10-31');
CALL Get_medicalsByDate('2025-08-01', '2025-08-31');
