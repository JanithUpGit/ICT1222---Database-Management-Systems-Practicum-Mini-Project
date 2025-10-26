-- ==========================================================
-- Procedure Name : Get_MedicalsByStatus
-- Description    : Retrieves all medical attendance records
--                  filtered by a given medical approval status
--                  (e.g., 'Approved', 'Pending', 'Rejected').
-- Author         : [Janith Uthpala]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_MedicalsByStatus;
DELIMITER //

CREATE PROCEDURE Get_MedicalsByStatus(
    IN p_Status VARCHAR(20)
)
BEGIN
    SELECT *
    FROM View_Medicals
    WHERE ApprovalStatus = p_Status
    ORDER BY StudentRegNo, LectureDate;
END //

DELIMITER ;

CALL Get_MedicalsByStatus('Approved');
CALL Get_MedicalsByStatus('Rejected');
CALL Get_MedicalsByStatus('Pending');