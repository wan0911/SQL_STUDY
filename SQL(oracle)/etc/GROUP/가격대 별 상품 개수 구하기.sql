-- CODE 앞 2자리 = 카테고리 코드
-- 만원 단위 / 상품 개수 / 가격순

-- 1. 서브쿼리: 가격대별 그룹을 만들고
-- 2. 그룹에 따라 COUNT

/*
;, "" 주의해서 써야 함... ㅠ
*/


-- 1. 오답
-- 범위... CASE WHEN을 쓸까 했는데, 범위는 무한대...
SELECT PRODUCT_ID, 
    CASE WHEN PRICE >= 0 AND PRICE < 10000 THEN 0
          WHEN PRICE >= 10000 AND PRICE < 20000 THEN 10000
          WHEN PRICE >= 20000 AND PRICE < 30000 THEN 20000
          WHEN PRICE >= 30000 AND PRICE < 40000 THEN 30000
          ELSE -1
      END AS "가격대"
FROM PRODUCT


-- 2. 정답
-- 만원 대 별이니까.. 만원 대 앞자리만 자른다 -> TRUNC, 0 / else 생각? ㄴㄴ
SELECT TRUNC(PRICE, -4) AS PRICE_GROUP, COUNT(PRODUCT_ID) AS PRODUCTS
FROM PRODUCT 
GROUP BY TRUNC(PRICE, -4)
ORDER BY 1

