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
	},
	h = { 
		name = "Harpoon", 
		a = { mark.add_file, "Add mark" },
		e = {ui.toggle_quick_menu, "Show quick menu"}
	},
},{prefix = "<leader>"})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Moeve things up and down, respecting indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
