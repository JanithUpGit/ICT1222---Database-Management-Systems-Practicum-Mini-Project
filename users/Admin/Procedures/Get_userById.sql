DROP PROCEDURE IF EXISTS Get_UserByID;
DELIMITER //

CREATE PROCEDURE Get_UserByID(IN p_UserID INT)
BEGIN
    DECLARE v_message TEXT;

    -- 1. Validate that user exists
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Id = p_UserID) THEN
        SET v_message = CONCAT('User not found. UserID = ', p_UserID);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_message;
    END IF;

    -- 2. Fetch the user and role-specific data
    SELECT
        U.Id AS UserID,
        CONCAT(U.FirstName, ' ', U.LastName) AS FullName,
        U.FirstName,
        U.LastName,
        U.Role AS UserRole,
        U.Email,
        U.Phone,
        U.Address,
        U.Dob,
        U.Status,
        D.DepartmentID,
        D.DeptCode,
        D.DeptName,
        -- Role-specific fields (nullable)
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
    WHERE U.Id = p_UserID;
END //
DELIMITER ;
