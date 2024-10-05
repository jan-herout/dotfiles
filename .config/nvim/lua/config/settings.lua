-- Set tab behavior to use spaces instead of tabs
vim.opt.expandtab = true  -- Converts tabs to spaces
vim.opt.tabstop = 4       -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4    -- Number of spaces a tab counts for while editing

vim.opt.number = true
vim.opt.relativenumber = true
--vim.opt.showmatch = true
--vim.opt.matchtime = 3

-- Set the clipboard to use the system clipboard
vim.opt.clipboard = 'unnamedplus'

-- 64bit colors
vim.opt.termguicolors = true
