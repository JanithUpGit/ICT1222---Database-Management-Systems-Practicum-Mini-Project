DROP PROCEDURE IF EXISTS Add_Medical;

DELIMITER /
/

CREATE PROCEDURE Add_Medical(
    IN p_RegNo        VARCHAR(15),
    IN p_StartDate    DATE,
    IN p_EndDate      DATE,
    IN p_DocumentPath VARCHAR(255)
)
BEGIN
    DECLARE v_LectureCount INT DEFAULT 0;
    DECLARE v_AbsentCount INT DEFAULT 0;

    
    IF NOT EXISTS (SELECT 1 FROM Student S WHERE S.StudentRegNo = p_RegNo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid student: RegNo not found.';
    END IF;

    IF p_StartDate IS NULL OR p_EndDate IS NULL OR p_StartDate > p_EndDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date range: StartDate must be before or equal to EndDate.';
    END IF;

    SELECT COUNT(*) INTO v_LectureCount
    FROM Lecture L
    JOIN Attendance A ON A.LectureID = L.LectureID
    WHERE A.RegNo = p_RegNo
      AND L.LectureDate BETWEEN p_StartDate AND p_EndDate;

    IF v_LectureCount = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No lectures found for this student in the given date range.';
    END IF;

    UPDATE Attendance A
    JOIN Lecture L ON A.LectureID = L.LectureID
    SET A.Status = 'Absent'
    WHERE A.RegNo = p_RegNo
      AND L.LectureDate BETWEEN p_StartDate AND p_EndDate
      AND A.Status <> 'Absent';

   
    SELECT COUNT(*) INTO v_AbsentCount
    FROM Lecture L
    JOIN Attendance A ON A.LectureID = L.LectureID
    WHERE A.RegNo = p_RegNo
      AND L.LectureDate BETWEEN p_StartDate AND p_EndDate
      AND A.Status = 'Absent';

    IF v_AbsentCount = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Could not find any lectures marked Absent after update.';
    END IF;

    INSERT INTO Medicals (StudentRegNo, StartDate, EndDate, SubmittedDate, DocumentPath, ApprovalStatus)
    VALUES (p_RegNo, p_StartDate, p_EndDate, NOW(), p_DocumentPath, 'Pending');

    SELECT 
        M.MedicalID,
        M.StudentRegNo,
        M.StartDate,
        M.EndDate,
        M.SubmittedDate,
        M.DocumentPath,
        M.ApprovalStatus
    FROM Medicals M
    WHERE M.MedicalID = LAST_INSERT_ID();
END
/
/

DELIMITER;

CALL Add_Medical (
    'TG2020-007',
    '2025-08-15',
    '2025-08-29',
    'docs/TG2020-007_medical3.pdf'
);

-- Check medical submitted or not
SELECT *
FROM Medicals
WHERE
    StudentRegNo = 'TG2020-007'
ORDER BY SubmittedDate DESC;