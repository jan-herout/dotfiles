require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })  -- Dedent
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })  -- Indent
-- page up, page down, center screen (zz -> center screen, noremap - stop recursion
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true }) -- Ctrl+u - up and zz
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true }) -- Ctrl+d - down and zz
vim.keymap.set("n", "n", "nzz", { noremap = true }) -- search for next centers screen
vim.keymap.set("n", "N", "Nzz", { noremap = true })-- search for next centers screen
-- move between splits
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)  -- Move down
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)  -- Move up
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)  -- Move left
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)  -- Move right
-- delete, do not append to register
--vim.keymap.set("n", "D", "dd")
vim.keymap.set("n", "D", [["_dd]])
vim.keymap.set("v", "D", [["_dd]])
-- resize splits
vim.keymap.set('n', '<C-Up>', ':resize +4<CR>', opts)    -- Increase height
vim.keymap.set('n', '<C-Down>', ':resize -4<CR>', opts)  -- Decrease height
vim.keymap.set('n', '<C-Left>', ':vertical resize -4<CR>', opts)  -- Decrease width
vim.keymap.set('n', '<C-Right>', ':vertical resize +4<CR>', opts) -- Increase width
-- line nav
vim.keymap.set('n', 'B', '0')
vim.keymap.set('n', 'E', '$')

