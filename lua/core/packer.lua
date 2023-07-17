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

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use ("folke/zen-mode.nvim")
  use ("folke/trouble.nvim")
  use { 'tanvirtin/vgit.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      {"MunifTanjim/nui.nvim"},
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {"rcarriga/nvim-notify"},
    }
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('core.plugin_configs.nvim_surround')
    end
  })

  use {
      "SmiteshP/nvim-navbuddy",
      requires = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
          "numToStr/Comment.nvim",        -- Optional
          "nvim-telescope/telescope.nvim" -- Optional
      }
  }
end)
