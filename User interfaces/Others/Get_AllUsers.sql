-- ==========================================================
-- View Name  : View_AllUsers
-- Purpose    : All users with department details and any
--              role-specific identifiers (StudentRegNo, Batch,
--              StaffCode, TOID). Rows are present even if
--              the user doesn't exist in role tables.
-- ==========================================================
DROP VIEW IF EXISTS View_AllUsers;

CREATE VIEW View_AllUsers AS
SELECT
    U.Id AS UserID,
    CONCAT(U.FirstName, ' ', U.LastName) AS FullName,
    U.FirstName,
    U.LastName,
    U.Role            AS UserRole,
    U.Email,
    U.Phone,
    U.Address,
    U.Dob,
    U.Status,
    D.DepartmentID,
    D.DeptCode,
    D.DeptName,
   
    S.StudentRegNo,
    S.Batch,
    L.StaffCode,
    L.Role AS LecturerRole,   
    T.TOID,
    U.CreatedAt,
    U.UpdatedAt
FROM Users U
JOIN Department D         ON D.DepartmentID = U.DepartmentID
LEFT JOIN Student S       ON S.UserID = U.Id
LEFT JOIN Lecturer L      ON L.UserID = U.Id
LEFT JOIN TechnicalOfficer T ON T.UserID = U.Id
ORDER BY U.Role, D.DeptCode, FullName;
