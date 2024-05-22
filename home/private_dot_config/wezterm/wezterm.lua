local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup({})

local padding = 10

local config = wezterm.config_builder()

config.check_for_updates = false
config.window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}

config.colors = catppuccin
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.font = wezterm.font("MonoLisa Nerd Font")
-- config.disable_default_key_bindings = true
-- config.bold_brightens_ansi_colors = true
-- config.window_background_opacity = .9
-- config.text_background_opacity = .9

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_mouse_cursor_when_typing = false
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 80
config.enable_wayland = false
config.keys = require("keys")
config.default_gui_startup_args = { "start", "--always-new-process" }

return config
