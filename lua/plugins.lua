return {
    -- Colorscheme
    { "sainnhe/sonokai", priority = 1000 },
    { "p00f/alabaster.nvim", priority = 1000 },
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
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
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
