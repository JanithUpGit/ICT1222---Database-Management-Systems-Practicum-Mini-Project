-- ==========================================================
-- Procedure Name : Get_medicalsByCourseCode
-- Description    : Retrieves medical records linked to a specific course 
--                  using the View_Medicals view. Displays student details, 
--                  course information, lecture coverage, and medical 
--                  approval status.
--
-- Parameters     :
--      p_CourseCode - The course code to retrieve related medical records for.
--
-- Author          : [TG1702 Janith Uthpala]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByCourseCode;
DELIMITER //

CREATE PROCEDURE Get_medicalsByCourseCode(
    IN p_CourseCode VARCHAR(10)
)
BEGIN

    IF p_CourseCode IS NULL OR p_CourseCode = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Course code cannot be NULL or empty.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Course WHERE CourseCode = p_CourseCode) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid CourseCode: No matching course found.';
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
    WHERE CourseCode = p_CourseCode
    ORDER BY StudentRegNo, StartDate, LectureDate;
END //
//
DELIMITER ;

CALL Get_medicalsByCourseCode('ICT1212');
CALL Get_medicalsByCourseCode('ICT1222');
