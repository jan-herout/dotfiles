-- this file is automatically loaded by vim after plugins are loaded
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')

lspconfig.pyright.setup{
    on_attach = function(client, bufnr)
        -- Key mappings for LSP
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- go to definition
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    end,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",  -- or "strict"
                useLibraryCodeForTypes = true,  -- Set to false if you experience delays
            }
        }
    }
}

-- bufferline
-- https://github.com/akinsho/bufferline.nvim
vim.opt.termguicolors = true
require("bufferline").setup{}


-- Function to reload the current file
function ReloadCurrentFile()
    vim.cmd("edit")  -- This command reloads the current buffer
end

vim.api.nvim_set_keymap("n", "<leader>r", ":lua ReloadCurrentFile()<CR>", { noremap = true, silent = true })

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
