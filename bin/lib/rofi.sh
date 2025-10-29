# Function to select SQL files using rofi
_rofi_select_file() {
    # Get extension from positional parameter, die if none provided
    local mask="$1"
    local pwd="$2"

    [[ -z "pwd" ]] && pwd="."

    if [[ -z "$mask" ]]; then
        echo "Error: No file extension provided" >&2
        echo ""
        return 1
    fi

    # Find all SQL files (case-insensitive) under current directory
    local sql_files
    sql_files=$(find "$pwd" -type f -iname "$mask" 2>/dev/null)
    
    # Check if any SQL files were found
    if [[ -z "$sql_files" ]]; then
        echo "No SQL files found in current directory and subdirectories" >&2
        return 1
    fi
    
    # Use rofi-menu to select one file
    local selected_file
    selected_file=$(echo "$sql_files" | rofi-menu)
    
    # Return the selected file (or empty if cancelled)
    if [[ -n "$selected_file" ]]; then
        echo "$selected_file"
        return 0
    else
        return 1
    fi
}


# Function to detect if X server is running
_rofi_is_x_server_running() {
    if [ -n "$DISPLAY" ] && command -v xset >/dev/null 2>&1 && xset q >/dev/null 2>&1; then
        return 0  # X server is running
    else
        return 1  # X server is not running
    fi
}

# Function to check if a command is available
_rofi_command_exists() {
    command -v "$1" >/dev/null 2>&1
}

_rofi_primary_monitor_id() {    
    # Get list of connected monitors with their names and positions
    local monitors=($(xrandr --query | grep " connected" | cut -d ' ' -f1))
    echo $local_monitors

    # Get primary monitor name
    local primary_monitor=$(xrandr --query | grep " primary" | cut -d ' ' -f1)
    echo $local_primary_monitor

    # Find the index (number) of the primary monitor
    for i in "${!monitors[@]}"; do
        if [[ "${monitors[$i]}" == "$primary_monitor" ]]; then
            echo "$i"
            exit 0
        fi
    done
    # If no primary monitor is found, return 0 by default
    echo 0
}
