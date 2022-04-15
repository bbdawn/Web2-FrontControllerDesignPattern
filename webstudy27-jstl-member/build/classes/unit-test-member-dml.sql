-- unit test
-- 아이디로 회원검색 sql 
SELECT id,name,address,TO_CHAR(birthday,'YYYY-MM-DD'),TO_CHAR(regdate,'YYYY-MM-DD HH24:MM:SS') 
FROM mvc_member WHERE id='java';
-- 로그인 sql 
SELECT name,address,TO_CHAR(birthday,'YYYY-MM-DD') FROM mvc_member WHERE id='java' AND password='a';

-- 주소로 회원검색
SELECT id,name,TO_CHAR(birthday,'YYYY-MM-DD') FROM mvc_member WHERE address='오리';

-- 회원 수정 테스트  id : queen  회원을 대상으로 한다
SELECT * FROM mvc_member WHERE id='queen'; 

-- 회원 수정 
UPDATE mvc_member SET password='b',name='머큐리',address='용인',birthday=TO_DATE('1999-11-11','YYYY-MM-DD') WHERE id='queen';

-- 회원 가입
INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('java','a','아이유','오리',TO_DATE('2001-03-11','YYYY-MM-DD'),SYSDATE);

-- 아이디 중복확인 : 존재하면 1 , 존재하지 않으면 0 
SELECT COUNT(*) FROM mvc_member WHERE id='java';
SELECT COUNT(*) FROM mvc_member WHERE id='java8';



-- DDL 
DROP TABLE mvc_member;

CREATE TABLE mvc_member(
	id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	address VARCHAR2(100) NOT NULL,
	birthday DATE NOT NULL,
	regdate DATE NOT NULL
)
INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('java','a','아이유','오리',TO_DATE('2001-03-11','YYYY-MM-DD'),SYSDATE);

INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('queen','a','프레디','오리',TO_DATE('1970-02-11','YYYY-MM-DD'),SYSDATE);

INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('beatles','a','존레논','용인',TO_DATE('1980-11-23','YYYY-MM-DD'),SYSDATE);


SELECT * FROM mvc_member;

COMMIT








