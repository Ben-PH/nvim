local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<M-d>", ui.toggle_quick_menu)

vim.keymap.set("n", "<M-h>", function() mark.set_current_at(1) end)
vim.keymap.set("n", "<M-t>", function() mark.set_current_at(2) end)
vim.keymap.set("n", "<M-n>", function() mark.set_current_at(3) end)
vim.keymap.set("n", "<M-s>", function() mark.set_current_at(4) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
