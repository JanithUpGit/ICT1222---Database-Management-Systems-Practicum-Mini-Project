-- ==========================================================
-- Procedure Name : Get_medicalsByName
-- Description    : Searches medical records by student's full 
--                  name (case-insensitive, partial match).
-- Author         : [Janith Uthpala]
-- Date           : [2025/10/24]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_medicalsByName;
DELIMITER //

CREATE PROCEDURE Get_medicalsByName(
    IN p_Name VARCHAR(100)
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
    WHERE LOWER(CONCAT(U.FirstName, ' ', U.LastName)) LIKE CONCAT('%', LOWER(p_Name), '%')
    ORDER BY M.SubmittedDate DESC;
END //

DELIMITER ;
