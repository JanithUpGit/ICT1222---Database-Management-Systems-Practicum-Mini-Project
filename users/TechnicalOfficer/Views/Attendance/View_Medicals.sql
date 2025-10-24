-- ==========================================================
-- View Name  : View_Medicals
-- Description: Shows all medical-related attendance records,
--              linking Attendance ↔ Medicals using either:
--              (a) MedicalParticipation bridge, or
--              (b) Date range overlap between LectureDate and
--                  Medical StartDate/EndDate.
--              Includes ALL ApprovalStatus values
--              (Approved, Pending, Rejected).
-- Author     : [Janith Uthpala]
-- Date       : [2025/10/24]
-- ==========================================================

DROP VIEW IF EXISTS View_Medicals;

CREATE OR REPLACE VIEW View_Medicals AS
WITH AllMedicals AS (
    -- (a) Mapped via MedicalParticipation
    SELECT 
        M.StudentRegNo,
        MP.LectureID,
        M.MedicalID
    FROM Medicals M
    JOIN MedicalParticipation MP 
      ON MP.MedicalID = M.MedicalID

    UNION

    -- (b) Lectures covered by any medical date range
    SELECT
        M.StudentRegNo,
        L.LectureID,
        M.MedicalID
    FROM Medicals M
    JOIN Lecture L 
      ON L.LectureDate BETWEEN M.StartDate AND M.EndDate
),
AM2 AS (
    SELECT 
        StudentRegNo,
        LectureID,
        MAX(MedicalID) AS MedicalID
    FROM AllMedicals
    GROUP BY StudentRegNo, LectureID
)
SELECT 
    -- Attendance / student / course
    A.AttendanceID,
    A.RegNo AS StudentRegNo,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    C.CourseID,
    C.CourseCode,
    C.CourseName,

    -- Lecture info
    L.LectureID,
    L.LectureDate,
    L.DurationHours,

    -- Attendance info
    A.SessionDate,
    A.Status,
    CONCAT(R.FirstName, ' ', R.LastName) AS RecordedByName,

    -- Medical info (linked)
    M.MedicalID,
    M.StartDate,
    M.EndDate,
    M.SubmittedDate,
    M.DocumentPath,
    M.ApprovalStatus

FROM Attendance A
JOIN Lecture   L  ON A.LectureID = L.LectureID
JOIN Course    C  ON L.CourseID   = C.CourseID
JOIN Student   S  ON S.StudentRegNo = A.RegNo
JOIN Users     U  ON U.Id         = S.UserID
LEFT JOIN Users R ON R.Id         = A.RecordedBy

-- Link to any medical (regardless of approval)
LEFT JOIN AM2        ON AM2.StudentRegNo = A.RegNo
                    AND AM2.LectureID    = L.LectureID
LEFT JOIN Medicals M ON M.MedicalID      = AM2.MedicalID

ORDER BY A.SessionDate DESC;

SELECT * FROM View_Medicals;