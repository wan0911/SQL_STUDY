-- 22년 10/16 / AVAILABILITY 추가: 대여중, 대여가능 / 자동차ID desc
-- 자동차 ID 당, 여러 대여 기록
-- 대여기간 중 20221016이 포함되었는지


-- 자동차ID로 그룹화
-- DATE 범위 기준?


-- 1. 오답
-- 가장 최신 DATE -> MAX
SELECT CAR_ID,
       CASE WHEN '20221016' 
                 BETWEEN TO_CHAR(START_DATE, 'yyyymmdd') AND TO_CHAR(END_DATE, 'yyyymmdd')
                 THEN '대여중'
            ELSE '대여 가능' END 
            AS AVAILABILITY
FROM (SELECT CAR_ID, MAX(START_DATE) START_DATE, MAX(END_DATE) END_DATE
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      GROUP BY CAR_ID)
ORDER BY CAR_ID DESC;



-- 2. 정답
-- 대여여부: CNT -> SUM으로 체크
-- SUM을 사용하면 CAR_ID로 GROUPING 하는 데 문제 X
SELECT CAR_ID,
       CASE WHEN AP = 0 THEN '대여 가능'
            ELSE '대여중' END
        AS AVAILABILITY
FROM (SELECT CAR_ID, 
             SUM(CASE WHEN TO_DATE('2022-10-16', 'YYYY-MM-DD') 
                 BETWEEN START_DATE AND END_DATE THEN 1 
                 ELSE 0 END) AS AP
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      GROUP BY CAR_ID)
ORDER BY 1 DESC;   