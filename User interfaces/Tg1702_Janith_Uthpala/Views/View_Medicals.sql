-- ==========================================================
-- View Name   : View_Medicals
-- Description  : Displays complete medical coverage details by linking
--                each medical record with relevant lectures, courses,
--                and student information.
--
-- Author       : [TG1702 Janith Uthpala]
-- ==========================================================

DROP VIEW IF EXISTS View_Medicals;

CREATE OR REPLACE VIEW View_Medicals AS
SELECT

    M.MedicalID,
    M.StudentRegNo,
    M.StartDate,
    M.EndDate,
    M.SubmittedDate,
    M.DocumentPath,
    M.ApprovalStatus,

    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,

    L.LectureID,
    L.LectureDate,
    L.DurationHours,
    L.SessionType AS LectureSessionType,

    C.CourseID,
    C.CourseCode,
    C.CourseName

FROM Medicals M

JOIN (
    SELECT DISTINCT MP.MedicalID, MP.LectureID
    FROM MedicalParticipation MP
    UNION ALL
    SELECT DISTINCT M2.MedicalID, L2.LectureID
    FROM Medicals M2
    JOIN Lecture L2 
        ON L2.LectureDate BETWEEN M2.StartDate AND M2.EndDate
) AS ML ON ML.MedicalID = M.MedicalID


JOIN Lecture  L ON L.LectureID  = ML.LectureID
JOIN Course   C ON C.CourseID   = L.CourseID
JOIN Student  S ON S.StudentRegNo = M.StudentRegNo
JOIN Users    U ON U.Id         = S.UserID

ORDER BY M.MedicalID, L.LectureDate, L.LectureID;

SELECT * FROM View_Medicals;
