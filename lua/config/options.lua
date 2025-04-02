-- Nice tabbing
vim.cmd.set("tabstop=4 softtabstop=0")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")

-- All the colors of the rainbow and how to use them
vim.cmd.set("termguicolors")
vim.cmd.colorscheme("catppuccin")
vim.cmd.set("background=light")

-- Line numbering
vim.cmd.set("number relativenumber")
local numbergroup = vim.api.nvim_create_augroup("numbertoggle", { clear=true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
    {
        pattern = "*",
        group = numbergroup,
        command = "if &nu && mode() != 'i' | set rnu | endif",
        desc = "turn relative numbers on"
    }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
    {
        pattern = "*",
        group = numbergroup,
        command = "if &nu | set nornu | endif",
        desc = "turn relative numbers off"
    }
)

-- Copying to clipboard
vim.cmd.set("clipboard=unnamed,unnamedplus")

