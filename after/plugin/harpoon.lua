local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")
wk.register({
	h = { 
		name = "Harpoon", 
		a = { mark.add_file, "Add mark" },
		e = {ui.toggle_quick_menu, "Show quick menu"}
	},
},{prefix = "<leader>"})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
