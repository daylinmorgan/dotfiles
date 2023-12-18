return {
  require("util").setup_lang({ treesitter = { "python", "toml" }, mason = { "ruff", "ruff-lsp" } }),
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources or {}, nls.builtins.formatting.ruff)
    end,
  },
  -- modified from https://www.lazyvim.org/extras/lang/python#nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- autoformat = false,
      servers = {
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
}
