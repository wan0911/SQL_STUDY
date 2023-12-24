-- PL/SQL 실습

-- 1. TABLE

-- 1.1.TB 생성 
CREATE TABLE MYUSER (
    USERNO NUMBER(11,0),
    USERID VARCHAR2(20),
    USERPW VARCHAR(30) NOT NULL,
    NICKNAME VARCHAR(30) UNIQUE,
    EMAIL VARCHAR(50) NULL,
    BIRTHYEAR NUMBER(11,0) CONSTRAINTS CH_BIRTHYEAR CHECK(BIRTHYEAR >14),
PRIMARY KEY (USERNO)
); 

COMMIT;


-- 1.1. TB 삭제
DROP TABLE MYUSER:



-- 현재 DB 내 TB 조회 
SELECT * FROM all_tables
WHERE TABLE_NAME = 'MYUSER';



INSERT INTO  MYUSER 
	(
		USERNO,
		USERID,
		USERPW,
		NICKNAME,
		EMAIL,
		BIRTHYEAR
	)
	VALUES 
	(
		SEQ_MYUSER.nextval,
		'aaa',
		'aaa',
		'nicknmf',
		'aaas@naber.com',
		50
);


SELECT * FROM MYUSER;




----------------------------------------------------------------------
-- 2. 시퀀스

-- 2.1. 시퀀스 생성 
CREATE SEQUENCE SEQ_MYUSER
  START WITH 0
  INCREMENT BY 1
  MAXVALUE 1000000000
  MINVALUE 0
  NOCYCLE;


-- 2.1 시퀀스 조회 
 SELECT * FROM all_sequences;

 
 

----------------------------------------------------------------------
-- 3. 프로시

-- 3.1 프로시저 생성/업데이트 

CREATE OR REPLACE PROCEDURE INSERT_USER
(
	In_userid IN varchar2,
	In_userpw IN varchar2,
	In_nickname IN varchar2,
	InOut_state IN OUT NUMBER 
)
IS 
	v_username varchar2(250) := 'AAA';
	v_userno number(11,0);

BEGIN
	
	BEGIN
		INSERT INTO MYUSER 
		(
			USERNO,
			USERID,
			USERPW,
			NICKNAME,
			EMAIL,
			BIRTHYEAR
		)
		VALUES
		(
			SEQ_MYUSER.nextval,
			In_userid,
			In_userpw,
			In_nickname,
			'aa@naver.com',
			50
		);
	
	
		SELECT 1 INTO v_userno
		FROM MYUSER
		WHERE USERID = In_userid
		AND ROWNUM = 1;
	
		InOut_state = v_userno;
		
		-- 예외 처
		EXCEPTION WHEN NO_DATA_FOUND THEN
		InOut_state = 0;
		WHEN others THEN
		dbms_output.put_line('1단');
		raise;
		
	END;
	

	UPDATE MYUSER 
	SET EMAIL = 'bb@naver.com'
	WHERE BIRTHYEAR = 50;

	EXCEPTION WHEN OTHERS THEN
	dbms_output.put_line('2단');

END;





-- 3.2 프로시저 호출

DECLARE
    v_state NUMBER(11,0):=50;
BEGIN
    INSERT_USER('aa','bb','cc',v_state);

	--결과값 출력 
    dbms_output.put_line('결과'||v_state);
END;




-- 3.3 현재 프로시저 조회
SELECT * FROM SYS.user_procedures;