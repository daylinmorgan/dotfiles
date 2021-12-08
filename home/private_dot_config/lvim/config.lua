require("keybindings")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"

lvim.leader = "space"
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "json",
  "lua",
  "python",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
  {"dracula/vim",
  as = "dracula"},
  {"snakemake/snakemake",
  rtp="misc/vim",
  ft = {"Snakefile","snk"}
  }
}

-- settings
local opt = vim.opt
opt.timeoutlen = 500
