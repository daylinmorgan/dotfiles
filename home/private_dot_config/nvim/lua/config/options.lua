vim.opt.listchars = {
  tab = "│→",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  nbsp = "␣",
}
vim.opt.foldenable = false
vim.opt.timeoutlen = 200

-- https://github.com/ziglang/zig.vim/issues/51#issuecomment-1637180522
vim.g.zig_fmt_autosave = 0
