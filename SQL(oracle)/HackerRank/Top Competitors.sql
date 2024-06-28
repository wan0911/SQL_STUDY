/*
-- 1. S에서 full score 받은 hacker 추려내기
-- 2. group by -> cnt >= 2 이상
-- 3. H 테이블에서 정보 매칭
-- 4. ORDER BY
*/


-- 1) JOIN 없이
SELECT H.hacker_id, H.name
    FROM (SELECT S.hacker_id, COUNT(1) AS CNT
                  FROM Submissions S
                WHERE S.score = (SELECT D.score
                                                  FROM Challenges C
                                                  INNER
                                                    JOIN Difficulty D
                                                       ON C.difficulty_level = D.difficulty_level
                                                WHERE C.challenge_id = S.challenge_id)
                GROUP
                        BY S.hacker_id
                HAVING COUNT(S.hacker_id) >= 2) A
      INNER 
        JOIN Hackers H
          ON A.hacker_id = H.hacker_id
ORDER
        BY A.CNT DESC, H.hacker_id;




-- 2) JOIN O
-- JOIN으로 푸는게 좋을듯.. WHERE -> GROUP BY를 걸면 된다 (GROUP BY 사용 더 생각하기)
SELECT S.hacker_id, H.name
  FROM Submissions S
    JOIN Challenges C   ON C.challenge_id = S.challenge_id
    JOIN Difficulty D       ON D.difficulty_level = C.difficulty_level  
    JOIN Hackers H        ON H.hacker_id = S.hacker_id
WHERE S.score = D.score
GROUP
        BY S.hacker_id, H.name
HAVING COUNT(S.hacker_id) >= 2
ORDER BY COUNT(S.hacker_id) DESC, S.hacker_id;
