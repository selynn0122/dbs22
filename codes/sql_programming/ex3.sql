-- ex3.
-- ex3-1
DROP PROCEDURE IF EXISTS ifProc; -- 기존에 만든적이 있다면 삭제
DELIMITER $$
CREATE PROCEDURE ifProc()
BEGIN
  DECLARE var1 INT;  -- var1 변수선언
  SET var1 = 100;  -- 변수에 값 대입

  IF var1 = 100 THEN  -- 만약 @var1이 100이라면,
	SELECT '100입니다.';
  ELSE
    SELECT '100이 아닙니다.';
  END IF;
END $$
DELIMITER ;
CALL ifProc();

-- ex3-1a 매개변수 사용
DROP PROCEDURE IF EXISTS ifProc_; -- 기존에 만든적이 있다면 삭제
DELIMITER $$
CREATE PROCEDURE ifProc_(IN var1 INT)
BEGIN
--   DECLARE ;  -- var1 변수선언
--   SET var1 = 100;  -- 변수에 값 대입

  IF var1 = 100 THEN  -- 만약 @var1이 100이라면,
	SELECT '100입니다.';
  ELSE
    SELECT '100이 아닙니다.';
  END IF;
END $$
DELIMITER ;
CALL ifProc_(100);
CALL ifProc_(103);
-- 매개 변수 사용에 따른 차이 살펴보기

-- ex3-2
DROP PROCEDURE IF EXISTS ifProc2; 
USE empDB;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE; -- 입사일
	DECLARE curDATE DATE; -- 오늘
	DECLARE days INT; -- 근무한 일수

	SELECT hire_date INTO hireDate -- hire_date 열의 결과를 hireDATE에 대입
	   FROM empDB.employees
	   WHERE emp_no = 10001;

	SET curDATE = CURRENT_DATE(); -- 현재 날짜
	SET days =  DATEDIFF(curDATE, hireDATE); -- 날짜의 차이, 일 단위

	IF (days/365) >= 5 THEN -- 5년이 지났다면
		  SELECT CONCAT('입사한지 ', days, '일이나 지났습니다. 축하합니다!');
	ELSE
		  SELECT '입사한지 ' + days + '일밖에 안되었네요. 열심히 일하세요.' ;
	END IF;
END $$
DELIMITER ;
CALL ifProc2();
-- to do: concat 사용여부에 따른 차이 살펴보기
-- note: Local variables needs to be declared using DECLARE before accessing it.

-- ex3-2a 매게변수 사용
DROP PROCEDURE IF EXISTS ifProc2_; 
DELIMITER $$
CREATE PROCEDURE ifProc2_(IN emp_id INT)
BEGIN
	DECLARE hireDATE DATE; -- 입사일
	DECLARE curDATE DATE; -- 오늘
	DECLARE days INT; -- 근무한 일수

	SELECT hire_date INTO hireDate -- hire_date 열의 결과를 hireDATE에 대입
	   FROM empDB.employees
	   WHERE emp_no = emp_id;

	SET curDATE = CURRENT_DATE(); -- 현재 날짜
	SET days =  DATEDIFF(curDATE, hireDATE); -- 날짜의 차이, 일 단위

	IF (days/365) >= 35 THEN -- 35년이 지났다면
		  SELECT CONCAT('입사한지 ', days, '일이나 지났습니다. 축하합니다!');
	ELSE
		  SELECT '입사한지 ' + days + '일밖에 안되었네요. 열심히 일하세요.' ;
	END IF;
END $$
DELIMITER ;
CALL ifProc2_(10001);
CALL ifProc2_(10187);
-- between 사용해서 두 개의 입력(a,b)을 받아 입사일이a와 b 사이인 사원 성 (fist_name), 이름 (last_name), 성별 (gender) 를 구하는 procedure 만들기

-- ex3-3
DROP PROCEDURE IF EXISTS ifProc3; 
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE point INT ;
    DECLARE credit CHAR(1);
    SET point = 77 ;
    
    IF point >= 90 THEN
		SET credit = 'A';
    ELSEIF point >= 80 THEN
		SET credit = 'B';
    ELSEIF point >= 70 THEN
		SET credit = 'C';
    ELSEIF point >= 60 THEN
		SET credit = 'D';
    ELSE
		SET credit = 'F';
    END IF;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL ifProc3();

-- ex3-3a in, out 매개변수
DROP PROCEDURE IF EXISTS ifProc3_; 
DELIMITER $$
CREATE PROCEDURE ifProc3_(IN point INT, OUT credit CHAR(1))
BEGIN
    -- DECLARE point INT ;
    -- DECLARE credit CHAR(1);
    -- SET point = 77 ;
    
    IF point >= 90 THEN
		SET credit = 'A';
    ELSEIF point >= 80 THEN
		SET credit = 'B';
    ELSEIF point >= 70 THEN
		SET credit = 'C';
    ELSEIF point >= 60 THEN
		SET credit = 'D';
    ELSE
		SET credit = 'F';
    END IF;
    SELECT CONCAT('취득점수==>', point) AS '점수', CONCAT('학점==>', credit) AS '학점';
END $$
DELIMITER ;
CALL ifProc3_(77,@credit);
SELECT @credit;

CALL ifProc3_(87,@credit);
SELECT @credit;

-- to do: credit 변수의 값의 변화 살펴보기
-- to do: score 도 변수로 두고 while 문 사용하여 점수 변화에 따른 학점 변화 살펴보는 코드 작성 
