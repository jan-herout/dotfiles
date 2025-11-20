#!/usr/bin/env bash
##==================================================================================================
##	DEPENDENCIES
##==================================================================================================
[ "$(type -t include)" != 'function' ]&&{ include(){ { [ -z "$_IR" ]&&_IR="$PWD"&&cd "$(dirname "${BASH_SOURCE[0]}")"&&include "$1"&&cd "$_IR"&&unset _IR;}||{ local d="$PWD"&&cd "$(dirname "$PWD/$1")"&&. "$(basename "$1")"&&cd "$d";}||{ echo "Include failed $PWD->$1"&&exit 1;};};}
include "user_io.sh"

##	USAGE
##	=====
##  fDie - print out message and exit
##	    fDie "message"
##      fDie "message" exit_code


fDie() {
    local st=$?
    case $2 in
        *[^0-9]*|'') :;;
        *) st=$2;;
    esac

    [[ $st -gt 0 ]] || st=1
    printError "$1"
    exit "$st"
}
