-- load config from local file...
-- local p = function(name)
--   return string.format("require'config.%s'", name)
-- end

-- d for default :P
local d = function(name)
  return string.format("require'%s'.setup({})", name)
end

return {
  { "lambdalisue/suda.vim" }, -- for sudo reading and writing
  -- theming
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = d("zk"),
  },
  -- language specific
  { "LnL7/vim-nix" },
  { "alaviss/nim.nvim" },
  {
    "quarto-dev/quarto-vim",
    requires = {
      { "vim-pandoc/vim-pandoc-syntax" },
    },
    ft = { "quarto" },
  },
  { "kenkundert/vim-nestedtext" },
  -- general tools
  {
    "mickael-menu/zk-nvim",
    config = d("zk"),
  },
}
