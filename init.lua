if not os.getenv("TMUX") then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(
        buf,
        0,
        -1,
        false,
        { "Error: Neovim is not running inside a tmux session" }
    )
    vim.api.nvim_set_current_buf(buf)
    return
end

-- Replaced with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("core.init")

-- place `project.lua` in project-root directory for per-project config.
-- NOTE: it loads at the very end, so will clobber even the `after/**/*.lua`s
function _G.load_project_config()
    local dir = vim.fn.getcwd()

    -- project.lua is optional, but we can keep track of if a project.lua has been sourced.
    if vim.fn.filereadable(dir .. "/project.lua") then
        dofile(dir .. "/project.lua")
        vim.g.project_config_loaded = true
    else
        vim.g.project_config_loaded = false
    end
end

-- And source the project config right at the end
vim.cmd([[autocmd VimEnter * :lua _G.load_project_config()]])
