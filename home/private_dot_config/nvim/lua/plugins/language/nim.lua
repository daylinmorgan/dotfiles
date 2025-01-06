return {
  require("util").setup_lang({ treesitter = { "nim", "nim_format_string" }, lsp = { "nim_langserver" } }),
  { "alaviss/nim.nvim" },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       nim_langserver = {
  --         mason = false,
  --       },
  --     },
  --   },
  -- },
}
