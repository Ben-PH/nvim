local wk = require("which-key")
local trouble = require("trouble")
local foo = ""

wk.register({

    ["<M-b>"] = { "<cmd>Buffers<CR>", "Buffers" },
    ["<M-g>"] = { "<cmd>Rg!<CR>", "grep" },
    ["<M-f>"] = { "<cmd>Files<CR>", "find files" },
    ["<M-l>"] = { "<cmd>Telescope project<CR>", "list projects" },
    ["<M-c>"] = { "<cmd>bp<CR>", "previous buffer" },
    ["<M-r>"] = { "<cmd>bn<CR>", "next buffer" },
    ["<M-/>"] = { "<cmd>nohlsearch<CR>", "Clear highlights" },
    ["<M-?>"] = { "<cmd>Commands<CR>", "commands" },
    ["<M-A>"] = {
        trouble.previous({ skip_groups = true, jump = true }),
        "Trouble: prev-item",
    },
    ["<M-U>"] = {
        trouble.next({ skip_groups = true, jump = true }),
        "Trouble: next-item",
    },
    ["<M-O>"] = {
        trouble.previous({ skip_groups = true, jump = true }),
        "Trouble: prev-group",
    },
    ["<M-E>"] = {
        trouble.next({ skip_groups = true, jump = true }),
        "Trouble: next-group",
    },
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
