CREATE USER 'Admin' @ '%' IDENTIFIED BY 'Admin@123';

GRANT ALL PRIVILEGES ON university.* TO 'Admin' @ '%'
WITH
GRANT OPTION;

CREATE USER 'Dean' @ '%' IDENTIFIED BY 'Dean@123';

GRANT ALL PRIVILEGES ON university.* TO 'Dean' @ '%';

CREATE USER 'Lecturer' @ '%' IDENTIFIED BY 'Lecturer@123';

GRANT ALL PRIVILEGES ON university.* TO 'Lecturer' @ '%';

REVOKE CREATE USER ON *.* FROM 'Lecturer'@'%';

CREATE USER 'TechnicalOfficer' @ '%' IDENTIFIED BY 'Tech@123';

GRANT
SELECT, INSERT,
UPDATE ON university.Attendance TO 'TechnicalOfficer' @ '%';

CREATE USER 'Student' @ '%' IDENTIFIED BY 'Student@123';

FLUSH PRIVILEGES;