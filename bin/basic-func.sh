#!/usr/bin/env bash
# doc: Knihovna užitečných funkcí pro barevné logování a kontrolu git repozitářů

##
# flog: logs a message to stdrr, use colors if we are on a console.
# usage: flog "message" [severity]; default severity is info
flog(){
    # assign a severity and a message
    local message=$1
    local severity=$2
    local blue_start=""
    local blue_end=""
    local yellow_start=""
    local yellow_end=""
    local red_start=""
    local red_end=""

    # detect if stderr is attached to a console
    if [[ -t 2 ]]; then
        blue_start="\033[34m"
        blue_end="\033[0m"
        yellow_start="\033[33m"
        yellow_end="\033[0m"
        red_start="\e[31m"
        red_end="\e[0m"
    fi

    local banner=""
    case "$severity" in
        "info")
            banner="[${blue_start}info${blue_end}   ]"
            ;;
        "warning")
            banner="[${yellow_start}warning${yellow_end}]"
            ;;
        "error")
            banner="[${red_start}error${red_end}  ]"
            ;;
        *)
            banner="[${yellow_start}default${yellow_end}]"
            ;;
    esac
    local current_time=$(date +"%T")

    echo -e "$banner [${current_time}] $message" >&2
}

##
# die (optional status version): Print a message to
# stderr and exit with either the given status or
# that of the most recent command.
# Usage: some_command || die "message" [status code]
#        some_command && die "message" [status code]
fdie() {
    local st=$?
    case $2 in
        *[^0-9]*|'') :;;
        *) st=$2;;
    esac

    [[ $st -gt 0 ]] || st=1
    flog "$1" error
    exit "$st"
}



check_repo_clean() {
    # Check if we are inside a git repository
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || fdie "Not inside a git repository."

    # Return 1 if there are any changes (staged, unstaged, untracked, deleted, renamed, etc.)
    if [ -n "$(git status --porcelain)" ]; then
        return 1
    fi
    return 0
}

