-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- plugin managers
  use("wbthomason/packer.nvim")
  use { "williamboman/mason.nvim" }

  -- LSP things
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")
  
  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- icons
  use("kyazdani42/nvim-web-devicons")

  -- themes ("colorschemes")
  use("bluz71/vim-nightfly-guicolors")
  use("tomasiser/vim-code-dark")
  
  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- telescope dependencies
  use("nvim-lua/plenary.nvim")

  -- fuzzy finder (telescope)
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  -- vim be good (training game by ThePrimeagen)
  use("ThePrimeagen/vim-be-good")
  
  -- prime's 3 must have plugins
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")

  -- prime's LSP things
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Move lines like VS Code's Alt+Arrow shortcut. (Instead uses Alt+HJKL)
  use("matze/vim-move") 

  
  if packer_bootstrap then
    require("packer").sync()
  end
end)
