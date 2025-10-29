==========================================================
-- Procedure Name : Get_StudentByBatch
-- Description    : Returns the list of students for a given batch
--                  including full name and department details.
--                  Uses tables: Student, Users, Department
--                  Fields returned:
--                  (1) StudentRegNo, StudentName, Batch
--                  (2) DepartmentID, DepartmentName
-- Author         : [Himantha Poornika]
-- Date           : [2025/10/26]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_StudentByBatch;
DELIMITER //

CREATE PROCEDURE Get_StudentByBatch(
    IN p_Batch VARCHAR(10)
)
BEGIN
    SELECT
        s.StudentRegNo AS RegNo,
        CONCAT(u.FirstName, ' ', u.LastName) AS StudentName,
        s.Batch,
        d.DepartmentID,
        d.DepartmentName
    FROM Student s
    JOIN Users u       ON s.UserID = u.UserID
    JOIN Department d  ON s.DepartmentID = d.DepartmentID
    WHERE s.Batch = p_Batch
    ORDER BY s.StudentRegNo;
END //
DELIMITER ;


CALL Get_StudentByBatch('ICT2021');
