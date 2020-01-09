# Git Development

## Rename a file / folder

    git mv old_filename new_filename

---

## Tags

### Add tag to specific commit

    git tag -a v[version] [hash] -m "your tag description"

## Diffs

Get a list of changed files between commits

    git diff --name-only old_sha new_sha
    git diff --name-only HEAD~10 HEAD~5
    git diff --name-only HEAD^ HEAD

---

## Logs

Show commits on THIS branch only (assumes current branch taken from develop)

    git log develop..

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

### Retrieve our changes
    git stash pop

### Now you can create your new unamended commit
    git commit -m 

---