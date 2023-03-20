local lsp = require('lsp-zero')
local wk = require('which-key')

lsp.preset('recommended')
lsp.ensure_installed({
	'rust_analyzer',
})


lsp.on_attach(function (client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	wk.register({
		g = { 
			name = "goto", 
			d = { function() vim.lsp.buf.definition() end, "definition", buffer = bufnr, noremap = true },
		},
	},{prefix = ","})
end)
lsp.setup()
