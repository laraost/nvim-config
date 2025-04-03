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
            delete_buf = function() vim.cmd.bdelete("!#") end
    else
            delete_buf = function() vim.cmd.bdelete("#") end
    end
    local cokeline = require("cokeline.mappings")
    if #get_listed_bufs() == 1 then
        -- There is only one buffer to close, so make a new one first.
        local current_buffer = vim.api.nvim_win_get_buf(0)
        vim.cmd.enew()
        if vim.api.nvim_win_get_buf(0) ~= current_buffer then
            vim.cmd.bdelete("#")
        end
    else
        -- Focus the previous buffer in the bufferline, then delete.
        cokeline.by_step("focus", -1)
        vim.cmd.bdelete("#")
    end
end
vim.keymap.set("n", close_mapping, function() close_buffer(false) end, {desc = "Close buffer"})
vim.keymap.set("n", force_close_mapping, function() close_buffer(true) end, {desc = "Close buffer without saving"})

-- Navigate in buffers; alternatives to `:bp`, `:bn` and the like
vim.keymap.set("n", "<Leader>h", "<cmd>bp<cr>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "<Leader>l", "<cmd>bn<cr>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<Leader>#", "<cmd>b#<cr>", {desc = "Go to last open buffer"})
 
-- Navigate through windows; alternatives to `<C-w>h` etc.
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to the right window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to the up window" })

-- Split windows; alternatives to `<C-w>s` and `<C-w>v`
vim.keymap.set("n", "<Leader>ws", "<cmd>split<cr>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<Leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })

-- Resizing windows; alternatives to `<C-w><gt>` etc.
vim.keymap.set("n", "<C-Right>", "<cmd>vert res +1<cr>", { desc = "Increase width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vert res -1<cr>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease height" })

-- Search
vim.keymap.set("n", "<Leader>/", "<cmd>noh<cr>", { desc = "Clear search highlighting" })
