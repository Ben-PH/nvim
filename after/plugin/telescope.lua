local tele = require("telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")
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
    },
})
tele.load_extension("noice")
tele.load_extension("file_browser")
tele.load_extension("projects")
