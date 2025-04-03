-- Toggle light/dark
vim.keymap.set(
    "n",
    "<Leader>D",
    "<cmd>if &background ==# 'dark' | set background=light | else | set background=dark | endif<cr>",
    { desc = "Toggle light/dark mode" }
)
-- Close the currently focused buffer
vim.keymap.set("n", "<Leader>c", "<cmd>b#|bd#<cr>", {desc = "Close buffer"})
vim.keymap.set("n", "<Leader>C", "<cmd>b#|bd!#<cr>", {desc = "Close buffer without saving"})
-- Navigate in buffers; alternatives to `:bp`, `:bn` and the like
vim.keymap.set("n", "<Leader>bh", "<cmd>bp<cr>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "<Leader>bl", "<cmd>bn<cr>", {desc = "Go to next buffer"})
vim.keymap.set("n", "<Leader>b#", "<cmd>b#<cr>", {desc = "Go to last open buffer"})
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
