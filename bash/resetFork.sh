#! /bin/bash
# Git Hard Reset Fork

git pull origin master
git pull upstream master
git reset --hard upstream/master
git push -f origin master
