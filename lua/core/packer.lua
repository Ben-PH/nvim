vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}


  use {
    "folke/which-key.nvim",
    config = function()
      require('core.plugin_configs.which_key')
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use ( 'theprimeagen/harpoon' )
end)
