-- ==========================================================
-- Procedure Name : Get_MarksByBatch
-- Description    : Retrieves all students' marks for a given batch,
--                  showing summarized marks per student and per course.
--                  Uses the pivoted View_Marks for simplified display.
--
-- Parameters     :
--      p_Batch - The batch year to filter marks (e.g., 2020, 2021).
--
-- Notes          :
--      - Works with the View_Marks view for summarized marks.
--      - Returns all courses and marks for students of the given batch.
--      - Throws an error if no matching batch exists.
--
-- Author         : [TG1702 Janith Uthpala]
-- Date Created   : [2025-10-26]
-- ==========================================================

DROP PROCEDURE IF EXISTS Get_MarksByBatch;
DELIMITER //

CREATE PROCEDURE Get_MarksByBatch(
    IN p_Batch INT
)
BEGIN
    /* --- Validate batch input --- */
    IF p_Batch IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Batch cannot be NULL.';
    END IF;

    /* --- Ensure the batch exists --- */
    IF NOT EXISTS (SELECT 1 FROM Student WHERE Batch = p_Batch) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid batch: No students found for the given batch.';
    END IF;

    /* --- Fetch marks for students in the given batch --- */
    SELECT 
        S.StudentRegNo,
        VM.StudentName,
        S.Batch,
        VM.CourseCode,
        VM.CourseName,
        VM.Quiz,
        VM.Assessment,
        VM.MidExam_Theory,
        VM.MidExam_Practical,
        VM.FinalExam_Theory,
        VM.FinalExam_Practical,
        VM.AverageMark
    FROM View_Marks VM
    JOIN Student S ON S.StudentRegNo = VM.StudentRegNo
    WHERE S.Batch = p_Batch
    ORDER BY VM.CourseCode, S.StudentRegNo;
END //
DELIMITER ;

-- ==========================================================
-- ✅ Test Calls
-- ==========================================================
CALL Get_MarksByBatch(2020);
CALL Get_MarksByBatch(2021);
