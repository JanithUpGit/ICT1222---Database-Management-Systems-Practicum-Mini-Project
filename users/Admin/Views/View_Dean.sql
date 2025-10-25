-- ==========================================================
-- View Name  : View_Dean
-- Purpose    : Deans (from Users.Role or Lecturer.Role), with staff code if available.
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
    L.Role AS LecturerRole, -- should be 'Dean' if present
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