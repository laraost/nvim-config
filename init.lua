-- Nice tabbing
vim.cmd.set("tabstop=4 softtabstop=0")
vim.cmd.set("shiftwidth=4")
vim.cmd.set("expandtab")

-- All the colors of the rainbow
vim.cmd.set("termguicolors")

-- Setting important keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.keys")

require("config.lazy")

vim.cmd.colorscheme("catppuccin")
vim.cmd.set("background=light")
