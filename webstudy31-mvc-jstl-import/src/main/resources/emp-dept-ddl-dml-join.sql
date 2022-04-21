/*
	사원테이블 
	--------											사원테이블							부서테이블
	사원번호			--3정규화에 의해 분리 -->	--------  ->|0 -------|--
	--------											사원번호							부서번호
	사원명										        사원명								-----
														월급								부서명
	월급												부서번호(fk)						지역
	부서번호																				부서전화번호 
	부서명
	지역
	부서전화번호
	
	부서테이블 : 부모 테이블 , 참조 대상이 되는 테이블 
	사원테이블 : 자식 테이블 , 참조하는 테이블 
	
	사원테이블에서 부서테이블을 참조할 수 있도록 foreign key 설정해서 참조 무결성을 보장한다 
	-> 사원 정보가 저장될 때는 부서테이블에 존재하는 부서번호로만 사원의 부서번호가 등록될 수 있도록 한다 	
*/
-- 부모테이블(참조대상테이블) 부터 만들어야 한다 
CREATE TABLE mvc_department(
	deptno NUMBER PRIMARY KEY,
	dname VARCHAR2(100) NOT NULL,
	loc VARCHAR2(100) NOT NULL,
	tel VARCHAR2(100) NOT NULL
)
CREATE TABLE mvc_employee(
	empno NUMBER PRIMARY KEY,
	ename VARCHAR2(100) NOT NULL,
	sal NUMBER NOT NULL,
	deptno NUMBER NOT NULL,
	CONSTRAINT fk_mvc_deptno FOREIGN KEY(deptno) REFERENCES mvc_department(deptno)
)
-- CONSTAINT(제약조건키워드)  fk_mvc_deptno(제약조건명:유일해야함)
-- FOREIGN KEY(deptno) : deptno 는 현 테이블의 컬럼명 , 이 컬럼에 fk 제약조건을 주겠다는 의미 
-- REFERENCES mvc_department(deptno) : mvc_department 부모 or 참조대상 테이블 , deptno 부모 테이블의 참조하는 컬럼명 

-- 부서 정보를 저장 
INSERT INTO mvc_department(deptno,dname,loc,tel) VALUES(10,'전략기획','오리','031');
INSERT INTO mvc_department(deptno,dname,loc,tel) VALUES(20,'공공사업','종로','02');
INSERT INTO mvc_department(deptno,dname,loc,tel) VALUES(30,'연구개발','판교','033');

-- 사원 정보를 저장 
-- FK 테스트 : ERROR  parent key not found : 참조하는 부서테이블의 부서번호에는 50번 부서는 존재하지 않기 때문에 ERROR 
--				 FK로 참조무결성을 보장한다 
INSERT INTO mvc_employee(empno,ename,sal,deptno) VALUES(1,'아이유',400,50);


INSERT INTO mvc_employee(empno,ename,sal,deptno) VALUES(1,'아이유',400,10);
INSERT INTO mvc_employee(empno,ename,sal,deptno) VALUES(2,'박보검',300,10);
INSERT INTO mvc_employee(empno,ename,sal,deptno) VALUES(3,'강하늘',600,20);

COMMIT


-- 총 사원수 
SELECT COUNT(*) FROM mvc_employee;


-- ename, dname, loc 
-- mvc_employee 와 mvc_department  inner join 

SELECT e.ename,d.dname,d.loc
FROM mvc_employee e,mvc_department d
WHERE e.deptno=d.deptno

-- ANSI SQL
SELECT e.ename,d.dname,d.loc
FROM mvc_employee e
INNER JOIN mvc_department d  ON e.deptno=d.deptno

-- mvc_department : 부서 3개  mvc_employee : 2개 부서로 구성 
-- 사원이 없는 부서정보까지 모두 조회 -> Outer join 

-- outer join 연산기호 (+) 는 정보가 없는 측 검색 조건에 기재 
SELECT e.ename,d.dname,d.loc
FROM mvc_employee e,mvc_department d
WHERE e.deptno(+)=d.deptno

