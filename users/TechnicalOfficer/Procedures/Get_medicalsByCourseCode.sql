-- ==========================================================
-- Procedure Name : Get_medicalsByCourseId
-- Description    : Displays medical records linked to a specific 
--                  course via the Lecture and MedicalParticipation 
--                  tables.
-- Author         : [Janith Uthpala]
-- Date           : [2025/10/24]
-- ==========================================================
DROP PROCEDURE IF EXISTS Get_attendanceByCourseCode;
DELIMITER //

CREATE PROCEDURE Get_attendanceByCourseCode(
    IN p_CourseCode VARCHAR(10)
)
BEGIN
    SELECT
        A.AttendanceID,
        S.StudentRegNo           AS RegNo,
        CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,

        C.CourseID,
        C.CourseCode,
        C.CourseName,

        L.LectureID,
        L.LectureDate,
        L.StartTime,
        L.DurationHours,
        L.SessionType,           -- e.g., 'Theory' / 'Practical' (or 'Lecture' if used in your data)

        A.SessionDate,
        A.Status,                -- Present / Absent / Medical
        A.RecordedBy,
        UR.FirstName  AS RecordedByFirstName,
        UR.LastName   AS RecordedByLastName
    FROM Course C
    JOIN Lecture L       ON L.CourseID   = C.CourseID
    JOIN Attendance A    ON A.LectureID  = L.LectureID
    JOIN Student S       ON S.StudentRegNo = A.RegNo
    JOIN Users U         ON U.Id         = S.UserID
    JOIN Users UR        ON UR.Id        = A.RecordedBy
    WHERE C.CourseCode = p_CourseCode
    ORDER BY
        S.StudentRegNo,
        L.LectureDate,
        L.StartTime,
        A.AttendanceID;
END //
//
DELIMITER ;


CALL Get_attendanceByCourseCode('ICT1212');
