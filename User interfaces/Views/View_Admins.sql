-- ==========================================================
-- View Name  : View_Admins
-- Description: Displays detailed information about all Admin users.
--              Includes personal details, contact info, department
--              details, and timestamps for record creation and updates.
-- Author     : [TG1702 Janith Uthpala]
-- ==========================================================

CREATE OR REPLACE VIEW View_Admins AS
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