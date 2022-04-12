SELECT * FROM MEMBER;

-- 로그인 SQL : client가 전송한 id와 password에 일치하는 회원이 존재하면 그 회원정보를 조회 , 일치하지 않으면 조회 결과 없음 
-- 아이디와 패스워드가 일치 : 로그인 ok 
SELECT name,address FROM member WHERE id='java' AND password='abcd';
-- 패스워드가 일치하지 않을 경우 : 로그인 실패 -> 조회 행이 나오지 않는다 
SELECT name,address FROM member WHERE id='java' AND password='1';
-- 아이디가 없는 경우 : 로그인 실패  
SELECT name,address FROM member WHERE id='kkzz' AND password='1';

UPDATE member SET password='a',name='강하늘',address='판교' WHERE id='spring';

INSERT INTO member(id,password,name,address) VALUES('kia','a','K5','군산');

SELECT * FROM member WHERE id='kia';

-- 아이디 존재 유무를 판단 
-- 존재하면 1 
SELECT COUNT(*) FROM member WHERE id='java';
-- 존재하지 않으면 0 
SELECT COUNT(*) FROM member WHERE id='java8';


































