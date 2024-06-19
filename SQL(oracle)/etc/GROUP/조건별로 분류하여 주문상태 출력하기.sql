-- 5월 1일 기준: 출고완료/출고미정/출고대기, 주문ID ASC


SELECT ORDER_ID, PRODUCT_ID, TO_CHAR(OUT_DATE, 'YYYY-MM-DD') OUT_DATE,
       CASE
           WHEN OUT_DATE <= TO_DATE('20220501', 'YYYYMMDD') THEN '출고완료'
           WHEN OUT_DATE IS NULL THEN '출고미정'
           ELSE '출고대기'
       END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID ASC;
