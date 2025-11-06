check_repo_clean() {
    # Check if we are inside a git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || bail_out "Not inside a git repository."

    # Return 1 if there are any changes (staged, unstaged, untracked, deleted, renamed, etc.)
    if [ -n "$(git status --porcelain)" ]; then
        return 1
    fi
    return 0
}