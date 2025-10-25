-- ==========================================================
-- View Name  : View_TechnicalOfficers
-- Purpose    : Technical Officers with user profile + department.
-- ==========================================================
DROP VIEW IF EXISTS View_TechnicalOfficers;

CREATE VIEW View_TechnicalOfficers AS
SELECT
    T.TOID,
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
FROM
    TechnicalOfficer T
    JOIN Users U ON U.Id = T.UserID
    JOIN Department D ON D.DepartmentID = U.DepartmentID
    -- Optionally enforce Users.Role = 'TO'
    -- WHERE U.Role = 'TO'
ORDER BY D.DeptCode, FullName;

SELECT * FROM View_TechnicalOfficers LIMIT 20;