-- Close the currently focused buffer
vim.keymap.set("n", "<Leader>c", "<cmd>b#|bd#<cr>",
    {desc = "Close buffer"})
-- Navigate in buffers; alternatives to `:bp`, `:bn` and the like
vim.keymap.set("n", "<Leader>bp", "<cmd>bp<cr>",
    {desc = "Go to previous buffer"})
vim.keymap.set("n", "<Leader>bn", "<cmd>bn<cr>",
    {desc = "Go to next buffer"})
vim.keymap.set("n", "<Leader>b#", "<cmd>b#<cr>",
    {desc = "Go to last open buffer"})
-- Navigate through windows; alternatives to `<C-w>h` etc.
vim.keymap.set("n", "<Leader>wh", "<C-w>h",
    { remap = true, desc = "Go to the left window"})
vim.keymap.set("n", "<Leader>wl", "<C-w>l",
    { remap = true, desc = "Go to the right window"})
vim.keymap.set("n", "<Leader>wj", "<C-w>j",
    { remap = true, desc = "Go to the down window"})
vim.keymap.set("n", "<Leader>wk", "<C-w>k",
    { remap = true, desc = "Go to the up window"})
-- Split windows; alternatives to `<C-w>s` and `<C-w>v`
vim.keymap.set("n", "<Leader>ws", "<C-w>s",
    { remap = true, desc = "Split window horizontally"})
vim.keymap.set("n", "<Leader>wv", "<C-w>v",
    { remap = true, desc = "Split window vertically"})
