-- login with dbstudent1
SELECT 'check for grant' as 'INFO';

show databases; 

use companyDB; 

show tables; 

select * from departments; 
-- select * from employees;

create view departments2 as select * from departments;
-- create view employees2 as select * from employees;

SELECT 'grant to dbstudent2' as 'INFO';

GRANT SELECT ON departments TO dbstudent2@localhost;
