-- ==========================================================
-- Procedure Name : Update_MedicalApproval
-- Description    : Updates the approval status of a medical record 
--                  in the Medicals table. Only accepts exact status 
--                  values ('Pending', 'Approved', or 'Rejected').
--
-- Parameters     :
--      p_MedicalID - The MedicalID of the record to update.
--      p_Status    - The new approval status ('Pending', 'Approved', 'Rejected').
--
-- Author          : [TG1702 Janith Uthpala]

-- ==========================================================

DROP PROCEDURE IF EXISTS Update_MedicalStatusByMedicalIDAndMStatus;
DELIMITER //

CREATE PROCEDURE Update_MedicalStatusByMedicalIDAndMStatus(
    IN p_MedicalID INT,
    IN p_Status VARCHAR(10)  
)
BEGIN

    IF p_Status NOT IN ('Pending', 'Approved', 'Rejected') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid status. Use exactly: Pending, Approved, or Rejected.';
    END IF;


    IF NOT EXISTS (SELECT 1 FROM Medicals WHERE MedicalID = p_MedicalID) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'MedicalID not found.';
    END IF;

    UPDATE Medicals
    SET ApprovalStatus = p_Status
    WHERE MedicalID = p_MedicalID;

    SELECT 
        M.MedicalID,
        M.StudentRegNo,
        CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
        M.StartDate,
        M.EndDate,
        M.SubmittedDate,
        M.DocumentPath,
        M.ApprovalStatus AS NewStatus
    FROM Medicals M
    JOIN Student S ON S.StudentRegNo = M.StudentRegNo
    JOIN Users U   ON U.Id = S.UserID
    WHERE M.MedicalID = p_MedicalID;
END //
DELIMITER ;

CALL Update_MedicalStatusByMedicalIDAndMStatus(3, 'Approved');
CALL Update_MedicalStatusByMedicalIDAndMStatus(3, 'Rejected');
CALL Update_MedicalStatusByMedicalIDAndMStatus(3, 'Pending');
