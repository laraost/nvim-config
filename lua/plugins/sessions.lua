return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        auto_restore = false, -- don't automatically restore on startup
        use_git_branch = true,
    },
    keys = {
        {
            "<leader>S",
            "<cmd>SessionRestore<cr>",
            desc = "Restore previous session for this directory(/branch)"
        },
        {
            "<leader>sd",
            "<cmd>SessionDelete<cr>",
            desc = "Delete the session for this directory(/branch)"
        },
        {
            "<leader>ss",
            "<cmd>Autosession search<cr>",
            desc = "Load a session from list"
        },
        {
            "<leader>sx",
            "<cmd>Autosession delete<cr>",
            desc = "Delete a session from list"
        },
    }
}
