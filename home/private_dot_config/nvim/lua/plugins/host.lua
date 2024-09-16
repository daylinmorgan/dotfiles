local hostname = vim.fn.hostname()
local plugins = {}

local single_host_plugins = {
  othalan = {
    { "aklt/plantuml-syntax" },
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
    -- { dir = "~/dev/github/usu-dev/usu-vim/" },
  },
}

local function add_single_host_plugins()
  if vim.tbl_contains(vim.tbl_keys(single_host_plugins), hostname) then
    vim.list_extend(plugins, single_host_plugins[hostname])
  end
end

if vim.tbl_contains({ "othalan", "algiz" }, hostname) then
  vim.list_extend(plugins, {
    { "lambdalisue/suda.vim" },
    { "LnL7/vim-nix" },
  })
end

add_single_host_plugins()

return plugins
