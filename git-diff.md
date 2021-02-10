# Diffs

## Files changed between commits

    git diff --name-only old_sha new_sha
    git diff --name-only HEAD~10 HEAD~5
    git diff --name-only HEAD^ HEAD

## Get the diff of a single file in a stash

	git difftool stash@{0} -- path/to/file
	
## Diffs two branches


    git diff develop..feature