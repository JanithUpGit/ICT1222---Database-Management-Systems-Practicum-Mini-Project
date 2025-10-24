-- ==========================================================
-- View Name  : View_Medicals
-- Purpose    : For each Medical record, list all covered lectures,
--              courses, and student details.
--              "Covered" means:
--              (a) Lecture explicitly mapped in MedicalParticipation, OR
--              (b) LectureDate falls within Medical StartDate..EndDate.
-- Author     : [Janith Uthpala]
-- Date       : [2025/10/24]
-- ==========================================================

DROP VIEW IF EXISTS View_Medicals;

CREATE OR REPLACE VIEW View_Medicals AS
SELECT
    -- Medical
    M.MedicalID,
    M.StudentRegNo,
    M.StartDate,
    M.EndDate,
    M.SubmittedDate,
    M.DocumentPath,
    M.ApprovalStatus,

    -- Student
    S.Batch,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    U.FirstName,
    U.LastName,

    -- Lecture
    L.LectureID,
    L.LectureDate,
    L.DurationHours,
    L.SessionType      AS LectureSessionType,

    -- Course
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    C.SessionType      AS CourseSessionType

FROM Medicals M

JOIN (
    SELECT MP.MedicalID, MP.LectureID
    FROM MedicalParticipation MP

    UNION

    SELECT M2.MedicalID, L2.LectureID
    FROM Medicals M2
    JOIN Lecture L2
      ON L2.LectureDate BETWEEN M2.StartDate AND M2.EndDate
) X
  ON X.MedicalID = M.MedicalID

JOIN Lecture  L ON L.LectureID  = X.LectureID
JOIN Course   C ON C.CourseID   = L.CourseID
JOIN Student  S ON S.StudentRegNo = M.StudentRegNo
JOIN Users    U ON U.Id           = S.UserID

ORDER BY M.MedicalID, L.LectureDate, L.LectureID;


SELECT * FROM View_Medicals;


