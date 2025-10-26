-- ==========================================================
-- View Name   : View_Students
-- Description  : Displays detailed information about all students,
--                combining student, user, and department data. This view
--                provides a unified profile for each student, including
--                registration, contact, and academic information.
--
-- Author       : [TG1702 Janith Uthpala]
-- ==========================================================

DROP VIEW IF EXISTS View_Students;

CREATE VIEW View_Students AS
SELECT
    U.Id AS UserID,
    S.StudentRegNo,
    CONCAT(U.FirstName, ' ', U.LastName) AS FullName,
    U.FirstName,
    U.LastName,
    U.Email,
    U.Phone,
    U.Address,
    U.Dob,
    U.Status,
    S.Batch,
    D.DepartmentID,
    D.DeptCode,
    D.DeptName,
    U.CreatedAt,
    U.UpdatedAt
FROM
    Student S
    JOIN Users U ON U.Id = S.UserID
    JOIN Department D ON D.DepartmentID = U.DepartmentID

ORDER BY S.StudentRegNo;

SELECT * FROM View_Students LIMIT 20;