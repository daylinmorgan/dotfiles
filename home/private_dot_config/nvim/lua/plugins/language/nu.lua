return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
}
