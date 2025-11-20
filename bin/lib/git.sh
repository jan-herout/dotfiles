#!/usr/bin/env bash
##==================================================================================================
##	DEPENDENCIES
##==================================================================================================
[ "$(type -t include)" != 'function' ]&&{ include(){ { [ -z "$_IR" ]&&_IR="$PWD"&&cd "$(dirname "${BASH_SOURCE[0]}")"&&include "$1"&&cd "$_IR"&&unset _IR;}||{ local d="$PWD"&&cd "$(dirname "$PWD/$1")"&&. "$(basename "$1")"&&cd "$d";}||{ echo "Include failed $PWD->$1"&&exit 1;};};}

function check_repo_clean() {
    # Check if we are inside a git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || bail_out "Not inside a git repository."

    # Return 1 if there are any changes (staged, unstaged, untracked, deleted, renamed, etc.)
    if [ -n "$(git status --porcelain)" ]; then
        return 1
    fi
    return 0
}

function isRepoClean() {
    local repo_dir=$1
    [[ ! -z "$repo_dir" ]] && pushd "$repo_dir"
    
    # Check if we are inside a git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 
    if [[ $? -ne 0 ]]; then
        echo "Not inside a git repository."
        [[ ! -z "$repo_dir" ]] && popd
        return 1
    fi

    # Return 1 if there are any changes (staged, unstaged, untracked, deleted, renamed, etc.)
    if [ -n "$(git status --porcelain)" ]; then
        [[ ! -z "$repo_dir" ]] && popd
        return 1
    fi
    popd
    return 0
}

function gitUpdateRepo() {
    local repo=$1
    local branch=$2
    pushd "$repo"      >/dev/null 2>&1 || fDie "Failed to change directory to $repo"    
    check_repo_clean   >/dev/null 2>&1 || fDie "$repo: repository is not clean."
    printSuccess "$repo: is clean"
    git switch $branch >/dev/null 2>&1 || fDie "$repo: Failed to switch to main branch."
    printSuccess "$repo: switched to main branch"
    git pull --rebase  >/dev/null 2>&1 || fDie "$repo: Failed to pull latest changes."    
    printSuccess "$repo: git pull --rebase"
    return 0
}
