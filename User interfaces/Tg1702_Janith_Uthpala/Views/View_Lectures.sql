-- ==========================================================
-- View Name  : View_Lectures
-- Purpose    : Lecturers (excluding Deans) with staff code and department.
-- Note       : Uses Lecturer table; filters Lecturer.Role='Lecturer'.
-- ==========================================================
DROP VIEW IF EXISTS View_Lectures;

CREATE VIEW View_Lectures AS
SELECT
    U.Id AS UserID,
    L.StaffCode,
    L.Role AS LecturerRole, -- 'Lecturer'
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
    -- Optionally also ensure Users.Role='Lecturer'
    -- AND U.Role = 'Lecturer'SELECT * FROM View_AllUsers           LIMIT 20;
ORDER BY D.DeptCode, FullName;

SELECT * FROM View_Lectures LIMIT 20;