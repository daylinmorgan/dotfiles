local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

M.keys = {
  { key = "C", mods = "CTRL|SHIFT", action = act.CopyTo "ClipboardAndPrimarySelection" },
  -- paste from the clipboard
  { key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },
  -- paste from the primary selection
  { key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom "PrimarySelection" },
  -- change font size
  { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
  { key = "+", mods = "CTRL", action = "IncreaseFontSize" },
  -- { key = "Space", mods = "CTRL|SHIFT", action = "QuickSelect" },
  { key = "Space", mods = "CTRL|SHIFT", action = "ActivateCopyMode" },
}


-- M.key_tables = {
--   copy_mode = {
--     { key = "c", mods = "CTRL", action = wezterm.action { CopyMode = "Close" } },
--     { key = "g", mods = "CTRL", action = wezterm.action { CopyMode = "Close" } },
--     { key = "q", mods = "NONE", action = wezterm.action { CopyMode = "Close" } },
--     { key = "Escape", mods = "NONE", action = wezterm.action { CopyMode = "Close" } },

--     { key = "h", mods = "NONE", action = wezterm.action { CopyMode = "MoveLeft" } },
--     { key = "j", mods = "NONE", action = wezterm.action { CopyMode = "MoveDown" } },
--     { key = "k", mods = "NONE", action = wezterm.action { CopyMode = "MoveUp" } },
--     { key = "l", mods = "NONE", action = wezterm.action { CopyMode = "MoveRight" } },

--     { key = "LeftArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveLeft" } },
--     { key = "DownArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveDown" } },
--     { key = "UpArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveUp" } },
--     { key = "RightArrow", mods = "NONE", action = wezterm.action { CopyMode = "MoveRight" } },

--     { key = "RightArrow", mods = "ALT", action = wezterm.action { CopyMode = "MoveForwardWord" } },
--     { key = "f", mods = "ALT", action = wezterm.action { CopyMode = "MoveForwardWord" } },
--     { key = "Tab", mods = "NONE", action = wezterm.action { CopyMode = "MoveForwardWord" } },
--     { key = "w", mods = "NONE", action = wezterm.action { CopyMode = "MoveForwardWord" } },

