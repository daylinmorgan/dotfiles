return {
  require("util").setup_lang({ treesitter = { "nim", "nim_format_string" } }),
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nim_langserver = {
          mason = false,
        }
      }
    }
  }
}
