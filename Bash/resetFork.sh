#! /bin/bash
# Git Hard Reset Fork
git_url=https://git.yourdomain.com/your/git

git remote add upstream $git_url

git pull origin master
git pull upstream master

git reset --hard upstream/master
