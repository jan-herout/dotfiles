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

local packr_config = require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} },

	}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('telescope').setup {
  defaults = {  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '--glob', '!.git/'},
      cwd = vim.fn.getcwd(),  -- Sets the current working directory
    },
  },
}


return packr_config
-----------------------------------------------------------------------------------------------
