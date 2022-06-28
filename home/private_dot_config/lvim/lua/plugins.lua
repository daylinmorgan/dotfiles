local p = function(name) return string.format("require'config.%s'", name) end

-- extra plugins
lvim.plugins = {
  { 'chrisbra/Colorizer' },
  {
    'catppuccin/nvim',
    as = 'catppuccin'
  },
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

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number", "Constant" }
  return colors[math.random(#colors)]
end

local function myfooter(lvim_version)
  -- local plugins = #vim.tbl_keys(packer_plugins) needs to be in config of packer table...
  local v = vim.version()
  local datetime = os.date " %Y.%m.%d   %H:%M:%S"
  return string.format(" %s   v%s.%s.%s  %s", lvim_version, v.major, v.minor, v.patch, datetime)
end

local lvim_version = require("lvim.utils.git").get_lvim_version()

local hl = pick_color()

lvim.builtin.alpha.dashboard.section.header.opts.hl = hl
lvim.builtin.alpha.dashboard.section.footer.opts.hl = hl
lvim.builtin.alpha.dashboard.section.footer.val = myfooter(lvim_version)


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
