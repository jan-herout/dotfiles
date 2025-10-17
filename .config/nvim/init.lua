vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

--other settings
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

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

