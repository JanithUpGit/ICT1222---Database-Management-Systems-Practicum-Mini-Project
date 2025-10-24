DROP PROCEDURE IF EXISTS Approve_Medical;
DELIMITER //

CREATE PROCEDURE Approve_Medical(
    IN p_MedicalID INT
)
BEGIN
    DECLARE v_StudentRegNo VARCHAR(15);
    DECLARE v_StartDate DATE;
    DECLARE v_EndDate   DATE;

    -- 1) Load the medical (and guard)
    SELECT StudentRegNo, StartDate, EndDate
      INTO v_StudentRegNo, v_StartDate, v_EndDate
    FROM Medicals
    WHERE MedicalID = p_MedicalID
    LIMIT 1;

    IF v_StudentRegNo IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Approve_Medical: MedicalID not found';
    END IF;

    -- 2) Ensure lecture mappings exist (safe if already present)
    INSERT IGNORE INTO MedicalParticipation (MedicalID, LectureID)
    SELECT p_MedicalID, L.LectureID
    FROM Lecture L
    WHERE L.LectureDate BETWEEN v_StartDate AND v_EndDate;

    -- 3) Approve it
    UPDATE Medicals
    SET ApprovalStatus = 'Approved'
    WHERE MedicalID = p_MedicalID;

    -- 4) Return a preview of covered lectures (nice for debugging/UI)
    SELECT 
        M.MedicalID, M.StudentRegNo, M.StartDate, M.EndDate, M.SubmittedDate,
        M.DocumentPath, M.ApprovalStatus,
        L.LectureID, L.LectureDate, L.DurationHours, L.SessionType,
        C.CourseID, C.CourseCode, C.CourseName
    FROM Medicals M
    JOIN MedicalParticipation MP ON MP.MedicalID = M.MedicalID
    JOIN Lecture L ON L.LectureID = MP.LectureID
    JOIN Course  C ON C.CourseID  = L.CourseID
    WHERE M.MedicalID = p_MedicalID
    ORDER BY L.LectureDate, L.LectureID;
END //
//
DELIMITER ;
