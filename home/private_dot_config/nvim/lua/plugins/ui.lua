return {
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡤⠴⠶⠶⠶⠶⠦⢤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⠿⠛⠛⠿⢶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀
⠀⠀⢠⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡄⠀⠀
⠀⢀⡟⠀⠀⠀⠀⠀⠀⣶⣶⡀⢸⣿⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣿⡇⢀⣶⣶⠀⠀⠀⠀⠀⠀⢻⡀⠀
⠀⣼⠁⠀⠀⠀⠀⠀⣸⣿⣿⣷⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣾⣿⣿⣇⠀⠀⠀⠀⠀⠈⣧⠀
⢀⡏⠀⠀⠀⠀⠀⢀⣿⣿⠹⣿⣷⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣾⣿⠏⣿⣿⡀⠀⠀⠀⠀⠀⢹⡀
⢸⡇⠀⠀⠀⠀⠀⣼⣿⡏⠀⠹⣿⣷⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣾⣿⠏⠀⢹⣿⣧⠀⠀⠀⠀⠀⢸⡇
⢸⡇⠀⠀⠀⠀⢠⣿⣿⠀⠀⠀⠹⣿⣷⡀⠀⠉⠉⠛⠛⠉⠉⠀⢀⣾⣿⠏⠀⠀⠀⣿⣿⡄⠀⠀⠀⠀⢸⡇
⠈⣇⠀⠀⠀⠀⣾⣿⠇⠀⠀⠀⠀⠹⣿⣷⡀⠀⠀⠀⠀⠀⠀⢀⣾⣿⠏⠀⠀⠀⠀⠸⣿⣷⠀⠀⠀⠀⣸⠁
⠀⢻⡀⠀⠀⢰⣿⡿⠀⠀⠀⠀⠀⠀⠹⣿⣷⡀⠀⠀⠀⠀⢀⣾⣿⠏⠀⠀⠀⠀⠀⠀⢿⣿⡆⠀⠀⢀⡟⠀
⠀⠈⣧⠀⠀⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⠹⣿⣷⡀⠀⠀⢀⣾⣿⠏⣶⣶⣶⣶⣶⣶⣶⣾⣿⣿⠀⠀⣼⠁⠀
⠀⠀⠘⢧⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠁⠀⠹⣿⣷⡀⢀⣾⣿⠏⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠁⠀⡼⠃⠀⠀
⠀⠀⠀⠈⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣷⣾⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⠶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠓⠲⠶⠶⠶⠶⠖⠚⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]]
      dashboard.section.header.val = vim.split(logo, "\n")
      math.randomseed(os.time())

      local function pick_color()
        local colors = { "String", "Identifier", "Keyword", "Number" }
        return colors[math.random(#colors)]
      end

      dashboard.section.header.opts.hl = pick_color()
      dashboard.opts.layout[1].val = 2
      return dashboard
    end,
  },
  {
    "folke/edgy.nvim",
    opts = {
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { height = 0.5 },
        },
        {
          title = "Neo-Tree Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Neo-Tree Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        -- {
        --   ft = "Outline",
        --   pinned = true,
        --   open = "SymbolsOutline",
        -- },
        "neo-tree",
      },
    },
  },
}
