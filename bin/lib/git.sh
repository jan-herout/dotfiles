check_repo_clean() {
    # Check if we are inside a git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || bail_out "Not inside a git repository."

    # Return 1 if there are any changes (staged, unstaged, untracked, deleted, renamed, etc.)
    if [ -n "$(git status --porcelain)" ]; then
        return 1
    fi
    return 0
}

gitUpdateRepo() {
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
