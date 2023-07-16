return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}


  use {
    "folke/which-key.nvim",
    config = function()
      require('core.plugin_configs.which_key')
    end
  }
end)
