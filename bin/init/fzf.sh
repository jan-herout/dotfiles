
__fzfm_readline_integration ()
{
    local selection="$1"
    local list_command="eza -1 --icons --color=always"
    local selected=$(
        $selection | fzf \
            --ansi \
            --reverse \
            --height 100% \
            --info right \
            --prompt "⚙️: look for ..." \
            --pointer ">" \
            --marker "🏁" \
            --border "rounded" \
            --color 'fg:#cdd6f4,fg+:#cdd6f4,bg+:#313244,border:#a5aac3,pointer:#cba6f7,label:#cdd6f4' \
            --bind "right:accept" \
            --bind "enter:accept" \
            --bind "shift-up:preview-up" \
            --bind "shift-down:preview-down" \
            --preview-window="bottom:65%" \
            --preview "
                file={}                
                file=\${file#\'}
                file=\${file%\'}

                if [[ -d \"\$file\" ]]; then
                    echo \"💻 Folder: \$file\"
                    echo \"\"
                    $list_command \"\$file\" 2>/dev/null
                elif [[ -f \"\$file\" ]]; then
                    echo \"💻 File: \$file\"
                    echo \"\"
                    preview-file.sh \"\$file\"
                else                    
                    # Handle symlinks detected by eza output format: symlink_name -> target
                    if [[ \"\$file\" =~ ^(.+)' -> '(.+)\$ ]]; then
                        symlink_name=\"\${BASH_REMATCH[1]}\"
                        symlink_target=\"\${BASH_REMATCH[2]}\"
                        echo \"💻 Symlink: \$symlink_name -> \$symlink_target\"
                        echo \"\"
                        if [[ -d \"\$symlink_name\" ]]; then
                            # Symlink points to a directory, use list command
                            $list_command \"\$symlink_name\" 2>/dev/null
                        else
                            # Symlink points to a file, use preview command
                            preview-file.sh \"\$symlink_name\"
                        fi
                    else
                        echo \"💻 Unknown item: \$file\"
                    fi
                fi
            "
    )

    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${selected}${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}


__fzfm_find_dir_in_home ()
{
    local dir="$HOME"
    local dirs=(
        "$HOME/o2/BIDEV-MAIN_edw/pkg/main"
        "$HOME/o2/BIDEV-MAIN_edw/mstr/src"
        "$HOME/O2-feature"
        "$HOME/o2/BIDEV-MAIN_edw/meta"
        "$HOME/o2/BIDEV-MAIN_vodwh"
        "$HOME/dotfiles"
        "$HOME/o2/BIDEV-MAIN_ia"
        "$HOME/git"
        "$HOME/d-blocks"
    )
    for dir in "${dirs[@]}"; do
        [[ -d "$dir" ]] && find "$dir" -type d
    done
}

bind -x '"\C-p":__fzfm_readline_integration __fzfm_find_dir_in_home'
