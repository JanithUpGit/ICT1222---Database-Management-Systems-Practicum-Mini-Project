-- ==========================================================
-- View Name  : View_CourseAttendance
-- Description: Displays detailed attendance records for each
--              lecture in every course. Includes course info,
--              lecture details, student registration number,
--              student name, attendance status, and the staff
--              member who recorded the attendance.
-- Author     : [Tg1702 Janith Uthpala]
-- ==========================================================

CREATE OR REPLACE VIEW View_Attendance AS
SELECT
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    L.LectureID,
    L.LectureDate,
    L.DurationHours,
    S.StudentRegNo,
     S.Status AS StudentStatus,

    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,

    CASE
        WHEN EXISTS (
            SELECT 1
            FROM
                Medicals M
                JOIN MedicalParticipation MP ON MP.MedicalID = M.MedicalID
                AND MP.LectureID = L.LectureID
            WHERE
                M.StudentRegNo = A.RegNo
                AND M.ApprovalStatus = 'Approved'
        ) THEN 'Medical'
        ELSE A.Status
    END AS Status,
    CONCAT(R.FirstName, ' ', R.LastName) AS RecordedByName
FROM
    Attendance A
    JOIN Lecture L ON A.LectureID = L.LectureID
    JOIN Course C ON L.CourseID = C.CourseID
    JOIN Student S ON S.StudentRegNo = A.RegNo
    JOIN Users U ON U.Id = S.UserID
    LEFT JOIN Users R ON R.Id = A.RecordedBy
ORDER BY C.CourseID, L.LectureDate, S.StudentRegNo;

SELECT * FROM View_Attendance;