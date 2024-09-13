vim.opt.number = true
vim.opt.relativenumber = false 
vim.opt.mouse = 'a'

-- global status line
vim.opt.laststatus = 3

-- disable line wrapping
vim.opt.wrap = false

-- highlight cursor
vim.opt.cursorline = true

-- yanking to system clipboard
-- this needs additional tools: sudo apt install wl-clipboard xclip
vim.opt.clipboard = 'unnamedplus'
