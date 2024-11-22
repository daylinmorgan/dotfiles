return require("util").if_exe("nu", {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "nu" }, -- Ensure the "nu" parser is installed
        highlight = {
          enable = true, -- Enable syntax highlighting
        },
      })
    end,
    dependencies = {
      -- Additional Nushell parser
      { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    build = ":TSUpdate",
  },
})
