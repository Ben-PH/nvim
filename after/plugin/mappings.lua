local wk = require("which-key")

wk.register({

    ["<M-b>"] = { "<cmd>Buffers<CR>", "Buffers" },
    ["<M-g>"] = { "<cmd>Rg!<CR>", "grep" },
    ["<M-f>"] = { "<cmd>Files<CR>", "find files" },
    ["<M-l>"] = { "<cmd>Telescope projects<CR>", "list projects" },
    ["<M-c>"] = { "<cmd>bp<CR>", "previous buffer" },
    ["<M-r>"] = { "<cmd>bn<CR>", "next buffer" },
    ["<M-/>"] = { "<cmd>nohlsearch<CR>", "Clear highlights" },
    ["<M-?>"] = { "<cmd>Commands<CR>", "commands" },
    --["<M->"] = {"<cmd><CR>", ""},
})
