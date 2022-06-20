local p = function(name) return string.format("require'config.%s'", name) end

-- extra plugins
lvim.plugins = {
  { 'chrisbra/Colorizer' },
  {
    'catppuccin/nvim',
    as = 'catppuccin'
  },
  -- { 'axelf4/vim-strip-trailing-whitespace' },
  { 'NoahTheDuke/vim-just' },
  { 'ggandor/lightspeed.nvim' },
  { 'elkowar/yuck.vim' },
  {
    'mickael-menu/zk-nvim',
    config = function()
      require("zk").setup({
        -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope" or "fzf"
        picker = "telescope",
        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },
}

-- default plugins settings
-- lvim.builtin.nvimtree.setup.git.ignore = false

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true


lvim.builtin.alpha.dashboard.section.header.val = {
  [[        _______________________________________        ]],
  [[       |,---"-----------------------------"---,|       ]],
  [[       ||___    16 bit....................    ||       ]],
  [[       ||====\ :HHHHHHHHHHHHHHHHHHHHHHHHHHH   ||       ]],
  [[       ||=====):H c> lvim                 H   ||       ]],
  [[       ||====/ :H ╦  ╦ ╦╔╗╔╔═╗╦═╗╦  ╦╦╔╦╗ H   ||       ]],
  [[       ||      :H ║  ║ ║║║║╠═╣╠╦╝╚╗╔╝║║║║ H   ||       ]],
  [[       ||PORTFO:H ╩═╝╚═╝╝╚╝╩ ╩╩╚═ ╚╝ ╩╩ ╩ H   ||       ]],
  [[       ||      :HHHHHHHHHHHHHHHHHHHHHHHHHHH   ||       ]],
  [[       ||_____,_________________________,_____||       ]],
  [[       |)_____)-----.| /I\ATARI |.------(_____(|       ]],
  [[     //"""""""|_____|=----------=|______|"""""""\      ]],
  [[    // _| _| _| _| _| _| _| _| _| _| _| _| _| _| \     ]],
  [[   // ___| _| _| _| _| _| _| _| _| _| _| _|  |  | \    ]],
  [[  |/ ___| _| _| _| _| _| _| _| _| _| _| _| ______| \   ]],
  [[  / __| _| _| _| _| _| _| _| _| _| _| _| _| _| ___| \  ]],
  [[ / _| _| _| _| ________________________| _| _| _| _| \ ]],
  [[|------"--------------------------------------"-------|]],
  [[`-----------------------------------------------------']],
}


-- simpler header
--[[
╦  ╦ ╦╔╗╔╔═╗╦═╗╦  ╦╦╔╦╗
║  ║ ║║║║╠═╣╠╦╝╚╗╔╝║║║║
╩═╝╚═╝╝╚╝╩ ╩╩╚═ ╚╝ ╩╩ ╩
]] --

--[[
        _______________________________________
       |,---"-----------------------------"---,|
       ||___    16 bit....................    ||
       ||====\ :HHHHHHHHHHHHHHHHHHHHHHHHHHH   ||
       ||=====):H c> lvim                 H   ||
       ||====/ :H ╦  ╦ ╦╔╗╔╔═╗╦═╗╦  ╦╦╔╦╗ H   ||
       ||      :H ║  ║ ║║║║╠═╣╠╦╝╚╗╔╝║║║║ H   ||
       ||PORTFO:H ╩═╝╚═╝╝╚╝╩ ╩╩╚═ ╚╝ ╩╩ ╩ H   ||
       ||      :HHHHHHHHHHHHHHHHHHHHHHHHHHH   ||
       ||_____,_________________________,_____||
       |)_____)-----.| /I\ATARI |.------(_____(|
     //"""""""|_____|=----------=|______|"""""""\
    // _| _| _| _| _| _| _| _| _| _| _| _| _| _| \
   // ___| _| _| _| _| _| _| _| _| _| _| _|  |  | \
  |/ ___| _| _| _| _| _| _| _| _| _| _| _| ______| \
  / __| _| _| _| _| _| _| _| _| _| _| _| _| _| ___| \
 / _| _| _| _| ________________________| _| _| _| _| \
|------"--------------------------------------"-------|
`-----------------------------------------------------'
]] --
