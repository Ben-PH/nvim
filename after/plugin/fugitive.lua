local wk = require("which-key")
wk.register({
	g = {
		name = "git",
		s = {"<cmd>Git<cr>", "Git"},
	},
},{prefix = "<leader>"})
