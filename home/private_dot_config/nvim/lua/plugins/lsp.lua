return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              -- I'll do the formatting myself
              autopep8 = { enabled = false },
              mccabe = { enabled = false },
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              yapf = { enabled = false },
              ruff = {
                enabled = true,
                extendSelect = { "I" },
              },
            },
          },
        },
      },
      nim_langserver = {},
    },
  },
}
