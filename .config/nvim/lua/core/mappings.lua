-- mapping
vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w")

-- Indent and dedent in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })  -- Dedent
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })  -- Indent

-- telescope a LSP - previous a next reference
vim.keymap.set("n", "<leader>gp", ":cp<enter>", { noremap = true, silent = true })  -- Indent
vim.keymap.set("n", "<leader>gn", ":cn<enter>", { noremap = true, silent = true })  -- Indent
