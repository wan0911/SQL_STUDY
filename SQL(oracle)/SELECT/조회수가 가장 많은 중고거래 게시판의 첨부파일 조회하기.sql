-- 조회수 가장 높은 게시물: 첨부파일 경로 / FILE_ID DESC
-- /home/grep/src/ + BOARD_ID + FILE_ID + FILE_NAME + FILE_EXT

-- 한 게시물 당, 여러개의 첨부파일이 있을 수 있다


-- 1. 틀린 풀이
-- GROUP으로 묶은 후, MAX(VIEW)를 조회하려 했으나,
-- MAX(VIEW)는 1개만 존재하므로, HAVING 절을 사용할 필요 X
SELECT BOARD_ID
FROM USED_GOODS_BOARD
GROUP BY BOARD_ID
HAVING VIEWS = MAX(VIEWS);


-- 2. 정답
-- 1. 조회수 가장 높은 ID 찾기 X => MAX(VIEWS)로 바로 찾기
-- 2. 그에 따른 정보
SELECT '/home/grep/src/' || B.BOARD_ID || '/' || F.FILE_ID || F.FILE_NAME || F.FILE_EXT 
        AS FILE_PATH
FROM USED_GOODS_BOARD B
INNER JOIN USED_GOODS_FILE F
ON B.BOARD_ID = F.BOARD_ID
WHERE VIEWS = (SELECT MAX(VIEWS) 
                FROM USED_GOODS_BOARD)
ORDER BY FILE_ID DESC





-- 3. 다른 풀이
-- JOIN 필요 없음
-- MAX
-- 1. 조회수가 가장 높은 BOARD_ID 구하기
SELECT '/home/grep/src/' || BOARD_ID || '/' || FILE_ID || FILE_NAME || FILE_EXT 
        AS FILE_PATH
FROM USED_GOODS_FILE 
WHERE BOARD_ID = (SELECT BOARD_ID
                FROM USED_GOODS_BOARD
                WHERE VIEWS = (SELECT MAX(VIEWS) FROM USED_GOODS_BOARD))
ORDER BY FILE_ID DESC



