vim.opt.signcolumn = "yes"

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
-- lspconfig.lua_ls.setup({}) -- lua-language-server is not correctly installed right now
