# Git

## Setup

### Git global setup

    git config --global user.name "Prename Name"
    git config --global user.email "email@example.com"

Just remove the `--global` flag for local setup.

### Create a new repository

    git clone https://user@github.com/user/repo.git
    cd repo
    touch README.md
    git add README.md
    git commit -m "add README"
    git push -u origin master

### Existing folder

    cd existing_folder
    git init
    git remote add origin https://user@github.com/user/repo.git
    git add .
    git commit
    git push -u origin master

### Existing Git repository

    cd existing_repo
    git remote add origin https://user@github.com/user/repo.git
    git push -u origin --all
    git push -u origin --tags

### Update remote location

```bash
git remote rm origin
git remote add origin <new-location>
git branch --set-upstream-to=origin/master master
```

---

## Remove password prompt

Caution: this will store the password unencrypted on the disk! Only use if it's safe on your machine!

    git config credential.helper store

---

## Sign/verify commits

Use `git commit -S` by default for all commits

    git config --global commit.gpgsign true

Set default key

    git config --global user.signingkey <key-id>

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

## Revert pushed commits

See [stackoverflow](https://stackoverflow.com/questions/1459150/how-to-undo-git-commit-amend-done-instead-of-git-commit/1459264) for full credit


### Get the last x local commits,  should contain your (amend)

    git reflog -5

### Reset to just before your (amend)

    git reset <SHA BEFORE THE AMMEND> --soft 

### You will now see all the changes in the commit and the amend undone
    git status

### Save ALL the changes to the stash
    git stash

### Get the latest from the remote tracking branch
    git pull origin <your-remote-branch> --ff-only

### If you want to see that you have the commit you didn't want to amend
    git log

### Retrieve our changes
    git stash pop

### Now you can create your new unamended commit
    git commit -m 

---