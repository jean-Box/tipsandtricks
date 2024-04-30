# Git

## How to ignore a tracked file in git without deleting it?

1 - Add all the files, individually or in a folder, that you want to remove from the repo but keep locally to `.gitignore`.
2 - Execute `git rm --cached put/here/your/file.ext` or recursivement `git rm --cached -r .idea`

## 
