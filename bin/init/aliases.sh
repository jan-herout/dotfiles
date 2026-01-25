# show the value of alias
function alias_value() {
  local value=
  value=$(alias "$1" 2>/dev/null) && eval "value=${value#*=}" && echo "$value"
}

# nav
alias bat="batcat"
alias la="/usr/bin/ls -A"
alias l="eza --color=always --long -b --icons  --no-user --no-permissions -h --time-style='+%Y-%m-%d %H:%M:%S'"
alias ll="eza --color=always --long -b --icons  --no-user --no-permissions -h --time-style='+%Y-%m-%d %H:%M:%S' --sort=time --reverse | bat"
alias ..="cd .."
alias ...="cd .. && cd .."
alias ....="cd .. && cd .. && cd .."

# yazi
alias yazi="flatpak run io.github.sxyazi.yazi"

# dev
alias flake8="flake8 --max-line-length=88"
alias fkill='fzf_kill'
alias pb="perlbrew use perl-5.24.4"

# vim
alias vim="nvim"
alias v="nvim ."
alias vh="nvim ."
alias ch="$HOME/bin/code-here.sh"

# git
alias gis="git status"
alias giau="git add -u"
alias giad="git add ."
alias gic="git commit"
alias gsw="git branch | sed -E 's/^[*]?\s+//' | fzf | xargs git switch"
alias gac="git add --all && git commit"
alias gst="git status"

# alias fe="fzf_find_edit"
# alias gadd='fzf_git_add'
# alias gll='fzf_git_log'
# alias grl='fzf_git_reflog'
# alias gcb='fzf_git_branch'
# alias fbat='selection=$( find . -maxdepth 1 -type f | fzf --preview "batcat -n --color=always --line-range :500 {}" ); if [ -n "$selection" ]; then echo "$selection" | xargs batcat; else echo "nothing to do"; fi'
# alias fcat='selection=$( find . -maxdepth 1 -type f | fzf --preview "batcat -n --color=always --line-range :500 {}" ); if [ -n "$selection" ]; then echo "$selection" | xargs cat; else echo "nothing to do"; fi'

# clipboard
alias wcl="wl-copy"
alias xcl="xclip -selection clipboard"

# misc
alias src="source ~/.bashrc"
alias nom="source $HOME/bin/netmount"
alias num="source $HOME/bin/netumount"
alias config="__config__"
alias _cd_to_feature="source $HOME/bin/fcd-feature-script"
alias _cd_to_mark="source $HOME/bin/fcd-script"
alias unmute="amixer -c 1 set Headphone unmute"
alias rg="rg -i"

# fix common typos
alias cmod="chmod"
alias kess="less -I"
alias less="less -I"
