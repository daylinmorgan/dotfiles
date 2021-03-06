-- Map a key with optional options
local function map(mode, keys, action, options)
  if options == nil then
    options = { noremap = true }
  end
  vim.api.nvim_set_keymap(mode, keys, action, options)
end

vim.g.mapleader = " "

map('i', 'jk', '<Esc>', { noremap = true })
map('v', 'jk', '<Esc>', { noremap = true })
map('n', "H", "^", { noremap = true })
map('n', "L", "$", { noremap = true })
map('n', 'j', "v:count ? 'j' : 'gj'", { expr = true, noremap = true })
map('n', 'k', "v:count ? 'k' : 'gk'", { expr = true, noremap = true })
map('n', "<C-j>","}",{noremap = true})
map('n', "<C-k>","{",{noremap = true})

-- zettelkasten keybindings
-- Create a new note after asking for its title.
-- map("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>")

-- -- Open notes.
-- map("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
-- -- Open notes associated with the selected tags.
-- map("n", "<leader>zt", "<Cmd>ZkTags<CR>")

-- -- Search for the notes matching a given query.
-- map("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>")
-- -- Search for the notes matching the current visual selection.

map("v", "<leader>zf", ":'<,'>ZkMatch<CR>")

local mappings = lvim.builtin.which_key.mappings

mappings["z"] = {
  name = "zk",
  n = { "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "New" },
  o = { "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "Open" },
  t = { "<Cmd>ZkTags<CR>", "Tags" },
  f = { "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>", "Fuzzy Search" },
}
mappings["s"]["p"] = { "<cmd>Telescope projects<CR>", "Recent Projects" }
mappings["s"]["w"] = { "<cmd>Telescope live_grep<CR>", "Find Word" }


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}
