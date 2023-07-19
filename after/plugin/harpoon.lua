local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
    ["<M-d>"] = { ui.toggle_quick_menu, "show marks" },
    ["<M-h>"] = { function() mark.set_current_at(1) end, "mark 1" },
    ["<M-t>"] = { function() mark.set_current_at(2) end, "mark 2" },
    ["<M-n>"] = { function() mark.set_current_at(3) end, "mark 3" },
    ["<M-s>"] = { function() mark.set_current_at(4) end, "mark 4" },
    ["<C-h>"] = { function() ui.nav_file(1) end, "goto 1" },
    ["<C-t>"] = { function() ui.nav_file(2) end, "goto 2" },
    ["<C-n>"] = { function() ui.nav_file(3) end, "goto 3" },
    ["<C-s>"] = { function() ui.nav_file(4) end, "goto 4" },
})
