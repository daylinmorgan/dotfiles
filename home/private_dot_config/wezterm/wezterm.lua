local wezterm = require("wezterm")
local catppuccin = require("colors/catppuccin").setup {}

-- add wezterm to title for wm usage
wezterm.on("format-window-title",
  function()
    return " - Wezterm"
  end
)

local padding = 10

return {
  window_background_opacity = 0.9,
  window_padding = {
    left = padding,
    right = padding,
    top = padding,
    bottom = padding,
  },
  font = wezterm.font("MonoLisa NF"),
  adjust_window_size_when_changing_font_size = false,
  colors = catppuccin,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  disable_default_key_bindings = true,
  bold_brightens_ansi_colors = true,
  keys = require('keys'),
}
