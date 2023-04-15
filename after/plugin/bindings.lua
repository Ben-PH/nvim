
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
},{prefix = "<leader>"})
