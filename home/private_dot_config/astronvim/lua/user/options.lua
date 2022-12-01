-- from https://code.mehalter.com/projects/68/files-- from https://code.mehalter.com/projects/68/files
return {
  opt = {
    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    spellfile = vim.fn.expand "~/.config/astronvim/lua/user/spell/en.utf-8.add",
    thesaurus = vim.fn.expand "~/.config/astronvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
  g = {
    matchup_matchparen_deferred = 1,
  },
}
