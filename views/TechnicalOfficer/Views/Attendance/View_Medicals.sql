
-- ==========================================================
-- View Name  : View_Medicals
-- Description: Displays all attendance records marked as 
--              'Medical', along with related student, course, 
--              and lecturer/recorder details.
--              Includes student full name, course name/code,
--              session date, status, and the staff member 
--              who recorded the attendance.
-- Author     : [Janith Uthpala]
-- Date       : [2023/10/24]
-- ==========================================================



CREATE OR REPLACE VIEW View_Medicals AS
SELECT 
    A.AttendanceID,
    A.RegNo AS StudentRegNo,
    CONCAT(U.FirstName, ' ', U.LastName) AS StudentName,
    C.CourseID,
    C.CourseCode,
    C.CourseName,
    A.SessionDate,
    A.Status,
    CONCAT(R.FirstName, ' ', R.LastName) AS RecordedByName
FROM Attendance A
JOIN Lecture L ON A.LectureID = L.LectureID
JOIN Course C ON L.CourseID = C.CourseID
JOIN Student S ON S.StudentRegNo = A.RegNo
JOIN Users U ON U.Id = S.UserID
LEFT JOIN Users R ON A.RecordedBy = R.Id
WHERE A.Status = 'Medical'
ORDER BY A.SessionDate DESC;

SELECT * FROM View_Medicals;