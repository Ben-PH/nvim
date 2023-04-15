local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local builtin = require('telescope.builtin')

wk.register({
	g = {
		name = "git",
		s = {"<cmd>Git<cr>", "Git"},
	},
	h = { 
		name = "Harpoon", 
		a = { mark.add_file, "Add mark" },
		e = {ui.toggle_quick_menu, "Show quick menu"}
	},
	s = { 
		name = "search", 
		f = { builtin.find_files, "file search" },
		g = { builtin.live_grep, "live-grep" },
		b = { builtin.buffers, "buffer search" },
		h = { builtin.help_tags, "help search" },
	},
},{prefix = "<leader>"})
