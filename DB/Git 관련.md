

- master랑 branch에서 각각 작업해서 merge 안될 때
	- git merge [브랜치] --no-ff
	- git merge 후 branch(현재) 다시 pull하고 push하기


- fetch
	: 원격 History를 가져오는 것


- merge
	- fastforward
		: 분기점에서 수정된 사항이 


- fork
	: 원본 소스를 다운받아 개발하는 방식 (원본 소스에 pull request할 수 있다는 점에서 일반 clone/branch와는 다르다)

- rebase
	: brach의 base(분기 시작점)를 바꾸는 방법
	: 강제 push가 동반되는 방법으로 사용에 주의
	![[Pasted image 20250213164838.png]]



> **commit 수정**
- ---
- amend
	: 이미 올린 commit에 추가로 수정을 하는 방법
	: commit id가 변경됨
	: 이미 push한 경우, 
	

- **cherry-pick**
	: 원하는 commit만 똑 떼서 branch에 추가하는 방법
	
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
	: 되돌아간 상태에 대한 새로운 커밋을 생성한다.
	: 기존 커밋을 지우고 새롭게 생성
```C
# 2. revert:
git revert <취소할 commit>

```


- **reset**
	: 
```C

```


- **git reset**: 시간을 되돌려 어떤 시점으로 돌아가고 싶은 경우, 사용한다.



> SSH(Secure Shell)
- Https(id/pw)와 달리 공개키/비밀키를 사용하는 방식 (서버: 자물쇠 / 로컬: 열쇠)

