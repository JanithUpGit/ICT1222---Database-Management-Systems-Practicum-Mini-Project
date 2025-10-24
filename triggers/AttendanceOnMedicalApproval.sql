DELIMITER $$

CREATE TRIGGER UpdateAttendanceOnMedicalApproval
AFTER UPDATE ON Medicals
FOR EACH ROW
BEGIN
    -- Only act when the medical is approved
    IF NEW.ApprovalStatus = 'Approved' THEN
        -- Update all related attendance records
        UPDATE Attendance AS A
        INNER JOIN MedicalParticipation AS MP ON A.LectureID = MP.LectureID
        INNER JOIN Lecture AS L ON L.LectureID = MP.LectureID
        SET A.Status = 'Medical'
        WHERE MP.MedicalID = NEW.MedicalID
          AND A.RegNo = NEW.StudentRegNo
          AND L.LectureDate BETWEEN NEW.StartDate AND NEW.EndDate;
    END IF;
END$$

DELIMITER ;
 



 DELIMITER $$

CREATE TRIGGER InsertAttendanceOnMedicalApproval
AFTER INSERT ON Medicals
FOR EACH ROW
BEGIN
    IF NEW.ApprovalStatus = 'Approved' THEN
        UPDATE Attendance AS A
        INNER JOIN MedicalParticipation AS MP ON A.LectureID = MP.LectureID
        INNER JOIN Lecture AS L ON L.LectureID = MP.LectureID
        SET A.Status = 'Medical'
        WHERE MP.MedicalID = NEW.MedicalID
          AND A.RegNo = NEW.StudentRegNo
          AND L.LectureDate BETWEEN NEW.StartDate AND NEW.EndDate;
    END IF;
END$$

DELIMITER ;
