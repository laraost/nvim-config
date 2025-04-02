return {
    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "auto",
            background = {
                light = "latte",
                dark = "frappe"
            },
        }
    },
    -- Show available key mappings
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
    },
    -- Buffer line
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- Highlight the focused buffer. Straight from the examples in the README
            local get_hex = require("cokeline.hlgroups").get_hl_attr
            require("cokeline").setup({
                default_hl = {
                    fg = function(buffer)
                        return
                          buffer.is_focused
                          and get_hex('ColorColumn', 'bg')
                           or get_hex('Normal', 'fg')
                    end,
                    bg = function(buffer)
                        return
                          buffer.is_focused
                          and get_hex('Normal', 'fg')
                           or get_hex('ColorColumn', 'bg')
                    end,
                },
            })
        end,
    }
}
