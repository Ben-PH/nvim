require("leap").add_default_mappings()
require("leap").opts = {
    max_phase_one_targets = 0,
    highlight_unlabeled_phase_one_targets = true,
    max_highlighted_traversal_targets = 10,
    case_sensitive = false,
    equivalence_classes = { " \t\r\n" },
    substitute_chars = {},
    safe_labels = { "h", "t", "n", "s", "-" },
    labels = { "h", "t", "n", "s", "-" },
    special_keys = {
        next_target = "<enter>",
        prev_target = "<tab>",
        next_group = "<space>",
        prev_group = "<tab>",
        multi_accept = "<enter>",
        multi_revert = "<backspace>",
    },
}
