# fzf defaults 
[[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && source /usr/share/doc/fzf/examples/key-bindings.bash

# my own
bind -x '"\C-f":"source $HOME/bin/fzfm"'   # Ctrl+F - "file manager"
bind -x '"\ez":"cd -"'                      # Alt+Z: cd to previous directory
bind -x '"\em":"_cd_to_mark"'               # Alt+M: cd to bookmark
bind -x '"\ef":"_cd_to_feature"'            # Alt+F: cd to feature
