-- ==========================================================
-- View Name  : View_Students
-- Purpose    : Students with user profile, department, reg no & batch.
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
    -- Optionally enforce that the Users.Role is 'Student'
    -- WHERE U.Role = 'Student'
ORDER BY S.StudentRegNo;

SELECT * FROM View_Students LIMIT 20;