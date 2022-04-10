CREATE TABLE mvc_product(
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	maker VARCHAR2(100) NOT NULL,
	price NUMBER NOT NULL,
	regdate DATE NOT NULL
)
SELECT * FROM mvc_product;

CREATE SEQUENCE mvc_product_seq;

INSERT INTO mvc_product(id,name,maker,price,regdate) VALUES(mvc_product_seq.nextval,'진라면','오뚜기',1100,sysdate);

SELECT id,name,maker,price,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') FROM mvc_product WHERE id=1;

commit

SELECT id,name,TO_CHAR(regdate,'YYYY.MM.DD') FROM mvc_product ORDER BY id DESC;

















