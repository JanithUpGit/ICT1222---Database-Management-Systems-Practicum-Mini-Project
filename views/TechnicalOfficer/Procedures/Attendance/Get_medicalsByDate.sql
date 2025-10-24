-- ==========================================================
-- Procedure Name : Get_medicalsByDate
-- Description    : Retrieves all medical records submitted 
--                  within a given date range (based on StartDate 
--                  and EndDate). Optionally filters by course ID.
-- Author         : [Janith Uthpala]
-- Date           : [2025/10/24]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByDate;
DELIMITER //

CREATE PROCEDURE Get_medicalsByDate(
    IN p_Start DATE,
    IN p_End   DATE
)
BEGIN
    SELECT 
        M.MedicalID,
        M.StudentRegNo,
        CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
        M.StartDate,
        M.EndDate,
        M.SubmittedDate,
        M.DocumentPath,
        M.ApprovalStatus
    FROM Medicals M
    JOIN Student S ON S.StudentRegNo = M.StudentRegNo
    JOIN Users U ON U.Id = S.UserID
    WHERE (M.StartDate BETWEEN p_Start AND p_End)
       OR (M.EndDate BETWEEN p_Start AND p_End)
    ORDER BY M.StartDate DESC;
END //

DELIMITER ;
