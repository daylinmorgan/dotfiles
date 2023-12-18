return {
  require("util").setup_lang({ treesitter = { "nim", "nim_format_string" }, mason = { "nimlsp" } }),
}
