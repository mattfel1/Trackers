#!bin/bash

branches=(`git branch -r | grep Class | sed 's/.*origin\///g'`)
for branch in ${branches[@]}; do
  git checkout -b $branch
  git pull origin $branch
  sed -i 's/on_failure: change/on_failure: never/g' .travis.yml
  git checkout --theirs -- results
  git checkout --theirs -- README.md
  git add -A
  git commit -m "foreach script"
  git push
done
