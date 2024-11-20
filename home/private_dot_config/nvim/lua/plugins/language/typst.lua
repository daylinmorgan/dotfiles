return require("util").if_exe("typst", {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typst_lsp = {
          mason = false,
          settings = {
            exportPdf = "never", -- Choose onType, onSave or never.
            -- serverPath = "" -- Normally, there is no need to uncomment it.
          },
        },
      },
    },
  },
})
