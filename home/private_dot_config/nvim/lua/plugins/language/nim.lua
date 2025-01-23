return {
  require("util").setup_lang({ treesitter = { "nim", "nim_format_string" }, lsp = { "nim_langserver" } }),
  -- { "alaviss/nim.nvim" },
}
