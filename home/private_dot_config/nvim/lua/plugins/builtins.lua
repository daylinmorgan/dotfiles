return {
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
    },
  },
  -- add emoji completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "ruff",
        "ruff-lsp",
        -- "nimlsp",
        "lua-language-server",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.ruff,
        },
      }
    end,
  },
  {
    -- can remove once https://github.com/LazyVim/LazyVim/pull/521 is merged
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ignore_install = { "help" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    setup = function(_, opts)
      require("lspconfig").nim_langserver.setup({})
    end,
  },
}
