

- master랑 branch에서 각각 작업해서 merge 안될 때
	- git merge [브랜치] --no-ff
	- git merge 후 branch(현재) 다시 pull하고 push하기


- fetch
	- 원격 History를 가져오는 것


- merge
	- fastforward
		- 분기점에서 수정된 사항이 


- fork
	- 원본 소스를 다운받아 개발하는 방식 (원본 소스에 pull request할 수 있다는 점에서 일반 clone/branch와는 다르다)

- rebase
	- brach의 base(분기 시작점)를 바꾸는 방법
	- 강제 push가 동반되는 방법으로 사용에 주의



> **commit 수정**
- ---
- amend
	- 이미 올린 commit에 추가로 수정을 하는 방법
	- commit id가 변경됨
	- 이미 push한 경우, 
	

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




> SSH(Secure Shell)
- Https(id/pw)와 달리 공개키/비밀키를 사용하는 방식 (서버: 자물쇠 / 로컬: 열쇠)

