-- Map a key with optional options
function map(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode,keys,action,options)
end




map('i','jk','<Esc>',{noremap=true})
map('v','jk','<Esc>',{noremap=true})
