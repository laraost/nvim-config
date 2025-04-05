vim.opt.signcolumn = "yes"

local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- Configure and enable LSPs
local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
-- lspconfig.lua_ls.setup({}) -- lua-language-server is not correctly installed right now

-- Configure auto-completion
local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
})

-- Configure appearance
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticVirtualTextError',
            [vim.diagnostic.severity.WARN] =  'DiagnosticVirtualTextWarn',
            [vim.diagnostic.severity.HINT] =  'DiagnosticVirtualTextHint',
            [vim.diagnostic.severity.INFO] =  'DiagnosticVirtualTextInfo',
        },
    },
    float = { border = "rounded" },
})

