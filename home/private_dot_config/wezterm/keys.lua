local wezterm = require("wezterm")

return {
  { key = "C", mods = "CTRL|SHIFT", action = wezterm.action { CopyTo = "ClipboardAndPrimarySelection" } },
  -- paste from the clipboard
  { key = "V", mods = "CTRL|SHIFT", action = wezterm.action { PasteFrom = "Clipboard" } },
  -- paste from the primary selection
  { key = "V", mods = "CTRL|SHIFT", action = wezterm.action { PasteFrom = "PrimarySelection" } },
  -- change font size
  {key="-", mods="CTRL", action="DecreaseFontSize"},
  {key="=", mods="CTRL", action="IncreaseFontSize"},
  { key = "Space", mods = "CTRL|SHIFT", action = "QuickSelect" },
}
