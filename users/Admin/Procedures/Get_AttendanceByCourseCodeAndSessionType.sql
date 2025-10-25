

DROP PROCEDURE IF EXISTS Get_AttendanceByCourseCodeAndSessionType;
DELIMITER //

CREATE PROCEDURE Get_AttendanceByCourseCodeAndSessionType(
    IN p_CourseCode VARCHAR(10),
    IN p_Mode       VARCHAR(10)   -- 'Theory' | 'Practical' | 'Both' (also accept 'Lecture' -> 'Theory')
)
BEGIN
    DECLARE v_Mode VARCHAR(10);

    -- normalize the mode
    SET v_Mode = UPPER(TRIM(p_Mode));
    IF v_Mode = 'LECTURE' THEN SET v_Mode = 'THEORY'; END IF;

    -- basic validation
    IF v_Mode NOT IN ('THEORY','PRACTICAL','BOTH') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mode must be Theory, Practical, or Both';
    END IF;

    /* Return raw attendance rows (no aggregation) */
    SELECT
        VA.StudentID,
        VA.StudentName,
        VA.CourseID,
        VA.CourseCode,
        VA.CourseName,
        L.LectureID,
        L.LectureDate,
        L.StartTime,
        L.SessionType,          -- from Lecture ('Theory' / 'Lecture' / 'Practical')
        L.DurationHours,
        VA.SessionDate,         -- date used in attendance view
        VA.Status               -- Present / Absent / Medical
    FROM View_Attendance AS VA
    JOIN Lecture AS L
      ON L.LectureID = VA.LectureID
    WHERE VA.CourseCode = p_CourseCode
      AND (
            v_Mode = 'BOTH'
         OR (v_Mode = 'PRACTICAL' AND L.SessionType = 'Practical')
         OR (v_Mode = 'THEORY'    AND L.SessionType IN ('Theory','Lecture'))
      )
    ORDER BY VA.StudentID, L.LectureDate, L.StartTime;
END //
//
DELIMITER ;
