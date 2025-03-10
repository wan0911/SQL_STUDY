
> **원격 저장소(repository) 관련**
---
```C
git remote -v // 원격 저장소 목록
git remote add <저장소 이름> <url> //
git remote rename <이전 이름> <새 이름> // 원격저장소 이름 변경
git remote remove <저장소 이름> // 원격 저장소 삭제
```

- **fork**
	- 원본 소스를 다운받아 개발하는 방식
	- *원본 소스에 <u>pull request</u>할 수 있다는 점에서 일반 clone/branch와는 다르다


- **upstream** (상류)
	- 원격 저장소에 있는 <u>변경 사항</u>을 가져오는 기능
	- [시스템 repository] --(fork)--> [내 repository ]--(pull)--> [Local 환경]
     upstream                                 origin                            기준
``` C
git fetch upstream // upstream 원격 저장소의 변경사항을 로컬 저장소로 가져온다.
git fetch upstream <브랜치> // upstream의 특정 브랜치의 내용만 가져온다.
```


- **fetch**
	- 원격 레포지토리의 History를 가져오는 것
``` C
git fetch <원격 저장소 이름> <브랜치 이름> // 원격 저장소(+특정 브랜치)의 커밋,브랜치,태그 History를 로컬 저장소로 가져온다.
```
	: branch 속성의 경우 대형 프로젝트 개발시 수많은 branch를 확인하며 개발하지 않기 때문에 필요하다.



---

### <u>commit 관련</u>


- **reflog**
	- git log 상세 내역 확인 (`git log` 보다 상세 내역을 볼 수 있음)
	- 유효 범위 = <u>로컬 저장소</u>
	

- **merge**
	- fastforward
		: 분기점에서 수정된 사항이 
	- 에러 관련
		- master랑 branch에서 각각 작업해서 merge 안될 때
			- git merge [브랜치] --no-ff
			- git merge 후 branch(현재) 다시 pull하고 push하기


- **rebase**
	- brach의 base(분기 시작점)를 바꾸는 방법
		- 두 브랜치 간 <u>"분기 시작점"이 동일 할 때 </u>
	- 강제 push가 동반되는 방법으로 사용에 주의
- **rebase -i**
	- 



> **commit 수정**
---
- **amend**
	- 이미 올린 commit에 추가로 수정을 하는 방법
		- <u>HEAD 커밋을 수정한다</u>
		- 다른 커밋을 수정하고 싶다면? HEAD를 바꿔서 수정한 후, 다시 HEAD를 돌리면 된다
	- commit id(해시 체크섬)가 변경됨
		- 기존 commit이 변경되는 것이 아니라, 아예 새로운 commit으로 대체되는 것
		- 이미 push한 commit을 수정할 경우, 강제로 push해야 한다. -> <u>가급적이면 사용 지양</u>
```C
# 1. 커밋 메세지 수정
git commit --amend -m "commit 메세지 수정" // 커밋 메세지 수정
# 2. 커밋 내용 추가
git add . // 추가 내용 add
git commit -- amend // commit에 추가 완료

```


- **cherry-pick**
	- 원하는 commit만 똑 떼서 branch에 추가하는 방법
	
```C
# git cherry-pick {커밋 해시} 
git cherry-pick 34b4cab 
git cherry-pick 13f03ab 

# 또는 
git cherry-pick 34b4cab 13f03ab 
# 또는 연속적인 커밋일 경우 
git cherry-pick 34b4cab..fe834e9

# merge commit을 cherry-pick
git cherry-pick -m 1 {머지 커밋 해시}
# cherry-pick 취소
git cherry-pick --abort
```


- **diff**
	- git과 작업 내역간 변경사항 확인
```C
git diff <a:작업 전> <b:작업 후> // 작업 전, 후 변경사항 비교
git diff main // main 브랜치와 변경점 확인

git diff --check // 공백 문자 확인
```




> **commit 복구**
---
- **restore**
```C
git restore <file name>
# 특정 커밋 시점으로 되돌리기
git restore --source <commit>
```


- **revert**
	- 되돌아간 상태에 대한 (그 시점을 대신하는) 새로운 커밋을 생성한다.
	- 기존 커밋을 지우고 그 커밋을 대체할 새로운 커밋 생성
	- 1 -> 2 -> 3 -> 4 -> 5 
		- 5의 커밋에서 3으로 revert 시, 기존 3 커밋을 지우고 새로운 3' 커밋을 만든다.
		- 4, 5  커밋은 삭제되지 않으므로 충돌(Confilct)를 야기할 수 있다
			- 4로 revert -> 4커밋 취소 -> 3로 revert 로 하면 되지만 번거롭다..
```C
git revert <취소할 commit ID>
git revert <취소하고자 하는 commit ID>..<현재 commit ID>
```


- **reset**
	- "특정 시점"으로 아예 되돌아가는 방법
	- 특정 시점 이후의 커밋들은 아예 삭제된다.
```C
# 1. 작업 디렉토리와 스테이지 모두 유지하고 commit만 되돌리기
git reset --sort
# 2. 작업 디렉토리만 유지하고 스테이지와 commit 되돌리기
git reset --mixed
# 3. 작업 디렉토리, 스테이지, commit 모두 되돌리기
git reset --hard
```


- **clean**
```C
git clean -f -d // untracked 파일 모두 삭제
```


