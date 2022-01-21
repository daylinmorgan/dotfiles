-- general settings
local o = vim.o
local w = vim.wo
local b = vim.bo

vim.g.mapleader = ' '

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4

b.tabstop = 4
b.smartindent = true
b.modeline = false
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false

o.swapfile = false
o.scrolloff = 5
o.updatetime = 300

w.number = true

if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

o.timeoutlen = 300

vim.cmd[[colorscheme dracula]]
