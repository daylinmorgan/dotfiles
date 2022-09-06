-- settings
local opt = vim.opt
opt.timeoutlen = 200
-- opt.cmdheight = 0 -- broken??
opt.listchars:append({ tab = "⍿·", trail = "×" })
vim.opt.list = true

-- lvim specific settings
-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "catppuccin"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
  "toml"
}

lvim.builtin.treesitter.highlight.enabled = true
