-- Function to insert the println! with n placeholders
function _G.insert_println(n)
    if not n or n < 0 then return end

    -- Generate placeholders
    local placeholders = string.rep("{}", n)

    -- Generate commas
    local commas = n >= 1 and string.rep(", ", n) or ""

    -- Combine into final string
    local printstmt = 'println!("' .. placeholders .. '"' .. commas .. ');'

    -- Insert the content at the cursor position and then move the cursor appropriately
    vim.api.nvim_feedkeys('i' .. printstmt .. '\x1B', 'n', false)
    
    -- Move the cursor to the appropriate position inside the first placeholder
    if n == 0 then
	    vim.api.nvim_feedkeys('F"i', 'n', false)
    else
	    vim.api.nvim_feedkeys('F"lla', 'n', false)
    end
end

-- Function to handle the key sequence
function _G.handle_pl_sequence()
    local num = vim.fn.nr2char(vim.fn.getchar())

    -- If the character is a digit, call insert_println with the digit
    if string.match(num, "%d") then
        _G.insert_println(tonumber(num))
        return
    end

    -- If not a digit, treat as normal
    return num
end

-- Define the keymapping for `,pl`
-- vim.api.nvim_set_keymap('n', ',pl', ':lua _G.handle_pl_sequence()<CR>', { noremap = true, silent = true })

-- Function to set mappings for rust files
function _G.set_rust_mappings()
    if vim.bo.filetype == "rust" then
        vim.api.nvim_set_keymap('n', ',pl', ':lua _G.handle_pl_sequence()<CR>', { noremap = true, silent = true })
    end
end

-- Call the set_rust_mappings function on startup
_G.set_rust_mappings()

-- And also set up an autocmd to call it for every buffer entered (in case the filetype is detected later)
vim.cmd([[ autocmd BufEnter * :lua _G.set_rust_mappings() ]])

