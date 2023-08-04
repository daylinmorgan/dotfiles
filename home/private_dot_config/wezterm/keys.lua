local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

M.keys = {
	{ key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("ClipboardAndPrimarySelection") },

	-- paste from the clipboard
	-- { key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	-- -- paste from the primary selection
	-- { key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("PrimarySelection") },
	--
	-- change font size
	{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
	{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },

	-- { key = "Space", mods = "CTRL|SHIFT", action = "QuickSelect" },
	{ key = "Space", mods = "CTRL|SHIFT", action = "ActivateCopyMode" },
}

return M
