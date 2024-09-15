-----------------------------------------------------------------------------------------------
-- packer bootstrap
-- url: https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- after plugins are added,, run command :PackerSync
local packr_config = require('packer').startup(function(use)
  	use 'wbthomason/packer.nvim'
  	use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} },

	}
	use { "catppuccin/nvim", as = "catppuccin" }
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	}
	use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
	-- lsp
	-- used already in Mason -- use {'neovim/nvim-lspconfig' }
	use {'hrsh7th/cmp-nvim-lsp' }
	use {'hrsh7th/cmp-buffer' }
	use {'hrsh7th/cmp-path' }
	use {'hrsh7th/cmp-cmdline' }
	use {'hrsh7th/nvim-cmp' }
	-- wiki.vim
	use {'lervag/wiki.vim', config = function()
		vim.g.wiki_root='~/logseg/'
		vim.g.wiki_journal={
			root = '~/logseg/journals',
			frequency = 'daily',
			date_format = {
				daily = '%Y_%m_%d',				
			}
		}
		vim.g.wiki_cache_root='~/logseg/.cache'
		vim.g.wiki_completion_case_sensitive=0
		vim.keymap.set('n', '<leder>ww', ':WikiIndex', { noremap = true, silent = true })
	end, }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- telescope: always search only under current working directory
require('telescope').setup {
  defaults = {  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '--glob', '!.git/'},
      cwd = vim.fn.getcwd(),  -- Sets the current working directory
    },
  },
}


-- see also .config/nvim/after.config/nvim/after - config which runs after plugins are loaded

return packr_config
-----------------------------------------------------------------------------------------------
