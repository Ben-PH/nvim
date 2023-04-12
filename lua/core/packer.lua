vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- project management
	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
					-- Manual mode doesn't automatically change your root directory, so you have
					-- the option to manually do so using `:ProjectRoot` command.
					manual_mode = false,

					-- Methods of detecting the root directory. **"lsp"** uses the native neovim
					-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
					-- order matters: if one is not detected, the other is used as fallback. You
					-- can also delete or rearangne the detection methods.
					detection_methods = { "lsp", "pattern" },

					-- All the patterns used to detect root dir, when **"pattern"** is in
					-- detection_methods
					patterns = { "Cargo.toml", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

					-- Table of lsp clients to ignore by name
					-- eg: { "efm", ... }
					ignore_lsp = {},

					-- Don't calculate root dir on specific directories
					-- Ex: { "~/.cargo/*", ... }
					exclude_dirs = {"~/.cargo/*"},

					-- Show hidden files in telescope
					show_hidden = true,

					-- When set to false, you will get a message when project.nvim changes your
					-- directory.
					silent_chdir = true,

					-- What scope to change the directory, valid options are
					-- * global (default)
					-- * tab
					-- * win
					scope_chdir = 'global',

					-- Path where project.nvim will store the project history for use in
					-- telescope
					datapath = vim.fn.stdpath("data"),
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				require('telescope').load_extension('projects')
			}
		end
	}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',

		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim', as = 'rose-pine' })

	vim.cmd('colorscheme rose-pine')


	-- TreeSitter
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })
	use ( 'theprimeagen/harpoon')
	use ( 'mbbill/undotree')
	use ( 'tpope/vim-fugitive')



	-- Lsp-zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}


	-- Which key
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

end)
