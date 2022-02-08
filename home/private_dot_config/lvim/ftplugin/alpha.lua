local wk = require("which-key")
-- local opts = lvim.builtin.which_key.opts


local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  C = "Edit Configuration"
}

wk.register(mappings,opts)

