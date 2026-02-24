-- Setting important keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.lazy")
require("config.keys")
require("config.options")
require("config.lsp")
-- Load a local configuration file, e.g., for setting custom tabstops and such
local local_config_path = vim.fn.stdpath("config") .. "/local.lua"
if vim.uv.fs_stat(local_config_path) then
    vim.cmd.source(local_config_path)
else
    vim.cmd('echo "No local config"')
end
