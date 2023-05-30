local function disable(plugins)
  local disabled = {}
  for _, plugin in ipairs(plugins) do
    table.insert(disabled, { plugin, enabled = false })
  end
  return disabled
end

return disable({
  "folke/tokyonight.nvim",
  "L3MON4D3/LuaSnip",
})
