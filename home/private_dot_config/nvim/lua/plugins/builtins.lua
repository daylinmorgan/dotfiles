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
    -- opts = {
      -- presets = {
      --   command_palette = false,
      -- },
      -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#ignore-certain-lsp-servers-for-progress-messages
      -- routes = {
      --   {
      --     filter = {
      --       event = "lsp",
      --       kind = "msg_show";
      --       cond = function(message)
      --         local client = vim.tbl_get(message.opts, "progress", "client")
      --         return client == "nim_langserver"
      --       end,
      --     },
      --     opts = { skip = true },
      --   },
      -- },
    -- },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "vim",
        "vimdoc",
        "html",
        "toml",
        "json",
        "yaml",

        "regex",
      })
    end,
  },
}
