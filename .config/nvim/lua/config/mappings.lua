
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

-- page up, page down, center screen (zz -> center screen, noremap - stop recursion
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
-- search for next centers screen
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })


-- move between splits
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)  -- Move down
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)  -- Move up
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)  -- Move left
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)  -- Move right


-- delete, do not append to register
vim.keymap.set("n", "D", "_dd")
vim.keymap.set("v", "D", "_dd")

-- resize splits
-- Key mappings for resizing splits
vim.keymap.set('n', '<C-Up>', ':resize +4<CR>', opts)    -- Increase height
vim.keymap.set('n', '<C-Down>', ':resize -4<CR>', opts)  -- Decrease height
vim.keymap.set('n', '<C-Left>', ':vertical resize -4<CR>', opts)  -- Decrease width
vim.keymap.set('n', '<C-Right>', ':vertical resize +4<CR>', opts) -- Increase width

-- Function to reload the current file
--function ReloadCurrentFile()
--    vim.cmd("edit")  -- This command reloads the current buffer
--end


vim.keymap.set('n', '<leader>q', ':q<enter>')
vim.api.nvim_set_keymap("n", "<leader>R", ":lua ReloadCurrentFile()<CR>", { noremap = true, silent = true })

-- black on code
-- Create an autocommand group for formatting with Black
vim.api.nvim_create_augroup("BlackAutoFormat", { clear = true })

-- Set up the autocommand to run Black on save for Python files
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "BlackAutoFormat",
    pattern = "*.py",
    callback = function()
	vim.cmd("silent !black %")
	vim.cmd("silent !isort %")
	vim.cmd("silent !edit")
    end
})
