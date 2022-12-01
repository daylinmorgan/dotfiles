return {
  {
    "quarto-dev/quarto-vim",
    requires = {
      { "vim-pandoc/vim-pandoc-syntax" },
    },
    ft = { "quarto" },
  },
  { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  { 'LnL7/vim-nix' },
  { 'lambdalisue/suda.vim' }, -- for sudo reading and writing
}
