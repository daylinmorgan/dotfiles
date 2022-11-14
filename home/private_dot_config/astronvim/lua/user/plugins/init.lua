return {
  {
    "quarto-dev/quarto-vim",
    requires = {
      { "vim-pandoc/vim-pandoc-syntax" },
    },
    ft = { "quarto" },
  },
  { 'xiyaowong/nvim-transparent',
    config = function()
      -- todo: move to separate file
      require("transparent").setup({
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups
          -- example of akinsho/nvim-bufferline.lua
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },
        exclude = {}, -- table: groups you don't want to clear
      })
    end
  },
  { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  { 'LnL7/vim-nix' },
}
