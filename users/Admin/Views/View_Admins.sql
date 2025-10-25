-- ==========================================================
-- View Name  : View_Admins
-- Purpose    : Admin users with department.
-- ==========================================================
DROP VIEW IF EXISTS View_Admins;

CREATE VIEW View_Admins AS
SELECT
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
    U.CreatedAt,
    U.UpdatedAt
FROM Users U
    JOIN Department D ON D.DepartmentID = U.DepartmentID
WHERE
    U.Role = 'Admin'
ORDER BY D.DeptCode, FullName;

SELECT * FROM View_Admins LIMIT 20;