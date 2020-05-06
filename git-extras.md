#Extras 

## Git Summary

Lists the status of each repository under a given dir

see https://gist.github.com/mzabriskie/6631607

## Git Summary mII

    bd=`pwd`
	IFS=$'\n'
	for gd in $(find . -name .git -prune | sed 's/.git//')
	do
	  echo "$gd"
	  cd "$gd"
	  git status -b --untracked-files=no
	  cd "$bd"
	  echo ""
	done