export OMB_CASE_SENSITIVE=false         # case insensitive completion and globbing
export OMB_HYPHEN_SENSITIVE=false       # hyphen and underscore are equivalent in completion
export PAGER="less -I"                  # case insensitive search
export BAT_PAGER="less -I -R"           # batcat uses less, case insensitive search + apply escape sequences
# # PS1 Color and formatting variables
# # Text colors
# export PS1_BLACK='\[\e[0;30m\]'
# export PS1_RED='\[\e[0;31m\]'
# export PS1_GREEN='\[\e[0;32m\]'
# export PS1_YELLOW='\[\e[0;33m\]'
# export PS1_BLUE='\[\e[0;34m\]'
# export PS1_MAGENTA='\[\e[0;35m\]'
# export PS1_CYAN='\[\e[0;36m\]'
# export PS1_WHITE='\[\e[0;37m\]'
# export PS1_GRAY='\[\e[0;90m\]'

# # Bright colors
# export PS1_BRIGHT_RED='\[\e[0;91m\]'
# export PS1_BRIGHT_GREEN='\[\e[0;92m\]'
# export PS1_BRIGHT_YELLOW='\[\e[0;93m\]'
# export PS1_BRIGHT_BLUE='\[\e[0;94m\]'
# export PS1_BRIGHT_MAGENTA='\[\e[0;95m\]'
# export PS1_BRIGHT_CYAN='\[\e[0;96m\]'
# export PS1_BRIGHT_WHITE='\[\e[0;97m\]'

# # Bold colors
# export PS1_BOLD_BLACK='\[\e[1;30m\]'
# export PS1_BOLD_RED='\[\e[1;31m\]'
# export PS1_BOLD_GREEN='\[\e[1;32m\]'
# export PS1_BOLD_YELLOW='\[\e[1;33m\]'
# export PS1_BOLD_BLUE='\[\e[1;34m\]'
# export PS1_BOLD_MAGENTA='\[\e[1;35m\]'
# export PS1_BOLD_CYAN='\[\e[1;36m\]'
# export PS1_BOLD_WHITE='\[\e[1;37m\]'

# # Background colors
# export PS1_BG_BLACK='\[\e[40m\]'
# export PS1_BG_RED='\[\e[41m\]'
# export PS1_BG_GREEN='\[\e[42m\]'
# export PS1_BG_YELLOW='\[\e[43m\]'
# export PS1_BG_BLUE='\[\e[44m\]'
# export PS1_BG_MAGENTA='\[\e[45m\]'
# export PS1_BG_CYAN='\[\e[46m\]'
# export PS1_BG_WHITE='\[\e[47m\]'

# # Bright background colors
# export PS1_BG_BRIGHT_BLACK='\[\e[100m\]'
# export PS1_BG_BRIGHT_RED='\[\e[101m\]'
# export PS1_BG_BRIGHT_GREEN='\[\e[102m\]'
# export PS1_BG_BRIGHT_YELLOW='\[\e[103m\]'
# export PS1_BG_BRIGHT_BLUE='\[\e[104m\]'
# export PS1_BG_BRIGHT_MAGENTA='\[\e[105m\]'
# export PS1_BG_BRIGHT_CYAN='\[\e[106m\]'
# export PS1_BG_BRIGHT_WHITE='\[\e[107m\]'

# # Text formatting
# export PS1_BOLD='\[\e[1m\]'
# export PS1_DIM='\[\e[2m\]'
# export PS1_ITALIC='\[\e[3m\]'
# export PS1_UNDERLINE='\[\e[4m\]'
# export PS1_BLINK='\[\e[5m\]'
# export PS1_REVERSE='\[\e[7m\]'
# export PS1_HIDDEN='\[\e[8m\]'

# # Reset
# export PS1_RESET='\[\e[0m\]'

# export PS1="${debian_chroot:+($debian_chroot)}"
# export PS1+="${PS1_BOLD_YELLOW}\w$ > ${PS1_RESET}"

export PATH=$PATH:~/bin:~/sbin:~/.local/bin

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export ORACLE_HOME=/home/jan/sbin/instantclient_23_6
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
export PATH=$PATH:$HOME/sbin/instantclient_23_6
export EDITOR=nvim

# press generator, pro init
export PRESS_MODEL_DIR=/home/jan/o2/BIDEV-MAIN_bimeta/press/models.lin
export PRESS_VIEW_DIR=/home/jan/o2/BIDEV-MAIN_bimeta/press
export PRESS_PROFILE_DIR=/home/jan/o2/BIDEV-MAIN_bimeta/press/profiles.lin
export PRESS_PDC_METADATA_FILE=/home/jan/o2/BIDEV-MAIN_bimeta/ModelMetadata/PDCMetadata.json
export PRESS_PRODUCTION_DDL_DIR=/home/jan/o2/svn-production/db/Teradata/DDL

# azure functions
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
