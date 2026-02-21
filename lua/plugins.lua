return {
    -- Colorscheme
    {
        "sainnhe/sonokai",
        priority = 1000
    },
    {
        "p00f/alabaster.nvim",
        priority = 1000
    },
    -- Show available key mappings
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
    },
    -- Coding-stuff
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "rust", "python", "meson" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    -- Git commands, git in statusline
    {
        url = "https://tpope.io/vim/fugitive.git",
        lazy = false,
        config = function() end,
    },
    -- Automatically close parentheses, brackets etc.
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- File browser
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
            { "<leader>o", "<cmd>Neotree toggle position=float<cr>", desc = "Open file browser" },
        },
    },
    -- Fuzzy finding
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
