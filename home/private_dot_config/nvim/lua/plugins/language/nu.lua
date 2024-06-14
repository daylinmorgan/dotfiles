return require("util").if_exe("nu", {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nushell/tree-sitter-nu" },
  },
  build = ":TSUpdate",
})
