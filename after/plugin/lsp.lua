local lsp = require('lsp-zero')
local wk = require('which-key')

lsp.preset('recommended')
lsp.ensure_installed({
	'rust_analyzer',
})


lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	wk.register({
		g = {
			name = "goto",
			d = { function() vim.lsp.buf.definition() end, "definition", buffer = bufnr, noremap = true },
			r = { "<cmd>Telescop lsp_references<cr>", "references" },
		},
		f = { function() vim.lsp.buf.format() end, "lsp format" },
	}, { prefix = "," })
end)
lsp.format_on_save({
	servers = {
		['lua_ls'] = { 'lua' },
		['rust_analyzer'] = { 'rust' },
	}
})
lsp.setup()
