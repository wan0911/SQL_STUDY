-- 조건 분기문을 잘 생각하기! 무조건 GROUP BY를 생각하지 말고..
-- CASE ~ WHEN 사용법


SELECT N,
            CASE 
                WHEN P IS NULL THEN 'Root'
                WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
                ELSE 'Leaf'
            END
FROM BST
ORDER BY N;

