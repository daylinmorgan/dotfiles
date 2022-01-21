-- LOAD THE PLUGINS

-- install packer on the fly
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
--


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'preservim/NERDTree'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }
  use {
    'airblade/vim-gitgutter',
    config = function ()
      local cmd = vim.cmd
      cmd [[highlight! link SignColumn LineNr]]
    end
  }

  use {
     'neoclide/coc.nvim',
      branch='release'
  }

  use 'Mofiqul/dracula.nvim'

  -- language specific plugins
  -- python
  use {
    'snakemake/snakemake',
    rtp="misc/vim",
    ft={"Snakefile","snk"}
  }

  -- toml
  use 'cespare/vim-toml'

  if Packer_bootstrap then
    require('packer').sync()
  end
end)

