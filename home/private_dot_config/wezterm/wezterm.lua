local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup({})
-- local keys = require("keys")

local padding = 10
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- window_background_opacity = 0.9
config.check_for_updates = false
config.window_padding = {
	left = padding,
	right = padding,
	top = padding,
	bottom = padding,
}

config.hide_mouse_cursor_when_typing = false
config.font = wezterm.font("MonoLisa Nerd Font")
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 80
config.colors = catppuccin
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
--config.disable_default_key_bindings = true
config.enable_wayland = false
config.bold_brightens_ansi_colors = true
config.default_gui_startup_args = { "start", "--always-new-process" }
-- config.keys = keys.keys
-- config.window_background_opacity = .9
-- config.text_background_opacity = .9

return config
