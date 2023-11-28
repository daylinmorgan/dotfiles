-- local function add_words()
--   local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
--   local words = {}
--   for word in io.open(path, "r"):lines() do
--     table.insert(words, word)
--   end
--   return words
-- end
--
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- ltex = {
      --   settings = {
      --     ltex = {
      --       dictionary = { ["en-US"] = add_words() },
      --     },
      --   },
      -- },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              -- I'll do the formatting myself
              autopep8 = { enabled = false },
              mccabe = { enabled = false },
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              yapf = { enabled = false },
              ruff = {
                enabled = true,
                extendSelect = { "I" },
              },
            },
          },
        },
      },
    },
  },
}
