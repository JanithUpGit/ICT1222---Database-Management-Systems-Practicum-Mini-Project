DROP PROCEDURE IF EXISTS Update_MedicalApproval;
DELIMITER //

CREATE PROCEDURE Update_MedicalApproval(
    IN p_MedicalID INT,
    IN p_Status VARCHAR(10)   -- 'Pending' | 'Approved' | 'Rejected'
)
BEGIN
    DECLARE v_status VARCHAR(10);

    -- Normalize and validate input status
    SET v_status = UPPER(TRIM(p_Status));
    IF v_status NOT IN ('PENDING','APPROVED','REJECTED') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid status. Use Pending, Approved, or Rejected';
    END IF;

    -- Check existence of the medical record
    IF (SELECT COUNT(*) FROM Medicals WHERE MedicalID = p_MedicalID) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'MedicalID not found';
    END IF;

    -- Update status (map normalized text back to enum-cased values)
    UPDATE Medicals
    SET ApprovalStatus =
        CASE v_status
            WHEN 'PENDING'  THEN 'Pending'
            WHEN 'APPROVED' THEN 'Approved'
            WHEN 'REJECTED' THEN 'Rejected'
        END
    WHERE MedicalID = p_MedicalID;

    -- Return confirmation
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
//
DELIMITER ;


CALL Update_MedicalApproval(3, 'Approved');
CALL Update_MedicalApproval(3, 'Rejected');
CALL Update_MedicalApproval(3, 'Pending');
