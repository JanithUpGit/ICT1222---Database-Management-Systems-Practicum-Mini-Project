-- ==========================================================
-- Procedure : Add_Attendance
-- Purpose   : Insert a single attendance row safely.
-- Validates : student, lecture, recorder, status, duplicates.
-- Description     : 
--              - Attendance.Status must be 'Present' or 'Absent'
--              - If p_SessionDate IS NULL, it uses the lecture date.
--              - Prevents duplicate (RegNo, LectureID) rows.
--              - Returns the inserted row.
-- Author    : [Himantha Poornika]
-- Date      : [YYYY-MM-DD]
-- ==========================================================

DROP PROCEDURE IF EXISTS Add_Attendance;
DELIMITER //

CREATE PROCEDURE Add_Attendance(
    IN p_RegNo        VARCHAR(15),
    IN p_LectureID    INT,
    IN p_Status       ENUM('Present','Absent'),
    IN p_RecordedBy   INT,
    IN p_SessionDate  DATE
)
BEGIN
    DECLARE v_lectureDate DATE;
    DECLARE v_attendanceId INT;

    IF NOT EXISTS (SELECT 1 FROM Student S WHERE S.StudentRegNo = p_RegNo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid student: RegNo not found.';
    END IF;

    SELECT L.LectureDate INTO v_lectureDate
    FROM Lecture L
    WHERE L.LectureID = p_LectureID;
    IF v_lectureDate IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid lecture: LectureID not found.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Users U WHERE U.Id = p_RecordedBy) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid recorder: Users.Id not found.';
    END IF;

    IF p_Status NOT IN ('Present','Absent') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid status. Must be Present or Absent.';
    END IF;

    IF EXISTS (
        SELECT 1 
        FROM Attendance A 
        WHERE A.RegNo = p_RegNo AND A.LectureID = p_LectureID
    ) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Duplicate attendance: (RegNo, LectureID) already recorded.';
    END IF;

    SET p_SessionDate = IFNULL(p_SessionDate, v_lectureDate);

    INSERT INTO Attendance (RegNo, LectureID, SessionDate, Status, RecordedBy)
    VALUES (p_RegNo, p_LectureID, p_SessionDate, p_Status, p_RecordedBy);

    SET v_attendanceId = LAST_INSERT_ID();

    SELECT 
        A.AttendanceID,
        A.RegNo,
        A.LectureID,
        A.SessionDate,
        A.Status,
        A.RecordedBy,
        CONCAT(Urec.FirstName, ' ', Urec.LastName) AS RecordedByName
    FROM Attendance A
    LEFT JOIN Users Urec ON Urec.Id = A.RecordedBy
    WHERE A.AttendanceID = v_attendanceId;
END //
//
DELIMITER ;
