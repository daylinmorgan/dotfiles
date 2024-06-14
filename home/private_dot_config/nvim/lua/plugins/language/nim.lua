local util = require("util")

return util.if_exe("nim", {
  util.setup_lang({ treesitter = { "nim", "nim_format_string" } }),
  { "alaviss/nim.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nim_langserver = {
          mason = false,
        },
      },
    },
  },
})
