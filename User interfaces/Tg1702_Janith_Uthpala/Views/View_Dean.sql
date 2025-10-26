-- ==========================================================
-- View Name   : View_Dean
-- Description  : Displays detailed information about the Dean(s) of departments,
--                combining user, lecturer, and department details. This view
--                captures both users and lecturers who hold the role of 'Dean'.
--
-- Author       : [TG1702 Janith Uthpala]
-- Date Created : [2025-10-26]
-- ==========================================================

DROP VIEW IF EXISTS View_Dean;

CREATE VIEW View_Dean AS
SELECT DISTINCT
    U.Id AS UserID,
    CONCAT(U.FirstName, ' ', U.LastName) AS FullName,
    U.Email,
    U.Phone,
    U.Address,
    U.Dob,
    U.Status,
    D.DepartmentID,
    D.DeptCode,
    D.DeptName,
    L.StaffCode,
    L.Role AS LecturerRole, 
    U.CreatedAt,
    U.UpdatedAt
FROM
    Users U
    JOIN Department D ON D.DepartmentID = U.DepartmentID
    LEFT JOIN Lecturer L ON L.UserID = U.Id
WHERE
    U.Role = 'Dean'
    OR L.Role = 'Dean'
ORDER BY D.DeptCode, FullName;

SELECT * FROM View_Dean LIMIT 20;