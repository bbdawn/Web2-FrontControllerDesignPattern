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

INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('spring','a','강하늘','용인',TO_DATE('1987-12-22','YYYY-MM-DD'),SYSDATE);


INSERT INTO mvc_member(id,password,name,address,birthday,regdate)
VALUES('aop','a','손흥민','용인',TO_DATE('1990-10-20','YYYY-MM-DD'),SYSDATE);
SELECT * FROM mvc_member;

COMMIT








