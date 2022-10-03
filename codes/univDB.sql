DROP DATABASE IF EXISTS univDB;
CREATE DATABASE IF NOT EXISTS univDB;
USE univDB;

DROP TABLE IF EXISTS course, student, take_course;

CREATE TABLE course
	( course_num char(4) NOT NULL PRIMARY KEY, 
	  name VARCHAR(20) NOT NULL, 
	  classroom CHAR(3) NOT NULL,
	  department VARCHAR(20) NOT NULL,
	  credit INT NOT NULL ) ; 

CREATE TABLE student
	( student_id CHAR(4) NOT NULL,
	  name VARCHAR(20) NOT NULL,
	  address VARCHAR(50) NULL DEFAULT 'undetermined', 
	  grade INT NOT NULL,
	  age INT NULL,
	  gender CHAR(1) NOT NULL,
	  phone_num CHAR(14) NULL, 
      department VARCHAR(20) NULL,
	  PRIMARY KEY (student_id), 
          CONSTRAINT CK_student_1 CHECK (grade >= 1 AND grade <= 4),  
	  UNIQUE (phone_num) ) ; 

CREATE TABLE take_course
	( student_id char(6) NOT NULL,
	  course_num CHAR(4) NOT NULL,
	  enroll_date DATE NOT NULL,
	  mid_score INT NULL DEFAULT 0,
	  fin_score INT NULL DEAFULT 0, 
	  grade CHAR(1) NULL,        
	  PRIMARY KEY(student_id, course_num), 
	  FOREIGN KEY(student_id) REFERENCES student(student_id) 
		ON UPDATE CASCADE ON DELETE CASCADE, 
	  FOREIGN KEY(course_num) REFERENCES course(course_num) 
		ON UPDATE CASCADE ON DELETE CASCADE,
	  CHECK (grade IN (‘A’, ‘B’, ‘C’, ‘D’, ‘F’)) ) ; 

INSERT INTO student
VALUES ('s001', 'Yuna Kim', 'Seoul, Seocho', 4, 23, 'F', '010-1111-2222', 'computer') ;
INSERT INTO student(student_id, name, address, grade, age, gender, phone_num, department)
VALUES ('s002', 'Gildong Hong', DEFAULT, 1, 26, 'M', NULL , 'statistics') ;
INSERT INTO student(grade, age, gender, department, student_id, name)
VALUES (3, 30, 'M', 'ICE', 's003', 'Sungsik Lee') ;
INSERT INTO student
VALUES ('s004', 'Mina Lee', 'Gyeonggi-do, Bundang', 2, NULL, 'F', '010-4444-5555', 'ICE') ;
INSERT INTO student
VALUES ('s005', 'Yeonji Song', 'Gyeonggi-do, Bundang', 4, 23, 'F', '010-6666-7777', 'computer') ;
INSERT INTO student
VALUES ('s006', 'Gildong Hong', 'Seoul, Jongro', 2, 26, 'M', '010-8888-9999', 'computer') ;
INSERT INTO student
VALUES ('s007', 'Woolin Lim', 'Gyeonggi-do, Gwacheon', 1, 23, 'F', '010-2222-3333', 'management') ;

INSERT INTO course
VALUES ('c001', 'database', 126, 'computer', 3) ;
INSERT INTO course
VALUES ('c002', 'information security', 137, 'ICE', 3) ;
INSERT INTO course
VALUES ('c003', 'mobile web', 128, 'computer', 3) ;
INSERT INTO course
VALUES ('c004', 'introduction to philosophy', 117, 'philosophy', 2) ;
INSERT INTO course
VALUES ('c005', 'writing', 120, 'general', 1) ;

INSERT INTO take_course
VALUES ('s001', 'c002', '2019-09-03', 93, 98, 'A') ;
INSERT INTO take_course
VALUES ('s004', 'c005', '2019-03-03', 72, 78, 'C') ;
INSERT INTO take_course
VALUES ('s003', 'c002', '2017-09-06', 85, 82, 'B') ;
INSERT INTO take_course
VALUES ('s002', 'c001', '2018-03-10', 31, 50, 'F') ;
INSERT INTO take_course
VALUES ('s001', 'c004', '2019-03-05', 82, 89, 'B') ;
INSERT INTO take_course
VALUES ('s004', 'c003', '2020-09-03', 91, 94, 'A') ;
INSERT INTO take_course
VALUES ('s001', 'c005', '2020-09-03', 74, 79, 'C') ;
INSERT INTO take_course
VALUES ('s003', 'c001', '2019-03-03', 81, 82, 'B') ;
INSERT INTO take_course
VALUES ('s004', 'c002', '2018-03-05', 92, 95, 'A') ;
