/*
-- 1. S에서 full score 받은 hacker 추려내기
-- 2. group by -> cnt >= 2 이상
-- 3. H 테이블에서 정보 매칭
-- 4. ORDER BY
*/

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

