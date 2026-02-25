-- Toggle light/dark
vim.keymap.set(
    "n",
    "<Leader>D",
    "<cmd>if &background ==# 'dark' | set background=light | else | set background=dark | endif<cr>",
    { desc = "Toggle light/dark mode" }
)

-- Close the currently focused buffer
-- First, we need a function to get the relevant buffers
local close_mapping = "<Leader>c"
local force_close_mapping = "<Leader>C"
local get_listed_bufs = function()
    return vim.tbl_filter(function(bufnr)
       return vim.api.nvim_buf_get_option(bufnr, "buflisted")
    end, vim.api.nvim_list_bufs())
end
--- Close the currently focused buffer.
-- Prints an error and stops if force is false and the buffer has been modified.
-- Otherwise, switches to the previous buffer in cokeline and closes this one.
-- If the buffer to close is the only "listed" buffer (the only one that shows up with `:ls`),
-- then a new empty buffer is opened instead.
-- @param force also close a buffer if it has been modified
local close_buffer = function(force)
    force = force or false
    if not force and vim.o.mod then
        vim.notify("No write since last change (consider using `<Leader>C` instead)", vim.log.levels.ERROR)
        return
    end
    local delete_buf
    if force then
            delete_buf = function() vim.cmd.bdelete{"#", bang=true} end
    else
            delete_buf = function() vim.cmd.bdelete("#") end
    end
    if #get_listed_bufs() == 1 then
        -- There is only one buffer to close, so make a new one first.
        local current_buffer = vim.api.nvim_win_get_buf(0)
        vim.cmd.enew()
        if vim.api.nvim_win_get_buf(0) ~= current_buffer then
            delete_buf(force)
        end
    else
        -- Focus the previous buffer in the bufferline, then delete.
        vim.cmd.bprevious()
        delete_buf(force)
    end
end
vim.keymap.set("n", close_mapping, function() close_buffer(false) end, {desc = "Close buffer"})
vim.keymap.set("n", force_close_mapping, function() close_buffer(true) end, {desc = "Close buffer without saving"})

-- Navigate through windows; alternatives to `<C-w>h` etc.
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to the right window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to the up window" })

-- Split windows; alternatives to `<C-w>s` and `<C-w>v`
vim.keymap.set("n", "<Leader>ws", "<cmd>split<cr>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<Leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close the current split" })

-- Resizing windows; alternatives to `<C-w><gt>` etc.
vim.keymap.set("n", "<C-Right>", "<cmd>vert res +1<cr>", { desc = "Increase width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vert res -1<cr>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease height" })

-- Managing tabpages
vim.keymap.set("n", "<Leader>t", "<cmd>tabnew<cr>", {desc = "Open a new tab"})


-- Search
vim.keymap.set("n", "<Leader>/", "<cmd>noh<cr>", { desc = "Clear search highlighting" })

-- Key maps for LSPs, enabled when an LSP is attached
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = function(desc)
        return {
            buffer = event.buf,
            desc = desc,
        }
    end

    local ts_builtin = require("telescope.builtin")
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("Hover"))
    vim.keymap.set("n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("List code actions"))
    vim.keymap.set("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Go to definition"))
    vim.keymap.set("n", "<Leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts("Go to declaration"))
    vim.keymap.set("n", "<Leader>ge", "<cmd>lua vim.diagnostic.open_float()<cr>", opts("Show diagnostics")) 
    vim.keymap.set("n", "<Leader>gE", ts_builtin.diagnostics, opts("List all diagnostics"))
    vim.keymap.set("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts("Go to implementation"))
    vim.keymap.set("n", "<Leader>gn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts("Go to next diagnostic"))
    vim.keymap.set("n", "<Leader>gN", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts("Go to previous diagnostic"))
    vim.keymap.set("n", "<Leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts("Go to type definition"))
    vim.keymap.set("n", "<Leader>gr", ts_builtin.lsp_references, opts("List references"))
    vim.keymap.set("n", "<Leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Signature help"))
    vim.keymap.set("n", "<Leader>gS", ts_builtin.lsp_document_symbols, opts("List file symbols"))
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
    vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format"))
  end,
})
