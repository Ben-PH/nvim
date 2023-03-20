-- vim.keymap.set("n", "<leader>au", vim.cmd.UndotreeToggle)
local wk = require("which-key")
wk.register({
	a = { 
		name = "application", 
		u = { vim.cmd.UndotreeToggle, "Undo Tree" },
	},
},{prefix = "<leader>"})
