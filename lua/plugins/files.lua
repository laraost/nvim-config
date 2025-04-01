return {
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
        { "<leader>fo", "<cmd>Neotree toggle<cr>", desc = "Toggle File Tree" },
        { "<leader>fe", "<cmd>Neotree focus<cr>", desc = "Focus File Tree" },
    },
}
