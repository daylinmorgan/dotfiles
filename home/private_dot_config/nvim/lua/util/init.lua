local function setDefault(t, d)
  local mt = {
    __index = function()
      return d
    end,
  }
  setmetatable(t, mt)
end

local function setup_lang(defs)
  setDefault(defs, {})
  return {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, defs.treesitter)
      end,
    },
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, defs.mason)
      end,
    },
  }
end

return {
  setup_lang = setup_lang,
}
