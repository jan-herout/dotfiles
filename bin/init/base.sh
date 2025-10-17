#! bash oh-my-bash.module
#------------------------------------------------------------------------------
# Note on copyright (2022-08-23): The contents of this file seems to have been
# originally introduced in a blog post [1].  The author also put it on Gist
# [2]. The blog post says "feel free to take whatever", but the license is not
# explicitly specified.  Aliases are moved to general.aliases.sh.
#
# [1] Nathaniel Landau, "My Mac OSX Bash Profile",
#     https://natelandau.com/my-mac-osx-bash_profile/, 2013-07-02.
# [2] https://gist.github.com/natelandau/10654137
#
#------------------------------------------------------------------------------
#
#  Description:  This file holds all base BASH functions
#
#  Sections:
#  1.   Make Terminal Better (remapping defaults and adding functionality)
#  2.   File and Folder Management
#  3.   Searching
#  4.   Process Management
#  5.   Networking
#  6.   System Operations & Information
#  7.   Date & Time Management
#  8.   Web Development
#  9.   <your_section>
#
#  X.   Reminders & Notes
#
#------------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

#   mcd:   Makes new Dir and jumps inside
#   --------------------------------------------------------------------
function mcd { mkdir -p -- "$*" ; cd -- "$*" || exit ; }

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.
#           Example: mans mplayer codec
#   --------------------------------------------------------------------
function mans { man "$1" | grep -iC2 --color=always "$2" | less ; }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
function showa { /usr/bin/grep --color=always -i -a1 "$@" ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   quiet: mute output of a command
#   ------------------------------------------------------------
function quiet {
  "$@" &> /dev/null &
}


#   -------------------------------
#   2.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

function zipf { zip -r "$1".zip "$1" ; }           # zipf:         To create a ZIP archive of a folder

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
function extract {
  if [ -f "$1" ] ; then
    case "$1" in
    *.tar.bz2)   tar xjf "$1"     ;;
    *.tar.gz)    tar xzf "$1"     ;;
    *.bz2)       bunzip2 "$1"     ;;
    *.rar)       unrar e "$1"     ;;
    *.gz)        gunzip "$1"      ;;
    *.tar)       tar xf "$1"      ;;
    *.tbz2)      tar xjf "$1"     ;;
    *.tgz)       tar xzf "$1"     ;;
    *.zip)       unzip "$1"       ;;
    *.Z)         uncompress "$1"  ;;
    *.7z)        7z x "$1"        ;;
    *)     _omb_util_print "'$1' cannot be extracted via extract()" ;;
    esac
  else
    _omb_util_print "'$1' is not a valid file"
  fi
}

#   del:  move files to hidden folder in tmp, that gets cleared on each reboot
#   ---------------------------------------------------------
function del {
  mkdir -p /tmp/.trash && mv "$@" /tmp/.trash;
}

#   pickfrom: picks random line from file
#   -------------------------------------------------------------------
function pickfrom {
  local file=$1
  [ -z "$file" ] && reference "$FUNCNAME" && return
  length=$(wc -l < "$file")
  n=$( ($RANDOM \* "$length" / 32768 + 1))
  head -n "$n" "$file" | tail -1
}
