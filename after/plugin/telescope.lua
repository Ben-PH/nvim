local tele = require("telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")

-- When open a new project window, target a specific file
local function tmux_select_file(inner_bufnr, project_path)
    local file_entry = state.get_selected_entry(inner_bufnr)
    local file_path = file_entry.value

    local tmux_cmd = string.format(
	"tmux new-window -n %s \"nvim -c 'cd %s' -c 'edit %s'\"",
	project_path, -- Create the tmux home for the project
	project_path, -- set nvim's working directory to the project path
	file_path -- open the selected file
    )

    os.execute(tmux_cmd)
    actions.close(inner_bufnr)
end

-- Tmuxified project selection
local function tmux_proj(prompt_bufnr)
    local selected = state.get_selected_entry(prompt_bufnr)
    local project_path = selected.path

    actions.close(prompt_bufnr)

    -- Check if the tmux window for the project already exists
    local tmux_windows = io.popen("tmux list-windows -F '#W'"):read("*a")
    if tmux_windows:find(project_path, 1, true) then
        -- The tmux window for the project exists, so switch to it immediately
        local tmux_cmd = string.format("tmux select-window -t %s", project_path)
        os.execute(tmux_cmd)
    else
        -- The tmux window for the project doesn't exist, so open the file picker in that directory
        require("telescope.builtin").find_files({
            cwd = project_path,
            attach_mappings = function(_, map)
                map("i", "<CR>", function(inner_bufnr) tmux_select_file(inner_bufnr, project_path) end)
                map("n", "<CR>", function(inner_bufnr) tmux_select_file(inner_bufnr, project_path) end)
            end,
        })
    end
end

tele.setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        file_browser = {
            -- path
            -- cwd
            cwd_to_path = false,
            grouped = false,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = false,
            hidden = { file_browser = false, folder_browser = false },
            -- respect_gitignore
            -- browse_files
            -- browse_folders
            hide_parent_dir = false,
            collapse_dirs = false,
            prompt_path = false,
            quiet = false,
            dir_icon = "",
            dir_icon_hl = "Default",
            display_stat = { date = true, size = true, mode = true },
            hijack_netrw = false,
            use_fd = true,
            git_status = true,
            mappings = {
                ["i"] = {
                    ["<A-c>"] = fb_actions.create,
                    ["<S-CR>"] = fb_actions.create_from_prompt,
                    ["<A-r>"] = fb_actions.rename,
                    ["<A-m>"] = fb_actions.move,
                    ["<A-y>"] = fb_actions.copy,
                    ["<A-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-g>"] = fb_actions.goto_parent_dir,
                    ["<C-e>"] = fb_actions.goto_home_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-t>"] = fb_actions.change_cwd,
                    ["<C-f>"] = fb_actions.toggle_browser,
                    ["<C-h>"] = fb_actions.toggle_hidden,
                    ["<C-s>"] = fb_actions.toggle_all,
                    ["<bs>"] = fb_actions.backspace,
                },
                ["n"] = {
                    ["c"] = fb_actions.create,
                    ["r"] = fb_actions.rename,
                    ["m"] = fb_actions.move,
                    ["y"] = fb_actions.copy,
                    ["d"] = fb_actions.remove,
                    ["o"] = fb_actions.open,
                    ["g"] = fb_actions.goto_parent_dir,
                    ["e"] = fb_actions.goto_home_dir,
                    ["w"] = fb_actions.goto_cwd,
                    ["t"] = fb_actions.change_cwd,
                    ["f"] = fb_actions.toggle_browser,
                    ["h"] = fb_actions.toggle_hidden,
                    ["s"] = fb_actions.toggle_all,
                },
            },
        },
        project = {
            on_project_selected = function(bufnr) tmux_proj(bufnr) end,
        },
    },
})
tele.load_extension("noice")
tele.load_extension("file_browser")
tele.load_extension("project")
