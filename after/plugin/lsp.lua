local lsp = require("lsp-zero")

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
	-- local opts = { buffer = bufnr, remap = false }
	-- remaps here
	navbuddy.attach(client, bufnr)
	vim.keymap.set("n", ",gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
end)

lsp.setup()

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- if you're using `vim` global
				enable = true,
			},
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = true,
})
