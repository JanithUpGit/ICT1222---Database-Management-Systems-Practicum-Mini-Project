-- ==========================================================
-- Procedure Name : Get_medicalsByName
-- Description    : Searches medical records by student's full name 
--                  using a case-insensitive, partial match. 
--                  Retrieves related course, lecture, and medical 
--                  details through the View_Medicals view.
--
-- Parameters     :
--      p_Name - The student's full or partial name to search for 
--               (case-insensitive).
--
-- Author         : [TG1702 Janith Uthpala]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByName;
DELIMITER //

CREATE PROCEDURE Get_medicalsByName(
    IN p_Name VARCHAR(100)
)
BEGIN
   
    IF p_Name IS NULL OR p_Name = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Search name cannot be NULL or empty.';
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
    WHERE LOWER(StudentName) LIKE CONCAT('%', LOWER(p_Name), '%')
    ORDER BY SubmittedDate DESC, StudentRegNo, StartDate;
END //
//
DELIMITER ;

CALL Get_medicalsByName('Anushka');
CALL Get_medicalsByName('Thilina');
CALL Get_medicalsByName('Menaka Madushani');
