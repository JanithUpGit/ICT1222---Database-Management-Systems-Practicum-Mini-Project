DROP PROCEDURE IF EXISTS Get_AttendanceByDate;

DELIMITER //



CALL Get_AttendanceByDate('2025-09-01','2025-10-31', NULL);   
CALL Get_AttendanceByDate('2025-09-01','2025-10-31', 2);