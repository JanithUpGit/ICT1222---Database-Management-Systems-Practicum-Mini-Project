-- ==========================================================
-- View Name   : View_Lectures
-- Description  : Displays detailed information about lecturers, including
--                their personal details, contact information, assigned role,
--                and department details.
--
-- Author       : [TG1702 Janith Uthpala]
-- ==========================================================

DROP VIEW IF EXISTS View_Lectures;

CREATE VIEW View_Lectures AS
SELECT
    U.Id AS UserID,
    L.StaffCode,
    L.Role AS LecturerRole,
    CONCAT(U.FirstName, ' ', U.LastName) AS FullName,
    U.Email,
    U.Phone,
    U.Address,
    U.Dob,
    U.Status,
    D.DepartmentID,
    D.DeptCode,
    D.DeptName,
    U.CreatedAt,
    U.UpdatedAt
FROM
    Lecturer L
    JOIN Users U ON U.Id = L.UserID
    JOIN Department D ON D.DepartmentID = U.DepartmentID
WHERE
    L.Role = 'Lecturer'
ORDER BY D.DeptCode, FullName;

SELECT * FROM View_Lectures LIMIT 20;