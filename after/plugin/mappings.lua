local wk = require("which-key")

wk.register({
    ["<M-b>"] = { "<cmd>Buffers<CR>", "Buffers" },
    ["<M-g>"] = { "<cmd>Rg!<CR>", "grep" },
    ["<M-f>"] = { "<cmd>Files<CR>", "find files" },
    ["<M-l>"] = { "<cmd>Telescope project<CR>", "list projects" },
    ["<M-c>"] = { "<cmd>bp<CR>", "previous buffer" },
    ["<M-r>"] = { "<cmd>bn<CR>", "next buffer" },
    ["<M-/>"] = { "<cmd>nohlsearch<CR>", "Clear highlights" },
    ["<M-?>"] = { "<cmd>Commands<CR>", "commands" },
    ["<M-t>"] = { "<cmd>NvimTreeToggle<CR>", "FileTree" },
    --["<M->"] = {"<cmd><CR>", ""},
})

local general_lsp_bindings = function()
    wk.register({

        ["<M-a>"] = { vim.lsp.buf.code_action, "Lsp: code-actions" },
        ["<M-G>"] = { vim.lsp.buf.definition, "Lsp: Definition" },
        ["<M-R>"] = { vim.lsp.buf.references, "Lsp: References" },
    })
    wk.register({
        r = { vim.lsp.buf.rename, "rename" },
    }, { name = "Lsp", prefix = "<M-L>" })
end

local lsp = require("lspconfig")

lsp.lua_ls.setup({ on_attach = general_lsp_bindings })
lsp.rust_analyzer.setup({ on_attach = general_lsp_bindings })
