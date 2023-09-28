#!/bin/bash

set -eo pipefail

current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ $current_branch != Federico ]; then
    echo WARNING: $current_branch not Federico
fi

if [ -z "$1" ]; then
    echo ERROR: manca il commit message
    exit 1
fi    

commit_message=$1

hugo
git add .
git commit -m "$commit_message"
git subtree push --prefix public origin gh-pages
