-- 우유, 요거트 동시 구입 / ID 순


-- 1. 우유를 구매한 ID filtering
-- 2. 그 중 요거트를 구매한 ID filtering




-- 1. 풀이
SELECT CART_ID
FROM CART_PRODUCTS
WHERE CART_ID IN (SELECT CART_ID
                    FROM CART_PRODUCTS
                    WHERE NAME = 'Milk')
    AND NAME = 'Yogurt'	
ORDER BY 1


-- 2. 다른 풀이
SELECT cart_id
from CART_PRODUCTS
where name in ('Milk','Yogurt')
group by cart_id
having count(distinct NAME) >= 2
order by cart_id

