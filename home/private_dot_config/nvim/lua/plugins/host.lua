local hostname = vim.fn.hostname()
local plugins = {}

local single_host_plugins = {
  othalan = {
    -- https://github.com/nvim-treesitter/nvim-treesitter/pull/5437
    -- { "aMOPel/nvim-treesitter-nim" }
    { "kaarmu/typst.vim" },
    {
      "mickael-menu/zk-nvim",
      config = function()
        require("zk").setup({
          -- See Setup section below
        })
      end,
    },
    { "Fymyte/rasi.vim" },
    { dir = "~/dev/github/usu-dev/usu-vim/" },
  },
  algiz = {
    { "LnL7/vim-nix" },
  },
}

local function add_single_host_plugins()
  if vim.tbl_contains(vim.tbl_keys(single_host_plugins), hostname) then
    vim.list_extend(plugins, single_host_plugins[hostname])
  end
end

if vim.tbl_contains({ "othalan", "algiz" }, "algiz") then
  vim.list_extend(plugins, {
    { "lambdalisue/suda.vim" },
  })
end

add_single_host_plugins()

return plugins
