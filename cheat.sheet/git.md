# git

## Basic commands


Initialize a new git repo in a target directory.

```bash
git init <a-directory>
```

Create a new empty commit. Empty commit is important after we init the repo, 
it enables us to tinker with the repo history, we always will have at least 
one commit to lean on to.

```bash
git commit -m "init" --allow-empty
```


See what is changed.

```bash
git status        # list chanmges to the repo
git diff <file>   # list diff on a file
git diff --staged # list changes that were staged
git diff <commit> # list changes on a commit, branch, tag, etc.
```

Do some changes, then stage them.

```bash
git stage -u      # stage only update files; THIS IS RECOMMENDED unless you know what you are doing
git stage .       # stage ALL files under current directory, including hidden files
git stage *       # stage only visible files in/under current dir
```

Unstage a file.

```bash
git reset <a-file.txt>
```


Rollback to last state on the index.

```bash
git checkout <a-file.txt>
```


Drop all changes to updated files.

```bash
git stash -u        # safely. Put chanmged files to stash.
git checkout -- .   # NOT SAFE. This rollbacks all changes and reverts to head.
```

