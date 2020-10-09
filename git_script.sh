#!/bin/sh

for branch in $(git branch -a | sed 's/^\s*//' | sed 's/^remotes\///' | grep -v 'master$'); do
  if [ "$(git log $branch --since "6 months ago" | wc -l)" -eq 0 ]; then

    local_branch_name=$(echo "$branch" | sed 's/remotes\/origin\///')
    echo "$local_branch_name"
    
    #echo git branch -d $local_branch_name
    #echo git push origin --delete $local_branch_name
  fi
done
