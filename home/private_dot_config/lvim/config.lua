require("plugins")
require("keybindings")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "yaml",
  "go"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- colorscheme
lvim.builtin.lualine.options.theme = "dracula"
lvim.colorscheme = "dracula"

-- settings
local opt = vim.opt
opt.timeoutlen = 200
lvim.autocommands.custom_groups = {
  -- On entering insert mode in any file, scroll the window so the cursor line is centered
  {"InsertEnter", "*", ":normal zz"},
}

