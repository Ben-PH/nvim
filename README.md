Mostly geared towards Rust, because I'm _that guy in the room_.


## Highlights

### Tmux + projects centric approach

Fresh tmux-window per project.

Use telescope project-picker to open a project:

- if project is not already active
 - pick the project-file to initially open
 - create a tmux-window dedicated to said project
 - name the window the path to project root
 - open nvim from project root into picked file
- if project already active:
 - switch to tmux window for picked project

### Project-dedicated config

If you want to setup a config for a specific project, e.g. configure LSP configurations, or add hotkeys/functions for a particular projects needs when it comes to build integrations: add a `project.lua` to the projects root directory.


### (Mostly) One-tap hotkeys:

- go-to definition? `alt-G`
- rg-search in project? `alt-g`
- hot-swap to harpooned file? `ctrl - $HOME_ROW_KEY`
- set harpoon file? `ctrl - $HOME_ROW_KEY`
- list harpooed file? `alt - H` (but dvorak mapped, so: `D`)

### whick-key

...because hot-key info is <3, and it makes setting that up eazy-breezy

## TODO:

more LSP 
