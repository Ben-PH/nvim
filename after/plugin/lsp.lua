local lsp = require("lsp-zero")
local lspconf = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local navbuddy = require("nvim-navbuddy")
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- remaps here
	navbuddy.attach(client, bufnr)
	vim.keymap.set("n", ",gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
