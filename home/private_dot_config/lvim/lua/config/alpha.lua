-- ref: https://github.com/dtr2300/nvim/blob/main/lua/config/plugins/alpha.lua
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number", "Constant" }
  return colors[math.random(#colors)]
end

local function footer()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  return string.format(" %s   v%s.%s.%s  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.header.val = {
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

dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  button( "n", "  New file" , ":ene <BAR> startinsert <CR>"),
  button( "SPC f","  Find File", "<Cmd>Telescope find_files<CR>"),
  button( "SPC s p","  Recent Projects", "<Cmd>Telescope projects<CR>" ),
  button( "SPC s r","  Recently Used Files", "<Cmd>Telescope oldfiles<CR>"),
  button( "SPC s w", "  Find Word","<Cmd>Telescope live_grep<CR>"),
  button( "SPC C","  Configuration",":e ~/.config/lvim/config.lua<CR>" ),
  button( "q", "  Quit NVIM" , ":qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = dashboard.section.header.opts.hl


-- hide tabline and statusline on startup
vim.cmd [[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 laststatus=0 noruler | au BufUnload <buffer> set showtabline=2 ruler laststatus=2
augroup END
]]


alpha.setup(dashboard.opts)

