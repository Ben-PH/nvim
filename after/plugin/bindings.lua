local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local builtin = require('telescope.builtin')
local wk = require("which-key")

wk.register({
	a = {
		name = "application",
		u = { vim.cmd.UndotreeToggle, "Undo Tree" },
	},
	s = {
		name = "search",
		f = { builtin.find_files, "file search" },
		g = { builtin.live_grep, "live-grep" },
		b = { builtin.buffers, "buffer search" },
		h = { builtin.help_tags, "help search" },
		d = { vim.cmd.Ex, "explore directories" },
	},
	g = {
		name = "git",
		s = { "<cmd>Git<cr>", "Git" },
	},
	h = {
		name = "Harpoon",
		a = { mark.add_file, "Add mark" },
		e = { ui.toggle_quick_menu, "Show quick menu" }
	},
}, { prefix = "<leader>" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


vim.keymap.set("x", "<leader>p", "\"_dP")

-- Moeve things up and down, respecting indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
