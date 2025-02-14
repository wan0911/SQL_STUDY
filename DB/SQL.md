#### 친절한 SQL 튜닝 정리

- SGA(System Global Area)
- 라이브러리 캐시: 내부 프로시저를 반복 재사용할 수 있도록 캐싱해 두는 메모리 공간 (*실행한 SQL문을 모아두는 장소)
  	- 소프트 파싱: 라이브러리 캐시에서  SQL 실행 이력이 있을 경우 바로 실행 단계로 넘어간다.
  	- 하드 파싱: 라이브러리 캐시에서  SQL 실행 이력이 없을 경우 [최적화 및 로우 소스 생성] 단계를 모두 실행한다.
  	   * 내비게이션에서 경로를 탐색하는 경우를 생각하면 된다.
  	   * 최적화(내부 프로시저 생성, ...)를 수행하는 것은 '옵티마이저'
  	 
  	- 라이브러리 캐시에서 **키(Key)**는 'SQL문 그 자체'이다.


  	 
- SQL이 느린 이유: 디스크 I/O
  - OS 또는 I/O 서브 시스템이 I/O를 처리하는 동안 프로세스는 잠을 잔다. (img. 프로세스 생명주기 참조)
    -   I/O = 잠(Sleep)
    -   프로세스: 실행중인 프로그램
      - 여러 프로세스가 하나의 CPU를 공유할 수 있지만, "특정 순간에는(ex. 디스크에서 데이터 읽기 -> CPU를 OS에 반환)" 하나의 프로세스만 CPU를 사용할 수 있다. -> Sleep의 이유
        - 그래서.. I/O 튜닝이 안된 시스템은 수많은 프로세스가 동시다발적으로 I/O Call을 호출하니 느려질 수 밖에 없다.
          - 예시) 쇼핑몰 오픈 이벤트로 사용자가 몰릴 때
            1. 튜닝 X
            ```SQL
            SELECT * FROM TB_USR_MST WHERE USER_ID = 'user01'
            SELECT * FROM TB_USR_MST WHERE USER_ID = 'user02'
            SELECT * FROM TB_USR_MST WHERE USER_ID = 'user03' ...
            ```
            2. 튜닝 O
            ```SQL
            SELECT * FROM TB_USR_MST WHRER USER_ID = :USER_ID
            ```
               
      

 ##### 데이터베이스 저장 구조
 - 데이터를 읽고 쓰는 단위: 블록

 - 논리적 I/O vs 물리적 I/O
   -   
  
