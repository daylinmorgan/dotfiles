-- extra plugins
lvim.plugins = {
    { 'Mofiqul/dracula.nvim' },
    { 'ggandor/lightspeed.nvim' },
    {
      'mickael-menu/zk-nvim',
        config = function ()
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
    }
}

-- default plugins settings

-- make telescope respect that hidden files exist
lvim.builtin.telescope.pickers = { find_files = { hidden = true }}
lvim.builtin.nvimtree.setup.git.ignore = false


lvim.builtin.dashboard.custom_header = {
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
]]--

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
