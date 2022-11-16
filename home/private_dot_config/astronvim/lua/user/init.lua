local config = {
  colorscheme = "catppuccin",

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- todo: convert to lua
    vim.cmd('cnoremap sudow w !sudo tee % >/dev/null')
  end,
}

return config