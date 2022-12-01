return function()
    vim.cmd [[
    autocmd BufNewFile,BufRead Knitfile set syntax=lua
    ]]
end
