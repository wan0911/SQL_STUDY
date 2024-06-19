-- 리뷰를 가장 많이 작성한 회원의 리뷰들
-- 리뷰 작성일, 텍스트 ASC



-- 최다 작성자가 여러명일 수 있다.
SELECT M.MEMBER_NAME, R.REVIEW_TEXT, TO_CHAR(R.REVIEW_DATE, 'YYYY-MM-DD') REVIEW_DATE
FROM REST_REVIEW R
INNER JOIN MEMBER_PROFILE M
ON R.MEMBER_ID = M.MEMBER_ID
WHERE M.MEMBER_ID IN (SELECT MEMBER_ID	
                    FROM REST_REVIEW
                    GROUP BY MEMBER_ID
                    HAVING COUNT(MEMBER_ID) = (SELECT MAX(COUNT(MEMBER_ID))
                                                FROM REST_REVIEW
                                                GROUP BY MEMBER_ID))
ORDER BY 3, 2

                        

-- 문제 오류 있다.
-- 최다 작성자(여러명)들에 대한 리뷰를 모두 출력해야 하는데, 그 중 1사람(정소율, 다른 사람은 또 안됨)의 리뷰만 출력해와도 통과가 됨