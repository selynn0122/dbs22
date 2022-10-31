DROP USER IF EXISTS dbteacher, dbstudent1, dbstudent2;

SELECT 'Create users' as 'INFO';

CREATE USER dbteacher@localhost IDENTIFIED BY 'dbs22';
CREATE USER dbstudent1@localhost IDENTIFIED BY 'dbs22';
CREATE USER dbstudent2@localhost IDENTIFIED BY 'dbs22';
SELECT * FROM mysql.user WHERE User IN ('dbsecure', 'dbstudent1', 'dbstudent2');

-- 권한 부여 (ALL PRIVILEGES)
source companyDB.sql;
USE companyDB;

SELECT 'grant to dbteacher' as 'INFO';
GRANT ALL PRIVILEGES ON companyDB.* TO dbteacher@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES; 
