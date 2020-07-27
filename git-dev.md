# Git Development

## Rename a file / folder

    git mv old_filename new_filename

---

# Rename a branch 

    git branch -m new_branch_name

---

## Revert unstaged files

If you have unstaged (not in the index) files and you want rid of them all

	git restore *

---

## Undo

Link to a git [undo](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/) resource.
	
---    

## Push new local branch to remote

When you have a new local branch which is tracking nothing,  you can do an initail push to an as yet null remote branch. Note the **-u** shorhand for **--set-upstream**
	
	git push -u origin feature/name
	
---

## Stop tracking a remote

This will stop your local branch from tracking a remote

    git branch --unset-upstream

---

## Tags

### Add tag to specific commit

    git tag -a v[version] [hash] -m "your tag description"

## Diffs

Get a list of changed files between commits

    git diff --name-only old_sha new_sha
    git diff --name-only HEAD~10 HEAD~5
    git diff --name-only HEAD^ HEAD

Get the diff of a single file in a stash

	git difftool stash@{0} -- path/to/file

List files changed in a stash

	git stash show
	
---

## Logs

Show commits on THIS branch only (assumes current branch taken from develop)

    git log develop..

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

## Delete local branches where the remote has gone

Use carefully this forcibly deletes branches regardless or their merge status see https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote

    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D

---

## Revert a pushed --amend commit

See [stackoverflow](https://stackoverflow.com/questions/1459150/how-to-undo-git-commit-amend-done-instead-of-git-commit/1459264) for full credit


### Get the last x local commits,  should contain your (amend)

    git reflog -5

### Reset to just before your (amend)

    git reset <SHA BEFORE THE AMEND> --soft 

### You will now see all the changes in the commit and the amend undone
    git status

### Save ALL the changes to the stash
    git stash

### Get the latest from the remote tracking branch
    git pull origin <YOUR REMOTE BRANCH> --ff-only

### If you want to see that you have the commit you didn't want to amend
    git log
    git log --all --author="Stephen Yeadon" --pretty=format

### Retrieve our changes
    git stash pop

### Now you can create your new unamended commit
    git commit -m 

---

## List branches and tags which contain a given commit

This list all branches and tags which contain a given commit
  
    git branch -r --contains <<commit>>
    git tag --contains  <<commit>>