#! /bin/bash
# Git Hard Reset Fork
git_url=https://github.com/sam-jc-vlad-sach/vino_etu

git remote add upstream $git_url

git pull origin master
git pull upstream master

git reset --hard upstream/master
