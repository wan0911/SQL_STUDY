-- 중성화 = N -> Y / 아이디 순
-- SEX_UPON_INTAKE LIKE '%Intact%' / SEX_UPON_OUTCOME != Intact

/*
- NOT LIKE 사용 -> 중성화한 동물만 찾으면 되므로, "SEX_UPON_INTAKE != SEX_UPON_OUTCOME"으로 필터링하면 된다.
- NOT IN, !=와 같은 부정형 쿼리는 테이블의 모든 데이터를 읽어야해서 효율이 좋지않다.
*/


SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS I
INNER JOIN ANIMAL_OUTS O
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.SEX_UPON_INTAKE LIKE '%Intact%'
AND O.SEX_UPON_OUTCOME NOT LIKE '%Intact%'
ORDER BY I.ANIMAL_ID