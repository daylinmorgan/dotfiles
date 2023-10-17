return {
  {
    "nvimdev/dashboard-nvim",
    opts = function (_, opts)
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

      -- TODO::
      -- originally used to set highlight group to change header color in alpha
      -- now would need to maybe use an AutoCmd to change DashboardHeader

      -- math.randomseed(os.time())
      -- local function pick_color()
      --   local colors = { "String", "Identifier", "Keyword", "Number" }
      --   return colors[math.random(#colors)]
      -- end
      --
      opts.config.header = vim.split(logo,"\n")
      return opts
    end
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
