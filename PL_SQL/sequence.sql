/* 2. 시퀀스 */ 

-- 2.1. 시퀀스 생성 
CREATE SEQUENCE SEQ_MYUSER
  START WITH 0
  INCREMENT BY 1
  MAXVALUE 1000000000
  MINVALUE 0
  NOCYCLE;


-- 2.1 시퀀스 조회 
 SELECT * FROM all_sequences;


-- 2.2 시퀀스 수정
ALTER SEQUENCE [시퀀스명]
INCREMENT BY 수정할 증가값
MAXVALUE 수정할 최대값
MINVALUE 수정할 최소값
CYCLE 또는 NOCYCLE;

-- 시퀀스의 시작값을 변경하는방법
-- 1. 시퀀스를 삭제 후 다시 생성.
-- 2. [INCREMENT BY 수정할 증가값]을 변경하여 원하는 시작값으로 이동.


 
-- 2.3 시퀀스 삭제 
DROP SEQUENCE [시퀀스명];