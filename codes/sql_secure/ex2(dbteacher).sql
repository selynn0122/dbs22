-- login with dbteacher
SELECT 'grant to dbstudent1' as 'INFO';

use companyDB;

GRANT SELECT, DELETE ON departments TO dbstudent1@localhost WITH GRANT OPTION;
GRANT CREATE VIEW on companyDB.* to dbstudent1@localhost;
