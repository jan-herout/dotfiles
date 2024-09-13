-- mapping
vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w")

-- Indent and dedent in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })  -- Dedent
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })  -- Indent

-- změna bufferu na předchozí a na další
vim.keymap.set("n", "<leader>bp", ":bp<enter>", { noremap = true, silent = true })  -- next buffer
vim.keymap.set("n", "<leader>bn", ":bn<enter>", { noremap = true, silent = true })  -- prev buffer
vim.keymap.set("n", "<leader>bd", ":bd<enter>", { noremap = true, silent = true })  -- close buffer

-- telescope a LSP - previous a next reference
vim.keymap.set("n", "<leader>rp", ":cp<enter>", { noremap = true, silent = true })  -- Indent
vim.keymap.set("n", "<leader>rn", ":cn<enter>", { noremap = true, silent = true })  -- Indent

-- next error a prev error
vim.keymap.set("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })  
