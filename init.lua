if os.getenv("TMUX") == nil then
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(
        buf,
        0,
        -1,
        false,
        { "Error: Neovim is not running inside a tmux session" }
    )
    vim.api.nvim_set_current_buf(buf)
else
    require("core.init")
end
