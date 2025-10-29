export OMB_CASE_SENSITIVE=false         # case insensitive completion and globbing
export OMB_HYPHEN_SENSITIVE=false       # hyphen and underscore are equivalent in completion
export PS1="]0;jan@blacktux:/home/jan/o2-feature/bidev-8829-ebox-views/data\\n\[\e[0;36m\]┌─\[\e[97;1m\][\u@\h]\[\e[0;36m\]─\[\e[33;1m\](\w)\n\[\e[0;36m\]└─\[\e[32;1m\][\A]\[\e[0;36m\]-\[\e[32;1m\](\[\e[0;32m\]^_^\[\e[32;1m\])\[\e[0;36m\]-\[\e[36;1m\][\[\e[0;32m\]\[\e[32;1m\]$\[\e[36;1m\]]\[\e[0;32m\] "
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
