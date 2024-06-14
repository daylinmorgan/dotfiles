local util = require("util")
return util.if_exe("nix", {
  util.setup_lang({ treesitter = { "nix" } }),
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {
          mason = false,
        },
        -- nil_ls = {
        -- mason = false,
        -- },
      },
    },
  },
})
