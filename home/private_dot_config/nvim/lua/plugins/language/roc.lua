if not vim.fn.executable("roc") then
  return
end

-- make .roc files have the correct filetype
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.roc" },
  command = "set filetype=roc",
})

-- -- add roc tree-sitter
-- local parsers = require("nvim-treesitter.parsers").get_parser_configs()
--
-- parsers.roc = {
--   install_info = {
--     url = "https://github.com/faldor20/tree-sitter-roc",
--     files = { "src/parser.c", "src/scanner.c" },
--   },
-- }

return {
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "roc" } } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roc_ls = {
          mason = false,
        },
      },
    },
  },
}
