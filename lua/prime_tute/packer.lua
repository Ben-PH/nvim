vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

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
end)
