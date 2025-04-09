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
    {
        "sainnhe/sonokai",
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
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {},
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
                    bold = function(buffer) return buffer.is_focused end,
                },
                components = {
                    {
                        text = function(buffer) return " " .. buffer.devicon.icon end,
                        fg = function(buffer) return buffer.devicon.color end,
                    },
                    {
                        text = function(buffer) return buffer.number .. ": " end,
                    },
                    {
                        text = function(buffer) return buffer.unique_prefix end,
                        fg = function() return get_hex("Comment", "fg") end,
                        italic = true,
                    },
                    { text = function(buffer) return buffer.filename .. " " end },
                    {
                        ---@param buffer Buffer
                        text = function(buffer)
                            if buffer.is_modified then
                                return ""
                            end
                            if buffer.is_hovered then
                                return "󰅙"
                            end
                            return "󰅖"
                        end,
                        on_click = function(_, _, _, _, buffer)
                            buffer:delete()
                        end,
                    },
                    { text = " ", },
                },
            })
        end,
    }
}
