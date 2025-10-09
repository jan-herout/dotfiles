# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

source ~/.bashrc_addons
source ~/bin/lib/history.sh
