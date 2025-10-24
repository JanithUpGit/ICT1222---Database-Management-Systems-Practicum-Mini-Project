-- ==========================================================
-- View Name  : View_CourseAttendance
-- Description: Displays detailed attendance records for each 
--              lecture in every course. Includes course info, 
--              lecture details, student registration number, 
--              student name, attendance status, and the staff 
--              member who recorded the attendance.
-- Author     : [Your Name]
-- Date       : [Current Date]
-- ==========================================================


CREATE OR REPLACE VIEW View_CourseAttendance AS
SELECT
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    L.LectureID,
    L.LectureDate,
    L.DurationHours,
    S.StudentRegNo AS StudentID,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    A.SessionDate,
    A.Status,
    CONCAT(R.FirstName, ' ', R.LastName) AS RecordedByName
FROM Attendance A
JOIN Lecture   L ON A.LectureID = L.LectureID
JOIN Course    C ON L.CourseID   = C.CourseID
JOIN Student   S ON S.StudentRegNo = A.RegNo
JOIN Users     U ON U.Id         = S.UserID
LEFT JOIN Users R ON R.Id        = A.RecordedBy
ORDER BY C.CourseID, L.LectureDate, S.StudentRegNo;
