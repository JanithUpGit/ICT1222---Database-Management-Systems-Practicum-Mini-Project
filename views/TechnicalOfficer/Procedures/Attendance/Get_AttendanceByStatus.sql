-- ==========================================================
-- Procedure Name : Get_AttendanceByStatus
-- Description    : Returns attendance rows filtered by status.
--                  When status='Medical', only shows lectures
--                  that are linked to an Approved medical for
--                  that student via MedicalParticipation.
-- Author         : [Your Name]
-- Date           : [2025/10/24]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_AttendanceByStatus;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByStatus(
    IN p_Status VARCHAR(20)   -- e.g., 'Medical', 'Present', 'Absent'
)
BEGIN
    SELECT 
        V.CourseID,
        V.CourseCode,
        V.CourseName,
        V.LectureID,
        V.LectureDate,
        V.DurationHours,
        V.StudentID,
        V.StudentName,
        V.SessionDate,
        V.Status,
        V.RecordedByName,
        M.MedicalID,
        M.ApprovalStatus
    FROM View_CourseAttendance V
    LEFT JOIN MedicalParticipation MP 
           ON MP.LectureID = V.LectureID
    LEFT JOIN Medicals M 
           ON M.MedicalID   = MP.MedicalID
          AND M.StudentRegNo = V.StudentID
          AND M.ApprovalStatus = 'Approved'
    WHERE LOWER(V.Status) = LOWER(p_Status)
      AND (LOWER(p_Status) <> 'medical' OR M.MedicalID IS NOT NULL)
    ORDER BY V.CourseID, V.LectureDate, V.StudentID;
END //
//
DELIMITER ;



CALL Get_AttendanceByStatus('Absent');