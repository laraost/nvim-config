vim.opt.signcolumn = "yes"

-- Configure and enable LSPs
vim.lsp.enable('rust_analyzer')
vim.lsp.config('clangd', {
    cmd = { 'clangd', '--header-insertion=never'}
})
vim.lsp.enable('clangd')

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

