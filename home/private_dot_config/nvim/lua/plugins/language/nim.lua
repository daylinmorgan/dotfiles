return {
  require("util").setup_lang({ treesitter = { "nim", "nim_format_string" } }),
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nimls = {
          mason = false,
        },
      }
    }
  }
}
