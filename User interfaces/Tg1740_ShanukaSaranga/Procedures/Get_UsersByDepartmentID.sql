DROP PROCEDURE IF EXISTS Get_UsersByDepartmentID;
DELIMITER //

CREATE PROCEDURE Get_UsersByDepartmentID(IN p_DepartmentID INT)
BEGIN
    DECLARE v_exists   INT DEFAULT 0;
    DECLARE v_message  TEXT;

    SELECT COUNT(*) INTO v_exists
    FROM Department
    WHERE DepartmentID = p_DepartmentID;

    IF v_exists = 0 THEN
        SET v_message = CONCAT('Department not found. DepartmentID = ', p_DepartmentID);
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = v_message;
    END IF;

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
        S.StudentRegNo,
        S.Batch,
        L.StaffCode,
        L.Role AS LecturerRole,
        T.TOID,
        U.CreatedAt,
        U.UpdatedAt
    FROM Users U
    JOIN Department D            ON D.DepartmentID = U.DepartmentID
    LEFT JOIN Student S          ON S.UserID = U.Id
    LEFT JOIN Lecturer L         ON L.UserID = U.Id
    LEFT JOIN TechnicalOfficer T ON T.UserID = U.Id
    WHERE U.DepartmentID = p_DepartmentID
    ORDER BY U.Role, FullName;
END //
DELIMITER ;



CALL Get_UsersByDepartmentID(1);

CALL Get_UsersByDepartmentID(999);
