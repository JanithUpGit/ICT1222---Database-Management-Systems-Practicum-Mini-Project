DROP PROCEDURE IF EXISTS Add_Medical;
DELIMITER //

CREATE PROCEDURE Add_Medical(
    IN p_StudentRegNo VARCHAR(15),
    IN p_StartDate    DATE,
    IN p_EndDate      DATE,
    IN p_DocumentPath VARCHAR(255),
    IN p_AutoMap      BOOLEAN  -- 1=also fill MedicalParticipation by date range, 0=skip
)
BEGIN
    DECLARE v_MedicalID INT;

    -- 1) Insert as Pending by default
    INSERT INTO Medicals (StudentRegNo, StartDate, EndDate, DocumentPath, ApprovalStatus)
    VALUES (p_StudentRegNo, p_StartDate, p_EndDate, p_DocumentPath, 'Pending');

    SET v_MedicalID = LAST_INSERT_ID();

    -- 2) Optionally link all lectures in the date range
    IF p_AutoMap THEN
        INSERT IGNORE INTO MedicalParticipation (MedicalID, LectureID)
        SELECT v_MedicalID, L.LectureID
        FROM Lecture L
        WHERE L.LectureDate BETWEEN p_StartDate AND p_EndDate;
    END IF;

    -- Return the created record
    SELECT v_MedicalID AS MedicalID,
           p_StudentRegNo AS StudentRegNo,
           p_StartDate AS StartDate,
           p_EndDate   AS EndDate,
           'Pending'   AS ApprovalStatus,
           'Medical created successfully' AS Message;
END //
//
DELIMITER ;
