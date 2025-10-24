-- ==========================================================
-- Procedure Name : Get_medicalsByCourseId
-- Description    : Displays medical records linked to a specific 
--                  course via the Lecture and MedicalParticipation 
--                  tables.
-- Author         : [Janith Uthpala]
-- Date           : [2025/10/24]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByCourseId;
DELIMITER //

CREATE PROCEDURE Get_medicalsByCourseId(
    IN p_CourseID INT
)
BEGIN
    SELECT 
        DISTINCT M.MedicalID,
        M.StudentRegNo,
        CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
        C.CourseID,
        C.CourseCode,
        C.CourseName,
        M.StartDate,
        M.EndDate,
        M.SubmittedDate,
        M.ApprovalStatus
    FROM Medicals M
    JOIN Student S ON S.StudentRegNo = M.StudentRegNo
    JOIN Users U ON U.Id = S.UserID
    JOIN MedicalParticipation MP ON MP.MedicalID = M.MedicalID
    JOIN Lecture L ON L.LectureID = MP.LectureID
    JOIN Course C ON C.CourseID = L.CourseID
    WHERE C.CourseID = p_CourseID
    ORDER BY M.SubmittedDate DESC, M.StudentRegNo;
END //

DELIMITER ;
