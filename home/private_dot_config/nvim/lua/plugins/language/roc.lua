return require("util").if_exe("roc", {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "roc" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roc_ls = {
          mason = false,
        },
      },
    },
  },
})
