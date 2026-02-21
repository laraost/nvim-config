-- Setting important keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.keys")
require("config.options")
require("config.lsp")
-- Load a local configuration file, e.g., for setting custom tabstops and such
if vim.uv.fs_stat("local.lua") then
    vim.cmd.source("local.lua")
else
    vim.cmd('echo "No local config"')
end
