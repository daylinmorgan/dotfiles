return {
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/noice.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "vim",
        "vimdoc",
        "html",
        "toml",
        "json",
        "yaml",

        "regex",
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = "default" },
    },
  },
}