--     { key = "LeftArrow", mods = "ALT", action = wezterm.action { CopyMode = "MoveBackwardWord" } },
--     { key = "b", mods = "ALT", action = wezterm.action { CopyMode = "MoveBackwardWord" } },
--     { key = "Tab", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveBackwardWord" } },
--     { key = "b", mods = "NONE", action = wezterm.action { CopyMode = "MoveBackwardWord" } },

--     { key = "0", mods = "NONE", action = wezterm.action { CopyMode = "MoveToStartOfLine" } },
--     { key = "Enter", mods = "NONE", action = wezterm.action { CopyMode = "MoveToStartOfNextLine" } },
--     { key = "$", mods = "NONE", action = wezterm.action { CopyMode = "MoveToEndOfLineContent" } },
--     { key = "$", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToEndOfLineContent" } },

--     { key = "m", mods = "ALT", action = wezterm.action { CopyMode = "MoveToStartOfLineContent" } },
--     { key = "^", mods = "NONE", action = wezterm.action { CopyMode = "MoveToStartOfLineContent" } },
--     { key = "^", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToStartOfLineContent" } },

--     { key = " ", mods = "NONE", action = wezterm.action { CopyMode = "ToggleSelectionByCell" } },
--     { key = "v", mods = "NONE", action = wezterm.action { CopyMode = "ToggleSelectionByCell" } },
--     { key = "v", mods = "CTRL", action = wezterm.action { CopyMode = { SetSelectionMode = "Block" } } },

--     { key = "G", mods = "NONE", action = wezterm.action { CopyMode = "MoveToScrollbackBottom" } },
--     { key = "G", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToScrollbackBottom" } },
--     { key = "g", mods = "NONE", action = wezterm.action { CopyMode = "MoveToScrollbackTop" } },

--     { key = "H", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportTop" } },
--     { key = "H", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportTop" } },
--     { key = "M", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportMiddle" } },
--     { key = "M", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportMiddle" } },
--     { key = "L", mods = "NONE", action = wezterm.action { CopyMode = "MoveToViewportBottom" } },
--     { key = "L", mods = "SHIFT", action = wezterm.action { CopyMode = "MoveToViewportBottom" } },

--     { key = "PageUp", mods = "NONE", action = wezterm.action { CopyMode = "PageUp" } },
--     { key = "PageDown", mods = "NONE", action = wezterm.action { CopyMode = "PageDown" } },

--     { key = "b", mods = "CTRL", action = wezterm.action { CopyMode = "PageUp" } },
--     { key = "f", mods = "CTRL", action = wezterm.action { CopyMode = "PageDown" } },
--   }
-- }


M.key_tables = {
    copy_mode = {
      {key="c", mods="CTRL", action=wezterm.action{CopyMode="Close"}},
      {key="g", mods="CTRL", action=wezterm.action{CopyMode="Close"}},
      {key="q", mods="NONE", action=wezterm.action{CopyMode="Close"}},
      {key="Escape", mods="NONE", action=wezterm.action{CopyMode="Close"}},

      {key="h", mods="NONE", action=wezterm.action{CopyMode="MoveLeft"}},
      {key="j", mods="NONE", action=wezterm.action{CopyMode="MoveDown"}},
      {key="k", mods="NONE", action=wezterm.action{CopyMode="MoveUp"}},
      {key="l", mods="NONE", action=wezterm.action{CopyMode="MoveRight"}},

      {key="LeftArrow", mods="NONE", action=wezterm.action{CopyMode="MoveLeft"}},
      {key="DownArrow", mods="NONE", action=wezterm.action{CopyMode="MoveDown"}},
      {key="UpArrow", mods="NONE", action=wezterm.action{CopyMode="MoveUp"}},
      {key="RightArrow", mods="NONE", action=wezterm.action{CopyMode="MoveRight"}},

      {key="RightArrow", mods="ALT", action=wezterm.action{CopyMode="MoveForwardWord"}},
      {key="f", mods="ALT", action=wezterm.action{CopyMode="MoveForwardWord"}},
      {key="Tab", mods="NONE", action=wezterm.action{CopyMode="MoveForwardWord"}},
      {key="w", mods="NONE", action=wezterm.action{CopyMode="MoveForwardWord"}},

      {key="LeftArrow", mods="ALT", action=wezterm.action{CopyMode="MoveBackwardWord"}},
      {key="b", mods="ALT", action=wezterm.action{CopyMode="MoveBackwardWord"}},
      {key="Tab", mods="SHIFT", action=wezterm.action{CopyMode="MoveBackwardWord"}},
      {key="b", mods="NONE", action=wezterm.action{CopyMode="MoveBackwardWord"}},

      {key="0", mods="NONE", action=wezterm.action{CopyMode="MoveToStartOfLine"}},
      {key="Enter", mods="NONE", action=wezterm.action{CopyMode="MoveToStartOfNextLine"}},
      {key="$", mods="NONE", action=wezterm.action{CopyMode="MoveToEndOfLineContent"}},
      {key="$", mods="SHIFT", action=wezterm.action{CopyMode="MoveToEndOfLineContent"}},

      {key="m", mods="ALT", action=wezterm.action{CopyMode="MoveToStartOfLineContent"}},
      {key="^", mods="NONE", action=wezterm.action{CopyMode="MoveToStartOfLineContent"}},
      {key="^", mods="SHIFT", action=wezterm.action{CopyMode="MoveToStartOfLineContent"}},

      {key=" ", mods="NONE", action=wezterm.action{CopyMode={SetSelectionMode="Cell"}}},
      {key="v", mods="NONE", action=wezterm.action{CopyMode={SetSelectionMode="Cell"}}},
      {key="V", mods="NONE", action=wezterm.action{CopyMode={SetSelectionMode="Line"}}},
      {key="V", mods="SHIFT", action=wezterm.action{CopyMode={SetSelectionMode="Line"}}},
      {key="v", mods="CTRL", action=wezterm.action{CopyMode={SetSelectionMode="Block"}}},

      {key="G", mods="NONE", action=wezterm.action{CopyMode="MoveToScrollbackBottom"}},
      {key="G", mods="SHIFT", action=wezterm.action{CopyMode="MoveToScrollbackBottom"}},
      {key="g", mods="NONE", action=wezterm.action{CopyMode="MoveToScrollbackTop"}},

      {key="H", mods="NONE", action=wezterm.action{CopyMode="MoveToViewportTop"}},
      {key="H", mods="SHIFT", action=wezterm.action{CopyMode="MoveToViewportTop"}},
      {key="M", mods="NONE", action=wezterm.action{CopyMode="MoveToViewportMiddle"}},
      {key="M", mods="SHIFT", action=wezterm.action{CopyMode="MoveToViewportMiddle"}},
      {key="L", mods="NONE", action=wezterm.action{CopyMode="MoveToViewportBottom"}},
      {key="L", mods="SHIFT", action=wezterm.action{CopyMode="MoveToViewportBottom"}},

      {key="o", mods="NONE", action=wezterm.action{CopyMode="MoveToSelectionOtherEnd"}},
      {key="O", mods="NONE", action=wezterm.action{CopyMode="MoveToSelectionOtherEndHoriz"}},
      {key="O", mods="SHIFT", action=wezterm.action{CopyMode="MoveToSelectionOtherEndHoriz"}},

      {key="PageUp", mods="NONE", action=wezterm.action{CopyMode="PageUp"}},
      {key="PageDown", mods="NONE", action=wezterm.action{CopyMode="PageDown"}},

      {key="b", mods="CTRL", action=wezterm.action{CopyMode="PageUp"}},
      {key="f", mods="CTRL", action=wezterm.action{CopyMode="PageDown"}},
    }
  }







return M
