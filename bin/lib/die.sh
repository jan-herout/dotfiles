#!/usr/bin/env bash

##	USAGE
##	=====
##  fDie - print out message and exit
##	    fDie "message"
##      fDie "message" exit_code




include "user_io.sh"


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
