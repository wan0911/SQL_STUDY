-- Student, Grade
-- Grade 8보다 작으면 -> 이름 null
-- 성적 내림차순, 이름순

-- 1~7 -> marks 오름차순

-- marks -> Grade
-- 기준 = Grade 8



-- 1) 틀린 풀이
-- 두 쿼리를 어떻게 합쳐야 할 지 모르겠음.. -> UNION은 ORDER 정렬이 1번만 가능하다
-- => 각각 쿼리를 구하는 것이 아니라, 하나의 쿼리로.. (개별 결과를 합치는게 아님)
SELECT NAME
            , CASE WHEN MARKS = 100 THEN 9
                          ELSE TRUNC(MARKS / 10, 0) + 1 
              END AS GRADE 
            , MARKS
FROM STUDENTS
WHERE MARKS >= 70
ORDER BY GRADE DESC, NAME
UNION
SELECT 'NULL' AS NAME
            , CASE WHEN MARKS BETWEEN 0 AND 9 THEN 1
                          ELSE TRUNC(MARKS / 10, 0) + 1
             END AS GRADE
            , MARKS
FROM STUDENTS
WHERE MARKS < 70
ORDER BY GRADE DESC, MARKS;



-- 2) 맞은 풀이
-- 범위로 JOIN한다는 생각을 못함..., CASE WHEN만 생각했다
SELECT CASE WHEN MARKS < 70 THEN 'NULL'
                          ELSE S.NAME
              END AS NAME
           , G.GRADE
           , S.MARKS
FROM STUDENTS S
JOIN GRADES G
  ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY GRADE DESC, NAME, MARKS;

