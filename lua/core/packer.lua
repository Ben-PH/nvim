vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({
		'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		}
	})
	--use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	vim.cmd('colorscheme rose-pine')


	-- TreeSitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('theprimeagen/harpoon')
	use('mbbill/undotree')



	-- Lsp-zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional

			-- rust
			{ 'simrat39/rust-tools.nvim' },

			-- Debugging
			use { 'nvim-lua/plenary.nvim' },
			use { 'mfussenegger/nvim-dap' },
		}
	}
	use("folke/which-key.nvim")

	-- hydra for the git thing
	-- use('lewis6991/gitsigns.nvim')
	-- use('anuvyklack/hydra.nvim')
	-- use {
	-- 	"ben/bindings",
	-- 	config = function()
	-- 		require("bindings")
	-- 	end
	-- }
end)
