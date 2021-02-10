#Log and commit details

## Commit Information

This will tell you the name of the branch the original commit was made on. You NEED to be on the branch which the commit was merged into

    git log <<SHA>>..HEAD --merges  --oneline | tail -1

## List branches and tags which contain a given commit

List all branches and tags which contain a given commit
  
    git branch -r --contains <<commit>>
    git tag --contains  <<commit>>

---


## Logs

Show commits on THIS branch only (assumes current branch taken from develop)

    git log develop..

Show top 100 commits on a branch from a given date for a given author showing only file name details with no merges

    git log --since="2001-01-01" --author="me@mydomain.com" -n 100 --name-status --no-merges

Show commits only belonging to you on the current branch

    git log --author=me@mydomain.com

Show which branch a commit was made on

	  git log 8f08c15..HEAD --ancestry-path --oneline --color

or only the merges 

	  git log 8f08c15..HEAD --ancestry-path --merges --oneline --color
	
or this might work
	
	  git name-rev 8f08c15

---

## List Branch Authors

This actually lists the last person to commit not the author see [stack overflow](https://stackoverflow.com/questions/12055198/find-out-a-git-branch-creator)

	  git for-each-ref --format='%(color:cyan)%(authordate:format:%m/%d/%Y %I:%M %p)%09%(align:25,left)%(color:yellow)%(authorname)%(end)%09%(color:reset)%(refname:strip=3)' --sort=authordate refs/remotes

---