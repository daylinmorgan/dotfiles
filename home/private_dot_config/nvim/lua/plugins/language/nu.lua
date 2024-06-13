if not vim.fn.executable("nu") then
  return
end

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nushell/tree-sitter-nu" },
  },
  build = ":TSUpdate",
}