-- ANSI SQL 
SELECT e.ename,d.dname,d.loc
FROM mvc_employee e
RIGHT OUTER JOIN mvc_department d  ON e.deptno=d.deptno

-- 사원 상세 정보 
SELECT e.empno,e.ename,e.sal,d.deptno,d.dname,d.loc,d.tel
FROM	mvc_employee e,mvc_department d
WHERE e.deptno=d.deptno
AND e.empno=1

-- 부서명(dname), 근무지(loc), 부서별 사원수(count(*) as emp_count) 를 조회 
-- 부서명과 근무지는 mvc_department table 정보
-- 부서별 사원수는 mvc_employee table 정보 

-- step1 : mvc_employee table 의 정보를 이용해 부서번호(deptno) 별로 사원수 통계 : group by 

SELECT deptno,count(*) as emp_count
FROM mvc_employee
GROUP BY deptno

-- step2 : 사원수 통계를 기반으로 두 정보를 inner join 한다
--			 step1의 sql을 inline view ( from 절의 subquery ) 로 처리해서 mvc_department 테이블을 join   
/*
 	 SELECT
 	 FROM table1 별칭, table2 별칭 
 	 WHERE 조인조건 
 	 ---------------------
 	 SELECT
 	 FROM (subquery) 별칭, table2 별칭 
 	 WHERE 조인조건
 */

SELECT d.dname,d.loc,g.emp_count
FROM	(
	SELECT deptno,count(*) as emp_count
	FROM mvc_employee
	GROUP BY deptno
) g,mvc_department d
WHERE g.deptno=d.deptno

-- ANSI SQL 
SELECT d.dname,d.loc,g.emp_count
FROM (
	SELECT deptno,count(*) as emp_count
	FROM mvc_employee
	GROUP BY deptno
) g
INNER JOIN  mvc_department d  ON g.deptno=d.deptno

-- step3. 현재 부서정보는 전략기획,공공사업,연구개발 부서가 있다 
--			step2 sql 의 실행결과는 전략기획, 공공사업의 사원수들만 조회된다 
--			이유는 연구개발 부서에는 현재 사원이 없기 때문 
--		    INNER JOIN 은 두 테이블 간의 상응하는 컬럼의 정보가 존재할 때만 조회되기 때문이다 
--			현재 사원이 존재하지 않는 부서(연구개발부)의 정보도 모두 조회하기 위해서는 Outer Join 이 필요하다 
--			Outer Join : 테이블 간의 상응하는 컬럼의 정보가 존재하지 않을 때에도 모두 조회 
SELECT * FROM mvc_department;

-- Outer Join 연산 기호 (+) 는 데이터가 없는 측의 조인조건에 기술 
SELECT d.dname,d.loc,g.emp_count
FROM	(
	SELECT deptno,count(*) as emp_count
	FROM mvc_employee
	GROUP BY deptno
) g,mvc_department d
WHERE g.deptno(+)=d.deptno

-- ANSI SQL : OUTER JOIN 
SELECT d.dname,d.loc,g.emp_count
FROM (
	SELECT deptno,count(*) as emp_count
	FROM mvc_employee
	GROUP BY deptno
) g
RIGHT OUTER JOIN  mvc_department d  ON g.deptno=d.deptno

-- NVL 함수 :  NVL(값,지정값) -> 값이 null 일 경우 지정값으로 대체 
SELECT NVL(NULL,0) FROM DUAL;

-- step4 : Outer join 결과 중 null 인 사원수 정보를 0으로 대체해서 조회 
SELECT d.dname,d.loc,NVL(g.emp_count,0) AS emp_count
FROM (
	SELECT deptno,count(*) as emp_count
	FROM mvc_employee
	GROUP BY deptno
) g
RIGHT OUTER JOIN  mvc_department d  ON g.deptno=d.deptno












