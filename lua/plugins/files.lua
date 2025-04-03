return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        opts = {
            source_selector = { winbar = true },
        },
        keys = {
            { "<leader>o", "<cmd>Neotree toggle position=float<cr>", desc = "Toggle File Tree" },
        },
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Search file names" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search in files" },
            { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Search string under cursor" },
        },
    },
}
