-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()


config.color_scheme = 'Catppuccin Mocha'
config.window_decorations = "RESIZE"
--config.font = wezterm.font("JetBrainsMono Nerd Font")
config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
 	font = wezterm.font { 
		family = 'Noto Sans', 
		weight = 'Regular' 
	},
}

-- config.disable_default_key_bindings = true

-- The shell configured for the current user in the password database will be used. 
-- The value of the $SHELL environment variable is deliberately ignored in order for wezterm 
-- to continue to be functional without restarting after the user changes their shell.
--
-- Spawn a fish shell in login mode
-- config.default_prog = { '/usr/local/bin/fish', '-l' }


-- maximalizuj při startu
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)


config.keys = {
    {key="+", mods="SHIFT|ALT", action=wezterm.action.SplitHorizontal({ domain="CurrentPaneDomain" })},
    {key="-", mods="SHIFT|ALT", action=wezterm.action.SplitVertical({ domain="CurrentPaneDomain" })},
  }

return config
